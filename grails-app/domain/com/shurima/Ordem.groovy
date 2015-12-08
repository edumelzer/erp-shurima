 package com.shurima

 class Ordem {

     Empresa cliente
     Date dataSaida
     Date dataRetorno
     Long quantidadeDias
     // static hasMany = [items: Item]
     String veiculo
     String motorista
     String placa
     String observacao
     Double total

     static hasMany = [items: OrdemItem]

     static constraints = {
         veiculo nullable: true
         placa nullable: true
         observacao nullable: true
         motorista nullable: true
     }

 }
