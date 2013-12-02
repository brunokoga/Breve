//
//  PeopleTheme.h
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BKTheme <NSObject>

- (UIFont *)regularFontWithSize:(CGFloat)size;
- (UIFont *)lightFontWithSize:(CGFloat)size;


- (UIColor *)primaryColorLight;
- (UIColor *)primaryColorDark;
- (UIColor *)secondaryColor;
- (UIColor *)darkColor;
- (UIColor *)lightGrayColor;



@end
