//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>
#import "YGTypes.h"

@interface YGResponse : NSObject

@property (nonatomic, readonly) NSString *request;
@property (nonatomic, readonly) NSInteger found;
@property (nonatomic, readonly) NSInteger results;
@property (nonatomic, readonly) YGEnvelope boundedBy;

@property (nonatomic, readonly) NSArray *objects;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary;

@end
