//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>
#import "YGTypes.h"

@class YGGeoObjectMetaData;

@interface YGGeoObject : NSObject <NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detailedName;
@property (nonatomic, assign) YGEnvelope boundedBy;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) YGGeoObjectMetaData *metaData;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)geoObjectWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)geoObjectsArrayWithArray:(NSArray *)array;

@end
