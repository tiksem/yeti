/**
 * Created with IntelliJ IDEA.
 * User: CM
 * Date: 06.04.13
 * Time: 0:01
 * To change this template use File | Settings | File Templates.
 */
package com.weshall.utilities {
    public function getElementsOfByIndexingArray(array:Array, indexes:Array) {
        var result = [];
        for(var i = 0; i < indexes.length; i++){
            var index = indexes[i];
            var element = array[index];
            result.push(element);
        }

        return result;
    }
}
