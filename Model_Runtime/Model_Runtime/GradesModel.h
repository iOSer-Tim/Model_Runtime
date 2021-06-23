//
//  GradesModel.h
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GradesModel : BaseModel

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)double score;

@end

NS_ASSUME_NONNULL_END
