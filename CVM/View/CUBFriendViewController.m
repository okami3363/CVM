//
//  CUBFriendViewController.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendViewController.h"
#import "CUBFriendViewModel.h"
#import "Masonry.h"
#import "CUBTableViewCellBaseClass.h"
#import "CUBUserTableViewCell.h"
#import "CUBSearchTableViewCell.h"
#import "CUBNoFriendTableViewCell.h"
#import "CUBFriendTableViewCell.h"
#import "CUBInviteTableViewCell.h"
#import "CUBFriendModel.h"
#import "CUBTableViewCellProtocol.h"
#import "CUBSearchModel.h"
#import "CUBInviteModel.h"
#import "CUBSegmentTableViewCell.h"

typedef NS_ENUM(NSInteger,CUBTestType){
    CUBTestType1 = 1,   //(1) 無好友畫面
    CUBTestType2,       //(2) 只有好友列表
    CUBTestType3,       //(3) 好友列表含邀請
};

@interface CUBFriendViewController () <UITableViewDataSource, UISearchResultsUpdating, CUBTableViewCellProtocol, UISearchControllerDelegate, UITableViewDelegate>

@property (nonatomic, strong) CUBFriendViewModel *eventHandler;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property CUBTestType testType;

@end

@implementation CUBFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupUI];
    [self setupAutolayout];
    
    self.eventHandler = [[CUBFriendViewModel alloc] init];
    self.testType = CUBTestType1;
    [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
        self.eventHandler.dataSource = dataSource.mutableCopy;
        [self.tableView reloadData];
    }];
    
}


- (void) setupUI {
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[CUBUserTableViewCell class] forCellReuseIdentifier:@"CUBUserModel"];
    [self.tableView registerClass:[CUBNoFriendTableViewCell class] forCellReuseIdentifier:@"CUBNoFriendModel"];
    [self.tableView registerClass:[CUBSearchTableViewCell class] forCellReuseIdentifier:@"CUBSearchModel"];
    [self.tableView registerClass:[CUBFriendTableViewCell class] forCellReuseIdentifier:@"CUBFriendModel"];
    [self.tableView registerClass:[CUBInviteTableViewCell class] forCellReuseIdentifier:@"CUBInviteModel"];
    [self.tableView registerClass:[CUBSegmentTableViewCell class] forCellReuseIdentifier:@"CUBSegmentModel"];
    
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.placeholder = @"想轉一筆給誰呢？";
    self.searchController.searchBar.tintColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.tableView.refreshControl = self.refreshControl;
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
}

- (void)setupAutolayout {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
        
    }];
    
}

- (void)refresh {
    
    switch (self.testType) {
        case CUBTestType1: {
            
            [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
                self.eventHandler.dataSource = dataSource.mutableCopy;
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        case CUBTestType2: {
            
            [self.eventHandler get_status_friend:^(NSArray *dataSource) {
                self.eventHandler.dataSource = dataSource.mutableCopy;
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        case CUBTestType3: {
            
            [self.eventHandler get_status_friend_and_invite:^(NSArray *dataSource) {
                self.eventHandler.dataSource = dataSource.mutableCopy;
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)openGroup:(NSIndexPath *)indexPath andLeader:(CUBInviteModel *)leaderModel{
    
    dispatch_queue_t createQueue = dispatch_queue_create("SerialQueue", nil);
    
    dispatch_async(createQueue, ^(){
        
        NSMutableArray *indexPaths = @[].mutableCopy;
        for (int i=1; i<=leaderModel.group.count; i++) {
            NSIndexPath *insterIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+i) inSection:0];
            [indexPaths addObject:insterIndexPath];
        }
        
        NSMutableIndexSet *idxSet = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, leaderModel.group.count)];
        
        [self.eventHandler.dataSource insertObjects:leaderModel.group atIndexes:idxSet];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            [self.tableView beginUpdates];
            
            leaderModel.isClose = NO;
            
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
            
            [self.tableView endUpdates];
            
        });
        
    });
    
}

- (void)closeGroup {
    
    dispatch_queue_t createQueue = dispatch_queue_create("SerialQueue", nil);
    
    dispatch_async(createQueue, ^(){
        
        NSPredicate *p = [NSPredicate predicateWithFormat:@"self isMemberOfClass: %@", [CUBInviteModel class]];
        NSArray * filtered = [self.eventHandler.dataSource filteredArrayUsingPredicate:p];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat: @"isLeader == YES"];
        CUBInviteModel *leaderModel = nil;
        for (CUBInviteModel *model in filtered) {
            if ([predicate evaluateWithObject:model]) {
                leaderModel = model;
            }
        }
        
        if (!leaderModel) return;
        
        NSInteger row = [self.eventHandler.dataSource indexOfObject:leaderModel];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        
        NSMutableArray *indexPaths = @[].mutableCopy;
        for (int i=1; i<=leaderModel.group.count; i++) {
            NSIndexPath *insterIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+i) inSection:0];
            [indexPaths addObject:insterIndexPath];
        }
        
        [self.eventHandler.dataSource removeObjectsInRange:NSMakeRange(indexPath.row+1, leaderModel.group.count)];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            [self.tableView beginUpdates];
            
            leaderModel.isClose = YES;
            
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
            
            [self.tableView endUpdates];
            
        });
        
    });
    
}

- (void)configLineAtLastCell:(CUBTableViewCellBaseClass *)cell indexPath:(NSIndexPath * _Nonnull)indexPath {
    NSInteger count = (self.searchController.active)?self.eventHandler.results.count:self.eventHandler.dataSource.count;
    if ([cell isMemberOfClass:[CUBFriendTableViewCell class]]) {
        CUBFriendTableViewCell *friendCell = (CUBFriendTableViewCell *)cell;
        if (indexPath.row == count-1) {
            friendCell.lineView.hidden = YES;
        }
        else {
            friendCell.lineView.hidden = NO;
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchController.active) {
        
        return self.eventHandler.results.count ;
    }
    
    return self.eventHandler.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = (self.searchController.active)?[self.eventHandler.results objectAtIndex:indexPath.row]:[self.eventHandler.dataSource objectAtIndex:indexPath.row];
    
    NSString *cellReuseIdentifier = NSStringFromClass([model class]);
    
    CUBTableViewCellBaseClass *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.delegate = self;
    cell.entity = model;
    [self configLineAtLastCell:cell indexPath:indexPath];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.searchController.active) return;
    
    id model = [self.eventHandler.dataSource objectAtIndex:indexPath.row];
    
    if ([model isMemberOfClass:[CUBInviteModel class]]) {
        CUBInviteModel *leaderModel = (CUBInviteModel *)model;
        
        if (leaderModel.isLeader && leaderModel.isClose) {
            [self openGroup:indexPath andLeader:leaderModel];
            return;
        }
        
        if (leaderModel.isClose == NO) {
            [self closeGroup];
            return;
        }
    }
    
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text ;
       if (self.eventHandler.results.count > 0) {
           [self.eventHandler.results removeAllObjects];
       }
       for (id model in self.eventHandler.dataSource) {
           
           CUBFriendModel *memberFriendModel = nil;
           if ([model isMemberOfClass:[CUBFriendModel class]]) {
               memberFriendModel = model;
               
               if ([memberFriendModel.name.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
                   [self.eventHandler.results addObject:memberFriendModel];
               }
           }
       }
       
       [self.tableView reloadData];
    
}

#pragma mark - UISearchControllerDelegate
- (void)didPresentSearchController:(UISearchController *)searchController {
    
    [self.searchController.searchBar becomeFirstResponder];
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {

    self.tableView.tableHeaderView = nil;

}

#pragma mark - CUBTableViewCellProtocol
- (void)search {
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"self isMemberOfClass: %@", [CUBSearchModel class]];
    NSArray * filtered = [self.eventHandler.dataSource filteredArrayUsingPredicate:p];
    NSInteger row = [self.eventHandler.dataSource indexOfObject:[filtered firstObject]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        [UIView animateWithDuration:0.5f animations:^{
            
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            
        } completion:^(BOOL finished){
            
            self.tableView.tableHeaderView = self.searchController.searchBar;
            
            self.searchController.active = YES;
            
        }];
    });
    
}

- (void)test1 {
    
    [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
        self.testType = CUBTestType1;
        self.eventHandler.dataSource = dataSource.mutableCopy;
        [self.tableView reloadData];
    }];
    
}

- (void)test2 {
    
    [self.eventHandler get_status_friend:^(NSArray *dataSource) {
        self.testType = CUBTestType2;
        self.eventHandler.dataSource = dataSource.mutableCopy;
        [self.tableView reloadData];
    }];
    
}

- (void)test3 {
    
    [self.eventHandler get_status_friend_and_invite:^(NSArray *dataSource) {
        self.testType = CUBTestType3;
        self.eventHandler.dataSource = dataSource.mutableCopy;
        [self.tableView reloadData];
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    

@end
