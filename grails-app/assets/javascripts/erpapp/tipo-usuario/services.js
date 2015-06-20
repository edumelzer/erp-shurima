'use strict';

function TipoUsuarioResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/tipoUsuario', 'TipoUsuario');
}

angular.module('erpapp.tipoUsuario.services', ['grails'])
    .factory('TipoUsuarioResource', TipoUsuarioResource);
