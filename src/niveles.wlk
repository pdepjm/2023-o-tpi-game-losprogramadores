import wollok.game.*
import nave.*
import configuracion.*
import colisionables.*
import direcciones.*

object nivel1 {
	
	var puntaje = 0
	
	method CantidadEnemigos() = 2
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
	}
	
	method visuals(){
		game.addVisual(naveActual)
		const naveEnemiga1 = new NaveEnemiga(position = game.at(8,7), anterior = game.at(8,7),id = 0, atacante = false)
		const naveEnemiga2 = new NaveEnemiga(position = game.at(6,2), anterior = game.at(9,9), id = 1,atacante = false)
		game.addVisual(naveEnemiga1)
		game.addVisual(naveEnemiga2)
		naveEnemiga2.colisionables()
		naveEnemiga1.colisionables()
		naveEnemiga1.atacar()
		naveEnemiga2.seguir()
	
	}
	
	method configuracionDeteclas(){
			
		//keyboard.up().onPressDo({naveActual.arriba()})
		//keyboard.down().onPressDo({naveActual.abajo()})
		keyboard.right().onPressDo({naveActual.derechaMoviemientoLateral()})
		keyboard.left().onPressDo({naveActual.izquierdaMoviemientoLateral()})
		keyboard.space().onPressDo({naveActual.dispararMovimientoLateral()})
		//keyboard.space().onPressDo({naveActual.disparar()})
	
	}
	
	method sumarPuntaje(puntos){
		puntaje =+ puntos
	} 
	
	method puntaje() = puntaje
	
}

object nivel2 {
		
	var puntaje = 0
	
	method CantidadEnemigos() = 2
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		
		
	}
	
	method visuals(){
		game.addVisual(naveActual)
		const naveEnemiga1 = new NaveEnemiga(position = game.at(8,7), anterior = game.at(8,7),id = 0, atacante = false)
		const naveEnemiga2 = new NaveEnemiga(position = game.at(6,2), anterior = game.at(9,9), id = 1,atacante = false)
		game.addVisual(naveEnemiga1)
		game.addVisual(naveEnemiga2)
		naveEnemiga2.colisionables()
		naveEnemiga1.colisionables()
		naveEnemiga1.atacar()
		naveEnemiga2.seguir()
	
	}
	
	method configuracionDeteclas(){
			
		keyboard.up().onPressDo({naveActual.arriba()})
		keyboard.down().onPressDo({naveActual.abajo()})
		keyboard.right().onPressDo({naveActual.derecha()})
		keyboard.left().onPressDo({naveActual.izquierda()})
		//keyboard.right().onPressDo({naveActual.derechaMoviemientoLateral()})
		//keyboard.left().onPressDo({naveActual.izquierdaMoviemientoLateral()})
		//keyboard.space().onPressDo({naveActual.dispararMovimientoLateral()})
		keyboard.space().onPressDo({naveActual.disparar()})
	
	}
	
	method sumarPuntaje(puntos){
		puntaje =+ puntos
	} 
	
	method puntaje() = puntaje
	
	}


object nivel3 {
	
}

