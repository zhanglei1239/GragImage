//
//  DragCell.h
//  DragImage
//
//  Created by highcom on 15-2-3.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragCell : UIView
@property (nonatomic,retain) UIColor * color;
@property (nonatomic,assign) int index;
@property (nonatomic,assign) id delegate;
-(void)setWithData:(UIColor *)color index:(int)idx;
@end
@protocol DragCellDeleegate <NSObject>

-(void)longPressCell:(DragCell *)cell;
-(void)longPressCancel:(UILongPressGestureRecognizer *)gesture cell:(DragCell *)cell;
-(void)longPressMove:(UILongPressGestureRecognizer *)gesture cell:(DragCell *)cell;
@end