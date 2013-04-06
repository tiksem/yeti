/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 13:28
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.flashUtilities {
import flash.display.Sprite;

public class VisibilityHandlingSprite extends Sprite{
    public function VisibilityHandlingSprite() {
    }

    protected function onShow():void {

    }

    protected function onHide():void {

    }

    override public function set visible(value:Boolean):void {
        if(super.visible == value){
            return;
        }

        var visible:Boolean = super.visible;
        super.visible = value;

        if(value){
            onShow();
        } else {
            onHide();
        }
    }
}
}
