class Pack {
    const duracion
    var precioBase
    const beneficios = []
    const coordinador
    
    method esPremium() 

    method duracion() = duracion 

    method coordinador() = coordinador

    method costosDeBeneficios() = if (beneficios.size()== 0) 0 else beneficios.filter({ben => ben.estaVigente()}).sum({ ben => ben.costo() }) 

    method calcularPrecioFinal() = precioBase + self.costosDeBeneficios()

    method agregarBeneficio(unBeneficio) {
      beneficios.add(unBeneficio)
}   
}
class PackNacionales inherits Pack {
    var proviciaDestino
    const actividades = []
    override method esPremium() = self.duracion() > 10 and self.coordinador().altamenteCalificado()
}
class PackInternacionales inherits Pack {
    var paisDestino
    var cantidadDeEscalas
    var esLugarDeInteres

    override method calcularPrecioFinal() = (super()) * 1.20

    method esLugarDeInteres() =  esLugarDeInteres

    method cantidadDeEscalas() = cantidadDeEscalas 

    override method esPremium() = self.esLugarDeInteres() and self.duracion() > 20 and self.cantidadDeEscalas() == 0
}

class Coordinador {
    var cantidadDeViajes
    var estaMotivado
    var aniosExperiencia
    var rol
    const rolesValidos = [guia, asistenteTuristico, acompaniante]

    method esUnRolValido(unRol) =  rolesValidos.contains(unRol)

    method cambiarRol(unNuevoRol) {
        if ( not self.esUnRolValido(unNuevoRol)) {
            self.error("No es un rol valido")
        }
        rol = unNuevoRol
    }
    method estaMotivado() = estaMotivado
    method aniosDeExperiencia() = aniosExperiencia
    method cantidadDeViajes() = cantidadDeViajes 
    method rol() = rol

    method altamenteCalificado() = self.cantidadDeViajes() > 20 and self.rol().condicionAdicional(self)

}
object guia {
  method condicionAdicional(unCoordinador) = unCoordinador.estaMotivado() and unCoordinador.cantidadDeViajes() >= 21
}
object asistenteTuristico {
  method condicionAdicional(unCoordinador) = unCoordinador.aniosDeExperiencia() >= 3
}
object acompaniante {
    method condicionAdicional(unCoordinador) = true
}

class BeneficioEspecial {
  const  tipo 
  const  costo
  const  estaVigente 

  method estaVigente() = estaVigente
  method costo() = costo
  method tipo() = tipo
}

//probando