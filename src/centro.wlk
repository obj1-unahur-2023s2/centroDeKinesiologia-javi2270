import pacientes.*
import aparatos.*

object centroDeKinesiologia {
	const aparatos = []
	const pacientes = #{}
	
	method colorDeAparatos() = aparatos.map({a => a.color()}).asSet()
	
	method pacientesMenoresA8() = pacientes.filter({p => p.edad() < 8})
	
	method pacientesQueNoCumplen() = pacientes.count({p => !p.puedeRealizarRutina()})
	
	method estaEnOptimasCondicioneds() = aparatos.all({a => !a.necesitaMantenimiento()})
	
	method aparatosParaMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()})
	
	method estaComplicado() = self.aparatosParaMantenimiento() >= aparatos.size() / 2
	
	method registrarVisitaDelTecnico() {
		self.aparatosParaMantenimiento().forEach({a => a.hacerMantenimiento()})
	}
}
