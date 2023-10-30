import wollok.game.*
import nave.*
import configuracion.*
import colisionables.*
import direcciones.*

object nivel1 {
	
	var puntaje = 0
	
	method CantidadEnemigos() = 18
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		
	}
	
	method visuals(){
		game.addVisual(naveActual)
		const naveEnemiga8 = new NaveEnemiga(position = game.at(0,7), anterior = game.at(0,7),id = 8, atacante = false)
		const naveEnemiga0 = new NaveEnemiga(position = game.at(1,7), anterior = game.at(1,7),id = 0, atacante = false)
		const naveEnemiga1 = new NaveEnemiga(position = game.at(2,7), anterior = game.at(2,7),id = 1, atacante = false)
		const naveEnemiga2 = new NaveEnemiga(position = game.at(3,7), anterior = game.at(3,7),id = 2, atacante = false)
		const naveEnemiga3 = new NaveEnemiga(position = game.at(4,7), anterior = game.at(4,7),id = 3, atacante = false)
		const naveEnemiga4 = new NaveEnemiga(position = game.at(5,7), anterior = game.at(5,7),id = 4, atacante = false)
		const naveEnemiga5 = new NaveEnemiga(position = game.at(6,7), anterior = game.at(6,7),id = 5, atacante = false)
		const naveEnemiga6 = new NaveEnemiga(position = game.at(7,7), anterior = game.at(7,7),id = 6, atacante = false)
		const naveEnemiga7 = new NaveEnemiga(position = game.at(8,7), anterior = game.at(8,7),id = 7, atacante = false)
		
		
		const naveEnemiga17 = new NaveEnemiga(position = game.at(0,8), anterior = game.at(0,8),id = 17, atacante = false)
		const naveEnemiga9 = new NaveEnemiga(position = game.at(1,8), anterior = game.at(1,8),id = 9, atacante = false)
		const naveEnemiga10 = new NaveEnemiga(position = game.at(2,8), anterior = game.at(2,8),id = 10, atacante = false)
		const naveEnemiga11 = new NaveEnemiga(position = game.at(3,8), anterior = game.at(3,8),id = 11, atacante = false)
		const naveEnemiga12 = new NaveEnemiga(position = game.at(4,8), anterior = game.at(4,8),id = 12, atacante = false)
		const naveEnemiga13 = new NaveEnemiga(position = game.at(5,8), anterior = game.at(5,8),id = 13, atacante = false)
		const naveEnemiga14 = new NaveEnemiga(position = game.at(6,8), anterior = game.at(6,8),id = 14, atacante = false)
		const naveEnemiga15 = new NaveEnemiga(position = game.at(7,8), anterior = game.at(7,8),id = 15, atacante = false)
		const naveEnemiga16 = new NaveEnemiga(position = game.at(8,8), anterior = game.at(8,8),id = 16, atacante = false)
		 
		
		game.addVisual(naveEnemiga0)
		game.addVisual(naveEnemiga1)
		game.addVisual(naveEnemiga2)
		game.addVisual(naveEnemiga3)
		game.addVisual(naveEnemiga4)
		game.addVisual(naveEnemiga5)
		game.addVisual(naveEnemiga6)
		game.addVisual(naveEnemiga7)
		game.addVisual(naveEnemiga8)
		
		game.addVisual(naveEnemiga9)
		game.addVisual(naveEnemiga10)
		game.addVisual(naveEnemiga11)
		game.addVisual(naveEnemiga12)
		game.addVisual(naveEnemiga13)
		game.addVisual(naveEnemiga14)
		game.addVisual(naveEnemiga15)
		game.addVisual(naveEnemiga16)
		game.addVisual(naveEnemiga17)
		 
		naveEnemiga0.avanzarPorTiempo()
		naveEnemiga0.inciarComportamientoBasico()
		naveEnemiga1.inciarComportamientoBasico()
		naveEnemiga1.avanzarPorTiempo()
		naveEnemiga2.avanzarPorTiempo()
		naveEnemiga2.inciarComportamientoBasico()
		naveEnemiga3.inciarComportamientoBasico()
		naveEnemiga3.avanzarPorTiempo()
		naveEnemiga4.inciarComportamientoBasico()
		naveEnemiga4.avanzarPorTiempo()
		naveEnemiga5.inciarComportamientoBasico()
		naveEnemiga5.avanzarPorTiempo()
		naveEnemiga6.inciarComportamientoBasico()
		naveEnemiga6.avanzarPorTiempo()
		naveEnemiga7.inciarComportamientoBasico()
		naveEnemiga7.avanzarPorTiempo()
		naveEnemiga8.inciarComportamientoBasico()
		naveEnemiga8.avanzarPorTiempo()
		
		naveEnemiga9.colisionables()
		naveEnemiga9.avanzarPorTiempo()
		naveEnemiga10.colisionables()
		naveEnemiga10.avanzarPorTiempo()
		naveEnemiga11.colisionables()
		naveEnemiga11.avanzarPorTiempo()
		naveEnemiga12.colisionables()
		naveEnemiga12.avanzarPorTiempo()
		naveEnemiga13.colisionables()
		naveEnemiga13.avanzarPorTiempo()
		naveEnemiga14.colisionables()
		naveEnemiga14.avanzarPorTiempo()
		naveEnemiga15.colisionables()
		naveEnemiga15.avanzarPorTiempo()
		naveEnemiga16.colisionables()
		naveEnemiga16.avanzarPorTiempo()
		naveEnemiga17.colisionables()
		naveEnemiga17.avanzarPorTiempo()
		 
		
		
		// le cuesta una barbaridad al wollok, nose se dejar solo una linea de 
		//naveEnemiga2.seguir()
	
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
	
	method CantidadEnemigos() = 5
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		
		
	}
	
	method visuals(){
		game.addVisual(naveActual)
		const naveEnemiga30 = new NaveEnemiga(position = game.at(1,7), anterior = game.at(1,7),id = 30, atacante = false)
		const naveEnemiga31 = new NaveEnemiga(position = game.at(7,7), anterior = game.at(7,7), id = 31,atacante = false)
		
		//game.schedule(6000,)
		game.addVisual(naveEnemiga30)
		game.addVisual(naveEnemiga31)
		naveEnemiga30.colisionables()
		naveEnemiga31.colisionables()
		naveEnemiga31.seguir()
		naveEnemiga30.seguir()
		
		game.schedule(7000,{
			
			
		const naveEnemiga4 = new NaveEnemiga(position = game.at(1,7), anterior = game.at(1,7),id = 4, atacante = false)
		const naveEnemiga5 = new NaveEnemiga(position = game.at(7,7), anterior = game.at(7,7), id = 5,atacante = false)
		const naveEnemiga6 = new NaveEnemiga(position = game.at(4,7), anterior = game.at(4,7), id = 6,atacante = false)
		
			
		game.addVisual(naveEnemiga6)
		game.addVisual(naveEnemiga4)
		game.addVisual(naveEnemiga5)
		naveEnemiga5.colisionables()
		naveEnemiga4.colisionables()
		naveEnemiga6.colisionables()
		naveEnemiga5.seguir()
		naveEnemiga4.seguir()
		naveEnemiga6.seguir()
			
			
		})
	
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

