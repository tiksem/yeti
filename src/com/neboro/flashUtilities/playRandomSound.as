/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 22:52
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.flashUtilities {
import com.neboro.utilities.getRandomElementOf;

import flash.events.Event;

import flash.media.Sound;
import flash.media.SoundChannel;

public function playRandomSound(sounds:Array, completeListener:Function = undefined) {
    if(!sounds || sounds.length == 0){
        if(completeListener){
            completeListener(null);
        }

        return;
    }

    var sound:Sound = Sound(getRandomElementOf(sounds));

    var channel:SoundChannel = sound.play();

    savedSounds[channel] = {
        sound: sound
    };

    if(!isSoundEnabled){
        channel.stop();
    }

    if(completeListener){
        setSingleEventListener(channel, Event.SOUND_COMPLETE, function(){
            completeListener();
            savedSounds[channel] = undefined;
        });
    }
}
}
