package com.shurima

import com.shurima.pages.usuario.*
import geb.spock.GebReportingSpec


class UsuarioFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to UsuarioListPage

		then:
		at UsuarioListPage
	}
	
	def "should be able to create a valid Usuario"() {
		when:
		to UsuarioListPage

		and:
		createButton.click()

		then:
		at UsuarioCreatePage

		when:
		loginField = "Foo"
		passwordField = "Foo"
		nomeField = "Foo"
			
		and:
		saveButton.click()

		then:
		at UsuarioShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Usuario was successfully created"
	}
	
	def "should be able to sort the Usuario List"() {
		given:
		to UsuarioListPage

		when:
		loginSort.click()
		
		then:
		loginSort.classes().contains("asc")

		when:
		passwordSort.click()
		
		then:
		passwordSort.classes().contains("asc")

		when:
		nomeSort.click()
		
		then:
		nomeSort.classes().contains("asc")
	
	}
	
	def "should be able to filter the Usuario List"() {
		given:
		to UsuarioListPage

		when:
		loginFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		passwordFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }

		when:
		nomeFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }
	
	}
	
	def "should be able to edit the first Usuario"() {
		when:
		to UsuarioListPage

		and:
		rows.first().editButton.click()

		then:
		at UsuarioEditPage
		
		when:
		loginField = "Foo!"
		passwordField = "Foo!"
		nomeField = "Foo!"
		
		and:
		saveButton.click()
		
		then:
		at UsuarioShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Usuario was successfully updated"
	}
	
	def "should be able to delete the first Usuario"() {
		when:
		to UsuarioListPage

		and:
		rows.first().deleteButton.click()

		then:
		at UsuarioListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "Usuario was successfully deleted"
      }
	
}