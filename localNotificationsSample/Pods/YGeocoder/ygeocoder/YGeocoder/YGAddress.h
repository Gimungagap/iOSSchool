//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>

@class YGAddressLocality;

@interface YGAddress : NSObject <NSCopying>

@property (nonatomic, copy) NSString *addressLine;
@property (nonatomic, copy) NSString *countryNameCode;
@property (nonatomic, copy) NSString *countryName;
@property (nonatomic, strong) YGAddressLocality *locality;

- (instancetype)initWithDictionary:(NSDictionary *)rawObject;
+ (instancetype)addressInfoWithDictionary:(NSDictionary *)rawObject;

@end
