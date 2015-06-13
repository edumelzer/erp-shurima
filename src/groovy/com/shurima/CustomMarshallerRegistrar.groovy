package com.shurima

import grails.converters.JSON

class CustomMarshallerRegistrar {
    
    void registerMarshallers() {

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