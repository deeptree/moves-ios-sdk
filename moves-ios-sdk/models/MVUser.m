//
//  MVUser.m
//  Move-iOS-SDK
//
//  Created by Vito on 13-7-11.
//  Copyright (c) 2013年 vito. All rights reserved.
//

#import "MVUser.h"
#import "DFDateFormatterFactory.h"

@implementation MVUser

- (MVUser *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if (self && !isNull(dic)) {
        _userId = dic[@"userId"];
        NSDictionary *profile = dic[@"profile"];
        if (!isNull(profile)) {
            if (!isNull(profile[@"firstDate"])) {
                NSDateFormatter *formatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyyMMdd"];
                _firstDate = [formatter dateFromString:profile[@"firstDate"]];
            }
            if (!isNull(profile[@"currentTimeZone"])) {
                _currentTimeZoneId = profile[@"currentTimeZone"][@"id"];
                if (!isNull(profile[@"currentTimeZone"][@"offset"])) {
                    _currentTimeZoneOffset = [profile[@"currentTimeZone"][@"offset"] integerValue];
                }
            }
            if (!isNull(profile[@"localization"])) {
                _localization = [[MVLocalization alloc] initWithDictionary:profile[@"localization"]];
            }
            
            if (!isNull(profile[@"caloriesAvailable"])) {
                _caloriesAvailable = [profile[@"caloriesAvailable"] boolValue];
            }
            _platform = profile[@"platform"];
        }
    }
    
    return self;
}

@end
