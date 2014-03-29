//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGUtils.h"

NSString *NSStringFromYGeocodeScope(YGeocodeScope scope)
{
    switch (scope) {
        case YGeocodeScopeLongitudeLatitude:
            return @"longlat";
        case YGeocodeScopeLatitudeLongitude:
            return @"latlong";
    }
    return nil;
}

NSString *NSStringFromCLLocation2DCoordinateWithYGeocodeScope(CLLocationCoordinate2D coordinate, YGeocodeScope scope)
{
    if (scope == YGeocodeScopeLatitudeLongitude) {
        return [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
    } else {
        return [NSString stringWithFormat:@"%f,%f", coordinate.longitude, coordinate.latitude];
    }
}

NSString *NSStringFromYGeocodeKind(YGeocodeKind kind)
{
    switch (kind) {
        case YGeocodeKindHouse:
            return @"house";
        case YGeocodeKindStreet:
            return @"street";
        case YGeocodeKindMetro:
            return @"metro";
        case YGeocodeKindDistrict:
            return @"district";
        case YGeocodeKindLocality:
            return @"locality";
    }
    return nil;
}

NSString *NSStringFromYGeocodeResultFormat(YGeocodeResultFormat resultFormat)
{
    switch (resultFormat) {
        case YGeocodeResultFormatJSON:
            return @"json";
        case YGeocodeResultFormatXML:
            return @"xml";
    }
    return nil;
}

CLLocationCoordinate2D CLLocationCoordinate2DFromNSStringWithYGeocodeScope(NSString *coordiateString, YGeocodeScope scope)
{
    CLLocationCoordinate2D coordinate = kCLLocationCoordinate2DInvalid;
    NSArray *point = [coordiateString componentsSeparatedByString:@" "];
    if (point.count == 2) {
        if (scope == YGeocodeScopeLongitudeLatitude) {
            coordinate.longitude = [point[0] doubleValue];
            coordinate.latitude = [point[1] doubleValue];
        } else {
            coordinate.longitude = [point[1] doubleValue];
            coordinate.latitude = [point[0] doubleValue];
        }
    }
    return coordinate;
}

YGEnvelope YGEnvelopeMakeInvalid(void)
{
    return YGEnvelopeMake(kCLLocationCoordinate2DInvalid, kCLLocationCoordinate2DInvalid);
}

YGEnvelope YGEnvelopeMake(CLLocationCoordinate2D lowerCorner, CLLocationCoordinate2D upperCorner)
{
    YGEnvelope result = {
        .lowerCorner = lowerCorner,
        .upperCorner = upperCorner
    };
    return result;
}

YGEnvelope YGEnvelopeFromDictionary(NSDictionary *dictionary)
{
    YGEnvelope result = YGEnvelopeMakeInvalid();
    if (dictionary) {
        YGeocodeScope envelopeCoordinateScope = YGeocodeScopeLongitudeLatitude;
        NSString *lowerCornerString = [dictionary valueForKey:@"lowerCorner"];
        NSString *upperCornerString = [dictionary valueForKey:@"upperCorner"];

        result = YGEnvelopeMake(
            CLLocationCoordinate2DFromNSStringWithYGeocodeScope(lowerCornerString, envelopeCoordinateScope),
            CLLocationCoordinate2DFromNSStringWithYGeocodeScope(upperCornerString, envelopeCoordinateScope)
        );
    }
    return result;
}

BOOL YGEnvelopeIsValid(YGEnvelope envelope)
{
    return CLLocationCoordinate2DIsValid(envelope.lowerCorner) && CLLocationCoordinate2DIsValid(envelope.upperCorner);
}
