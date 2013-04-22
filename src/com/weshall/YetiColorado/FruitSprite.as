/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 13:09
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.YetiColorado {
import com.weshall.flashUtilities.loadFromFile;
import com.weshall.flashUtilities.setSingleEventListener;

import flash.display.Bitmap;

import flash.display.DisplayObjectContainer;

import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Mouse;

import mx.effects.Fade;
import mx.effects.easing.Exponential;
import mx.events.EffectEvent;

public class FruitSprite extends Sprite{
    public static const FRUIT_WIDTH_PERCENTS:Number = 0.15;

    public static const POSITION_LEFT:int = 0;
    public static const POSITION_RIGHT:int = 2;
    public static const POSITION_CENTER:int = 1;

    public static const FRUIT_MARGIN_LEFT_PERCENTS = 0.07;
    public static const FRUIT_MARGIN_BOTTOM_PERCENTS = 0.07;

    public static const FADE_DURATION:int = 2000;

    private var fruitImage:Bitmap;
    private var stageWidth:int;
    private var stageHeight:int;

    private var onClickListener:Function;

    private var positionId:int = POSITION_LEFT;

    private var fade:Fade = new Fade();

    public function set position(position:int):void {
        positionId = position;

        if(!fruitImage){
            return;
        }

        switch (position) {
            case POSITION_LEFT:
                x = stageWidth * FRUIT_MARGIN_LEFT_PERCENTS;
                break;
            case POSITION_CENTER:
                x = (stageWidth - width) / 2;
                break;
            case POSITION_RIGHT:
                x = stageWidth - (stageWidth * FRUIT_MARGIN_LEFT_PERCENTS + width);
                break;
            default: throw new Error("invalid position identifier, shoud be 0,1,2");
        }
    }

    public function get position():int {
        return positionId;
    }

    public function set image(fruitImage:Bitmap) {
        if(this.fruitImage){
            try{
                removeChild(this.fruitImage);
            } catch(e) {

            }
        }

        this.fruitImage = fruitImage;
        fruitImage.alpha = 0;

        fruitImage.width = fruitImage.height = FRUIT_WIDTH_PERCENTS * stageWidth;
        y = stageHeight - (stageWidth * FRUIT_MARGIN_BOTTOM_PERCENTS + fruitImage.height);
        addChild(fruitImage);

        position = positionId;
    }

    private function createFade():Fade {
        if(fade){
            fade.stop();
        }

        fade.target = fruitImage;
        fade.duration = FADE_DURATION;
        fade.easingFunction = mx.effects.easing.Exponential.easeOut;

        return fade;
    }

    private function startFading(fade:Fade, completeListener:Function) {
        fade.play();

        if(completeListener){
            setSingleEventListener(fade, EffectEvent.EFFECT_END, completeListener);
        }
    }

    public function show(completeListener:Function = undefined):void {
        if(fruitImage.alpha >= 0.7){
            return;
        }

        var fade:Fade = createFade();

        fade.alphaFrom = fruitImage.alpha;
        fade.alphaTo = 1;

        startFading(fade, completeListener);
    }

    public function hide(completeListener:Function = undefined):void {
        if(fruitImage.alpha <= 0.3){
            return;
        }

        var fade:Fade = createFade();

        fade.alphaFrom = fruitImage.alpha;
        fade.alphaTo = 0;

        startFading(fade, completeListener);
    }

    public function set onClick(listener:Function) {
        if(onClickListener){
            removeEventListener(MouseEvent.CLICK, onClickListener);
        }

        if(!listener){
            return;
        }

        onClickListener = function(event:Event):void{
            if(fruitImage.alpha >= 0.3){
                listener(event);
            }
        };

        addEventListener(MouseEvent.CLICK, onClickListener);
    }

    public function FruitSprite(parent:DisplayObjectContainer) {
        stageWidth = parent.stage.stageWidth;
        stageHeight = parent.stage.stageHeight;

        parent.addChild(this);
    }
}
}
