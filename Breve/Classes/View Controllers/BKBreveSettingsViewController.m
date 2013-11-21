//
//  BKBubsSettingsViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveSettingsViewController.h"
#import "BKBreveSettings.h"

@interface BKBreveSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *autocapitalizationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autocorrectionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *spellCheckingSwitch;

@end

@implementation BKBreveSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self applySettings];
}

- (void)applySettings
{
    BKBreveSettings *settings = [BKBreveSettings generalSettings];
    self.autocapitalizationSwitch.on = [settings autocapitalization];
    self.autocorrectionSwitch.on = [settings autocorrection];
    self.spellCheckingSwitch.on = [settings spellChecking];
    
    
    
}

- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{}];
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *s = sender;
    BKBreveSettings *settings = [BKBreveSettings generalSettings];
    
    if (s == self.autocapitalizationSwitch)
    {
        [settings setAutocapitalization:s.on];
        
        
    } else if (s == self.autocorrectionSwitch)
    {
        [settings setAutocorrection:s.on];
        
    } else if (s == self.spellCheckingSwitch)
    {
        [settings setSpellChecking:s.on];
    }
}
@end
