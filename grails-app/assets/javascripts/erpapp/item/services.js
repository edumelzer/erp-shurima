'use strict';

function ItemResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/item', 'Item');
}

angular.module('erpapp.item.services', ['grails'])
    .factory('ItemResource', ItemResource);
