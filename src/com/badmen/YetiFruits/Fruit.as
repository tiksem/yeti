/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 21:26
 * To change this template use File | Settings | File Templates.
 */
package com.badmen.YetiFruits {
import com.weshall.flashUtilities.playRandomSound;
import com.weshall.flashUtilities.setSingleEventListener;
import com.weshall.utilities.getRandomElementOf;

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;

import flash.events.Event;
import flash.media.Sound;

import flash.media.Sound;

public class Fruit {
    private var fruitSprite:FruitSprite;

    public var wonFlag:Boolean = false;
    public var hideExecuted:Boolean = true;

    public var onLoose:Function;

    public var onWin:Function;

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
                onWin();
            } else {
                onLoose();
            }
        }
    }
}
}
