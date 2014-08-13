//
//  TouchDemoViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/13.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "TouchDemoViewController.h"


@interface TouchDemoViewController ()

@end

@implementation TouchView
- (id) initWithFrame:(CGRect)frame
{
    frame.origin.y = 0.0;
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        self.multipleTouchEnabled = YES;
        self.backgroundColor = [UIColor blackColor];
        for (int i=0; i<4; i++) {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.marlin-arms.com/support/ipsdk/images/touchdemo/%d.png", i+1]];
            images[i] = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
            offsets[i] = CGPointMake(0.0, 0.0);
        }
        offsets[0] = CGPointMake(0.0, 0.0);
        offsets[1] = CGPointMake(self.frame.size.width - images[1].size.width, 0.0);
        offsets[2] = CGPointMake(0.0, self.frame.size.height - images[2].size.height);
        offsets[3] = CGPointMake(self.frame.size.width - images[3].size.width, self.frame.size.height - images[3].size.height);
    }
    NSLog(@"%@", NSStringFromCGRect(self.frame));
    return self;
}

-(void)drawRect:(CGRect)rect
{
    for (int i=0; i<4; i++) {
        [images[i] drawInRect:CGRectMake(offsets[i].x, offsets[i].y, images[i].size.width, images[i].size.height)];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch;
    int touchId = 0;
    
    NSEnumerator *enumerator = [touches objectEnumerator];
    while ((touch = (UITouch *)[enumerator nextObject])) {
        traking[touchId] = -1;
        CGPoint location = [touch locationInView:self];
        for (int i=3; i>=0; i--) {
            CGRect rect = CGRectMake(offsets[i].x, offsets[i].y, images[i].size.width, images[i].size.height);
            if (CGRectContainsPoint(rect, location)) {
                NSLog(@"タッチID %d 開始。画像 %d を追跡中。¥n", touchId, i);
                traking[touchId] = i;
                break;
            }
        }
        touchId++;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch;
    int touchId = 0;
    
    NSEnumerator *enumerator = [touches objectEnumerator];
    while ((touch = (UITouch *)[enumerator nextObject])) {
        if (traking[touchId] != -1) {
            NSLog(@"タッチID %d 開始。画像 %d を追跡中。¥n", touchId, traking[touchId]);
            CGPoint location = [touch locationInView:self];
            CGPoint oldLocation = [touch previousLocationInView:self];
            offsets[traking[touchId]].x += (location.x - oldLocation.x);
            offsets[traking[touchId]].y += (location.y - oldLocation.y);
            if (offsets[traking[touchId]].x < 0.0) {
                offsets[traking[touchId]].x = 0.0;
            }
            if (offsets[traking[touchId]].x + images[traking[touchId]].size.width > self.frame.size.width) {
                offsets[traking[touchId]].x = self.frame.size.width - images[traking[touchId]].size.width;
            }
            if (offsets[traking[touchId]].y < 0.0) {
                offsets[traking[touchId]].y = 0.0;
            }
            if (offsets[traking[touchId]].y + images[traking[touchId]].size.height > self.frame.size.height) {
                offsets[traking[touchId]].y = self.frame.size.height - images[traking[touchId]].size.height;
            }
        }
        touchId++;
    }
    [self setNeedsDisplay];
}

-(void)modify
{
    NSLog(@"%@", NSStringFromCGRect(self.frame));
}

@end

@implementation TouchDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    touchView = [[TouchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"--------%@",[touchView performSelector:@selector(recursiveDescription)]);
    self.view = touchView;
    [touchView modify];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
