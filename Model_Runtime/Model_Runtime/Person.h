//
//  Person.h
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "BaseModel.h"
#import "NSObject+Property.h"
#import "School.h"
#import "infos.h"

NS_ASSUME_NONNULL_BEGIN

@class GradesModel,InfoModel;

@interface Person : BaseModel

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)int age;
@property(nonatomic,copy)NSString * sex;

@property(nonatomic,copy)NSString *cityName;

@property(nonatomic,copy)NSArray <GradesModel *>* grades;

@property(nonatomic,copy)NSArray <infos *>* infos;

@property(nonatomic,strong)School * schoolM;

@end

NS_ASSUME_NONNULL_END
