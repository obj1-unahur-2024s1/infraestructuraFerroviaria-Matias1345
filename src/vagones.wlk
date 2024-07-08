class Vagon{
	method cantidadPasajeros()
	
	method tieneBanio()
	
	method maximoCarga()
	
	method pesoMaximo()
	
	method recibirMantenimiento(){}
}

class VagonPasajeros inherits Vagon{
	var property largo
	var property ancho
	var tieneBanio
	var property estaOrdenado
	
	override method cantidadPasajeros() = (if(self.ancho() <= 3) 8 * self.largo() else 10 * self.largo()) -
	self.verificarSiEstaOrdenado()
	
	method verificarSiEstaOrdenado() = if(self.estaOrdenado()) 0 else 15
	
	override method tieneBanio() = tieneBanio
	
	override method maximoCarga() = if(self.tieneBanio()) 300 else 800
	
	override method pesoMaximo() = 2000 + 80 * self.cantidadPasajeros() + self.maximoCarga()
	
	override method recibirMantenimiento(){estaOrdenado = true}
}

class VagonCarga inherits Vagon{
	var property cargaMaxIdeal
	var property maderasSueltas
	
	override method cantidadPasajeros() = 0
	
	override method tieneBanio() = false
	
	override method maximoCarga() = self.cargaMaxIdeal() - 400 * self.maderasSueltas()
	
	override method pesoMaximo() = 1500 + self.maximoCarga()
	
	override method recibirMantenimiento(){(maderasSueltas = 0.max(maderasSueltas - 2))}
}

class VagonDormitorio inherits Vagon{
	var property cantCompartimentos
	var property camasXcompartimento
	
	override method cantidadPasajeros() = self.cantCompartimentos() * self.camasXcompartimento()
	
	override method tieneBanio() = true
	
	override method maximoCarga() = 1200
	
	override method pesoMaximo() = 4000 + 80 * self.cantidadPasajeros() + self.maximoCarga()
}



