import wollok.game.*
import nave.*
import colisionables.*
import niveles.*


object configJuego {
	
	var property contadorDeMuertes = 0
	var property nivelActual
	const level1 = new SelectLevel(position=game.at(2,5), image="level1.png")
	const level2 = new SelectLevel(position=game.at(2,4), image="level2.png")
	const level3 = new SelectLevel(position=game.at(2,3), image="level3.png")
	
	method level1() = level1
	method level2() = level2
	method level3() = level3
	
	
	method sumarMuerte(){
		contadorDeMuertes = contadorDeMuertes + 1
	}
	
	method contadorDeMuertes() = contadorDeMuertes

	
	method iniciar(){
		self.configPantalla()
		self.portadaIncio()
		game.start()
	}
	
	method limites(){
		
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(-1,n)))}		
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,-1)))}
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,9)))}	
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(9,n)))}	
		
		game.onCollideDo(naveActual,{chocado => chocado.chocarseConNave()})
	}
	
	method portadaIncio(){
		
		game.addVisual(portada)
		
		keyboard.space().onPressDo({
			self.menuGeneral()
		})
	}
	
	method menuGeneral(){
		
		self.removeVisuals()
		self.addVisuals()
		
		game.addVisual(opcion1)
		game.addVisual(opcion2)
		game.addVisual(opcion3)
		game.addVisual(titulo)
		
		keyboard.enter().onPressDo({flechita.seleccionarOpcionMenu()})
		
	}
	
	method menuInstrucciones(){
		
		self.removeVisuals()
		self.addVisuals()
		game.addVisual(instrucciones)
		game.addVisual(exitInstrucciones)
		
		keyboard.enter().onPressDo({flechita.seleccionarOpcionInstrucciones()})
		
	}
	
	
	method menuDeNiveles(){
		
			self.removeVisuals()
			self.addVisuals()
			game.addVisual(titulo)
			game.addVisual(self.level1())
			game.addVisual(self.level2())
			game.addVisual(self.level3())
			
			keyboard.enter().onPressDo({flechita.seleccionarOpcionNivel()})
		
	}
	
	method addVisuals(){		
		game.addVisual(flechita)
		keyboard.down().onPressDo({flechita.cambiarPosicion()})
		keyboard.up().onPressDo({flechita.cambiarPosicionUp()})
	}
	method removeVisuals(){
		game.clear()
	}
	
	
	method configPantalla(){
		game.width(9)
		game.height(9)
		game.cellSize(120)	
		fondo.fondoRotativo()
		game.addVisual(fondo)
		game.boardGround("F0-0000.jpg")
		game.title("operacionOrbita")
	}
	
	
	method configTeclasJuego(){
		keyboard.up().onPressDo({naveActual.arriba()})
		keyboard.down().onPressDo({naveActual.abajo()})
		keyboard.right().onPressDo({naveActual.derecha()})
		keyboard.left().onPressDo({naveActual.izquierda()})
		keyboard.space().onPressDo({naveActual.disparar()})
	}
	
}



object opcion1{
	
	const position= game.at(2,4)
	
	method image() = "instrucciones.png"
	method position() = position
	
	method accion(){		
		configJuego.menuInstrucciones()
	}
	
}

object opcion2{
	
	const position= game.at(2,5)
	
	method image() = "selectLevel.png"
	method position() = position
	
	method accion(){
		configJuego.menuDeNiveles()
	}
	
}

object opcion3{
	
	const position= game.at(2,3)
	
	method image() = "exit.png"
	method position() = position
	
	method accion(){
		game.stop()
	}
	
}

class SelectLevel{
	
	var property position 
	var property image 
	
	method position() = position
	method image()= image
	
	
	method accion(nivel){
		configJuego.removeVisuals()
		configJuego.nivelActual(nivel)
		nivel.inicarNivel()
		configJuego.limites()
	}
	
	
}

object instrucciones{
	var property position = game.at(3,4)
	var property image = "instrucciones.png"
	
	method position() = position
	method image()= image
	
	
}

object titulo{
	const  position = game.at(1,6)
	const  image = "operacionOrbita.png"
	
	method position() = position
	method image()= image
}


object exitInstrucciones{
	var property position = game.at(3,5)
	var property image = "exit.png"
	
	method position() = position
	method image()= image
	
	method accion(){
		configJuego.menuGeneral()
	}
}

object flechita{
	
	var property position = game.at(2, 5)
	
	method position() = position
	
	method image() = "flechaSeleccionadora.png"
	
	method cambiarPosicion(){
		if(position.y()<=3){
			position = game.at(position.x(), 5)
		}else{
			position = game.at(position.x(), position.y()-1)
		}
	}
	
	method cambiarPosicionUp(){
		if(position.y()>=5){
			position = game.at(position.x(), 3)
		}else{
			position = game.at(position.x(), position.y()+1)
		}
	}
	
	method seleccionarOpcionMenu(){
		if(position.y()==5){
			opcion2.accion()
		}
		else if(position.y()==4){
			//position = game.at(3,5)
			opcion1.accion()
		}
		else{
			opcion3.accion()
		}
	}
	
	method seleccionarOpcionNivel(){
		if(position.y()==5){
			configJuego.level1().accion(nivel1)
		}
		else if(position.y()==4){
			//game.stop()
			configJuego.level2().accion(nivel2)
		}
		else{
			configJuego.level3().accion(nivel3)
		}
	}
	
	method seleccionarOpcionInstrucciones(){
		if(self.position().y()==5){
			exitInstrucciones.accion()
		}
	}
	

}

object portada{
	
	var property position = game.at(2,2)
	var property image = "portada.png"
	
	method position() = position
	method image()= image
	
}

object youWin{
	
	var property position = game.at(1,4)
	var property image = "youWin.png"
	
	method position() = position
	method image()= image
	
	
}

object puntajeFinal{
	var property position = game.at(2,3)
	var property image = "puntaje.png"
	
	method position() = position
	method image()= image
}

object numeroPuntajeFinal{
	
	const listaNumeros = ["0.png","100.png","200.png","300.png","400.png","500.png","600.png","700.png","800.png","900.png","1000.png","1200.png","1300.png","1400.png","1500.png","1600.png","1700.png","1800.png"]
	
	const position = game.at(5,3)

	method position() = position
	method image()= listaNumeros.get(configJuego.nivelActual().puntaje())
	
}

object gameOver{
	
	var property position = game.at(1,4)
	var property image = "gameOver.png"
	
	method position() = position
	method image()= image
	
}

object pressSpaceToContinue{
	
	var property position = game.at(3, 1)
	var property image = "pressSpaceToContinue.png"
	
	method position() = position
	method image()= image
		
}

object finalPartida{
	
	method controlNivel(nivel){
		
		if(nivel.CantidadEnemigos()==configJuego.contadorDeMuertes()){ // nivel.CantidadEnemigos() me da la cantidad de enemidos segun el nivel
			self.ganar()
		} 
	}
	
	method ganar(){
		configJuego.contadorDeMuertes(0)
		game.clear()
		game.addVisual(youWin)
		game.addVisual(puntajeFinal)
		game.addVisual(numeroPuntajeFinal)
		//game.schedule(2000,{self.volverAMenu()})
		game.schedule(4000,{configJuego.menuGeneral()})
		/*game.addVisual(pressSpaceToContinue)
		keyboard.space().onPressDo({
			configJuego.menuGeneral()
		})*/
		
	}
	
	method perder(){
		game.clear()
		game.addVisual(gameOver)
		//game.addVisual(pressSpaceToContinue)
		game.addVisual(puntajeFinal)
		game.addVisual(numeroPuntajeFinal)
		game.schedule(4000,{configJuego.menuGeneral()})
		/*keyboard.space().onPressDo({
			configJuego.menuGeneral()
		})
		*/
	}
}

object fondo{
	var position = game.center()
	var listaFondos = ["F0-0000.png","F1-0000.png","F2-0000.png","F3-0000.png","F4-0000.png","F5-0000.png","F6-0000.png","F7-0000.png","F8-0000.png","F9-0000.png","F10-0000.png","F11-0000.png","F12-0000.png","F13-0000.png","F14-0000.png","F15-0000.png","F16-0000.png"]
	var lugar = 0
	
	
	method fondoRotativo(){
		if(lugar != 16){
			lugar = lugar + 1
		}else{
			lugar = 0
		}
	}
	
	method position() = position
	method image()= listaFondos.get(lugar)
}
