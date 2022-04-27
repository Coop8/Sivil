#include "SivilController.h"
#import <spawn.h> //Make sure to import this for respring to work

#define tint [UIColor colorWithRed: 0.45 green: 0.43 blue: 0.77 alpha: 1.00] //choose the one you want, google how to convert rgb/hex to UIColor


@implementation SivilController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)openGithub { //Github button
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/Coop8/Sivil"]
	options:@{}
	completionHandler:nil];
}

- (void)lukiTwitter { //Twitter button
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Lukii120"]
	options:@{}
	completionHandler:nil];
}

- (void)myTwitter { //Twitter button
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/CoopDev8"]
	options:@{}
	completionHandler:nil];
}

- (void)featherIcons { //Twitter button
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://feathericons.com/"]
	options:@{}
	completionHandler:nil];
}

- (void)respring { //Respring button
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/sbreload"]) { //sbreload if available
  			pid_t pid;

  		const char* args[] = {"sbreload", NULL};

  		posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
	} else {
  		pid_t pid;

  		const char* args[] = {"killall", "backboardd", NULL};

  		posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL); //if sbreload is not available killall backboardd
		}
}
//I want to thank MTAC for this respring code

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	//Set the minimum offset before scrolling and creates the view and sets it as title view
	if(!self.navigationItem.titleView) {
		SVLAnimatedNav *titleView = [[SVLAnimatedNav alloc] initWithTitle:@"Sivil" minimumScrollOffsetRequired:30];
		self.navigationItem.titleView = titleView;
	}

	self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed: 0.45 green: 0.43 blue: 0.77 alpha: 1.00]; // tint color (background)
	self.navigationController.navigationController.navigationBar.shadowImage = [UIImage new]; // removes the shadow line that acts as separator
	self.navigationController.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated { //reset everything back to it's original state, otherwise it'll affect all the navigation bars in the settings app

    [super viewWillDisappear:animated];

    self.navigationController.navigationController.navigationBar.barTintColor = nil;
    self.navigationController.navigationController.navigationBar.translucent = YES;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

	if([self.navigationItem.titleView respondsToSelector:@selector(adjustLabelPositionToScrollOffset:)]) {
		[(SVLAnimatedNav *)self.navigationItem.titleView adjustLabelPositionToScrollOffset:scrollView.contentOffset.y];
		//Updates the view as you scroll
	}
}

@end

@implementation SivilTableCell

- (void)tintColorDidChange {

    [super tintColorDidChange];

    self.textLabel.textColor = tint;
    self.textLabel.highlightedTextColor = tint;

}

- (void)refreshCellContentsWithSpecifier:(PSSpecifier *)specifier {

    [super refreshCellContentsWithSpecifier:specifier];

    if ([self respondsToSelector:@selector(tintColor)]) {

        self.textLabel.textColor = tint;
        self.textLabel.highlightedTextColor = tint;

    }
}

@end

@implementation AdvancedCellController


- (NSArray *)specifiers {

	if(!_specifiers) _specifiers = [self loadSpecifiersFromPlistName:@"AdvancedCell" target:self];

	return _specifiers;

}

@end
