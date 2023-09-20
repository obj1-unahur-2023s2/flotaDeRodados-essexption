import rodados.*
import pedidos.*

class Dependencia {
	var property cantEmpleados = 0
	const rodados = []
	const pedidos = []
	
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	
	method pesoTotalFlota() = rodados.sum({auto => auto.peso()})
	method todosSuperanXVelocidad(velocidad) = rodados.all({auto=>auto.velocidad()>=velocidad})
	method estaBienEquipada() = rodados.size() > 2 and self.todosSuperanXVelocidad(100)
	
	method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({auto => auto.capacidad()})
	
	method rodadosDeColor(unColor) {
		return rodados.filter({auto => auto.color() == unColor})
	}
	
	method rodadoMasRapido() {
		if(rodados.isEmpty()) { self.error("No se puede calcular el maximo")}
		return rodados.max({auto=>auto.velocidad()})
	}
	
	method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
	
	method capacidadDeLaFlota() = rodados.sum({auto => auto.capacidad()})
	method capacidadFaltante() = 0.max(cantEmpleados - self.capacidadDeLaFlota())
	method esGrande() = cantEmpleados >= 40 and rodados.size()>=5
	
	method ningunoSatisface(pedido){
		return rodados.all({auto => not pedido.puedeSerSatisfechoPor(auto)})
	}
	
	method pedidosInsatisfechos(){
		return pedidos.filter({ p => self.ningunoSatisface(p)})
	}
}
