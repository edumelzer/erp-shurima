describe('Transacao Controllers: ', function() {

    var item = {'foo': 'bar', 'count': 100};

    beforeEach(module('erpapp.transacao.controllers'));

    describe('ShowCtrl: ', function() {
        var ctrl, scope;

        beforeEach(module(function($provide) {
            $provide.value('transacao', item);
        }));

        beforeEach(inject(
            function ($controller, $rootScope) {
                scope = $rootScope.$new();
                ctrl = $controller('ShowCtrl', { $scope: scope });
            }
        ));

        it('should have the transacao on the scope', function() {
            expect(ctrl.transacao).toEqual(item);
        });
    });

    describe('CreateEditCtrl: ', function() {
        var ctrl, scope;

        beforeEach(module(function($provide) {
            $provide.value('transacao', item);
			$provide.value('empresaList', []);
        }));

        beforeEach(inject(
            function ($controller, $rootScope) {
                scope = $rootScope.$new();
                ctrl = $controller('CreateEditCtrl', { $scope: scope });
            }
        ));

        it('should have the transacao on the scope', function() {
            expect(ctrl.transacao).toEqual(item);
        });
    });

    describe('ListCtrl: ', function() {
        var ctrl, scope, deferred;

        var items = [
            {id: 1, name: 'Item1'},
            {id: 2, name: 'Item2'}
        ];

        var items2 = [
            {id: 3, name: 'Item3'},
            {id: 4, name: 'Item4'}
        ];

        var PAGE_SIZE = 25;

        beforeEach(module(function($provide) {

            var mockCrudService = {
                list: function() {
                    deferred.resolve(items2);
                    return deferred.promise;
                }
            };

            $provide.value('TransacaoResource', mockCrudService);
            $provide.value('transacaoList', items);
			$provide.value('empresaList', []);
            $provide.value('pageSize', PAGE_SIZE);
        }));

        beforeEach(inject(
            function ($controller, $rootScope, $q) {
                deferred = $q.defer();
                scope = $rootScope.$new();
                ctrl = $controller('ListCtrl', { $scope: scope });
            }
        ));

        it('should have the transacaoList and default values set on the scope', function() {
            expect(ctrl.pageSize).toEqual(PAGE_SIZE);
            expect(ctrl.transacaoList).toEqual(items);
            expect(ctrl.page).toEqual(1);
        });

        it('reload should reset page', function() {
            ctrl.page = 2;
            ctrl.reload();
            scope.$digest();

            expect(ctrl.page).toEqual(1);
            expect(ctrl.transacaoList).toEqual(items2);
        });

    });


});