//
//  DWModal.m
//  AlterDemo
//
//  Created by Damon on 16/8/5.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalTransitioningDelegate.h"
#import "DWModal.h"

@interface DWModal ()

@property (nonatomic, strong) DWModalTransitioningDelegate *transitionDelegate;/**< 专场代理 */

@end


@implementation DWModal

+ (instancetype)sharedModal {
    static dispatch_once_t once;
    static DWModal *modal;
    dispatch_once(&once, ^ { modal = [[DWModal alloc] init]; });
    return modal;
}

+(void)modalController:(UIViewController *)controller{

    DWModal *modal = [DWModal sharedModal];

    controller.transitioningDelegate = modal.transitionDelegate;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.view.backgroundColor = [UIColor clearColor];

    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];

}




#pragma getter && setter 

-(DWModalTransitioningDelegate *)transitionDelegate{
    if (!_transitionDelegate) { _transitionDelegate = [[DWModalTransitioningDelegate alloc] init];}
    return _transitionDelegate;
}

@end
