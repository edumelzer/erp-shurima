package com.shurima

import com.shurima.pages.tipoUsuario.*
import geb.spock.GebReportingSpec


class TipoUsuarioFunctionalSpec extends GebReportingSpec {

	def "should be able to view list page"() {
		when:
		to TipoUsuarioListPage

		then:
		at TipoUsuarioListPage
	}
	
	def "should be able to create a valid TipoUsuario"() {
		when:
		to TipoUsuarioListPage

		and:
		createButton.click()

		then:
		at TipoUsuarioCreatePage

		when:
		descricaoField = "Foo"
			
		and:
		saveButton.click()

		then:
		at TipoUsuarioShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "TipoUsuario was successfully created"
	}
	
	def "should be able to sort the TipoUsuario List"() {
		given:
		to TipoUsuarioListPage

		when:
		descricaoSort.click()
		
		then:
		descricaoSort.classes().contains("asc")
	
	}
	
	def "should be able to filter the TipoUsuario List"() {
		given:
		to TipoUsuarioListPage

		when:
		descricaoFilter = "Foo"
		
		then:
		waitFor { rows.size() > 0 }
	
	}
	
	def "should be able to edit the first TipoUsuario"() {
		when:
		to TipoUsuarioListPage

		and:
		rows.first().editButton.click()

		then:
		at TipoUsuarioEditPage
		
		when:
		descricaoField = "Foo!"
		
		and:
		saveButton.click()
		
		then:
		at TipoUsuarioShowPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "TipoUsuario was successfully updated"
	}
	
	def "should be able to delete the first TipoUsuario"() {
		when:
		to TipoUsuarioListPage

		and:
		rows.first().deleteButton.click()

		then:
		at TipoUsuarioListPage

		and:
		successMessage.displayed

		and:
		successMessage.text().contains "TipoUsuario was successfully deleted"
      }
	
}