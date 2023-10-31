import wollok.game.*
import nave.*
import configuracion.*
import colisionables.*
import direcciones.*

object nivel1 {
	
	var property puntaje = 0
	

	method CantidadEnemigos() = 18
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		self.puntaje(0)
		configJuego.contadorDeMuertes(0)
		naveActual.vida(3)
		
		
	}
	
	method visuals(){
		game.addVisual(vidas)
		game.addVisual(numeroVida)
		game.addVisual(puntajes)
		game.addVisual(numeroPuntaje)
		game.addVisual(naveActual)
		const naveEnemiga8 = new NaveEnemiga(position = game.at(0,6), anterior = game.at(0,6),id = 8, atacante = false)
		const naveEnemiga0 = new NaveEnemiga(position = game.at(1,6), anterior = game.at(1,6),id = 0, atacante = false)
		const naveEnemiga1 = new NaveEnemiga(position = game.at(2,6), anterior = game.at(2,6),id = 1, atacante = false)
		const naveEnemiga2 = new NaveEnemiga(position = game.at(3,6), anterior = game.at(3,6),id = 2, atacante = false)
		const naveEnemiga3 = new NaveEnemiga(position = game.at(4,6), anterior = game.at(4,6),id = 3, atacante = false)
		const naveEnemiga4 = new NaveEnemiga(position = game.at(5,6), anterior = game.at(5,6),id = 4, atacante = false)
		const naveEnemiga5 = new NaveEnemiga(position = game.at(6,6), anterior = game.at(6,6),id = 5, atacante = false)
		const naveEnemiga6 = new NaveEnemiga(position = game.at(7,6), anterior = game.at(7,6),id = 6, atacante = false)
		const naveEnemiga7 = new NaveEnemiga(position = game.at(8,6), anterior = game.at(8,6),id = 7, atacante = false)
		
		
		const naveEnemiga17 = new NaveEnemiga(position = game.at(0,7), anterior = game.at(0,7),id = 17, atacante = false)
		const naveEnemiga9 = new NaveEnemiga(position = game.at(1,7), anterior = game.at(2,7),id = 9, atacante = false)
		const naveEnemiga10 = new NaveEnemiga(position = game.at(2,7), anterior = game.at(2,7),id = 10, atacante = false)
		const naveEnemiga11 = new NaveEnemiga(position = game.at(3,7), anterior = game.at(3,7),id = 11, atacante = false)
		const naveEnemiga12 = new NaveEnemiga(position = game.at(4,7), anterior = game.at(4,7),id = 12, atacante = false)
		const naveEnemiga13 = new NaveEnemiga(position = game.at(5,7), anterior = game.at(5,7),id = 13, atacante = false)
		const naveEnemiga14 = new NaveEnemiga(position = game.at(6,7), anterior = game.at(6,7),id = 14, atacante = false)
		const naveEnemiga15 = new NaveEnemiga(position = game.at(7,7), anterior = game.at(7,7),id = 15, atacante = false)
		const naveEnemiga16 = new NaveEnemiga(position = game.at(8,7), anterior = game.at(8,7),id = 16, atacante = false)
		 
		
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
	
	method sumarPuntaje(){
		puntaje = puntaje + 1
	} 
	
	
}

object nivel2 {
		
	var property puntaje = 0
	
	method CantidadEnemigos() = 5
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		self.puntaje(0)
		configJuego.contadorDeMuertes(0)
		naveActual.vida(3)
		
	}
	
	method visuals(){
		game.addVisual(vidas)
		game.addVisual(numeroVida)
		game.addVisual(puntajes)
		game.addVisual(numeroPuntaje)
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
	
	method sumarPuntaje(){
		puntaje = puntaje + 1
	} 
	
}


object nivel3 {
	var property puntaje = 0
	
	method CantidadEnemigos() = 12
	
	method inicarNivel(){
		self.visuals()
		self.configuracionDeteclas()
		naveActual.modifarPosicion(game.at(4,1))
		naveActual.direccion(up)
		naveActual.inicializarImagen()
		self.puntaje(0)
		configJuego.contadorDeMuertes(0)
		naveActual.vida(3)
		
		
	}
	
	method visuals(){
		game.addVisual(vidas)
		game.addVisual(numeroVida)
		game.addVisual(puntajes)
		game.addVisual(numeroPuntaje)
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
		
		
		 
		game.addVisual(naveEnemiga0)
		game.addVisual(naveEnemiga1)
		game.addVisual(naveEnemiga2)
		game.addVisual(naveEnemiga3)
		game.addVisual(naveEnemiga4)
		game.addVisual(naveEnemiga5)
		game.addVisual(naveEnemiga6)
		game.addVisual(naveEnemiga7)
		game.addVisual(naveEnemiga8)
		
	
		 
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
		
	
		game.schedule(20000,{
			
			
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
		naveEnemiga5.atacar()
		naveEnemiga4.seguir()
		naveEnemiga4.atacar()
		naveEnemiga6.seguir()
		naveEnemiga6.atacar()
			
			
		})
		
	
		
		// le cuesta una barbaridad al wollok, nose se dejar solo una linea de 
		//naveEnemiga2.seguir()
	
	}
	
	method configuracionDeteclas(){
			
		
		keyboard.up().onPressDo({naveActual.arriba()})
		keyboard.down().onPressDo({naveActual.abajo()})
		keyboard.right().onPressDo({naveActual.derecha()})
		keyboard.left().onPressDo({naveActual.izquierda()})
		keyboard.space().onPressDo({naveActual.disparar()})
	
	
	}
	
	method sumarPuntaje(){
		puntaje = puntaje + 1
	} 
	
	
	
	
}

object vidas{
	
	var property position = game.at(0,8)
	var property image = "vidas.png"
	
	method position() = position
	method image()= image
	
}

object numeroVida{
	
	//var image = naveActual.vidas()+".png"
	
	const listaNumeros = ["1.png","2.png","3.png"]
	
	const  position = game.at(1,8)
	const image = "3.png"
	
	method position() = position
	method image()= listaNumeros.get(naveActual.vidas()-1)
	
}
object puntajes{
	
	var position = game.at(6,8)
	const image = "puntos.png"
	
	method position() = position
	method image()= image
	
	method position(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method recibirDisparo(_){
		
	}
	
}


object numeroPuntaje{
	
	const listaNumeros = ["0.png","100.png","200.png","300.png","400.png","500.png","600.png","700.png","800.png","900.png","1000.png","1200.png","1300.png","1400.png","1500.png","1600.png","1700.png","1800.png"]
	
	const position = game.at(8,8)
	
	method recibirDisparo(_){
		
	}
	
	method position() = position
	method image()= listaNumeros.get(configJuego.nivelActual().puntaje())
	
}

