/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 22:10
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.YetiColorado {
import com.neboro.YetiColorado.Fruit;
import com.neboro.YetiColorado.Fruit;
import com.neboro.flashUtilities.playRandomSound;
import com.neboro.flashUtilities.setSingleEventListener;
import com.neboro.utilities.chooseElementsFrom;
import com.neboro.utilities.getElementsOfByIndexingArray;
import com.neboro.utilities.getRandomElementOf;
import com.neboro.utilities.getRandomInt;

import flash.display.AVM1Movie;

import flash.display.Bitmap;

import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.setInterval;
import flash.utils.setTimeout;

public class GameManager {
    [Embed("../../../assets/Yetigo.swf", mimeType="application/octet-stream")]
    private var YetiInSnowSWF:Class;

    [Embed("../../../assets/neboroText.swf", mimeType="application/octet-stream")]
    private var NeboroLogo:Class;

    [Embed("../../../assets/travelling.swf", mimeType="application/octet-stream")]
    private var TravellingMovie:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound2:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound3:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound4:Class;

    [Embed(source="../../../assets/apple.png", mimeType="image/png")]
    private var MyImage:Class;

    [Embed(source="../../../assets/apple.png", mimeType="image/png")]
    private var MyImage2:Class;

    [Embed(source="../../../assets/apple.png", mimeType="image/png")]
    private var MyImage3:Class;

    [Embed(source="../../../assets/apple.png", mimeType="image/png")]
    private var MyImage4:Class;

    private var soundClasses:Array = []

    private var fruits:Vector.<Fruit>;
    private var giveSounds:Array;
    private var loseWonSounds:Array;
    private var bitmaps:Array;
    private var parent:DisplayObjectContainer;

    private var stageHeight:int;
    private var stageWidth:int;

    private function showFruits():void {
        var randomItems = chooseElementsFrom(bitmaps, fruits.length);
        var bitmapsToAssign = randomItems.elements;
        var soundsToAssign = getElementsOfByIndexingArray(loseWonSounds, randomItems.indexes);


        for(var i = 0; i < fruits.length; i++) {
            fruits[i].image = new bitmapsToAssign[i];
            fruits[i].looseSounds = soundsToAssign[i].loose;
            fruits[i].looseSounds = soundsToAssign[i].won;
        }

        playRandomSound(giveSounds, function(){
            showFruitSprites();
        });
    }

    private function showFruitSprites(){
        for(var i = 0; i < fruits.length; i++) {
            fruits[i].show();
        }
    }

    private function hideFruitSprites(){
        var count = 0;
        for(var i = 0; i < fruits.length; i++) {
            fruits[i].hide(function(){
                count++;
                if(count == fruits.length){
                    showFruits();
                }
            });
        }
    }

    public function GameManager(parent:DisplayObjectContainer) {
        this.parent = parent;

        bitmaps = [MyImage, MyImage2, MyImage3, MyImage4];
        var soundsCollection:SoundsCollection = new SoundsCollection();
        giveSounds = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];

        loseWonSounds = []
        var sound = new SoundsCollection();
        sound.won = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        sound.loose = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        loseWonSounds.push(sound);
        var sound = new SoundsCollection();
        sound.won = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        sound.loose = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        loseWonSounds.push(sound);
        var sound = new SoundsCollection();
        sound.won = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        sound.loose = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        loseWonSounds.push(sound);
        var sound = new SoundsCollection();
        sound.won = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        sound.loose = [new GiveSound(), new GiveSound2(), new GiveSound3(), new GiveSound4()];
        loseWonSounds.push(sound);

        fruits = new <Fruit>[];
        for(var i = 0; i < 3; i++){
            var fruit:Fruit = fruits[i] = new Fruit(parent);
            fruit.position = i;
            fruit.onRoundComplete = hideFruitSprites;
        }
    }

    public function playSWF(swfClass:Class, delayBeforeDeleteFromScene:int,
                            completeListener:Function = undefined):void
    {
        var loader:Loader = new Loader();

        setSingleEventListener(loader.contentLoaderInfo, Event.COMPLETE, function(e:Event){
            var swf:MovieClip = MovieClip(loader.content);
            swf.x = 0;
            swf.y = 0;
            swf.width = stageWidth;
            swf.height = stageHeight;

            var endHandler:Function = function(){
                if(swf.isPlaying){
                    return;
                }

                setTimeout(function(){
                    parent.removeChild(swf);

                    swf.stop();
                    if(completeListener){
                        completeListener();
                    }

                }, delayBeforeDeleteFromScene);

                swf.removeEventListener(Event.ENTER_FRAME, endHandler);
            }

            swf.addEventListener(Event.ENTER_FRAME, endHandler);
            swf.play();

            parent.addChild(swf);
        });

        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
        loaderContext.allowCodeImport = true;
        loaderContext.allowLoadBytesCodeExecution = true;
        loader.loadBytes(new swfClass, loaderContext);
    }

    public function playYetiInSnowMovie(completeListener:Function):void {
        playSWF(YetiInSnowSWF, 2000, completeListener);
    }

    public function playNeboroLogoMovie(completeListener:Function):void {
        playSWF(NeboroLogo, 2000, completeListener);
    }

    public function playTravellingLogoMovie(completeListener:Function):void {
        playSWF(TravellingMovie, 2000, completeListener);
    }

    public function run():void {
        stageWidth = parent.stage.stageWidth;
        stageHeight = parent.stage.stageHeight;

        playNeboroLogoMovie(function(){
            playYetiInSnowMovie(function(){
                playTravellingLogoMovie(function(){
                    showFruits();
                });
            });
        })
    }
}
}
