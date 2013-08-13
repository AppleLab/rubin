//
//  Core.m
//  iParking
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "Core.h"

static Core* _core;

@implementation Core

-(id) init
{
    self = [super init];
    return self;
}

+(Core*) core
{
    @synchronized(_core)
    {
        if (!_core)
            _core = [[Core alloc] init];
        return _core;
    }
}

@end
