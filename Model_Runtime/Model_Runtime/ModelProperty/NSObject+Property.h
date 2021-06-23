//
//  NSObject+Property.h
//  FMDBManager
//
//  Created by APP on 24/05/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)

//字典转模型
+(instancetype)modelWithDict:(id)dict;

// 属性自定义类映射，用来实现自定义类的转换声明
- (NSDictionary <NSString *, id>*)modelContainerPropertyGenericClass;

// 属性数据映射，用来定义多样化数据时转换声明
- (NSDictionary <NSString *, id>*)modelCustomPropertyMapper;

@end

NS_ASSUME_NONNULL_END
