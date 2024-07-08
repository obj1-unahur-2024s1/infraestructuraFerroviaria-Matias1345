class Locomotora{
	var property peso
	var property cuantoPuedeArrastrar
	var property velocidadMax
	
	method esEficiente() = self.cuantoPuedeArrastrar() >= (self.peso() * 5)
}