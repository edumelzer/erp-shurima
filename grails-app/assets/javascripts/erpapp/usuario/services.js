'use strict';

function UsuarioResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/usuario', 'Usuario');
}

angular.module('erpapp.usuario.services', ['grails'])
    .factory('UsuarioResource', UsuarioResource);
