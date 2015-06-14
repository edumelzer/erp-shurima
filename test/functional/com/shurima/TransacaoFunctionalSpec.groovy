package com.shurima

import com.shurima.pages.transacao.*
import geb.spock.GebReportingSpec


class TransacaoFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to TransacaoListPage

		then:
		at TransacaoListPage
	}
	
	def "should be able to create a valid Transacao"() {
		when:
		to TransacaoListPage

		and:
		createButton.click()

		then:
		at TransacaoCreatePage

		when:
		dataField = "01/01/2001"
		valorField = valorField.find('option').value()
		empresaField = empresaField.find('option').value()
		tipoField = "Foo"
			
		and:
		saveButton.click()

		then:
		at TransacaoShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Transacao was successfully created"
	}
	
	def "should be able to sort the Transacao List"() {
		given:
		to TransacaoListPage

		when:
		dataSort.click()
		
		then:
		dataSort.classes().contains("asc")

		when:
		valorSort.click()
		
		then:
		valorSort.classes().contains("asc")

		when:
		empresaSort.click()
		
		then:
		empresaSort.classes().contains("asc")

		when:
		tipoSort.click()
		
		then:
		tipoSort.classes().contains("asc")
	
	}
	
	def "should be able to filter the Transacao List"() {
		given:
		to TransacaoListPage

		when:
		dataFilter = "01/01/2001"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		valorFilter = valorFilter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }

		when:
		empresaFilter = empresaFilter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }

		when:
		tipoFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }
	
	}
	
	def "should be able to edit the first Transacao"() {
		when:
		to TransacaoListPage

		and:
		rows.first().editButton.click()

		then:
		at TransacaoEditPage
		
		when:
		dataField = "02/01/2001"
		valorField = valorField.find('option').value()
		empresaField = empresaField.find('option').value()
		tipoField = "Foo!"
		
		and:
		saveButton.click()
		
		then:
		at TransacaoShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Transacao was successfully updated"
	}
	
	def "should be able to delete the first Transacao"() {
		when:
		to TransacaoListPage

		and:
		rows.first().deleteButton.click()

		then:
		at TransacaoListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Transacao was successfully deleted"
      }
	
}