//
// Created by storoj on 07.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>
#import "YGTypes.h"

@interface YGParams : NSObject <NSCopying>

@property (nonatomic, assign) YGeocodeType type;
@property (nonatomic, assign) YGeocodeScope scope;
@property (nonatomic, assign) YGeocodeKind kind;
@property (nonatomic, assign) YGeocodeResultFormat resultFormat;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) CLLocationCoordinate2D searchCenterCoordinate;
@property (nonatomic, assign) CLLocationDegrees searchCoordinatesDelta;

@property (nonatomic, assign) BOOL searchOnlyInRegion;

@property (nonatomic, assign) NSInteger maxResults;
@property (nonatomic, assign) NSInteger skip;

@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy) NSString *apiKey;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
+ (instancetype)paramsWithCoordinate:(CLLocationCoordinate2D)coordinate;

- (instancetype)initWithAddress:(NSString *)address;
+ (instancetype)paramsWithAddress:(NSString *)address;

@end
