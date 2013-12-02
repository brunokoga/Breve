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
@property (weak, nonatomic) IBOutlet UISwitch *accentsAndDiacriticsSwitch;
@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *themeTableViewCells;

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
    self.accentsAndDiacriticsSwitch.on = [settings removeAccentsAndDiacritics];
    
    
    
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
    } else if (s == self.accentsAndDiacriticsSwitch)
    {
        [settings setRemoveAccentsAndDiacritics:s.on];
    }
}

- (void)selectThemeAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    for (UITableViewCell *cell in self.themeTableViewCells)
    {
        if (cell != selectedCell)
        {
        cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

#pragma mark - UITableViewDelegate

#define kSettingsTableViewSectionGeneral 0
#define kSettingsTableViewSectionTheme 1
#define kSettingsTableViewSectionAbout 2
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case kSettingsTableViewSectionTheme:
            [self selectThemeAtIndexPath:indexPath];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            break;
            
        default:
            break;
    }
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *returnIndexPath = nil;
    switch (indexPath.section) {
        case kSettingsTableViewSectionTheme:
        case kSettingsTableViewSectionAbout:
            returnIndexPath = indexPath;
            break;
        default:
            break;
    }
    
    return returnIndexPath;
}

@end
