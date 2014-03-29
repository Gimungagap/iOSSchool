#import <CoreLocation/CoreLocation.h>

typedef enum {
    YGeocodeTypeForward,
    YGeocodeTypeReverse
} YGeocodeType;

typedef enum {
    YGeocodeScopeLongitudeLatitude,
    YGeocodeScopeLatitudeLongitude
} YGeocodeScope;

typedef enum {
    YGeocodeKindHouse,
    YGeocodeKindStreet,
    YGeocodeKindMetro,
    YGeocodeKindDistrict,
    YGeocodeKindLocality
} YGeocodeKind;

typedef enum {
    YGeocodeResultFormatJSON,
    YGeocodeResultFormatXML
} YGeocodeResultFormat;

typedef struct {
    CLLocationCoordinate2D lowerCorner;
    CLLocationCoordinate2D upperCorner;
} YGEnvelope;

typedef enum {
    YGeocodePrecisionOther
} YGeocodePrecision;
