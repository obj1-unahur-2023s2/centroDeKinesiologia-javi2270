import aparatos.*

class Paciente {
	const property edad
	var nivelDeFortaleza
	var nivelDeDolor
	
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
}

