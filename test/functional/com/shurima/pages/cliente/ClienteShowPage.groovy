package com.shurima.pages.cliente

import geb.Page

class ClienteShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show Cliente' }

    static content = {
        successMessage { $(".alert-success") }
    }

}