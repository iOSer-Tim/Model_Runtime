//
//  Person.m
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "Person.h"

@implementation Person

//重写modelContainerPropertyGenericClass方法返回的数组中字典模型对应的类型：
- (NSDictionary <NSString *, id>*)modelContainerPropertyGenericClass{
    return @{@"grades":@"GradesModel",@"infos":@"InfoModel"};
}

//重写modelCustomPropertyMapper方法返回字典模型对应的类型：
-(NSDictionary <NSString *, id>*)modelCustomPropertyMapper{
    return @{@"cityName":@"city"};
}

@end
