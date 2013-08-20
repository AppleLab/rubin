//
//  ImageLoader.m
//  Rubin
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ImageLoader.h"

@implementation ImageLoader

// Cвойства

@synthesize name;
@synthesize iconURL;

-(UIImage*) image {
    return m_image;
}

// Конструкторы и деструктор

-(id) initWithName:(NSString*)country {
    return [self initWithName:country iconURL:nil];
}

-(id) initWithName:(NSString *)country iconURL:(NSURL*)iconUrl {
    self = [super init];
    self.name = country;
    self.iconURL = iconURL;
    return self;
}

+(ImageLoader*) countryWithName:(NSString*)country {
    return [[[ImageLoader alloc] initWithName:country] autorelease];
}
+(ImageLoader*) countryWithName:(NSString *)country iconURL:(NSURL*)url {
    return [[[ImageLoader alloc]
             initWithName:country iconURL:url] autorelease];
}

-(void) dealloc {
    [m_image release];
    self.iconURL = nil;
    self.name = nil;
    [super dealloc];
}

// Методы загрузки картинки

-(void) loadImage {
    // запускам загружаться изображение асинхронно
    [self performSelectorInBackground:@selector(loadImageInBackground)
                           withObject:nil];
}

-(void) loadImageInBackground {
    NSAutoreleasePool* pool = [NSAutoreleasePool new];
    
    // готовим и выполняем запрос
    NSURLRequest* request = [NSURLRequest requestWithURL:self.iconURL];
    NSError* error = nil;
    NSData* data =
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:nil error:&error];
    
    if ( error == nil ) {
        //изображение загрузилось
        [m_image release];
        m_image = [[UIImage imageWithData:data] retain];
        
        // сообщаем, что изображение загрузилось
        [[NSNotificationCenter defaultCenter]
         postNotificationName:IMAGE_LOADED_NOTIFICATION
         object:self];
    }
    
    [pool release];
}

@end