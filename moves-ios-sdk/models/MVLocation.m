//
//  MVLocation.m
//  Move-iOS-SDK
//
//  Created by Vito on 13-7-11.
//  Copyright (c) 2013年 vito. All rights reserved.
//

#import "MVLocation.h"

@implementation MVLocation

- (MVLocation *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if (self && !isNull(dic)) {
        
        if (dic[@"lat"] && !isNull(dic[@"lat"])) {
            _lat = [dic[@"lat"] floatValue];
        }
        if (dic[@"lon"] && !isNull(dic[@"lon"])) {
            _lon = [dic[@"lon"] floatValue];
        }
    }
    
    return self;
}


@end
