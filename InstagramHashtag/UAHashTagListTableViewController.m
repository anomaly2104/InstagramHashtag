//
//  UAHashTagListTableViewController.m
//  InstagramHashtag
//
//  Created by Udit Agarwal on 02/03/17.
//  Copyright © 2017 Udit Agarwal. All rights reserved.
//

#import "UAHashTagListTableViewController.h"
#import <InstagramKit/InstagramKit.h>
#import "UAHashTagListTableViewCell.h"

@interface UAHashTagListTableViewController ()

@property (nonatomic) NSString *hashTag;
@property (nonatomic) NSArray<InstagramMedia *> *hashTagList;

@end

@implementation UAHashTagListTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView reloadData];
}

- (void)updateList {
  [[InstagramEngine sharedEngine] setAccessToken:@"269859562.ffd8e58.9074055503d14a359d52e05008c58285"];
  
  __weak typeof(self)weakSelf = self;
  [[InstagramEngine sharedEngine] getMediaWithTagName:@"travel"
                                          withSuccess:^(NSArray<InstagramMedia *> * _Nonnull media, InstagramPaginationInfo * _Nonnull paginationInfo) {
                                            typeof(weakSelf)strongSelf = weakSelf;
                                            strongSelf.hashTagList = media;
                                            [strongSelf.tableView reloadData];
                                          }
                                              failure:^(NSError * _Nonnull error, NSInteger serverStatusCode) {
                                              }];
}

#pragma mark - Custom Setters

- (void)setHashTag:(NSString *)hashTag {
  _hashTag = hashTag;
  [self updateList];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hashTagList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UAHashTagListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UAHashTagListTableViewCell class])
                                                                     forIndexPath:indexPath];
  InstagramMedia *media = self.hashTagList[indexPath.row];
  [cell setPhotoURL:media.lowResolutionImageURL];
  
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
