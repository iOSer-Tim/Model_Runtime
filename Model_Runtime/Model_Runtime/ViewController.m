//
//  ViewController.m
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "ViewController.h"

#import "NSObject+Property.h"
#import "Person.h"

@interface ViewController ()

@property(nonatomic,copy)NSDictionary *dict;

@end

@implementation ViewController

-(NSDictionary *)dict {
    if (!_dict) {
        _dict = @{
                  @"name" : @"Tim",
                  @"age" : @18,
                  @"sex" : @"男",
                  @"city" : @"深圳市",
                  @"grades" : @[
                          @{
                              @"name" : @"语文",
                              @"score" : @125
                              },
                          @{
                              @"name" : @"数学",
                              @"score" : @146
                              },
                          @{
                              @"name" : @"英语",
                              @"score" : @112
                              }
                          ],
                  @"infos" : @[
                          @{
                              @"type" : @"语文",
                              @"number" : @100
                              },
                          @{
                              @"type" : @"数学",
                              @"number" : @101
                              },
                          @{
                              @"type" : @"英语",
                              @"number" : @102
                              }
                          ],
                  @"school" : @{
                          @"name" : @"宝安一中",
                          @"address" : @"宝安区",
                          @"grade" : @{
                                  @"name" : @"九年级",
                                  @"teacher" : @"Mr Li"
                                  }
                          }
                  };
    }
    return _dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //字典转模型
    Person *model = [Person modelWithDict:self.dict];
    
    NSLog(@"%@--%@",model.cityName,[model.grades firstObject]);
    
    NSLog(@"%@----%@",model.schoolM.name,model.schoolM.grade.teacher);
    
    NSLog(@"%@",model.infos);
}


@end
