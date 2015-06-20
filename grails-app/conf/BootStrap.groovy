import com.shurima.TipoUsuario

class BootStrap {

	def customMarshallerRegistrar

	def init = { servletContext ->
		customMarshallerRegistrar.registerMarshallers()

		new TipoUsuario(id: 1, descricao: 'Admin')
		new TipoUsuario(id: 2, descricao: 'Contas a Pagar')
		new TipoUsuario(id: 3, descricao: 'Contas a Receber')
		new TipoUsuario(id: 4, descricao: 'Estoque')

	}

	def destroy = {

	}
}
