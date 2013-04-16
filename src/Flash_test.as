/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 03.04.13
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
package {
import com.neboro.YetiColorado.GameManager;

import flash.desktop.NativeApplication;
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.LocationChangeEvent;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.media.SoundMixer;
import flash.media.SoundTransform;
import flash.media.StageWebView;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.system.Capabilities;

[SWF(width="2560", height="1600", frameRate="24")]
public class Flash_test extends MovieClip{
    [Embed(source="banner.html",mimeType="application/octet-stream")]
    var Banner:Class;

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
        NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, function(){
            setSoundEnabled(false);
        });

        NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, function(){
            setSoundEnabled(true);
        });

        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    protected function init(event:Event){
        _stageWebView = new StageWebView () ;
        var bannerWidth:Number = stage.stageWidth * 468 / Capabilities.screenResolutionX;
        var bannerHeight:Number = stage.stageHeight * 60 / Capabilities.screenResolutionY;
        _stageWebView.viewPort = new Rectangle((stage.stageWidth - bannerWidth) / 2,
                stage.stageHeight - bannerHeight, bannerWidth, bannerHeight);
        // add a listener for when the content of the StageWebView changes
        _stageWebView.addEventListener(LocationChangeEvent.LOCATION_CHANGE,onLocationChange);
        // start loading the URL;

        var myString:String = (new Banner()).toString();

        _stageWebView.loadString(myString);
        _stageWebView.stage = stage;
    }

    var _stageWebView:StageWebView;
    var myAdvertURL:String = "file://banner.html";

    function toggleAd(event:MouseEvent):void {
        trace("toggling advert",_stageWebView);
        // check that StageWebView instance exists
        if (_stageWebView) {
            trace("_stageWebView.stage:"+_stageWebView.stage);
            if (_stageWebView.stage == null) {
                //show the ad by setting the stage parameter
                _stageWebView.stage = stage;
            } else {
                // hide the ad by nulling the stage parameter
                _stageWebView.stage = null;
            }
        } else {
            // ad StageWebView doesn't exist - show create it

        }
    }

    function destroyAd(event:MouseEvent):void {
        // check that the instace of StageWebView exists
        if (_stageWebView) {
            trace("removing advert");
            // destroys the ad
            _stageWebView.stage = null;
            _stageWebView = null;
        }
    }

    var firstTime:Boolean = false;

    function onLocationChange(event:LocationChangeEvent):void {
        // check that it's not our ad URL loading
        if (firstTime) {
            // destroy the ad as the user has kindly clicked on my ad
            destroyAd(null);
            init(null);
            // Launch a normal browser window with the captured  URL;
            navigateToURL( new URLRequest( event.location ) );
            firstTime = false;
        } else {
            firstTime = true;
        }
    }

    private function setSoundEnabled(value:Boolean){
        if(value){
            SoundMixer.soundTransform = new SoundTransform(1.0, 0);
        } else {
            SoundMixer.soundTransform = new SoundTransform(0.0, 0);
        }
    }

    public function onApplicationComplete():void {
        SoundMixer.stopAll();
    }


}
}
