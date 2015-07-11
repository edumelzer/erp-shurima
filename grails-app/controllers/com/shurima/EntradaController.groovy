package com.shurima
import com.shurima.Transacao
import grails.gorm.PagedResultList

class EntradaController extends PagedRestfulController {

  EntradaController() {
      super(Transacao)
  }
  def index(Integer max) {
		params.page = params.int('page') ?: 1
		params.max = grailsApplication.config.angular.pageSize ?: 25
		params.offset = ((params.page - 1) * params.max)

		def results = loadPagedResults(params)

		response.setHeader('Content-Range', getContentRange((int)results.totalCount, params.offset, params.max))
		respond results, formats: ['json', 'html']
	}
  //@Override
  public PagedResultList loadPagedResults(params) {

  	resource.createCriteria().list(max: params.max, offset: params.offset) {
  	  params.filter?.each { String name, String value ->
  		  setDefaultCriteria(delegate, name, value)
  		}

  		if (params.sort) {
  		  order(params.sort, params.order == "asc" ? "asc" : "desc")
  		}

      //eq tipo, 'R'
      eq 'tipo', 'R'

    }
  }

  @Override
  protected def createResource(Map params) {
    params.tipo = 'R'
    resource.newInstance(params)
  }

  protected def createResource() {
    def instance = resource.newInstance()
    bindData instance, getObjectToBind()
    instance.tipo = 'R'
    instance
  }

}
