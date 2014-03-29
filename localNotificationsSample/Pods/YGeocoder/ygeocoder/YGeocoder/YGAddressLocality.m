//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGAddressLocality.h"


@implementation YGAddressLocality

- (id)copyWithZone:(NSZone *)zone
{
    YGAddressLocality *result = [[[self class] alloc] init];
    result.localityName = _localityName;
    result.thoroughfareName = _thoroughfareName;
    return result;
}

@end
