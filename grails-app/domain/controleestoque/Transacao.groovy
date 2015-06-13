package controleestoque
import grails.rest.Resource

@Resource(uri='/transacoes')
class Transacao {

    Date data
    String tipo
    Double valor

    static constraints = {
      data blank: false
      tipo blank: false
      valor blank: false
    }
}
