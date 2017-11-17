//
//  DateSelectViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/17.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "DateSelectViewController.h"

@interface DateSelectViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DateSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.datePickerMode = UIDatePickerModeDate;
}

- (IBAction)done:(id)sender {
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    NSString *str = [NSString stringWithFormat:@"%ld %ld %ld", currentYear, currentMonth, currentDay];
    self.selectItemBlock(str, 0);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)otherCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
