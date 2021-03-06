class UrlMappings {

    static mappings = {
        '/tipoUsuario'(view: 'tipoUsuario')
        '/api/tipoUsuario'(resources: 'tipoUsuario')
        '/item'(view: 'item')
        '/api/item'(resources: 'item')
        '/usuario'(view: 'usuario')
        '/api/usuario'(resources: 'usuario')
        '/transacao'(view: 'transacao')
        '/api/transacao'(resources: 'transacao')
        '/entrada'(view: 'entrada')
        '/api/entrada'(resources: 'entrada')
        '/empresa'(view: 'empresa')
        '/api/empresa'(resources: 'empresa')
        '/cliente'(view: 'cliente')
        '/api/cliente'(resources: 'cliente')
        //'/ordem'(view: 'ordem')
        //'/grupo'(view: 'grupo')
        '/teste'(view: 'teste')
        '/index'(view: 'index')
        '/relatorioPagar'(view: 'relatorioPagar')
        '/relatorioFinanceiro'(view: 'relatorioFinanceiro')
        '/relatorioEmpresa'(view: 'relatorioEmpresa')
        '/relatorioReceber'(view: 'relatorioReceber')
        '/relatorioOrdem'(view: 'relatorioOrdem')
        '/relatorioGrupo'(view: 'relatorioGrupo')
        '/relatorioEstoque'(view: 'relatorioEstoque')
        '/login'(view: 'usuario/login')
        "/$controller/$action?/$id?(.$format)?"{
                constraints {
                // apply constraints here
                            }
                }

        "/"(view:"/index")
        "500"(view:'/error')
    }
}
