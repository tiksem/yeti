/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 13:14
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.flashUtilities {
import flash.display.Loader;
import flash.display.MovieClip;
import flash.events.Event;
import flash.net.URLRequest;

    public function loadFromFile(swfPath:String, completeListener:Function):void {
        var loader:Loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(event:Event){
            completeListener(loader);
        });
        loader.load(new URLRequest(swfPath));
    }
}
