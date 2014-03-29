//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "YGTypes.h"

NSString *NSStringFromYGeocodeScope(YGeocodeScope scope);
NSString *NSStringFromCLLocation2DCoordinateWithYGeocodeScope(CLLocationCoordinate2D coordinate, YGeocodeScope scope);
NSString *NSStringFromYGeocodeKind(YGeocodeKind kind);
NSString *NSStringFromYGeocodeResultFormat(YGeocodeResultFormat resultFormat);

CLLocationCoordinate2D CLLocationCoordinate2DFromNSStringWithYGeocodeScope(NSString *coordiateString, YGeocodeScope scope);

YGEnvelope YGEnvelopeMake(CLLocationCoordinate2D lowerCorner, CLLocationCoordinate2D upperCorner);
YGEnvelope YGEnvelopeMakeInvalid(void);
BOOL YGEnvelopeIsValid(YGEnvelope envelope);
YGEnvelope YGEnvelopeFromDictionary(NSDictionary *dictionary);
