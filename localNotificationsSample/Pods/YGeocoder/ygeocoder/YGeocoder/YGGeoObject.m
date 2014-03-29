//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGGeoObject.h"
#import "YGGeoObjectMetaData.h"
#import "YGUtils.h"

@implementation YGGeoObject

- (instancetype)initWithDictionary:(NSDictionary *)rawObject
{
    if (!rawObject) {
        return nil;
    }
    self = [super init];
    if (self) {
        _name = [rawObject valueForKey:@"name"];
        _detailedName = [rawObject valueForKey:@"description"];

        NSString *coordiateString = [rawObject valueForKeyPath:@"Point.pos"];
        _coordinate = CLLocationCoordinate2DFromNSStringWithYGeocodeScope(coordiateString, YGeocodeScopeLongitudeLatitude);
        _boundedBy = YGEnvelopeFromDictionary([rawObject valueForKeyPath:@"boundedBy.Envelope"]);

        _metaData = [YGGeoObjectMetaData metaDataWithDictionary:[rawObject valueForKeyPath:@"metaDataProperty.GeocoderMetaData"]];
    }
    return self;
}

+ (instancetype)geoObjectWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

+ (NSArray *)geoObjectsArrayWithArray:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[array count]];
    for (NSDictionary *rawObject in array) {
        if (![rawObject isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        YGGeoObject *geoObject = [self geoObjectWithDictionary:[rawObject valueForKey:@"GeoObject"]];
        if (geoObject) {
            [result addObject:geoObject];
        }
    }
    return [result copy];
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    YGGeoObject *result = [[[self class] alloc] init];
    result.name = _name;
    result.detailedName = _detailedName;
    result.boundedBy = _boundedBy;
    result.coordinate = _coordinate;
    result.metaData = [_metaData copy];
    return result;
}

@end
