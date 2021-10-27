#include <spawn.h>


#import <UIKit/UIKit.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>



@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;
@end



@interface SivilTitle : PSTableCell <PreferencesTableCustomView> {
    UIView *bgView;
    UILabel *packageNameLabel;
    UILabel *devLabel;
    UILabel *versionLabel;
}
@end



@implementation SivilTitle

  - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	    if (self) {

		      int width = self.contentView.bounds.size.width;

          CGRect nameFrame = CGRectMake(-10, 90, width, 50);
          CGRect devFrame = CGRectMake(-10, 45, width, 50);
          CGRect versionFrame = CGRectMake(275, 45, width, 50);
          CGRect bgFrame = CGRectMake(-33, -1030, 800, 1200);
          //Creating frames for all subviews

          bgView = [[UIView alloc] initWithFrame:bgFrame];
          [bgView setBackgroundColor:[UIColor colorWithRed: 0.45 green: 0.43 blue: 0.77 alpha: 1.00]];
          //Creating background color for title view

          packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
          [packageNameLabel setFont:[UIFont systemFontOfSize:50 weight: UIFontWeightSemibold] ];
          packageNameLabel.textColor = [UIColor whiteColor];
          packageNameLabel.text = @"Sivil";
          //Creating label for package text

          devLabel = [[UILabel alloc] initWithFrame:devFrame];
          [devLabel setFont:[UIFont systemFontOfSize:25 weight: UIFontWeightMedium] ];
          devLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
          devLabel.text = @"CoopDev";
          //Creating label for dev text

          versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
          [versionLabel setFont:[UIFont systemFontOfSize:16 weight: UIFontWeightMedium] ];
          versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.65];
          versionLabel.text = @"v1.0.0";
          //Creating label for translation text


          [self addSubview:bgView];
          [self addSubview:packageNameLabel];
          [self addSubview:devLabel];
          [self addSubview:versionLabel];
          //Adding all the subviews

        }
    	   return self;

}


- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WotsitBetaTitleCell" specifier:specifier];
}


- (CGFloat)preferredHeightForWidth:(CGFloat)arg1{
    return 175.0f;
}


- (CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}

@end

//This title view is inspired by Dave Van Wijk's QuitAll tweak.
