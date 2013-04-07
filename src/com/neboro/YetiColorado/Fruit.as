/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 21:26
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.YetiColorado {
import com.neboro.flashUtilities.playRandomSound;
import com.neboro.flashUtilities.setSingleEventListener;
import com.neboro.utilities.getRandomElementOf;

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;

import flash.events.Event;
import flash.media.Sound;

import flash.media.Sound;

public class Fruit {
    private var fruitSprite:FruitSprite;

    public var looseSounds:Array;
    public var wonSounds:Array;

    public var wonFlag:Boolean = false;

    public var onRoundComplete:Function;

    public var hideExecuted:Boolean = true;

    private function callOnRoundComplete():void {
        if(onRoundComplete){
            onRoundComplete();
        }
    }

    public function loose():void {
        playRandomSound(looseSounds);
        onRoundComplete();
    }

    public function won():void {
        playRandomSound(wonSounds);
        onRoundComplete();
    }

    public function show():void {
        fruitSprite.show();
        hideExecuted = false;
    }

    public function hide(completeListener:Function = undefined) {
        fruitSprite.hide(completeListener);
        hideExecuted = true;
    }

    public function set image(value:Bitmap){
        fruitSprite.image = value;
    }

    public function set position(value:int){
        fruitSprite.position = value;
    }

    public function Fruit(parent:DisplayObjectContainer) {
        fruitSprite = new FruitSprite(parent);

        fruitSprite.onClick = function(){
            if(hideExecuted){
                return;
            }

            if(wonFlag){
                won();
            } else {
                loose();
            }
        }
    }
}
}
