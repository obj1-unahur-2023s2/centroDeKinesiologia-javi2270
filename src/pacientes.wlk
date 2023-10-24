import aparatos.*

class Paciente {
	const property edad
	var nivelDeFortaleza
	var nivelDeDolor 
	const rutina = []
	
	method edad() = edad
	method nivelDeDolor() = nivelDeDolor
	method nivelDeFortaleza() = nivelDeFortaleza
	
	method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)
	
	method usarAparato(unAparato) {
		if ( !self.puedeUsar(unAparato) ) {
			self.error('El paciente no puede usar este aparato.')
		}
		nivelDeDolor = 0.max(nivelDeDolor - unAparato.dolorQueResta(self))
		nivelDeFortaleza += unAparato.fortalezaQueSuma(self)
	}
	
	method asignarRutina(listaDeAparatos) {
		rutina.addAll(listaDeAparatos)
	}
	
	method puedeRealizarRutina() = rutina.all({a => self.puedeUsar(a)})
	
	method realizarRutina() {
		if (!self.puedeRealizarRutina()){
			self.error('El paciente no puede realizar la rutina.')
		}
		rutina.forEach({a => self.usarAparato(a)})
	}
}

class PacienteResistente inherits Paciente {
	
	override method usarAparato(unAparato) {
		super(unAparato)
		nivelDeFortaleza ++
	}
}

class PacienteCaprichoso inherits Paciente {
	
	override method puedeRealizarRutina() {
		return super() && rutina.any({a => a.color() == 'rojo'})
	}
	
	override method realizarRutina() {
		super()
		super()
	}
	
}

class PacienteRapidaRecuperacion inherits Paciente {

	override method realizarRutina() {
		super()
		nivelDeDolor -= coeficienteDeRecupeacion.valor()
	}
}

object coeficienteDeRecupeacion {
	var property valor = 3
}







