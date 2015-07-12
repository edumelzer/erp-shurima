<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Shurima ERP</title>

		<style>

		</style>

	</head>
	<body>
		<br/>
        <div class="col-md-3">
            <div class="panel panel-default", style="display: none;">
                <div class="panel-heading">
                    <h2 class="panel-title">Status da Aplicação</h2>
                </div>
                <div class="panel-body">
                    <ul>
                        <li>App version: <g:meta name="app.version"/> beta</li>
                        <li>Grails version: <g:meta name="app.grails.version"/></li>
                        <li>Groovy version: ${GroovySystem.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default", style="display: none;">
                <div class="panel-heading">
                    <h2 class="panel-title">Plugins</h2>
                </div>
                <div class="panel-body", style="display: none;">
                    <ul>
                        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>
                    </ul>
                </div>
            </div>


    </div>
        <div class="col-md-9">
            <h1>Shurima ERP</h1>
						<p>Aplicação para controle financeiro e de estoque - versão beta</p>

		    <p class="alert alert-info"><i class="fa fa-info-circle"></i> Verifique os menus disponíveis</p>


        </div>

	</body>
</html>
