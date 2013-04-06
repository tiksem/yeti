/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 22:35
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.utilities {
    public function getRandomInt(minNum:Number, maxNum:Number):Number {
        return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
    }
}
