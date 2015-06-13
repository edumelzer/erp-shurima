import controleestoque.Transacao

class BootStrap {

    def init = { servletContext ->
      new Transacao(data: new Date(), tipo: 'P', valor: 77.0).save()
      new Transacao(data: new Date(), tipo: 'P', valor: 79.0).save()
    }
    def destroy = {
    }
}
