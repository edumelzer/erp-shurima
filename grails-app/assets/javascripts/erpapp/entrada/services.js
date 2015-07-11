'use strict';

function EntradaResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/entrada', 'Entrada');
}

angular.module('erpapp.entrada.services', ['grails'])
    .factory('EntradaResource', EntradaResource);
