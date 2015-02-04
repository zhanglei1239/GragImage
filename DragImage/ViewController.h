//
//  ViewController.h
//  DragImage
//
//  Created by highcom on 15-2-3.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,retain) UIScrollView * list1;
@property (nonatomic,retain) UIScrollView * list2;
@property (nonatomic,retain) NSMutableArray * arr1;
@property (nonatomic,retain) NSMutableArray * arr2;
@property (nonatomic,retain) NSMutableArray * cellArr;
@property (nonatomic,retain) UIView * dragView;
@end

