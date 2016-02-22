//
//  UDMessageVoiceFactory.m
//  Udesk
//
//  Created by xuchen on 15/8/26.
//  Copyright (c) 2015年 xuchen. All rights reserved.
//

#import "UDMessageVoiceFactory.h"

@implementation UDMessageVoiceFactory

+ (UIImageView *)messageVoiceAnimationImageViewWithBubbleMessageType:(UDMessageFromType)type {
    UIImageView *messageVoiceAniamtionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 17)];
    NSString *imageSepatorName;
    switch (type) {
        case UDMessageTypeSending:
            imageSepatorName = @"Sender";
            break;
        case UDMessageTypeReceiving:
            imageSepatorName = @"Receiver";
            break;
        default:
            break;
    }
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 1; i < 4; i ++) {
        UIImage *image = [UIImage imageWithContentsOfFile:getMyBundlePath([imageSepatorName stringByAppendingFormat:@"VoiceNodePlaying00%ld.png", (long)i])];
        if (image)
            [images addObject:image];
    }
    
    messageVoiceAniamtionImageView.image = [UIImage imageWithContentsOfFile:getMyBundlePath([imageSepatorName stringByAppendingString:@"VoiceNodePlaying003.png"])];
    messageVoiceAniamtionImageView.animationImages = images;
    messageVoiceAniamtionImageView.animationDuration = 1.0;
    [messageVoiceAniamtionImageView stopAnimating];
    
    return messageVoiceAniamtionImageView;
}

@end