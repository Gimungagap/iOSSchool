//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGAddress.h"
#import "YGAddressLocality.h"

@implementation YGAddress

- (instancetype)initWithDictionary:(NSDictionary *)rawObject
{
    NSDictionary *country = [rawObject valueForKey:@"Country"];
    if (!country) {
        return nil;
    }
    self = [super init];
    if (self) {
        _addressLine = [country valueForKey:@"AddressLine"];
        _countryName = [country valueForKey:@"CountryName"];
        _countryNameCode = [country valueForKey:@"CountryNameCode"];

        // TODO locality
    }
    return self;
}

+ (instancetype)addressInfoWithDictionary:(NSDictionary *)rawObject
{
    return [[self alloc] initWithDictionary:rawObject];
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    YGAddress *result = [[[self class] alloc] init];
    result.addressLine = _addressLine;
    result.countryNameCode = _countryNameCode;
    result.countryName = _countryName;
    result.locality = [_locality copy];
    return result;
}

@end
