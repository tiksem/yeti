/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 03.04.13
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
package {
import com.neboro.YetiColorado.Fruit;
import com.neboro.YetiColorado.FruitSprite;
import com.neboro.YetiColorado.GameManager;
import com.neboro.flashUtilities.loadFromFile;

import flash.display.Bitmap;

import flash.display.DisplayObject;

import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.NativeWindow;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageAspectRatio;
import flash.display.StageDisplayState;
import flash.display.StageOrientation;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.system.System;
import flash.text.TextField;

import mx.core.FlexTextField;
import mx.effects.Fade;

import org.osmf.layout.ScaleMode;

import spark.effects.Scale;

[SWF(width="2560", height="1600", frameRate="60")]
public class Flash_test extends MovieClip{
    public function adjustStageSize(width:int, height:int):void {
        var widthK:Number = stage.stageWidth / width;
        stage.stageHeight = widthK * height;
    }

    public function Flash_test() {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.EXACT_FIT;

        //stage.autoOrients = false;
        //stage.setAspectRatio(StageAspectRatio.LANDSCAPE);

        var game:GameManager = new GameManager(this);
        game.run();
    }

    public function onApplicationComplete():void {

    }


}
}
