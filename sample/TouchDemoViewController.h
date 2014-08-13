//
//  TouchDemoViewController.h
//  sample
//
//  Created by 桜井 克朗 on 2014/08/13.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView{
    UIImage *images[4];
    CGPoint offsets[4];
    int traking[4];
}

@end

@interface TouchDemoViewController : UIViewController{
    TouchView *touchView;
}

@end
