//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGResponse.h"
#import "YGGeoObject.h"

@implementation YGResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *responseGeoObjectCollection = [dictionary valueForKeyPath:@"response.GeoObjectCollection"];
    if (!responseGeoObjectCollection) {
        return nil;
    }
    self = [super init];
    if (self) {
        NSDictionary *geocoderResponseMetaData = [responseGeoObjectCollection valueForKeyPath:@"metaDataProperty.GeocoderResponseMetaData"];

        _request = [[geocoderResponseMetaData valueForKey:@"request"] copy];
        _found = [[geocoderResponseMetaData valueForKey:@"found"] integerValue];
        _results = [[geocoderResponseMetaData valueForKey:@"results"] integerValue];

        NSArray *featureMember = [responseGeoObjectCollection valueForKey:@"featureMember"];
        if (![featureMember isKindOfClass:[NSArray class]]) {
            NSLog(@"value for key 'featureMember' is not an array");
        }

        // TODO boundedBy
        _objects = [YGGeoObject geoObjectsArrayWithArray:[responseGeoObjectCollection valueForKey:@"featureMember"]];
    }
    return self;
}

+ (instancetype)responseWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

/**
* TODO
* - (NSString *)description
*/

@end
