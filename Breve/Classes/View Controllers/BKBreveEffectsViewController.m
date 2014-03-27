//
//  BKBreveEffectsViewController.m
//  Breve
//
//  Created by Bruno Koga on 3/27/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectsViewController.h"
#import "BKBreveEffectManager.h"

@interface BKBreveEffectsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic, readwrite) NSArray *effects;

@end

@implementation BKBreveEffectsViewController

- (instancetype)initWithEffects:(NSArray *)effects delegate:(id<BKBreveEffectDelegate>)delegate
{
  self = [super init];
  if (self) {
    _effects = effects;
    _delegate = delegate;
    [self setUp];
  }
  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

- (void)setUp {
  id<BKTheme> theme = [BKThemeManager theme];
  [self.tableView setBackgroundColor:[theme backgroundAlternativeColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.effects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *reuseIdentifier = @"Effect Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:reuseIdentifier];
  }
  BKBreveEffect *effect = self.effects[indexPath.row];
  cell.textLabel.text = [effect effectDisplayName];
  cell.textLabel.textColor = [[BKThemeManager theme] tintColor];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  BKBreveEffect *effect = self.effects[indexPath.row];
  [[BKBreveEffectManager sharedManager] setEffect:effect];
  [self.delegate effectChanged:effect];
  [self.tableView deselectRowAtIndexPath:indexPath
                                animated:YES];
}

@end
