import com.shurima.*

class BootStrap {

	def customMarshallerRegistrar

	def init = { servletContext ->
		customMarshallerRegistrar.registerMarshallers()

		new TipoUsuario(id: 1, descricao: 'Admin').save(flush: true)
		new TipoUsuario(id: 2, descricao: 'Contas a Pagar').save(flush: true)
		new TipoUsuario(id: 3, descricao: 'Contas a Receber').save(flush: true)
		new TipoUsuario(id: 4, descricao: 'Estoque').save(flush: true)

		Usuario admin = new Usuario(username:'admin', nome: 'Admin', password:'admin', enabled:true)
		Usuario eduardo = new Usuario(username:'eduardo', nome: 'Eduardo', password:'eduardo', enabled:true)
		Usuario recebimento = new Usuario(username:'recebimento', nome: 'Recebimento', password:'recebimento', enabled:true)

		admin.save()
		eduardo.save()
		recebimento.save()

		println "Vai se fuder"
		println admin.errors
		println eduardo.errors

		Role adminRole = new Role(authority: 'ROLE_ADMIN').save()
		Role contasPagar = new Role(authority: 'ROLE_CONTASPAGAR').save()
		UserRole.create(admin, adminRole)
		UserRole.create(admin, contasPagar)
		UserRole.create(eduardo, contasPagar)
		UserRole.create(recebimento, contasPagar)

	}

	def destroy = {

	}
}
