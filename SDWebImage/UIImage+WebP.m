//
//  UIImage+WebP.m
//  SDWebImage
//
//  Created by Olivier Poitrey on 07/06/13.
//  Copyright (c) 2013 Dailymotion. All rights reserved.
//

#ifdef SD_WEBP
#import "UIImage+WebP.h"
//#import "webp/decode.h"

// Callback for CGDataProviderRelease


@implementation UIImage (WebP)

+ (UIImage *)sd_imageWithWebPData:(NSData *)data
{
    return nil;
}

@end

// Functions to resolve some undefined symbols when using WebP and force_load flag
void WebPInitPremultiplyNEON(void) {}
void WebPInitUpsamplersNEON(void) {}
void VP8DspInitNEON(void) {}
#endif
