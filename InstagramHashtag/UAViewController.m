//
//  UAViewController.m
//  InstagramHashtag
//
//  Created by Udit Agarwal on 02/03/17.
//  Copyright © 2017 Udit Agarwal. All rights reserved.
//

#import "UAViewController.h"
#import "UAHashTagListTableViewController.h"

@interface UAViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hashTagInputField;

@end

@implementation UAViewController

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"UAShowHashTagListSegue"]) {
    UAHashTagListTableViewController *destination = segue.destinationViewController;
    [destination setHashTag:self.hashTagInputField.text];
  }
}

@end
