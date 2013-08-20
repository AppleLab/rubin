//
//  ImageLoader.h
//  Rubin
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

// название уведомления о загрузке
#define IMAGE_LOADED_NOTIFICATION @"imageLoaded"

@interface ImageLoader : NSObject {
    UIImage* m_image;
}

// свойства
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSURL* iconURL;
@property (nonatomic, readonly) UIImage* image;

// конструкторы

+(ImageLoader*) countryWithName:(NSString*)country;
+(ImageLoader*) countryWithName:(NSString *)country iconURL:(NSURL*)url;

-(id) initWithName:(NSString*)country;
-(id) initWithName:(NSString *)country iconURL:(NSURL*)iconUrl;

// запускает загрузку изображения

-(void) loadImage;

@end
