import pacientes.*

class Aparato {
	const property color
	
	method puedeSerUsadoPor(unPaciente) = true
	
	method fortalezaQueSuma(unPaciente)
	method dolorQueResta(unPaciente)
	method concecuenciasDeUso(unPaciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()

}

class Magneto inherits Aparato {
	var imantacion = 800
	
	override method dolorQueResta(unPaciente) = unPaciente.nivelDeDolor() * 0.1
	override method fortalezaQueSuma(unPaciente) = 0
	method imantacion() = imantacion
	override method concecuenciasDeUso(unPaciente) {
		imantacion --
	}
	override method necesitaMantenimiento() = self.imantacion() < 100
	override method hacerMantenimiento() {
		if (!self.necesitaMantenimiento()){
			self.error('El aparato no necesita mantenimiento.')
		}
		imantacion += 500
	}
}

class Bicicleta inherits Aparato {
	var vecesDesajustoTornillo = 0
	var vecesPerdioAceite = 0
	
	method vecesDesajustoTornillo() = vecesDesajustoTornillo
	method vecesPerdioAceite() = vecesPerdioAceite
	override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8	
	override method dolorQueResta(unPaciente) = 4
	override method fortalezaQueSuma(unPaciente) = 3
	override method concecuenciasDeUso(unPaciente) {
		if (unPaciente.nivelDeDolor() > 30 && unPaciente.edad().between(30,50)) {
			vecesDesajustoTornillo ++
			vecesPerdioAceite ++
		}
		vecesDesajustoTornillo ++
	}
	override method necesitaMantenimiento() {
		return self.vecesDesajustoTornillo() >=10 || self.vecesPerdioAceite() >= 5
	}
	
	override method hacerMantenimiento() {
		if (!self.necesitaMantenimiento()){
			self.error('El aparato no necesita mantenimiento.')
		}
		vecesDesajustoTornillo = 0
		vecesPerdioAceite = 0
	} 
}

class Minitramp inherits Aparato {
	
	override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDeDolor() < 20
	override method dolorQueResta(unPaciente) = 0
	override method fortalezaQueSuma(unPaciente) = unPaciente.edad() * 0.1
	override method concecuenciasDeUso(unPaciente){}
	override method necesitaMantenimiento() = false
	override method hacerMantenimiento(){}
}



