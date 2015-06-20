package com.shurima.pages.item

import geb.Page

class ItemShowPage extends Page {

    static at = { $('h2').text().startsWith 'Show Item' }

    static content = {
        successMessage { $(".alert-success") }
    }

}