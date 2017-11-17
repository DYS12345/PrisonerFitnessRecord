//
//  DifficultyCoefficienViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/17.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "DifficultyCoefficienViewController.h"

@interface DifficultyCoefficienViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *ary;
@property (nonatomic, assign) NSInteger selectNum;

@end

@implementation DifficultyCoefficienViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ary = @[@"0.2", @"0.4", @"0.6", @"0.8", @"1.0"];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.selectedItemStr = self.ary[0];
}

- (IBAction)done:(id)sender {
    self.selectItemBlock(self.selectedItemStr, self.selectNum);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)otherCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.ary.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.ary[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedItemStr = self.ary[row];
    self.selectNum = row;
}

@end
