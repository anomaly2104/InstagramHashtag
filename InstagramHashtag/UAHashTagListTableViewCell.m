//
//  UAHashTagListTableViewCell.m
//  InstagramHashtag
//
//  Created by Udit Agarwal on 02/03/17.
//  Copyright © 2017 Udit Agarwal. All rights reserved.
//

#import "UAHashTagListTableViewCell.h"
#import <SDWebImage/UIView+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface UAHashTagListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation UAHashTagListTableViewCell

- (void)awakeFromNib {
  [super awakeFromNib];
  [self.photoImageView sd_setShowActivityIndicatorView:YES];
  [self.photoImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)setPhotoURL:(NSURL *)URL {
  [self.photoImageView sd_setImageWithURL:URL
                         placeholderImage:nil
                                  options:SDWebImageRefreshCached];

}

@end
