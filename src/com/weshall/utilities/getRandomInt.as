/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 22:35
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.utilities {
    public function getRandomInt(minNum:Number, maxNum:Number):Number {
        var rand = Math.random();
        if(rand >= 1.0){
            rand = rand - 0.1;
        }

        maxNum--;

        return Math.floor( minNum + ( rand * ( maxNum - minNum + 1 ) ));
    }
}
