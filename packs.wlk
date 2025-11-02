class Pack {
    var duracion
    var precioBase
    const beneficios = []
    const coordinador

    method costosDeBeneficios() = if (beneficios.size()== 0) 0 else beneficios.filter({ben => ben.estaVigente()}).sum({ ben => ben.costo() }) 

    method calcularPrecioFinal() = precioBase + self.costosDeBeneficios()

    method agregarBeneficio(unBeneficio) {
      beneficios.add(unBeneficio)
}   
}
class PackNacionales inherits Pack {
    var proviciaDestino
    const actividades = []
}
class PackInternacionales inherits Pack {
    var paisDestino
    var cantidadDeEscalas
    var esLugarDeInteres

    override method calcularPrecioFinal() = (super()) * 1.20
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
}



object guia {
  
}
object asistenteTuristico {
  
}
object acompaniante {
  
}

class BeneficioEspecial {
  const  tipo 
  const  costo
  const  estaVigente 

  method estaVigente() = estaVigente
  method costo() = costo
  method tipo() = tipo
}
