//
//  ReLiangDuiZhaoViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "ReLiangDuiZhaoViewController.h"
#import "MobileNet.h"
#import <CoreML/CoreML.h>
#import <Vision/Vision.h>
#import "AFNetworking.h"
#import "NSString+FBMD5.h"

@interface ReLiangDuiZhaoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UIImage *imag;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSString *itemStr;

@end

@implementation ReLiangDuiZhaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (IBAction)uploadImage:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return;
    }
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imag = info[UIImagePickerControllerOriginalImage];
    
    MobileNet *modelV3 = [[MobileNet alloc] init];
    NSError *err = [NSError new];
    VNCoreMLModel *model = [VNCoreMLModel modelForMLModel:modelV3.model error:&err];
    VNCoreMLRequest *request = [[VNCoreMLRequest alloc] initWithModel:model completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        CGFloat confidence = 0.0f;
        VNClassificationObservation *tempClassification = nil;
        for (VNClassificationObservation *classification in request.results) {
            if (classification.confidence > confidence) {
                confidence = classification.confidence;
                tempClassification = classification;
            }
        }
//        NSString *str = [NSString stringWithFormat:@"识别结果：%@-----匹配率为：%@", tempClassification.identifier, @(tempClassification.confidence)];
        
        NSString *urlstring = @"http://openapi.youdao.com/api";
        NSString *q = tempClassification.identifier;
        NSString *salt = [NSString stringWithFormat:@"%d", (arc4random() % 501) + 500];
        NSString *str = [NSString stringWithFormat:@"%@%@%@%@", @"04a99aa001f4f279", q, salt, @"rARcknYAfMr2gGZQHFqaQawORRXy78zu"];
        NSString *sign = [NSString getMd5_32Bit_String:str];
        NSDictionary *dict =@{
                              @"q": q,
                              @"from":@"EN",
                              @"to":@"zh-CHS",
                              @"appKey":@"04a99aa001f4f279",
                              @"salt":salt,
                              @"sign": sign
                              };
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [manager POST:urlstring parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            self.itemStr = responseObject[@"translation"][0];
            [self.tableview reloadData];
            
            NSString *urlstring1 = @"http://www.boohee.com/food/search";
            NSDictionary *param = @{
                                    @"keyword" : @"%E8%8B%B9%E6%9E%9C"
                                    };
            AFHTTPSessionManager *manager1 = [AFHTTPSessionManager manager];
            manager1.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager1.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", @"JSON/text",nil];
            [manager1 POST:urlstring1 parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"sdasdsadsa  成功  %@", responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"失败 %@", error);
            }];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失败 %@", error);
        }];
    }];
    
    VNImageRequestHandler *handler = [[VNImageRequestHandler alloc] initWithCGImage:self.imag.CGImage options:nil];
    NSError *error = nil;
    [handler performRequests:@[request] error:&error];
    if (error) {
        NSLog(@"adasdas  %@", error.localizedDescription);
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.itemStr;
    return cell;
}

@end
