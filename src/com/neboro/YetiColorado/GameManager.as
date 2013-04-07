/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 22:10
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.YetiColorado {
import com.neboro.flashUtilities.playLoopingSound;
import com.neboro.flashUtilities.playRandomSound;
import com.neboro.flashUtilities.playSound;
import com.neboro.flashUtilities.playSoundSpecifyVolume;
import com.neboro.flashUtilities.setSingleEventListener;
import com.neboro.utilities.chooseElementsFrom;
import com.neboro.utilities.getElementsOfByIndexingArray;
import com.neboro.utilities.getRandomElementOf;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.events.Event;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.setTimeout;

public class GameManager {
    [Embed("../../../assets/swfs/Yetigo.swf")]
    private var YetiInSnowSWF:Class;

    [Embed("../../../assets/swfs/neboroText.swf", mimeType="application/octet-stream")]
    private var NeboroLogo:Class;

    [Embed("../../../assets/swfs/travelling.swf", mimeType="application/octet-stream")]
    private var TravellingMovie:Class;

    [Embed("../../../assets/yeti_down_part.swf")]
    private var YetiDownPart:Class;

    [Embed("../../../assets/Yeti_top.swf", mimeType="application/octet-stream")]
    private var YetiSWF:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound2:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound3:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound4:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound5:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound6:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound7:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound8:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound9:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound10:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound11:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound12:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound13:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound14:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound15:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound16:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound17:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound18:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound19:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound20:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound21:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound22:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound23:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound24:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound25:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound26:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound27:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound28:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound29:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound30:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound31:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound32:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound33:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound34:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound35:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound36:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound37:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound38:Class;

    [Embed(source="../../../assets/give.mp3")]
    private var GiveSound39:Class;

    [Embed(source="../../../assets/fruits/apples_with_grad.png", mimeType="image/png")]
    private var MyImage:Class;

    [Embed(source="../../../assets/fruits/bananas.png", mimeType="image/png")]
    private var MyImage2:Class;

    [Embed(source="../../../assets/fruits/beet.png", mimeType="image/png")]
    private var MyImage3:Class;

    [Embed(source="../../../assets/fruits/blueberry.png", mimeType="image/png")]
    private var MyImage4:Class;

    [Embed(source="../../../assets/fruits/broccoli.png", mimeType="image/png")]
    private var MyImage5:Class;

    [Embed(source="../../../assets/fruits/cabbage.png", mimeType="image/png")]
    private var MyImage6:Class;

    [Embed(source="../../../assets/fruits/carrot.png", mimeType="image/png")]
    private var MyImage7:Class;

    [Embed(source="../../../assets/fruits/cherry.png", mimeType="image/png")]
    private var MyImage8:Class;

    [Embed(source="../../../assets/fruits/cherry.png", mimeType="image/png")]
    private var MyImage9:Class;

    [Embed(source="../../../assets/fruits/coconut.png", mimeType="image/png")]
    private var MyImage10:Class;

    [Embed(source="../../../assets/fruits/corn.png", mimeType="image/png")]
    private var MyImage11:Class;

    [Embed(source="../../../assets/fruits/cucmber.png", mimeType="image/png")]
    private var MyImage12:Class;

    [Embed(source="../../../assets/fruits/currant.png", mimeType="image/png")]
    private var MyImage13:Class;

    [Embed(source="../../../assets/fruits/eggplant.png", mimeType="image/png")]
    private var MyImage14:Class;

    [Embed(source="../../../assets/fruits/garlic.png", mimeType="image/png")]
    private var MyImage15:Class;

    [Embed(source="../../../assets/fruits/grape_fruit.png", mimeType="image/png")]
    private var MyImage16:Class;

    [Embed(source="../../../assets/fruits/grapes.png", mimeType="image/png")]
    private var MyImage17:Class;

    [Embed(source="../../../assets/fruits/kiwi.png", mimeType="image/png")]
    private var MyImage18:Class;

    [Embed(source="../../../assets/fruits/lemon.png", mimeType="image/png")]
    private var MyImage19:Class;

    [Embed(source="../../../assets/fruits/lime.png", mimeType="image/png")]
    private var MyImage20:Class;

    [Embed(source="../../../assets/fruits/nuts.png", mimeType="image/png")]
    private var MyImage21:Class;

    [Embed(source="../../../assets/fruits/olive.png", mimeType="image/png")]
    private var MyImage22:Class;

    [Embed(source="../../../assets/fruits/onion.png", mimeType="image/png")]
    private var MyImage23:Class;

    [Embed(source="../../../assets/fruits/orange.png", mimeType="image/png")]
    private var MyImage24:Class;

    [Embed(source="../../../assets/fruits/passionfruit.png", mimeType="image/png")]
    private var MyImage25:Class;

    [Embed(source="../../../assets/fruits/peach.png", mimeType="image/png")]
    private var MyImage26:Class;

    [Embed(source="../../../assets/fruits/pear.png", mimeType="image/png")]
    private var MyImage27:Class;

    [Embed(source="../../../assets/fruits/peas.png", mimeType="image/png")]
    private var MyImage28:Class;

    [Embed(source="../../../assets/fruits/pepper.png", mimeType="image/png")]
    private var MyImage29:Class;

    [Embed(source="../../../assets/fruits/pineapple.png", mimeType="image/png")]
    private var MyImage30:Class;

    [Embed(source="../../../assets/fruits/plum.png", mimeType="image/png")]
    private var MyImage31:Class;

    [Embed(source="../../../assets/fruits/pomegranate.png", mimeType="image/png")]
    private var MyImage32:Class;

    [Embed(source="../../../assets/fruits/potato.png", mimeType="image/png")]
    private var MyImage33:Class;

    [Embed(source="../../../assets/fruits/pumpkin.png", mimeType="image/png")]
    private var MyImage34:Class;

    [Embed(source="../../../assets/fruits/radish.png", mimeType="image/png")]
    private var MyImage35:Class;

    [Embed(source="../../../assets/fruits/raspberry.png", mimeType="image/png")]
    private var MyImage36:Class;

    [Embed(source="../../../assets/fruits/strawberry.png", mimeType="image/png")]
    private var MyImage37:Class;

    [Embed(source="../../../assets/fruits/tomato.png", mimeType="image/png")]
    private var MyImage38:Class;

    [Embed(source="../../../assets/fruits/watermelon.png", mimeType="image/png")]
    private var MyImage39:Class;

    [Embed(source="../../../assets/images/background.jpg", mimeType="image/jpg")]
    private var Background:Class;

    [Embed(source="../../../assets/images/lotki_left.png", mimeType="image/png")]
    private var LotkiLeft:Class;

    [Embed(source="../../../assets/images/lotki_middle.png", mimeType="image/png")]
    private var LotkiCenter:Class;

    [Embed(source="../../../assets/images/lotki_right.png", mimeType="image/png")]
    private var LotkiRight:Class;

    [Embed(source="../../../assets/inroduce.mp3")]
    private var IntroducingSound:Class;

    [Embed(source="../../../assets/bazaar.mp3")]
    private var BazarSound:Class;

    [Embed(source="../../../assets/background_sounds/background_sound.mp3")]
    private var BackgroundSound:Class;

    [Embed(source="../../../assets/background_sounds/airtone_-_disOrder.mp3")]
    private var BackgroundSound2:Class;

    [Embed(source="../../../assets/background_sounds/DoKashiteru_-_ditto_ditto.mp3")]
    private var BackgroundSound3:Class;

    [Embed(source="../../../assets/background_sounds/DoKashiteru_-_Yiourgh.mp3")]
    private var BackgroundSound4:Class;

    [Embed(source="../../../assets/background_sounds/opus_opium_-_Momentums.mp3")]
    private var BackgroundSound5:Class;

    private static const YETI_SIZE_PERCENTAGE:Number = 0.25;

    private var soundClasses:Array = []

    private var fruits:Vector.<Fruit>;
    private var giveSounds:Array;
    private var loseWonSounds:Array;
    private var bitmaps:Array;
    private var parent:DisplayObjectContainer;

    private var stageHeight:int;
    private var stageWidth:int;

    private var yeti:MovieClip;
    private var yetiDownPart:MovieClip;

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

        bitmaps = [MyImage, MyImage2, MyImage3, MyImage4, MyImage5, MyImage6, MyImage7, MyImage8,
            MyImage9, MyImage10, MyImage11, MyImage12, MyImage13, MyImage14, MyImage15, MyImage16,
            MyImage17, MyImage18, MyImage19, MyImage20, MyImage21, MyImage22, MyImage23, MyImage24,
            MyImage25, MyImage26, MyImage27, MyImage28, MyImage29, MyImage31, MyImage32, MyImage33,
            MyImage34, MyImage34, MyImage36, MyImage37, MyImage38, MyImage39
        ];
        var soundsCollection:SoundsCollection = new SoundsCollection();
        giveSounds = [new GiveSound, new GiveSound2, new GiveSound3, new GiveSound4, new GiveSound5, new GiveSound6, new GiveSound7, new GiveSound8,
            new GiveSound9, new GiveSound10, new GiveSound11, new GiveSound12, new GiveSound13, new GiveSound14, new GiveSound15, new GiveSound16,
            new GiveSound17, new GiveSound18, new GiveSound19, new GiveSound20, new GiveSound21, new GiveSound22, new GiveSound23, new GiveSound24,
            new GiveSound25, new GiveSound26, new GiveSound27, new GiveSound28, new GiveSound29, new GiveSound31, new GiveSound32, new GiveSound33,
            new GiveSound34, new GiveSound34, new GiveSound36, new GiveSound37, new GiveSound38, new GiveSound39
        ];

        loseWonSounds = []
        for(var i = 0; i < giveSounds.length; i++){
            var sounds:SoundsCollection = new SoundsCollection();
            sounds.loose = [new GiveSound];
            sounds.won = [new GiveSound];
            loseWonSounds.push(sounds);
        }

        fruits = new <Fruit>[];
        for(var i = 0; i < 3; i++){
            var fruit:Fruit = fruits[i] = new Fruit(parent);
            fruit.position = i;
            fruit.onRoundComplete = hideFruitSprites;
        }
    }

    public function loadSWF(swfClass:Class, completeListener:Function){
        var loader:Loader = new Loader();
        setSingleEventListener(loader.contentLoaderInfo, Event.COMPLETE, function(e:Event){
            completeListener(loader.content);
        });

        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
        loaderContext.allowCodeImport = true;
        loaderContext.allowLoadBytesCodeExecution = true;
        loader.loadBytes(new swfClass, loaderContext);
    }

    public function playSWF(swfClass:Class, delayBeforeDeleteFromScene:int,
                            completeListener:Function = undefined, play:Boolean = true, changeSize:Boolean = true)
    {
        var loader:Loader = new Loader();

        setSingleEventListener(loader.contentLoaderInfo, Event.COMPLETE, function(e:Event){
            var swf:MovieClip = MovieClip(loader.content);

            if(changeSize){
                swf.x = 0;
                swf.y = 0;
                swf.width = stageWidth;
                swf.height = stageHeight;
            }

            var endHandler:Function = function(){
                if(swf.isPlaying){
                    return;
                }

                setTimeout(function(){
                    parent.removeChild(swf);

                    swf.stop();
                    if(completeListener){
                        completeListener(swf);
                    }

                }, delayBeforeDeleteFromScene);

                swf.removeEventListener(Event.ENTER_FRAME, endHandler);
            }

            swf.addEventListener(Event.ENTER_FRAME, endHandler);
            if(play){
                swf.play();
            }

            parent.addChild(swf);
        });

        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
        loaderContext.allowCodeImport = true;
        loaderContext.allowLoadBytesCodeExecution = true;
        loader.loadBytes(new swfClass, loaderContext);
    }

    private function playLoopingSWF(swfClass, duration, completeListener:Function):void{
        var swf:MovieClip = new swfClass();
        swf.play();
        swf.x = 0;
        swf.y = 0;
        swf.width = stageWidth;
        swf.height = stageHeight;
        parent.addChild(swf);

        setTimeout(function(){
            swf.stop();
            parent.removeChild(swf);
            completeListener();
        }, duration)
    }

    public function playYetiInSnowMovie(completeListener:Function):void {
        playLoopingSWF(YetiInSnowSWF, 7500, completeListener);
    }

    public function playNeboroLogoMovie(completeListener:Function):void {
        playSWF(NeboroLogo, 2000, completeListener);
    }

    public function playTravellingLogoMovie(completeListener:Function):void {
        playSWF(TravellingMovie, 2000, completeListener);
    }

    private function showBackground():void {
        var bg:Bitmap = new Background;
        bg.width = stageWidth;
        bg.height = stageHeight;
        bg.x = 0;
        bg.y = 0;
        parent.addChildAt(bg, 0);
    }

    private function adjustSize(displayObject:DisplayObject, percentage:Number){
        var prevWidth:int = displayObject.width;
        displayObject.width = stageWidth * YETI_SIZE_PERCENTAGE;
        var k:Number = displayObject.width / prevWidth;
        displayObject.height *= k;
    }

    private function adjustSizeAndPutInCenter(displayObject:DisplayObject, percentage:Number){
        var prevWidth:int = displayObject.width;
        var width:int  = stageWidth * YETI_SIZE_PERCENTAGE;
        displayObject.width = width;
        var k:Number = width / prevWidth;
        displayObject.height *= k;
        displayObject.x = (stageWidth - width) / 2;
    }


    private function putInCenter(displayObject:DisplayObject){
        displayObject.x = (stageWidth - displayObject.width) / 2;
    }

    private function showYetiAndLotki():void {
        var lotki_left:Bitmap = new LotkiLeft;
        var k:Number = stageWidth / lotki_left.width / 3;
        var lotkiWidth = stageWidth / 3;
        lotki_left.width = lotkiWidth;
        var lotkiHeight:int = lotki_left.height * k;
        lotki_left.height = lotki_left.height * k;
        lotki_left.x = 0;
        lotki_left.y = stageHeight - lotki_left.height;
        parent.addChildAt(lotki_left, 0);

        var lotki_middle:Bitmap = new LotkiCenter;
        lotki_middle.width = lotkiWidth;
        lotki_middle.height = lotkiHeight;
        lotki_middle.x = lotkiWidth;
        lotki_middle.y = stageHeight - lotki_middle.height;
        parent.addChildAt(lotki_middle, 1);

        var lotki_right:Bitmap = new LotkiRight;
        lotki_right.width = lotkiWidth;
        lotki_right.height = lotkiHeight;
        lotki_right.x = lotkiWidth + lotki_middle.x;
        lotki_right.y = lotki_middle.y;
        parent.addChildAt(lotki_right, 0);

        showBackground();
    }

    public function playBackgroundSound():void {
        var handler:Function = function(){
            var sound = getRandomElementOf([new BackgroundSound, new BackgroundSound2,
                new BackgroundSound3, new BackgroundSound4, new BackgroundSound5]);
            playSoundSpecifyVolume(sound as Sound, 0.4, handler);
        }

        playSoundSpecifyVolume(new BackgroundSound, 0.4, handler);
    }

    public function playBazarSound():void {
        playLoopingSound(new BazarSound, 0.14);
    }

    public function run():void {
        stageWidth = parent.stage.stageWidth;
        stageHeight = parent.stage.stageHeight;

        playBackgroundSound();

        playNeboroLogoMovie(function(){
            new IntroducingSound().play();
            playYetiInSnowMovie(function(){
                playTravellingLogoMovie(function(){
                    showYetiAndLotki();
                    showFruits();
                    playBazarSound();
                });
            });
        })
    }
}
}
