class Deposito{
	const formaciones = []
	const locomotorasSueltas = []
	
	method vagonMasPesadoDeCadaFormacion() = formaciones.map({f => f.vagonMasPesado()})
	
	method necesitaCondExperimentado() = formaciones.any({f => f.esCompleja()})
	
	method agregarLocomotoraA(formacion,locomotora){
		if(!formacion.puedeMoverse() and locomotora.cuantoPuedeArrastrar() >= 
		formacion.kilosEmpujeFaltantes()){
			formacion.agregarLocomotora(locomotora)
		}
	}
}