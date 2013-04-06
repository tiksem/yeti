/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 23:40
 * To change this template use File | Settings | File Templates.
 */
package com.neboro.utilities {
    public function cloneArray(source:Array):Array {
        var clone = [];
        for(var i = 0; i < source.length; i++){
            clone[i] = source[i];
        }

        return clone;
    }
}
