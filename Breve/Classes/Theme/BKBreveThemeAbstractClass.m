//
//  BKBreveThemeAbstractClass.m
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveThemeAbstractClass.h"

@implementation BKBreveThemeAbstractClass

- (void)applyAppearance
{
  [[UISwitch appearance] setOnTintColor:[self tintColor]];
  [[UITableView appearance] setTintColor:[self tintColor]];
  [[UITextView appearance] setBackgroundColor:[self backgroundColor]];
  [[UITextView appearance] setTextColor:[self foregroundColor]];
  [[UITextField appearance] setKeyboardAppearance:[self keyboardAppearance]];
  [[UINavigationBar appearance] setBarTintColor:[self backgroundColor]];
  [[UITableViewCell appearance] setBackgroundColor:[self backgroundColor]];
  [[UILabel appearance] setTextColor:[self foregroundColor]];
  [[UITableView appearance] setBackgroundColor:[self backgroundColor]];
  [[UIButton appearance] setTintColor:[self tintColor]];
  [[UIBarButtonItem appearance] setTintColor:[self tintColor]];
  [[UINavigationBar appearance] setTintColor:[self tintColor]];
  [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [self tintColor]}];
  [[UISegmentedControl appearance] setTintColor:[self tintColor]];
  [[UIToolbar appearance] setBarTintColor:[self backgroundColor]];
  [[UITableView appearance] setBackgroundColor:[self backgroundAlternativeColor]];
  [[UITableView appearance] setTintColor:[self tintColor]];
}

@end
