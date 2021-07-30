//
//  Grade.m
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "Grade.h"

@implementation Grade

//重写modelCustomPropertyMapper方法返回字典模型对应的字段：
-(NSDictionary <NSString *, id>*)modelCustomPropertyMapper{
    return @{@"Teacher":@"teacher"};
}

@end
