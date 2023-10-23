import pacientes.*

class Aparato {
	
	method puedeSerUsadoPor(unPaciente) = true

}

class Magneto inherits Aparato {
	
	method dolorQueResta(unPaciente) = unPaciente.nivelDeDolor() * 0.1
	
	method fortalezaQueSuma(unPaciente) = 0
}

class Bicicleta inherits Aparato {
	
	override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8	
	
	method dolorQueResta(unPaciente) = 4
	
	method fortalezaQueSuma(unPaciente) = 3
}

class Minitramp inherits Aparato {
	
	override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDeDolor() < 20
	
	method dolorQueResta(unPaciente) = 0
	
	method fortalezaQueSuma(unPaciente) = unPaciente.edad() * 0.1
}



