package com.shurima
import com.shurima.Usuario

class UsuarioController extends PagedRestfulController {

    UsuarioController() {
        super(Usuario)
    }

    def scaffold = Usuario

    def login() {

    }

    def authenticate() {
      def user = Usuario.findByLoginAndPassword(params.login, params.password)
      if(user){
        session.user = user
        flash.message = "Hello ${user.name}!"
        redirect(controller:"entry", action:"list")
      }else{
        flash.message = "Sorry, ${params.login}. Please try again."
        redirect(action:"login")
      }
    }

    def logout() {
      flash.message = "Goodbye ${session.user.name}"
      session.user = null
      redirect(controller:"entry", action:"list")
    }

}
