//
//  EvaluatAlterController.m
//  AlterDemo
//
//  Created by Damon on 16/7/11.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "EvaluatAlterController.h"
#import "HCSStarRatingView.h"
#import "DWModalConst.h"

@interface EvaluatAlterController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *rateView;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@property (nonatomic, copy) DWCompletionHandler block;/**<  */

@end

@implementation EvaluatAlterController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    self.contentTextView.layer.cornerRadius =  2;
    self.contentTextView.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentTextView.layer.borderWidth = 1;
    self.contentTextView.delegate = self;
    self.contentTextView.text = @"写下您的意见和建议";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}



-(void)dealloc{
    
}

#pragma mark -- UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"写下您的意见和建议"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithRed:58.0 /255 green:58.0 /255 blue:58.0 /255 alpha:1];
        textView.font      = [UIFont systemFontOfSize:13.0f];
    }

}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length<1) {
        textView.text = @"写下您的意见和建议";
        textView.textColor = [UIColor lightGrayColor];
        textView.font      = [UIFont systemFontOfSize:13.0f];
    }
    self.navigationItem.rightBarButtonItem = nil;
}

- (IBAction)commitClick:(UIButton *)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
