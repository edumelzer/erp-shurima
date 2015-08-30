package com.shurima

class Grupo {

    String descricao
    Double valor1
    Double valor2
    Double valor3

    static hasMany = [items: GrupoItem]

    String toString() {
        return this.descricao
    }

}
