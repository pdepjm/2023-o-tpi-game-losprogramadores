import wollok.game.*

object up {
	
	method moverseHaciaArrba(objeto) {
		 objeto.position(objeto.position().up(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaArrba(objeto)
		
	}
}

object down{
	method moverseHaciaAbajo(objeto) {
		 objeto.position(objeto.position().down(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaAbajo(objeto)
	}
	
}

object right{
	method moverseHaciaDerecha(objeto) {
		 objeto.position(objeto.position().right(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaDerecha(objeto)
	}
}

object left{
	method moverseHaciaIzquierda(objeto) {
		 objeto.position(objeto.position().left(1))
	}
	
	method moverA(objeto){
		self.moverseHaciaIzquierda(objeto)
	}
}