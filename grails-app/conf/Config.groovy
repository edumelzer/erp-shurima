import grails.plugin.springsecurity.SecurityConfigType

grails.project.groupId = "com.shurima"

grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

grails.converters.json.default.deep = true
grails.views.default.codec = "html"

grails.controllers.defaultScope = 'singleton'

grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml'
            codecs {
                expression = 'html'
                scriptlet = 'html'
                taglib = 'none'
                staticparts = 'none'
            }
        }
    }
}

grails.converters.encoding = "UTF-8"
grails.scaffolding.templates.domainSuffix = 'Instance'

grails.json.legacy.builder = false
grails.enable.native2ascii = true
grails.spring.bean.packages = []
grails.web.disable.multipart=false

grails.exceptionresolver.params.exclude = ['password']

grails.hibernate.cache.queries = false

grails.hibernate.pass.readonly = false
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    test {
        grails.assets.minifyJs = true
    }

    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

log4j.main = {

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

grails.databinding.dateFormats = [
    "yyyy-MM-dd'T'hh:mm:ss'Z'",
    "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'",
    "dd/MM/yyyy"
]

angular.pageSize = 25
angular.dateFormat="dd/MM/yyyy"

grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.shurima.Usuario'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.shurima.UserRole'
grails.plugin.springsecurity.authority.className = 'com.shurima.Role'

//grails.plugin.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
/*grails.plugin.springsecurity.interceptUrlMap = [
        '/screen/authenticatedPage':  ['IS_AUTHENTICATED_FULLY'],
        '/usuario/**':  ['ROLE_ADMIN'],
        '/transacao/**': ['ROLE_CONTASPAGAR'],
        '/**':           ['IS_AUTHENTICATED_FULLY']
]*/
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
    '/':                              ['IS_AUTHENTICATED_FULLY'],
    '/index':                         ['IS_AUTHENTICATED_FULLY'],
    '/index.gsp':                     ['IS_AUTHENTICATED_FULLY'],
    '/**/js/**':                      ['permitAll'],
    '/**/css/**':                     ['permitAll'],
    '/**/images/**':                  ['permitAll'],
    '/**/favicon.ico':                ['permitAll'],
  '/contact/*':                     ['permitAll'],
  '/empresa/**':                    ['ROLE_ADMIN', 'ROLE_CONTASRECEBER', 'ROLE_CONTASPAGAR'],
  '/relatorioReceber/**':           ['ROLE_ADMIN'],
  '/relatorioPagar/**':             ['ROLE_ADMIN'],
  '/relatorioEmpresa/**':           ['ROLE_ADMIN'],
  '/relatorioFinanceiro/**':        ['ROLE_ADMIN'],
  '/relatorioOrdem/**':             ['ROLE_ADMIN'],
  '/relatorioGrupo/**':             ['ROLE_ADMIN'],
  '/relatorioEstoque/**':           ['ROLE_ADMIN'],
  '/jasper/**':                     ['ROLE_ADMIN'],
  '/transacao/**':                  ['ROLE_ADMIN', 'ROLE_CONTASPAGAR'], //ROLE_ESTOQUE
  '/entrada/**':                    ['ROLE_ADMIN', 'ROLE_CONTASRECEBER'],
  '/item/**':                       ['ROLE_ADMIN', 'ROLE_ESTOQUE'],
  '/usuario/**':                    ['ROLE_ADMIN'],
  '/grupo/**':                      ['ROLE_ADMIN', 'ROLE_ESTOQUE'],
  '/ordem/**':                      ['ROLE_ADMIN', 'ROLE_ESTOQUE']
]

grails.plugin.springsecurity.rest.login.useJsonCredentials = true
grails.plugin.springsecurity.rest.token.storage.useGorm = true
grails.plugin.springsecurity.rest.token.storage.gorm.tokenDomainClassName = 'com.shurima.AuthenticationToken'
grails.plugin.springsecurity.logout.postOnly = false
