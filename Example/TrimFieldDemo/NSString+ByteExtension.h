//
//  NSString+ByteExtension.h
//  trimTest
//
//  Created by 　yangrui on 2017/8/3.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ByteExtension)


/**返回字符串 实际的字节 长度  */
-(NSInteger)bytesLen;

/** 给定一个字符串(中文\英文\emoj 都可以) 截取 subString 小于等于 bytesLen 字节长度的 完整 字符 */
-(NSString *)subStringLessThanBytesLen:(NSInteger)bytesLen;

/**检查 字符串的两端 是否 包含完整的trimStr,如果两端有包含,则删除两端的trimStr */
-(NSString *)trimString:(NSString *)trimStr;



@end
