//
//  NSObject+Property.m
//  FMDBManager
//
//  Created by APP on 24/05/2019.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

+(instancetype)modelWithDict:(id)dict{
    NSObject *obj = [[self alloc] init];
    [obj transformDict:dict];
    return  obj;
}

-(void)transformDict:(id)dict{
    
    Class cls = self.class;
    //count:成员变量个数
    unsigned int Count = 0;
    //获取成员变量数组
    Ivar *ivars = class_copyIvarList(cls, &Count);
    //遍历所有成员变量
    for (int i=0; i<Count; i++) {
                    
            //获取成员变量
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            //成员变量名转为属性名，去掉_
            key = [key substringFromIndex:1];

            //取出字典的值
            id value = dict[key];
            
            //自定义接收属性值
            if ([self respondsToSelector:@selector(modelCustomPropertyMapper)]) {
                NSDictionary *mapDict = [self modelCustomPropertyMapper];
                if ([mapDict.allKeys containsObject:key] ) {
                    value = dict[mapDict[key]];
                }
            }
            
            //如果模型属性数量大于字典键值对数理，模型属性会被赋值为nil而报错
            if (value==nil) continue;
            //获取成员变量的类型
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            //如果属性是对象类型(字典或者数绷带包含字典)
            NSRange range = [type rangeOfString:@"@"];
            if (range.location !=NSNotFound) {
                // 那么截取对象的名字（比如@"Dog"，截取为Dog）
                type = [type substringWithRange:NSMakeRange(2, type.length-3)];
                // 排除系统的对象类型(如果人为的设置自定义的类带@”NS“如：NSBook,则会出现错误)
                if (![type hasPrefix:@"NS"]) {//字典
                    //将对象名转换为对象的类型，将新的对象字典转模型（递归)
                    Class class = NSClassFromString(type);
                    value = [class modelWithDict:value];
                }else if ([type isEqualToString:@"NSArray"]){//数组
                    // 如果是数组类型，将数组中的每个模型进行字典转模型，先创建一个临时数组存放模型
                    NSArray *array = (NSArray *)value;
                    NSMutableArray *mArray = [NSMutableArray array];
                    //获取每个模型的类型
                    id class;
                    if ([self respondsToSelector:@selector(modelContainerPropertyGenericClass)]) {
                        //获取数组中每个字典对应转换的类型，即重写modelContainerPropertyGenericClass方法返回的类型
                        NSDictionary *classDict = [self modelContainerPropertyGenericClass];
                        if ([classDict.allKeys containsObject:key]) {
                            class = NSClassFromString(classDict[key]);
                        }
                        
                    }
                    
                    // 将数组中的所有模型进行字典转模型
                    for (int i=0; i<array.count; i++) {
                        if (class==nil){
                            [mArray addObject:array[i]];
                        }else{
                            [mArray addObject:[class modelWithDict:value[i]]];
                        }
                    }
                    value = mArray;
                }
                
            }
            //利用KVC将字典中的值设置到模型上
            [self setValue:value forKeyPath:key];
    }
    free(ivars);
}

- (NSDictionary <NSString *, id>*)modelContainerPropertyGenericClass{
    return nil;
}

-(NSDictionary <NSString *, id>*)modelCustomPropertyMapper{
    return nil;
}


@end
