//
//  InfoModel.h
//  Model_Runtime
//
//  Created by APP on 23/06/2021.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoModel : BaseModel

@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)int number;

@end

NS_ASSUME_NONNULL_END
