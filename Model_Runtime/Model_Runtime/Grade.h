//
//  Grade.h
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Grade : BaseModel

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * teacher;

@end

NS_ASSUME_NONNULL_END
