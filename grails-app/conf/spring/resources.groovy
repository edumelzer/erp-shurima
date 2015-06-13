// Place your Spring DSL code here
import com.shurima.CustomMarshallerRegistrar

beans = {
    customMarshallerRegistrar(CustomMarshallerRegistrar)
    /*localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
       defaultLocale = new Locale("pt","BR")
       java.util.Locale.setDefault(defaultLocale)
    }*/
}
