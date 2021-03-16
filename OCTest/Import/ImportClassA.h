//
//  ImportClassA.h
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImportClassA : NSObject

@property (nonatomic, copy) NSString *name;

- (void)sayHello NS_SWIFT_NAME(say());

@end

NS_ASSUME_NONNULL_END
