#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>

@interface SVLColorPickerCell : PSTableCell <UIColorPickerViewControllerDelegate>
-(UIColor *)colorFromHex:(NSString *)hex useAlpha:(BOOL)useAlpha;
-(NSString *)hexFromColor:(UIColor *)color useAlpha:(BOOL)useAlpha;
-(NSString *)legibleStringFromHex:(NSString *)hexString;
@end

@interface UIView (Private)
-(UIViewController *)_viewControllerForAncestor;
@end

@interface PSSpecifier (Private)
-(void)performSetterWithValue:(id)value;
-(id)performGetter;
@end
