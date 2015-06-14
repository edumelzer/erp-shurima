'use strict';

function TransacaoResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/transacao', 'Transacao');
}

angular.module('erpapp.transacao.services', ['grails'])
    .factory('TransacaoResource', TransacaoResource);
