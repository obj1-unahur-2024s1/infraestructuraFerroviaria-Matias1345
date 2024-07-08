import vagones.*
import locomotoras.*

class Formacion{
	const vagones = []
	const locomotoras = []
	
	method agregarVagon(vagon){vagones.add(vagon)}
	
	method agregarLocomotora(locomotora){locomotoras.add(locomotora)}
	
	method pasajerosQuePuedeLlevar() = vagones.sum({v => v.cantidadPasajeros()})
	
	method cantVagonesPopulares() = vagones.count({v => v.cantidadPasajeros() > 50})
	
	method esFormacionCarguera() = vagones.all({v => v.maximoCarga() >= 1000})
	
	method dispersionDePesos() = self.pesoMaxVagonMasPesado() - self.pesoMaxVagonMasLiviano()
	
	method pesoMaxVagonMasPesado() = vagones.max({v => v.pesoMaximo()}).pesoMaximo()
	
	method pesoMaxVagonMasLiviano() =  vagones.min({v => v.pesoMaximo()}).pesoMaximo()
	
	method cuantosBaniosTiene() = vagones.count({v => v.tieneBanio()})
	
	method realizarMantenimiento(){vagones.forEach({v => v.recibirMantenimiento()})}
	
	method estaEquilibradaEnPjs() = self.maximoPjsEnUnVagon() - self.minimoPjsEnUnVagon() <= 20
	
	method vagonesConPasajeros() = vagones.filter({v => v.cantidadPasajeros() > 0})
	
	method maximoPjsEnUnVagon() = self.vagonesConPasajeros().max({v => v.cantidadPasajeros()})
	
	method minimoPjsEnUnVagon() = self.vagonesConPasajeros().min({v => v.cantidadPasajeros()})
	
	/*method estaOrganizada(){
		if (vagones.size()>=2) {
			return not (1..vagones.size()-1).any({i=> not vagones.get(i-1).esDePasajeros() and 
			vagones.get(i).esDePasajeros()})
		}
		else{
			return true
		}
	}*/
	
	method pesoTotalVagones() = vagones.sum({v => v.pesoMaximo()})
	
	method velocidadMaxima() = locomotoras.min({l => l.velocidadMax()})
	
	method esEficiente() = locomotoras.all({l => l.esEficiente()})
	
	method pesoMaxFormacion() = locomotoras.sum({l => l.peso()}) + self.pesoTotalVagones()
	
	method puedeMoverse() = locomotoras.sum({l => l.cuantoPuedeArrastrar()}) >= self.pesoMaxFormacion()
	
	method kilosEmpujeFaltantes() = if(self.puedeMoverse()) 0 else self.pesoMaxFormacion() - 
	self.arrastreTotalLocomotoras()
	
	method arrastreTotalLocomotoras() = locomotoras.sum({l => l.cuantoPuedeArrastrar()})
	
	method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
	
	method esCompleja() = vagones.size() + locomotoras.size() > 8 or self.pesoMaxFormacion() > 80000
}






