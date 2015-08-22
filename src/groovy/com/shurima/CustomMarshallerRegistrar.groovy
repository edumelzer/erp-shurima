package com.shurima

import grails.converters.JSON

class CustomMarshallerRegistrar {

    void registerMarshallers() {

		JSON.registerObjectMarshaller(com.shurima.Usuario) {
			def map = [:]
			map['id'] = it?.id
			map['username'] = it?.username
			map['password'] = it?.password
      map['tipoUsuario'] = it?.tipoUsuario
	    	map['toText'] = it?.toString()
			return map
		}

    JSON.registerObjectMarshaller(com.shurima.TipoUsuario) {
			def map = [:]
			map['id'] = it?.id
			map['descricao'] = it?.descricao
	    	map['toText'] = it?.toString()
			return map
		}



		JSON.registerObjectMarshaller(com.shurima.Item) {
			def map = [:]
			map['id'] = it?.id
			map['nome'] = it?.nome
			map['quantidade'] = it?.quantidade
			map['valor1'] = it?.valor1
			map['valor2'] = it?.valor2
			map['valor3'] = it?.valor3
			map['unidade'] = it?.unidade
        map['toText'] = it?.toString()
    return map
    }



		JSON.registerObjectMarshaller(com.shurima.Transacao) {
			def map = [:]
			map['id'] = it?.id
			map['data'] = it?.data
			map['valor'] = it?.valor
			map['empresa'] = it?.empresa
			map['tipo'] = it?.tipo
      map['numeroTitulo']=it?.numeroTitulo
      map['observacao']=it?.observacao
	     map['toText'] = it?.toString()
			return map
		}

		JSON.registerObjectMarshaller(com.shurima.Empresa) {
			def map = [:]
			map['id'] = it?.id
			map['nome'] = it?.nome
			map['cnpj'] = it?.cnpj
			map['inscricaoEstadual'] = it?.inscricaoEstadual
			map['endereco'] = it?.endereco
			map['numero'] = it?.numero
			map['complemento'] = it?.complemento
			map['cidade'] = it?.cidade
			map['bairro'] = it?.bairro
			map['UF'] = it?.UF
			map['CEP'] = it?.CEP
			map['telefone1'] = it?.telefone1
			map['telefone2'] = it?.telefone2
			map['email'] = it?.email
			map['isCliente'] = it?.isCliente
			map['isFornecedor'] = it?.isFornecedor
	    	map['toText'] = it?.toString()
			return map
		}

		JSON.registerObjectMarshaller(com.shurima.Cliente) {
			def map = [:]
			map['id'] = it?.id
			map['nome'] = it?.nome
			map['cnpj'] = it?.cnpj
			map['inscricaoEstadual'] = it?.inscricaoEstadual
			map['endereco'] = it?.endereco
			map['numero'] = it?.numero
			map['complemento'] = it?.complemento
			map['cidade'] = it?.cidade
			map['bairro'] = it?.bairro
			map['UF'] = it?.UF
			map['CEP'] = it?.CEP
			map['telefone1'] = it?.telefone1
			map['telefone2'] = it?.telefone2
			map['email'] = it?.email
	    	map['toText'] = it?.toString()
			return map
		}
	}

}
