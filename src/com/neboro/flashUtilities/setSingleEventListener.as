/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 21:45
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.flashUtilities {
import flash.events.Event;

public function setSingleEventListener(target:Object, type:String, listener:Function):void {
        var handler:Function = function(event:Event):void {
            listener(event);
            target.removeEventListener(type, handler);
        }

        target.addEventListener(type, handler);
    }
}
