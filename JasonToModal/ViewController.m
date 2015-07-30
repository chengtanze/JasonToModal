//
//  ViewController.m
//  JasonToModal
//
//  Created by ciwong-huanghg on 15/7/30.
//  Copyright (c) 2015年 Hype. All rights reserved.
//

#import "ViewController.h"
#import "TestModal.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestModal * test = [[TestModal alloc]init];
    NSArray * array = [test PropertyKeys];
    NSLog(@"%@", array);
    NSString * data = @"{\"state\":1,\"data\":1}";

    
    NSString * jason = @"{\"state\":0,\"data\":[{\"id\":\"1\",\"type\":\"\u86cb\u7cd5\",\"isActive\":\"0\"},{\"id\":\"2\",\"type\":\"\u9152\u6c34\",\"isActive\":\"0\"}]}";
    
    
    
    NSData* mydata = [jason dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * retDictData = [NSJSONSerialization  JSONObjectWithData:mydata options:0 error:nil];
    NSArray * arr = [retDictData objectForKey:@"data"];
    
    
    NSArray * listArray = [test convertJsonData:arr];
    TestModal * modeal1 = listArray[0];
    TestModal * modeal2 = listArray[1];
    NSLog(@"%ld-%@-%ld", modeal1.id, modeal1.type, modeal1.isActive);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
