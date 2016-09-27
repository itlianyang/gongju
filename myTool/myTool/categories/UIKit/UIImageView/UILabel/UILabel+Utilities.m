//
//  UILabel+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UILabel+Utilities.h"

@implementation UILabel (Utilities)

- (instancetype)initWithFont:(UIFont *)font
                   textColor:(UIColor *)textColor
               textAlignment:(NSTextAlignment)textAlignment {
    if (self = [super init]) {
        self.font = font;
        self.textAlignment = textAlignment ? textAlignment : NSTextAlignmentLeft;
        self.textColor = textColor;
    }
    return self;
}

+ (instancetype)labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment {
    return [[UILabel alloc] initWithFont:font textColor:textColor textAlignment:textAlignment];
}

- (void)alignTop {
  int lines = self.frame.size.height / self.font.leading;
  for(int i=0; i<lines; i++)
    self.text = [self.text stringByAppendingString:@"\n "];
}

- (void)alignBottom {
  int lines = self.frame.size.height / self.font.leading;
  for(int i=0; i<lines; i++)
    self.text = [NSString stringWithFormat:@" \n%@",self.text];
}

@end
