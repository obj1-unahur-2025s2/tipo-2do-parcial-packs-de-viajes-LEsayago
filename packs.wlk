class Pack {
    var duracion
    var precioBase
    const baneficios = []
    const coordinador


}
class PackNacionales inherits Pack {
    var proviciaDestino
    const actividades = []
}
class PackInternacionales inherits Pack {
    var paisDestino
    var cantidadDeEscalas
    var esLugarDeInteres
}

class Coordinador {
    var cantidadDeViajes
    var estaMotivado
    var aniosExperiencia
    var rol
    const rolesValidos = [guia, asistenteTuristico, acompaniante]

    method esUnRolValido(unRol) =  rolesValidos.contains(unRol)
}



object guia {
  
}
object asistenteTuristico {
  
}
object acompaniante {
  
}
