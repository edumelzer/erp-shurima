'use strict';

function EmpresaResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/empresa', 'Empresa');
}

angular.module('erpapp.empresa.services', ['grails'])
    .factory('EmpresaResource', EmpresaResource);
