package com.shurima

import com.shurima.pages.item.*
import geb.spock.GebReportingSpec


class ItemFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to ItemListPage

		then:
		at ItemListPage
	}
	
	def "should be able to create a valid Item"() {
		when:
		to ItemListPage

		and:
		createButton.click()

		then:
		at ItemCreatePage

		when:
		nomeField = "Foo"
		quantidadeField = quantidadeField.find('option').value()
		valor1Field = valor1Field.find('option').value()
		valor2Field = valor2Field.find('option').value()
		valor3Field = valor3Field.find('option').value()
		unidadeField = "Foo"
			
		and:
		saveButton.click()

		then:
		at ItemShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Item was successfully created"
	}
	
	def "should be able to sort the Item List"() {
		given:
		to ItemListPage

		when:
		nomeSort.click()
		
		then:
		nomeSort.classes().contains("asc")

		when:
		quantidadeSort.click()
		
		then:
		quantidadeSort.classes().contains("asc")

		when:
		valor1Sort.click()
		
		then:
		valor1Sort.classes().contains("asc")

		when:
		valor2Sort.click()
		
		then:
		valor2Sort.classes().contains("asc")
	
	}
	
	def "should be able to filter the Item List"() {
		given:
		to ItemListPage

		when:
		nomeFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		quantidadeFilter = quantidadeFilter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }

		when:
		valor1Filter = valor1Filter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }

		when:
		valor2Filter = valor2Filter.find('option').value()
		
		then:
		waitFor { rows.size() > 0 }
	
	}
	
	def "should be able to edit the first Item"() {
		when:
		to ItemListPage

		and:
		rows.first().editButton.click()

		then:
		at ItemEditPage
		
		when:
		nomeField = "Foo!"
		quantidadeField = quantidadeField.find('option').value()
		valor1Field = valor1Field.find('option').value()
		valor2Field = valor2Field.find('option').value()
		valor3Field = valor3Field.find('option').value()
		unidadeField = "Foo!"
		
		and:
		saveButton.click()
		
		then:
		at ItemShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Item was successfully updated"
	}
	
	def "should be able to delete the first Item"() {
		when:
		to ItemListPage

		and:
		rows.first().deleteButton.click()

		then:
		at ItemListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Item was successfully deleted"
      }
	
}