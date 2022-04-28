#import "Tweak.h"

@interface SBSearchBackdropView : UIView
@end

@interface SPUIDefaults : UIView
@end

NSString *backgroundColor;

//This is a function that converts a given hex code into a UIColor object. This function was taken from https://stackoverflow.com/a/3805354. Take a look!
UIColor * returnUIColor(NSString * realText) {
	NSString *cleanString = [realText stringByReplacingOccurrencesOfString:@"#" withString:@""];
	if([cleanString length] == 3) {
		cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
						[cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
						[cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
						[cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
	}
	if([cleanString length] == 6) {
		cleanString = [cleanString stringByAppendingString:@"ff"];
	}

	unsigned int baseValue;
	[[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];

	float red = ((baseValue >> 24) & 0xFF)/255.0f;
	float green = ((baseValue >> 16) & 0xFF)/255.0f;
	float blue = ((baseValue >> 8) & 0xFF)/255.0f;
	float alpha = ((baseValue >> 0) & 0xFF)/255.0f;

	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

%hook SBSearchBackdropView

  -(void)didMoveToWindow{ //Better to hook this method than layoutSubviews
    %orig;

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.coopdev.sivilprefs"]; //Creating a dictionary for my preference keys
      id isEnabled = [bundleDefaults valueForKey:@"isEnabled"]; //Defining enabled switch
      CGFloat blurValue = [[bundleDefaults valueForKey:@"blurValue"]floatValue]; //Defining slider


      if ([isEnabled isEqual:@1]) { //If enabled switch is off
          if(([self.superview class] == %c(_SBRootFolderLayoutWrapperView))) { //Check for correct SBSearchBackdropView (Thanks Luki120 for this)
            self.alpha = blurValue; //Set alpha
            self.backgroundColor = returnUIColor(backgroundColor); //Set color
            }
        }
    }
%end

//EXPERIMENTAL FLOATING SPOTLIGHT
%hook SPUIDefaults

      + (BOOL)enableFloatingWindow{

        BOOL value = %orig;

        NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.coopdev.sivilprefs"]; //Creating a dictionary for my preference keys
          id isEnabled = [bundleDefaults valueForKey:@"isEnabled"]; //Defining enabled switch
          id floatEnable = [bundleDefaults valueForKey:@"floatEnable"]; //Defining float enabled switch

          if([isEnabled isEqual:@1]) {
            if([floatEnable isEqual:@1])return YES;
            else return NO;
          }

          return value;
        }

%end

%ctor {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.coopdev.sivilprefs"];
    backgroundColor = [bundleDefaults valueForKey:@"backgroundColor"];
}
