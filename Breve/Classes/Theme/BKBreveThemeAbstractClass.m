//
//  BKBreveThemeAbstractClass.m
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveThemeAbstractClass.h"
#import "BKBreveEffectsInputView.h"

@implementation BKBreveThemeAbstractClass

- (void)applyAppearance
{
  [[UISwitch appearance] setOnTintColor:[self tintColor]];
  [[UITableView appearance] setTintColor:[self tintColor]];
  [[UITextView appearance] setBackgroundColor:[self backgroundColor]];
  [[UITextView appearance] setTextColor:[self foregroundColor]];
  [[UITextField appearance] setKeyboardAppearance:[self keyboardAppearance]];
  [[UINavigationBar appearance] setBarTintColor:[self backgroundAlternativeColor]];
  [[UITableViewCell appearance] setBackgroundColor:[self backgroundAlternativeColor]];
  [[UILabel appearance] setTextColor:[self foregroundColor]];
  [[UITableView appearance] setBackgroundColor:[self backgroundColor]];
  [[UIButton appearance] setTintColor:[self tintColor]];
  [[UIBarButtonItem appearance] setTintColor:[self tintColor]];
  [[UINavigationBar appearance] setTintColor:[self tintColor]];
  [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [self tintColor]}];
  [[UISegmentedControl appearance] setTintColor:[self tintColor]];
  [[UIToolbar appearance] setBarTintColor:[self backgroundColor]];
  [[BKBreveEffectsInputView appearance] setBackgroundColor:[self backgroundColor]];
}

@end
