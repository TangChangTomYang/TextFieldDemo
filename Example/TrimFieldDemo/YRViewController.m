//
//  YRViewController.m
//  TrimFieldDemo
//
//  Created by TangchangTomYang on 08/03/2017.
//  Copyright (c) 2017 TangchangTomYang. All rights reserved.
//

#import "YRViewController.h"
#import "NSString+ByteExtension.h"


@interface YRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation YRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	    [self.textField addTarget:self action:@selector(textFieldDidChangeBytes:) forControlEvents:UIControlEventEditingChanged];
}

#define  MAXLen   24

-(void)textFieldDidChangeBytes:(UITextField *)textField{
    NSString *text = textField.text;
    
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    //如果没有高亮选择的文字我们就开始 截取长度
    if(position == nil){
        
        // 字节处理
        NSInteger textBytesLen = [textField.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@" %@,bLen:%ld",textField.text,textBytesLen);
        if (textBytesLen > MAXLen) {
            
            textField.text = [textField.text subStringLessThanBytesLen:MAXLen];
        }
        
    }
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
