import com.shurima.*

class BootStrap {

    def customMarshallerRegistrar

    def init = { servletContext ->
        customMarshallerRegistrar.registerMarshallers()

        Usuario admin = new Usuario(username:'admin', nome: 'Admin', password:'admin', enabled:true, tipoUsuario: 'A')
        Usuario recebimento = new Usuario(username:'recebimento', nome: 'Recebimento', password:'recebimento', enabled:true, tipoUsuario: 'R')
        Usuario pagamento = new Usuario(username:'pagamento', nome: 'Pagamento', password:'pagamento', enabled:true, tipoUsuario: 'P')

        if (!admin.save()) {
            println admin.errors
            return
        }
        pagamento.save()
        recebimento.save()

        Role adminRole = new Role(authority: 'ROLE_ADMIN').save()
        Role contasPagar = new Role(authority: 'ROLE_CONTASPAGAR').save()
        Role contasReceber = new Role(authority: 'ROLE_CONTASRECEBER').save()

        if (adminRole) {
            UserRole.create(admin, adminRole)
        }

        if (contasPagar) {
            UserRole.create(admin, contasPagar)
            UserRole.create(pagamento, contasPagar)
        }

        if (contasReceber) {
            UserRole.create(admin, contasReceber)
            UserRole.create(recebimento, contasReceber)
        }

    }

    def destroy = {

    }
}
