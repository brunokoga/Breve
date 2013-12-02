//
//  PeopleTheme.h
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BKTheme <NSObject>

- (UIColor *)backgroundColor;
- (UIColor *)foregroundColor;
- (UIColor *)tintColor;

- (void)applyAppearance;

@end
