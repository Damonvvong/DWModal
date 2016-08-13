//
//  ViewController.m
//  Example-OC
//
//  Created by Damon on 16/8/13.
//  Copyright © 2016年 damon. All rights reserved.
//

#import "ViewController.h"
#import "DWModal.h"
#import "EvaluatAlterController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)ModalVC:(id)sender {
	
	[DWModal modalController:[EvaluatAlterController new]];
}

@end
