//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGGeoObjectMetaData.h"
#import "YGAddress.h"

@implementation YGGeoObjectMetaData

- (instancetype)initWithDictionary:(NSDictionary *)rawObject
{
    if (!rawObject) {
        return nil;
    }
    self = [super init];
    if (self) {
        _text = [[rawObject valueForKey:@"text"] copy];
        // TODO _precision = ...

        _addressDetails = [YGAddress addressInfoWithDictionary:[rawObject valueForKey:@"AddressDetails"]];
    }
    return self;
}

+ (instancetype)metaDataWithDictionary:(NSDictionary *)rawObject
{
    return [[self alloc] initWithDictionary:rawObject];
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    YGGeoObjectMetaData *result = [[[self class] alloc] init];
    result.text = _text;
    result.precision = _precision;

    result.addressDetails = [_addressDetails copy];
    return result;
}

@end
