//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>
#import "YGTypes.h"

@class YGAddress;

@interface YGGeoObjectMetaData : NSObject <NSCopying>

// TODO property 'kind'
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) YGeocodePrecision precision;

@property (nonatomic, strong) YGAddress *addressDetails;

- (instancetype)initWithDictionary:(NSDictionary *)rawObject;
+ (instancetype)metaDataWithDictionary:(NSDictionary *)rawObject;

@end
