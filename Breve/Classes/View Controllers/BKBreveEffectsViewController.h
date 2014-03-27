//
//  BKBreveEffectsViewController.h
//  Breve
//
//  Created by Bruno Koga on 3/27/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import "BKBreveBaseViewController.h"
#import "BKBreveEffect.h"

@protocol BKBreveEffectDelegate <NSObject>
@required
- (void)effectChanged:(BKBreveEffect *)effect;

@end

@interface BKBreveEffectsViewController : BKBreveBaseViewController
@property (weak, nonatomic) id<BKBreveEffectDelegate> delegate;

- (instancetype)initWithEffects:(NSArray *)effects delegate:(id<BKBreveEffectDelegate>)delegate;

@end
