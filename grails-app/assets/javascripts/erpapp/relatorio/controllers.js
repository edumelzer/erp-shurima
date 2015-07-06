'use strict';

function ShowCtrl(relatorio) {
    var self = this;
    self.relatorio = relatorio;
};

angular.module('erpapp.relatorio.controllers', [])
    .controller('ShowCtrl', ShowCtrl);
