package controleestoque

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
