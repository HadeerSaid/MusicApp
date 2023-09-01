//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<assets_audio_player/AssetsAudioPlayerPlugin.h>)
#import <assets_audio_player/AssetsAudioPlayerPlugin.h>
#else
@import assets_audio_player;
#endif

#if __has_include(<assets_audio_player_web/AssetsAudioPlayerWebPlugin.h>)
#import <assets_audio_player_web/AssetsAudioPlayerWebPlugin.h>
#else
@import assets_audio_player_web;
#endif

#if __has_include(<audio_session/AudioSessionPlugin.h>)
#import <audio_session/AudioSessionPlugin.h>
#else
@import audio_session;
#endif

#if __has_include(<just_audio/JustAudioPlugin.h>)
#import <just_audio/JustAudioPlugin.h>
#else
@import just_audio;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AssetsAudioPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"AssetsAudioPlayerPlugin"]];
  [AssetsAudioPlayerWebPlugin registerWithRegistrar:[registry registrarForPlugin:@"AssetsAudioPlayerWebPlugin"]];
  [AudioSessionPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioSessionPlugin"]];
  [JustAudioPlugin registerWithRegistrar:[registry registrarForPlugin:@"JustAudioPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
}

@end
