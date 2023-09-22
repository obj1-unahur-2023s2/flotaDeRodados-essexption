import rodados.*

class Pedido {
	const property distancia
	var property tiempo
	var property pasajeros
	const property coloresIncompatibles = #{}
	
	
	method velocidadRequerida(){
		return distancia/tiempo
	}
	
	method puedeSerSatisfechoPor(unRodado){
		return unRodado.velocidad()>= 10 + self.velocidadRequerida() and unRodado.capacidad() >= pasajeros and self.esDeColorCompatible(unRodado.color())
	}
	
	method agregarColorIncompatible(unColor) = coloresIncompatibles.add(unColor)
	method quitarColorIncompatible(unColor) = coloresIncompatibles.remove(unColor)
	
	method esDeColorCompatible(unColor) = not coloresIncompatibles.contains(unColor)
	
	method acelerar(){ tiempo -= (tiempo-1).min(1).max(0)}
	method relajar() { tiempo += 1}
	
	
}
