# Model_Runtime
Runtime实现iOS字典转模型

字典转模型核心代码：
```
//字典转模型
+(instancetype)modelWithDict:(id)dict;

// 属性自定义类映射，用来实现自定义类的转换声明
- (NSDictionary <NSString *, id>*)modelContainerPropertyGenericClass;

// 属性数据映射，用来定义多样化数据时转换声明
- (NSDictionary <NSString *, id>*)modelCustomPropertyMapper;
```

调用示例,具体参考demo：
```
   //字典转模型
    Person *model = [Person modelWithDict:self.dict];
    
    NSLog(@"%@--%@",model.cityName,[model.grades firstObject]);
    
    NSLog(@"%@----%@",model.school.name,model.school.grade.teacher);
    
    NSLog(@"%@",model.infos);

```
