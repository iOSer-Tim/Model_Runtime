
# 前言
  Runtime实现iOS字典转模型

# 功能
- 字典转模型

# 使用方法
```
//字典转模型
+(instancetype)modelWithDict:(id)dict;

// 属性自定义类映射，用来实现自定义类的转换声明
- (NSDictionary <NSString *, id>*)modelContainerPropertyGenericClass;

// 属性数据映射，用来定义多样化数据时转换声明
- (NSDictionary <NSString *, id>*)modelCustomPropertyMapper;
```

# 调用示例,具体参考demo：
```
   //字典转模型
    Person *model = [Person modelWithDict:self.dict];
    
    NSLog(@"%@--%@",model.cityName,[model.grades firstObject]);
    
    NSLog(@"%@----%@",model.school.name,model.school.grade.teacher);
    
    NSLog(@"%@",model.infos);

```
