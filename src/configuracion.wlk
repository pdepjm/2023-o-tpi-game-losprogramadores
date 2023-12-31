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
		(2..5).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,8)))}	
		//0 8, 1 8, 6 8, 8 8
		game.addVisual(new ParedInvisible(position= game.at(7,8)))
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(9,n)))}	
		
		game.onCollideDo(naveActual,{chocado => chocado.chocarseConNave()})
	}
	
	method portadaIncio(){
		
		game.addVisual(portada1)
		
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
		game.addVisual(titulo1)
		
		keyboard.enter().onPressDo({flechita.seleccionarOpcionMenu()})
		
	}
	
	method menuInstrucciones(){
		
		self.removeVisuals()
		self.addVisuals()
		game.addVisual(instrucciones1)
		game.addVisual(exitInstrucciones1)
		//game.addVisual(flechita)
		//flechita.position(game.at(2,5)) 
		
		keyboard.enter().onPressDo({flechita.seleccionarOpcionInstrucciones()})
		
	}
	
	
	method menuDeNiveles(){
		
			self.removeVisuals()
			self.addVisuals()
			game.addVisual(titulo1)
			game.addVisual(self.level1())
			game.addVisual(self.level2())
			game.addVisual(self.level3())
			
			keyboard.enter().onPressDo({flechita.seleccionarOpcionNivel()})
		
	}
	
	method addVisuals(){		
		game.addVisual(flechita)
		flechita.position(game.at(2,5))
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

class ObjetosVisuales{
	
	var property position 
	var property image 
	
	method position() = position
	method image()= image
}

const instrucciones1 = new ObjetosVisuales(position=game.at(1,2),image="instruccionesNuevas.jpeg")
const titulo1 = new ObjetosVisuales(position=game.at(1,6),image="operacionOrbita.png")
const exitInstrucciones1 = new ObjetosVisuales(position=game.at(3,5),image="exit.png")
const portada1 = new ObjetosVisuales(position=game.at(2,2),image="portada.png")
const youWin1 = new ObjetosVisuales(position=game.at(1,4),image="youWin.png")
const puntajeFinal1 = new ObjetosVisuales(position=game.at(2,3),image="puntaje.png") 
const gameOver1 = new ObjetosVisuales(position=game.at(1,4),image="gameOver.png")

object instrucciones{
	var property position = game.at(1,2)
	var property image = "instruccionesNuevas.jpeg"
	
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
		game.sound("opcionArcade.wav").play()
		if(position.y()<=3){
			position = game.at(position.x(), 5)
		}else{
			position = game.at(position.x(), position.y()-1)
		}
	}
	
	method cambiarPosicionUp(){
		game.sound("opcionArcade.wav").play()
		if(position.y()>=5){
			position = game.at(position.x(), 3)
		}else{
			position = game.at(position.x(), position.y()+1)
		}
	}
	
	method seleccionarOpcionMenu(){
		if(position.y()==5){
			opcion2.accion()
			//game.sound("nivelElegido.wav")
		}
		else if(position.y()==4){
			//position = game.at(3,5)
			opcion1.accion()
			//game.sound("nivelElegido.wav")
		}
		else{
			opcion3.accion()
			//game.sound("nivelElegido.wav")
		}
	}
	
	method seleccionarOpcionNivel(){
		if(position.y()==5){
			//game.sound("eleccionNivel.wav").play()
			configJuego.level1().accion(nivel1)
		}
		else if(position.y()==4){
			//game.sound("eleccionNivel.wav").play()
			configJuego.level2().accion(nivel2)
		}
		else{
			//game.sound("eleccionNivel.wav").play()
			configJuego.level3().accion(nivel3)
		}
	}
	
	method seleccionarOpcionInstrucciones(){
		if(self.position().y()==5){
			exitInstrucciones.accion()
		}
	}
	

}

object numeroPuntajeFinal{
	
	const listaNumeros = ["0.png","100.png","200.png","300.png","400.png","500.png","600.png","700.png","800.png","900.png","1000.png","1100.png","1200.png","1300.png","1400.png","1500.png","1600.png","1700.png","1800.png"]
	
	const position = game.at(5,3)

	method position() = position
	method image()= listaNumeros.get(configJuego.nivelActual().puntaje())
	
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
		game.addVisual(youWin1)
		//game.addVisual(pressSpaceToContinue)
		game.addVisual(puntajeFinal1)
		game.addVisual(numeroPuntajeFinal)
		game.sound("youWin.wav").play()
		game.schedule(3000,{
			configJuego.menuGeneral()
		}
			
		)
		/*keyboard.space().onPressDo({
			configJuego.menuGeneral()
		})*/
		
	}
	
	method perder(){
		game.clear()
		game.addVisual(gameOver1)
		//game.addVisual(pressSpaceToContinue)
		game.schedule(2000,{configJuego.menuGeneral()})
		game.addVisual(puntajeFinal1)
		game.addVisual(numeroPuntajeFinal)
		game.sound("gameOver.wav").play()
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
