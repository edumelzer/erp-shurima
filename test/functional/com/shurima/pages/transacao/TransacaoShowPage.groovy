package com.shurima.pages.transacao

import geb.Page

class TransacaoShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show Transacao' }

    static content = {
        successMessage { $(".alert-success") }
    }

}