#import "SVLAnimatedNav.h"

@implementation SVLAnimatedNav {
  UILabel *_titleLabel;
  NSLayoutConstraint *_yConstraint;
  CGFloat _minimumOffsetRequired;
}

  -(instancetype)initWithTitle:(NSString *)title minimumScrollOffsetRequired:(CGFloat)minimumOffset {
    if([super init]) {
      self.superview.clipsToBounds = YES;

      _titleLabel = [[UILabel alloc] init];
      _titleLabel.text = title;
      _titleLabel.textAlignment = NSTextAlignmentCenter;
      _titleLabel.textColor = [UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1.00];
      _titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
      _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
      [_titleLabel sizeToFit];

      [self addSubview:_titleLabel];

      [NSLayoutConstraint activateConstraints:@[
        [self.widthAnchor constraintEqualToAnchor:_titleLabel.widthAnchor],
        [self.heightAnchor constraintEqualToAnchor:_titleLabel.heightAnchor],

        [_titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        _yConstraint = [_titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:30],
      ]];

      _minimumOffsetRequired = minimumOffset;
    }

    return self;
  }

  -(void)adjustLabelPositionToScrollOffset:(CGFloat)offset {
    CGFloat adjustment = 40 - (offset - _minimumOffsetRequired);
    if(offset >= _minimumOffsetRequired) {
      if(adjustment <= 0) {
        _yConstraint.constant = 0;
      } else {
        _yConstraint.constant = adjustment;
      }

    } else {
      _yConstraint.constant = -40;
    }
  }
@end

//Code modified from the link below
//https://github.com/LacertosusRepo/Preference-Cell-Examples/tree/main/Animated%20Title%20View
