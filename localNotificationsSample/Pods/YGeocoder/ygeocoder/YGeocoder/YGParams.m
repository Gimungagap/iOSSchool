//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGParams.h"

@implementation YGParams

- (void)initialize
{
    _searchCenterCoordinate = kCLLocationCoordinate2DInvalid;
    _maxResults = 0;
    _skip = 0;
    _resultFormat = YGeocodeResultFormatJSON;
    _scope = YGeocodeScopeLatitudeLongitude;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        [self initialize];

        _type = YGeocodeTypeReverse;
        _coordinate = coordinate;
    }
    return self;
}

+ (instancetype)paramsWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    return [[self alloc] initWithCoordinate:coordinate];
}

- (instancetype)initWithAddress:(NSString *)address
{
    self = [super init];
    if (self) {
        [self initialize];

        _type = YGeocodeTypeForward;
        _address = [address copy];
    }
    return self;
}

+ (instancetype)paramsWithAddress:(NSString *)address
{
    return [[self alloc] initWithAddress:address];
}

#pragma mark -
#pragma mark NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    YGParams *result = [[[self class] alloc] init];

    result.type = _type;
    result.scope = _scope;
    result.kind = _kind;
    result.resultFormat = _resultFormat;

    result.coordinate = _coordinate;
    result.address = _address;

    result.searchCenterCoordinate = _searchCenterCoordinate;
    result.searchCoordinatesDelta = _searchCoordinatesDelta;

    result.searchOnlyInRegion = _searchOnlyInRegion;

    result.maxResults = _maxResults;
    result.skip = _skip;

    result.language = _language;

    result.apiKey = _apiKey;

    return result;
}

@end
