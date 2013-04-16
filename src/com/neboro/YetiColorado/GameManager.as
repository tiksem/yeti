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
import com.neboro.utilities.getRandomInt;

import flash.display.AVM1Movie;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.setTimeout;

import flashx.textLayout.formats.TextAlign;

import mx.effects.Fade;
import mx.effects.easing.Exponential;
import mx.events.EffectEvent;
import mx.states.SetEventHandler;

public class GameManager {
    [Embed("../../../assets/swfs/Yetigo.swf")]
    private var YetiInSnowSWF:Class;

    [Embed("../../../assets/swfs/neboroText.swf", mimeType="application/octet-stream")]
    private var NeboroLogo:Class;

    [Embed("../../../assets/swfs/travelling.swf", mimeType="application/octet-stream")]
    private var TravellingMovie:Class;

    [Embed("../../../assets/swfs/yetiStatic.swf")]
    private var YetiSWF:Class;

    [Embed("../../../assets/swfs/loose.swf")]
    private var YetiLoose:Class;

    [Embed("../../../assets/swfs/win.swf")]
    private var YetiWin:Class;

    [Embed("../../../assets/swfs/YetiHeadAnimation.swf")]
    private var YetiHeadAnimationSWF:Class;

    [Embed(source="../../../assets/sounds/win.mp3")]
    private var WinSound:Class;

    [Embed(source="../../../assets/sounds/loose.mp3")]
    private var LooseSound:Class;

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

    [Embed(source="../../../assets/images/Cloud.png", mimeType="image/png")]
    private var Cloud:Class;

    [Embed(source="../../../assets/images/background.jpg", mimeType="image/jpg")]
    private var Background:Class;

    [Embed(source="../../../assets/images/lotki_left.png", mimeType="image/png")]
    private var LotkiLeft:Class;

    [Embed(source="../../../assets/images/lotki_middle.png", mimeType="image/png")]
    private var LotkiCenter:Class;

    [Embed(source="../../../assets/images/lotki_right.png", mimeType="image/png")]
    private var LotkiRight:Class;


    [Embed(source="../../../assets/images/skip.png", mimeType="image/png")]
    private var SkipButton:Class;

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

    private static const FRUIT_NAMES:Array = [
        "Apple",
        "Banana",
        "Beet",
        "Blueberry",
        "Broccoli",
        "Cabbage",
        "Carrot",
        "Cherry",
        "Coconut",
        "Corn",
        "Cucumber",
        "Currant",
        "Eggplant",
        "Garlic",
        "Grapefruit",
        "Grapes",
        "Kiwi",
        "Lemon",
        "Lime",
        "Nuts",
        "Olive",
        "Onion",
        "Orange",
        "Passion fruit",
        "Peach",
        "Pear",
        "Peas",
        "Pepper",
        "Pineapple",
        "Plum",
        "Pomegranate",
        "Potato",
        "Pumpkin",
        "Radish",
        "Raspberry",
        "Strawberry",
        "Tomato",
        "Watermelon"
    ];

    private static const YETI_SIZE_PERCENTAGE:Number = 0.5;
    private static const CLOUD_SIZE_PERCENTAGE:Number = 0.38;
    private static const SKIP_BUTTON_PERCENTAGE:Number = 0.14;
    private static const SKIP_BUTTON_PADDING:Number = 0.02;

    private var soundClasses:Array = []

    private var fruits:Vector.<Fruit>;
    private var giveSounds:Array;
    private var loseWonSounds:Array;
    private var bitmaps:Array;
    private var parent:DisplayObjectContainer;

    private var wonFruitName:String;
    private var text:TextField = new TextField();

    private var stageHeight:int;
    private var stageWidth:int;

    private var skipButton:DisplayObjectContainer;

    [Embed(source="../../../assets/RAVIE.TTF", fontName="Ravie", mimeType="application/x-font-truetype")]
    private static var RavieFont:Class;

    private var textFont:Font = new RavieFont;

    private var yetiStatic:MovieClip = new YetiSWF;
    private var yetiHeadAnimation:MovieClip = new YetiHeadAnimationSWF;
    private var yetiLoose:MovieClip = new YetiLoose;
    private var yetiWin:MovieClip = new YetiWin;
    private var yeti:MovieClip;
    private var lotkiMiddle:DisplayObject;
    private var cloud:Bitmap;
    private var skipped:Boolean = false;
    private var skipper:Function;
    private var introducingSoundChannel:SoundChannel;

    private function showFruits():void {
        if(bitmaps.length != FRUIT_NAMES.length){
            throw new Error("bitmaps.length != FRUIT_NAMES.length");
        }

        var randomItems = chooseElementsFrom(bitmaps, fruits.length);
        var bitmapsToAssign = randomItems.elements;

        var wonIndex:int = getRandomInt(0, fruits.length);

        for(var i = 0; i < fruits.length; i++) {
            fruits[i].image = bitmapsToAssign[i];

            if(wonIndex == i){
                fruits[i].wonFlag = true;
                wonFruitName = FRUIT_NAMES[randomItems.indexes[i]] as String;
            } else {
                fruits[i].wonFlag = false;
            }
        }

        showFruitSprites();
        showText();
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

    private function onLoose():void {
        playYetiLooseAnimation();
        playSound(new LooseSound as Sound, function(){

        });
        hideFruits();
    }

    private function onWin():void {
        playYetiWinAnimation();
        playSound(new WinSound as Sound, function(){

        });
        hideFruits();
    }

    private function hideFruits(){
        hideFruitSprites();
        hideText();
    }

    private function createFade(completeListener:Function, alphaFrom:Number, hide:Boolean):Fade {
        var fade:Fade = new Fade();
        setSingleEventListener(fade, EffectEvent.EFFECT_END, completeListener);
        fade.alphaFrom = alphaFrom;
        fade.duration = 1000;
        fade.easingFunction = Exponential.easeOut;

        if(hide){
            fade.alphaTo = 0;
        } else {
            fade.alphaTo = 1;
        }

        return fade;
    }

    private function showText() {
        text.alpha = 0;
        text.text = wonFruitName;

        var textFormat:TextFormat = new TextFormat();
        textFormat.font = textFont.fontName;
        textFormat.align = TextAlign.CENTER;
        textFormat.size = 100;
        textFormat.color = 0xFF8000;
        //text.embedFonts = true;
        text.setTextFormat(textFormat);

        var prevWidth = cloud.width;
        var width:Number = stageWidth * CLOUD_SIZE_PERCENTAGE;
        cloud.width = width;
        var k:Number = width / prevWidth;
        cloud.height *= k;
        cloud.x = 0;
        cloud.y = 0;
        cloud.alpha = 0;

        var fade:Fade = createFade(function(){

        }, 0, false);

        fade.play([cloud, text]);

        text.width = cloud.width;
        text.height = text.textHeight;

        text.y = (cloud.height - text.height) / 2;
    }

    private function hideText():void {
        var fade:Fade = createFade(function(){
            try{

            } catch (e:Error) {

            }
        }, 1, true);

        fade.play([cloud, text]);
    }

    private function initSkipButton():void {
        var skipButton:Bitmap = new SkipButton;
        var width:int = SKIP_BUTTON_PERCENTAGE * stageWidth;
        var prevWidth:int = skipButton.width;
        var k:Number = width / prevWidth;
        skipButton.width = width;
        skipButton.height = skipButton.height * k;
        skipButton.x = stageWidth - stageWidth * SKIP_BUTTON_PADDING - skipButton.width;
        skipButton.y = stageHeight - stageWidth * SKIP_BUTTON_PADDING - skipButton.height;

        var skipParent:DisplayObjectContainer = new Sprite();
        skipParent.addChild(skipButton);

        setSingleEventListener(skipParent, MouseEvent.CLICK, function(){
            removeSkipButton();
            skipped = true;
            skipper();
            introducingSoundChannel.stop();
        });

        parent.addChild(skipParent);
        this.skipButton = skipParent;
    }

    private function placeBeforeSkipButton(what:DisplayObject):void {
        if(skipButton){
            parent.addChildAt(what,  parent.getChildIndex(skipButton));
        } else {
            parent.addChild(what);
        }
    }

    private function removeSkipButton(){
        if(!skipButton){
            return;
        }

        parent.removeChild(skipButton);
        skipButton = undefined;
    }

    public function GameManager(parent:DisplayObjectContainer) {
        this.parent = parent;

        bitmaps = [MyImage, MyImage2, MyImage3, MyImage4, MyImage5, MyImage6, MyImage7, MyImage8,
             MyImage10, MyImage11, MyImage12, MyImage13, MyImage14, MyImage15, MyImage16,
            MyImage17, MyImage18, MyImage19, MyImage20, MyImage21, MyImage22, MyImage23, MyImage24,
            MyImage25, MyImage26, MyImage27, MyImage28, MyImage29, MyImage30, MyImage31, MyImage32, MyImage33,
            MyImage34, MyImage35, MyImage36, MyImage37, MyImage38, MyImage39
        ];

        for(var i = 0; i < bitmaps.length; i++){
            bitmaps[i] = new bitmaps[i];
        }

        fruits = new <Fruit>[];
        for(var i = 0; i < 3; i++){
            var fruit:Fruit = fruits[i] = new Fruit(parent);
            fruit.position = i;
            fruit.onLoose = onLoose;
            fruit.onWin = onWin;
        }

        cloud = new Cloud;
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
    :Function
    {
        var loader:Loader = new Loader();
        var skipperOut:Function;

        setSingleEventListener(loader.contentLoaderInfo, Event.COMPLETE, function(e:Event){
            var swf:MovieClip = MovieClip(loader.content);

            if(changeSize){
                swf.x = 0;
                swf.y = 0;
                //swf.width = stageWidth;
                //swf.height = swf.height;
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

            placeBeforeSkipButton(swf);

            var skipper:Function = function(){
                swf.removeEventListener(Event.ENTER_FRAME, endHandler);
                parent.removeChild(swf);

                swf.stop();
                if(completeListener){
                    completeListener(swf);
                }
            }

            skipperOut = skipper;
        });

        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
        loaderContext.allowCodeImport = true;
        loaderContext.allowLoadBytesCodeExecution = true;
        loader.loadBytes(new swfClass, loaderContext);

        return function(){
            if(skipperOut){
                skipperOut();
            } else {
                loader.close();
            }
        }
    }

    private function playLoopingSWF(swfClass, duration, completeListener:Function):Function {
        var swf:MovieClip = new swfClass();
        swf.play();
        swf.x = 0;
        swf.y = 0;
        swf.width = stageWidth;
        swf.height = stageHeight;
        placeBeforeSkipButton(swf);

        var skipper = {
            active: false,
            skipper: function(){
                swf.stop();
                parent.removeChild(swf);
                completeListener();
                skipper.active = true;
            }
        };

        setTimeout(function(){
            if(!skipper.active){
                swf.stop();
                parent.removeChild(swf);
                completeListener();
            }
        }, duration);

        return skipper.skipper;
    }

    public function playYetiInSnowMovie(completeListener:Function):Function {
        return playLoopingSWF(YetiInSnowSWF, 7500, completeListener);
    }

    public function playNeboroLogoMovie(completeListener:Function):void {
        playSWF(NeboroLogo, 2000, completeListener);
    }

    public function playTravellingLogoMovie(completeListener:Function):Function {
        return playSWF(TravellingMovie, 2000, completeListener);
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

    private function placeYeti(yeti:DisplayObject){
        var yetiPrevWidth = yeti.width;
        var width:Number = stageWidth * YETI_SIZE_PERCENTAGE;
        yeti.width = width;
        var k:Number = width / yetiPrevWidth;
        yeti.height = yeti.height * k * 1.06;
        yeti.x = (stageWidth - width) / 2;
        yeti.y = lotkiMiddle.y - yeti.height + stageHeight * 0.06;
    }

    private function setActiveYeti(activeYeti:MovieClip):void {
        if(yeti){
            var saveYeti = yeti;
            setTimeout(function(){
                saveYeti.visible = false;
            }, 100);
        }

        yeti = activeYeti;

        yeti.visible = true;
    }

    private function playYetiAnimation(animYeti:MovieClip, framesCount:int,  completeListener:Function):void {
        parent.addChildAt(animYeti, parent.getChildIndex(lotkiMiddle));

        setActiveYeti(animYeti);

        setTimeout(function(){
            if(animYeti == yeti){
                setActiveYeti(yetiStatic);
            }

            parent.removeChild(animYeti);
        }, framesCount * 1.0 / 24.0 * 1000);
    }

    private function playYetiHeadAnimation(completeListener:Function):void {
        playYetiAnimation(yetiHeadAnimation, 50, completeListener);
    }

    private function playYetiLooseAnimation():void {
        playYetiAnimation(yetiLoose, 30, function(){

        });
    }

    private function playYetiWinAnimation():void {
        playYetiAnimation(yetiWin, 30, function(){

        });
    }

    private function showYetiAndLotki():void {
        var lotki_left:Bitmap = new LotkiLeft;
        var k:Number = stageWidth / lotki_left.width * 0.375;
        var rightLotkiWidth = stageWidth * 0.375;
        lotki_left.width = rightLotkiWidth;
        var lotkiHeight:int = lotki_left.height * k;
        lotki_left.height = lotki_left.height * k;
        lotki_left.x = 0;
        lotki_left.y = stageHeight - lotki_left.height;
        parent.addChildAt(lotki_left, 0);

        var lotki_middle:Bitmap = new LotkiCenter;
        var k:Number = stageWidth / lotki_left.width * 0.25;
        var middleLotkiWidth = stageWidth * 0.25;
        lotki_middle.width = middleLotkiWidth;
        lotki_middle.height = lotkiHeight;
        lotki_middle.x = rightLotkiWidth;
        lotki_middle.y = stageHeight - lotki_middle.height;
        parent.addChildAt(lotki_middle, 1);
        lotkiMiddle = lotki_middle;

        var lotki_right:Bitmap = new LotkiRight;
        lotki_right.width = rightLotkiWidth;
        lotki_right.height = lotkiHeight;
        lotki_right.x = middleLotkiWidth + lotki_middle.x;
        lotki_right.y = lotki_middle.y;
        parent.addChildAt(lotki_right, 0);

        showBackground();

        placeYeti(yetiStatic);
        placeYeti(yetiHeadAnimation);
        placeYeti(yetiLoose);
        placeYeti(yetiWin);

        setActiveYeti(yetiStatic);

        parent.addChildAt(yetiStatic, parent.getChildIndex(lotki_middle));

        placeBeforeSkipButton(cloud);
        placeBeforeSkipButton(text);
    }

    public function playBackgroundSound():void {
        var handler:Function = function(){
            var sound = getRandomElementOf([new BackgroundSound, new BackgroundSound2,
                new BackgroundSound3, new BackgroundSound4, new BackgroundSound5]);
            playSoundSpecifyVolume(sound as Sound, 0.5, handler);
        }

        playSoundSpecifyVolume(new BackgroundSound, 0.5, handler);
    }

    public function playBazarSound():void {
        playLoopingSound(new BazarSound, 0.14);
    }

    public function loopYetiHeadAnimation(){
        var duration = getRandomInt(3500, 7000);
        setTimeout(function(){
            if(yeti is YetiSWF){
                playYetiHeadAnimation(function(){});
            }
            loopYetiHeadAnimation();
        }, duration)
    }

    public function run():void {
        stageWidth = parent.stage.stageWidth;
        stageHeight = parent.stage.stageHeight;

        playBackgroundSound();

        playNeboroLogoMovie(function(){
            introducingSoundChannel = (new IntroducingSound as Sound).play();
            initSkipButton();
            skipper = playYetiInSnowMovie(function(){
                if(!skipped){
                    skipper = playTravellingLogoMovie(function(){
                        showYetiAndLotki();
                        showFruits();
                        playBazarSound();
                        loopYetiHeadAnimation();
                        removeSkipButton();
                    });
                } else {
                    showYetiAndLotki();
                    showFruits();
                    playBazarSound();
                    loopYetiHeadAnimation();
                }
            });
        })

    }
}
}
