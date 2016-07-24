//
//  MPJekyllPreferencesViewController.m
//  MacDown
//
//  Created by Matteo Gavagnin on 24/07/16.
//  Copyright © 2016 Tzu-ping Chung . All rights reserved.
//

#import "MPJekyllPreferencesViewController.h"
#import "MPPreferences.h"

@interface MPJekyllPreferencesViewController ()

@end

@implementation MPJekyllPreferencesViewController

#pragma mark - MASPrefernecesViewController
- (NSString *)identifier
{
    return @"JekyllPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:@"PreferencesJekyll"];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"Jekyll", @"Preference pane title.");
}

@end