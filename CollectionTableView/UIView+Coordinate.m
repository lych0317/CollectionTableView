//
//  UIView+Coordinate.m
//  beethoven-new
//
//  Created by li yuanchao on 15/4/7.
//
//

#import "UIView+Coordinate.h"

@implementation UIView (Coordinate)

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)centerX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)centerY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

@end
