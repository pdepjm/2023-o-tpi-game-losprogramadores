import wollok.game.*

object up {
	
	const lugar = 0
	
	method posicionObejeto(posicion) = posicion.up(1)
		
	
	method lugar() = lugar
	
	method moverseHaciaArrba(objeto) {
		 objeto.position(objeto.position().up(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaArrba(objeto)
		
	}
}

object down{
	
	const lugar = 1
	
	method posicionObejeto(posicion) = posicion.down(1)
	
	method lugar() = lugar
	
	method moverseHaciaAbajo(objeto) {
		 objeto.position(objeto.position().down(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaAbajo(objeto)
	}
	
	
	
}

object right{
	
	const lugar = 3
	
	method posicionObejeto(posicion) = posicion.right(1)
	
	method lugar() = lugar
	
	method moverseHaciaDerecha(objeto) {
		 objeto.position(objeto.position().right(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaDerecha(objeto)
	}
	
	
}

object left{
	
	const lugar = 2
	
	method posicionObejeto(posicion) = posicion.left(1)
	
	method lugar() = lugar
	
	method moverseHaciaIzquierda(objeto) {
		 objeto.position(objeto.position().left(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaIzquierda(objeto)
	}
}