//
//  CategorySelectViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/16.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "CategorySelectViewController.h"

@interface CategorySelectViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *otherCancelBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *ary;

@end

@implementation CategorySelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.otherCancelBtn addTarget:self action:@selector(otherCancel) forControlEvents:UIControlEventTouchUpInside];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.ary = @[@"读一本书", @"看完视频教程", @"养成一个习惯"];
    self.selectedItemStr = self.ary[0];
}

-(void)otherCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    self.selectItemBlock(self.selectedItemStr);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.ary[row];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedItemStr = self.ary[row];
}

@end
