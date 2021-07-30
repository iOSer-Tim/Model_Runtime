//
//  infos.h
//  Model_Runtime
//
//  Created by APP on 09/07/2021.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface infos : BaseModel

@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)int number;

@end

NS_ASSUME_NONNULL_END
