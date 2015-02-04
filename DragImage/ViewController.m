//
//  ViewController.m
//  DragImage
//
//  Created by highcom on 15-2-3.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "DragCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.list1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20)];
    [self.list1 setBackgroundColor:[UIColor clearColor]];
    [self.list1 setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:self.list1];
    
    self.arr1 = [NSMutableArray array];
    for(int i = 0 ; i<40; i++){
        UIColor * color = [UIColor colorWithRed:(arc4random() % 256 / 256.0) green:(arc4random() % 256 / 256.0) blue:(arc4random() % 256 / 256.0) alpha:1];
        [self.arr1 addObject:color];
    }
    
    [self initialList1];
    
    self.list2 = [[UIScrollView alloc] initWithFrame:CGRectMake(60, 20, [UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height-20)];
    [self.list2 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.list2];
    
    self.arr2 = [NSMutableArray array];
    for(int i = 0 ; i<40; i++){
        UIColor * color = [UIColor blackColor];
        [self.arr2 addObject:color];
    }
    
    [self initialList2];
    
  
    
}


-(void)initialList1{
    int count = 0;
    for (UIColor * color in self.arr1) {
        DragCell * view = [[DragCell alloc] initWithFrame:CGRectMake(0, 60*count, 60, 60)];
        view.delegate = self;
        [view setWithData:color index:count];
        [view setBackgroundColor:color];
        [self.list1 addSubview:view];
        count++;
    }
    [self.list1 setContentSize:CGSizeMake(60, count*60)];
}

-(void)initialList2{
    self.cellArr = [NSMutableArray array];
    for (UIView * view in self.cellArr) {
        [view removeFromSuperview];
    }
    int count = 0;
    for (UIColor * color in self.arr2) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(64*(count%4)+4, count/4*64, 60, 60)];
        [view setBackgroundColor:color];
        [self.list2 addSubview:view];
        [self.cellArr addObject:view];
        count++;
    }
    CGFloat width = (count>4?4*64:count*64);
    CGFloat height = (count%4 == 0?(count/4*64):((count/4+1)*64));
    [self.list2 setContentSize:CGSizeMake(width, height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)longPressCell:(DragCell *)cell{
    self.dragView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.view addSubview:self.dragView];
    self.dragView.center = CGPointMake(cell.center.x,cell.center.y-self.list1.contentOffset.y+20);
    UIColor * color = [self.arr1 objectAtIndex:cell.index];
    [self.dragView setBackgroundColor:color];
    [self.view bringSubviewToFront:self.dragView];
}

-(void)longPressCancel:(UILongPressGestureRecognizer *)gesture cell:(DragCell *)cell{
    CGPoint point  = [gesture locationInView:self.view];
    if (CGRectContainsPoint(self.list2.frame, point)) {
        int count = 0;
        for (UIView * view in self.cellArr) {
            if (CGRectContainsPoint(view.frame, CGPointMake(point.x-self.list2.frame.origin.x, point.y-self.list2.frame.origin.y+self.list2.contentOffset.y))) {
                break;
            }
            count++;
        }
        if (count+1<=[self.cellArr count]) {
            [self.arr2 insertObject:cell.color atIndex:count];
            [self.arr2 removeObjectAtIndex:count+1];
            UIView * v = [self.cellArr objectAtIndex:count];
            [v setBackgroundColor:[self.arr2 objectAtIndex:count]];
            [self initialList2];
        }

    }else{
       
    }
    [self.dragView removeFromSuperview];
}
-(void)longPressMove:(UILongPressGestureRecognizer *)gesture cell:(DragCell *)cell{ 
    CGPoint point  = [gesture locationInView:self.view];
    self.dragView.center = CGPointMake(point.x, point.y);
}
@end
