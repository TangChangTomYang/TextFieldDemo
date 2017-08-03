//
//  NSString+ByteExtension.m
//  trimTest
//
//  Created by 　yangrui on 2017/8/3.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "NSString+ByteExtension.h"

@implementation NSString (ByteExtension)

/**返回字符串 实际的字节 长度  */
-(NSInteger)bytesLen{

  return   [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];

}

/** 给定一个字符串(中文\英文\emoj 都可以) 截取 subString 小于等于 bytesLen 字节长度的 完整 字符 */
-(NSString *)subStringLessThanBytesLen:(NSInteger)bytesLen{

    
    NSString *newStr = nil;
    NSInteger rawBytesLen = [self bytesLen];
    
    if(rawBytesLen <= bytesLen ){
        
        newStr = [self copy];
    }
    else{
    
        NSRange indexRange ;
        NSInteger toIndexBytesLen = 0;
        for (int i = 0; i < self.length ; i+= indexRange.length) {
            
            indexRange = [self rangeOfComposedCharacterSequenceAtIndex:i];
            
            toIndexBytesLen += strlen([self substringWithRange:indexRange].UTF8String);
            
            
            if (toIndexBytesLen > bytesLen) {
                
                newStr = [self substringWithRange:NSMakeRange(0, indexRange.location)];
                
                break;
            }
            
        
        }
    }
    

    return newStr;
  
  
}


/**检查 字符串的两端 是否 包含完整的trimStr,如果两端有包含,则删除两端的trimStr */
-(NSString *)trimString:(NSString *)trimStr{

    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:trimStr];
    
    return [self stringByTrimmingCharactersInSet:charSet];
}
@end
