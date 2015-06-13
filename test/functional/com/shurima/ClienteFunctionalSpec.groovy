package com.shurima

import com.shurima.pages.cliente.*
import geb.spock.GebReportingSpec


class ClienteFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to ClienteListPage

		then:
		at ClienteListPage
	}
	
	def "should be able to create a valid Cliente"() {
		when:
		to ClienteListPage

		and:
		createButton.click()

		then:
		at ClienteCreatePage

		when:
		nomeField = "Foo"
		cnpjField = cnpjField.find('option').value()
		inscricaoEstadualField = "Foo"
		enderecoField = "Foo"
		numeroField = numeroField.find('option').value()
		complementoField = "Foo"
		cidadeField = "Foo"
		bairroField = "Foo"
		UFField = "Foo"
		CEPField = CEPField.find('option').value()
		telefone1Field = telefone1Field.find('option').value()
		telefone2Field = telefone2Field.find('option').value()
		emailField = "Foo"
			
		and:
		saveButton.click()

		then:
		at ClienteShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Cliente was successfully created"
	}
	
	def "should be able to sort the Cliente List"() {
		given:
		to ClienteListPage

		when:
		nomeSort.click()
		
		then:
		nomeSort.classes().contains("asc")

		when:
		cnpjSort.click()
		
		then:
		cnpjSort.classes().contains("asc")

		when:
		inscricaoEstadualSort.click()
		
		then:
		inscricaoEstadualSort.classes().contains("asc")

		when:
		enderecoSort.click()
		
		then:
		enderecoSort.classes().contains("asc")
	
	}
	
	def "should be able to filter the Cliente List"() {
		given:
		to ClienteListPage

		when:
		nomeFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		cnpjFilter = cnpjFilter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }

		when:
		inscricaoEstadualFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		enderecoFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }
	
	}
	
	def "should be able to edit the first Cliente"() {
		when:
		to ClienteListPage

		and:
		rows.first().editButton.click()

		then:
		at ClienteEditPage
		
		when:
		nomeField = "Foo!"
		cnpjField = cnpjField.find('option').value()
		inscricaoEstadualField = "Foo!"
		enderecoField = "Foo!"
		numeroField = numeroField.find('option').value()
		complementoField = "Foo!"
		cidadeField = "Foo!"
		bairroField = "Foo!"
		UFField = "Foo!"
		CEPField = CEPField.find('option').value()
		telefone1Field = telefone1Field.find('option').value()
		telefone2Field = telefone2Field.find('option').value()
		emailField = "Foo!"
		
		and:
		saveButton.click()
		
		then:
		at ClienteShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Cliente was successfully updated"
	}
	
	def "should be able to delete the first Cliente"() {
		when:
		to ClienteListPage

		and:
		rows.first().deleteButton.click()

		then:
		at ClienteListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Cliente was successfully deleted"
      }
	
}