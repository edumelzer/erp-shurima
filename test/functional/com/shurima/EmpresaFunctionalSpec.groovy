package com.shurima

import com.shurima.pages.empresa.*
import geb.spock.GebReportingSpec


class EmpresaFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to EmpresaListPage

		then:
		at EmpresaListPage
	}
	
	def "should be able to create a valid Empresa"() {
		when:
		to EmpresaListPage

		and:
		createButton.click()

		then:
		at EmpresaCreatePage

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
		isClienteField = isClienteField.find('option').value()
		isFornecedorField = isFornecedorField.find('option').value()
			
		and:
		saveButton.click()

		then:
		at EmpresaShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Empresa was successfully created"
	}
	
	def "should be able to sort the Empresa List"() {
		given:
		to EmpresaListPage

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
	
	def "should be able to filter the Empresa List"() {
		given:
		to EmpresaListPage

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
	
	def "should be able to edit the first Empresa"() {
		when:
		to EmpresaListPage

		and:
		rows.first().editButton.click()

		then:
		at EmpresaEditPage
		
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
		isClienteField = isClienteField.find('option').value()
		isFornecedorField = isFornecedorField.find('option').value()
		
		and:
		saveButton.click()
		
		then:
		at EmpresaShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Empresa was successfully updated"
	}
	
	def "should be able to delete the first Empresa"() {
		when:
		to EmpresaListPage

		and:
		rows.first().deleteButton.click()

		then:
		at EmpresaListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Empresa was successfully deleted"
      }
	
}