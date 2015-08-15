<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		ShurimaERP
		<small>Efetue login para continuar utilizando o sistema.</small>
	</h1>
</section>

<!-- Main content -->
<section class="content">

<div id='login'>
	<div class='inner'>

		<!--<div class='fheader'><g:message code="springSecurity.login.header"/></div>-->

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<!-- form principal -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Formulário de Login</h3>
			</div><!-- /.box-header -->
			<!-- form start -->
			<form role="form" action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<div class="box-body">
					<div class="form-group">
						<label for="username">Usuário</label>
						<input type='text' class="form-control" name='j_username' id='username'
							placeholder="Digite o usuário"/>
					</div>
					<div class="form-group">
						<label for="password">Senha</label>
						<input type='password' class="form-control"
							name='j_password' id='password' placeholder="Digite a senha"/>
					</div>
					<div class="checkbox">
						<label>
							<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
							Lembrar
						</label>
					</div>
				</div><!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="submit"
					  value='${message(code: "springSecurity.login.button")}'>
						Entrar
					</button>
				</div>
			</form>
		</div><!-- /.box -->

	</div>
</div>
</section><!-- /.content -->
<script type='text/javascript'>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
</script>
</body>
</html>
