#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

#import "SVLAnimatedNav.h"

@interface SivilController : PSListController
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
@end

@interface PSListController (Private)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
-(id)readPreferenceValue:(PSSpecifier *)arg1;
@end

@interface SivilTableCell : PSTableCell

@end

@interface AdvancedCellController : PSListController

@end
