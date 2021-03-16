//
//  StaticProtocol.h
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StaticProtocol <NSObject>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@end

NS_ASSUME_NONNULL_END
