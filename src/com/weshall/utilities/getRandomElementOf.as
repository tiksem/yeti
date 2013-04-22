/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 21:33
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.utilities {
    public function getRandomElementOf(array:Array):Object {
        var idx:int=Math.floor(Math.random() * array.length);
        return array[idx];
    }
}
