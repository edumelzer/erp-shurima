'use strict';

function RelatorioResource(CrudResourceFactory) {
    return CrudResourceFactory('/api/relatorio', 'Relatorio');
}

angular.module('erpapp.relatorio.services', ['grails'])
    .factory('RelatorioResource', RelatorioResource);
