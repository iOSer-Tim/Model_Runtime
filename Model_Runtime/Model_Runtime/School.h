//
//  School.h
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "BaseModel.h"
#import "Grade.h"

NS_ASSUME_NONNULL_BEGIN


@interface School : BaseModel

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * address;
@property(nonatomic,strong)Grade * grade;

@end

NS_ASSUME_NONNULL_END
