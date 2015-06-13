'use strict';

function ClienteResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/cliente', 'Cliente');
}

angular.module('erpapp.cliente.services', ['grails'])
    .factory('ClienteResource', ClienteResource);
