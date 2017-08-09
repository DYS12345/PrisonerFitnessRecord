//
//  FillInDetailsViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/8.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "FillInDetailsViewController.h"
#import "Masonry.h"
#import "OtherMacro.h"
#import "SVProgressHUD.h"

@interface FillInDetailsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *wordView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation FillInDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wordView.layer.masksToBounds = YES;
    self.wordView.layer.cornerRadius = 3;
    self.tf.delegate = self;
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view insertSubview:effectView belowSubview:self.wordView];
}

-(void)setModel:(FinishedModel *)model{
    _model = model;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (IBAction)cancel:(id)sender {
    if (self.tf.text.length == 0) {
        
    } else {
        if (![[self.model.countAry class] isKindOfClass:[NSMutableArray class]]) {
            self.model.countAry = [NSMutableArray array];
        }
        [self.model.countAry addObject:self.tf.text];
        [self.model saveOrUpdate];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
