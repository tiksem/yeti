/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 05.04.13
 * Time: 23:38
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.utilities {
    public function chooseElementsFrom(elements:Array, count:int) {
        if(count > elements.length){
            throw new Error("invalid count");
        }

        var clone:Array = cloneArray(elements);
        var result = {
            elements: [],
            indexes: []
        };

        for(var i = 0; i < count;){
            var index = getRandomInt(0, clone.length);
            var element = clone[index];
            if(element == undefined){
                continue;
            }

            result.elements[i] = element;
            result.indexes[i] = index;
            clone[index] = undefined;

            i++;
        }

        return result;
    }
}
