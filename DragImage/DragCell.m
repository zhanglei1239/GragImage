//
//  DragCell.m
//  DragImage
//
//  Created by highcom on 15-2-3.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "DragCell.h"

@implementation DragCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILongPressGestureRecognizer * longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        longpress.minimumPressDuration = .1;
        [self addGestureRecognizer:longpress];
//        UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
//                                                                            action:@selector(handlePanGestures:)];
//        //无论最大还是最小都只允许一个手指
//        panGestureRecognizer.minimumNumberOfTouches = 1;
//        panGestureRecognizer.maximumNumberOfTouches = 1;
//        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

-(void)setWithData:(UIColor *)color index:(int)idx{
    self.color = color;
    self.index = idx;
    [self setBackgroundColor:color];
    
}

-(void)longPress:(UILongPressGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateBegan){
        if (_delegate &&[_delegate respondsToSelector:@selector(longPressCell:)]) {
            [_delegate longPressCell:self];
        }
    }else if(gesture.state == UIGestureRecognizerStateChanged){
        if (_delegate && [_delegate respondsToSelector:@selector(longPressMove:cell:)]) {
            [_delegate longPressMove:gesture cell:self];
        }
    }else{
        if (_delegate &&[_delegate respondsToSelector:@selector(longPressCancel:cell:)]) {
            [_delegate longPressCancel:gesture cell:self];
        }
    }
}
//- (void) handlePanGestures:(UIPanGestureRecognizer*)paramSender{
//    if (paramSender.state == UIGestureRecognizerStateBegan) {
//        
//    }else
//    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){
//        //通过使用 locationInView 这个方法,来获取到手势的坐标
//        CGPoint location = [paramSender locationInView:paramSender.view.superview];
//        paramSender.view.center = location;
//    }
//}
@end
