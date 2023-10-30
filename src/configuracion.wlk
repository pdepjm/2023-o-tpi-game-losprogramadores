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
		
		keyboard.any().onPressDo({
			self.removeVisuals()
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
	
	method removeVisuals(){
		game.clear()
	}
	
	method addVisuals(){		
		game.addVisual(flechita)
		keyboard.down().onPressDo({flechita.cambiarPosicion()})
	}
	
	method configPantalla(){
		game.width(9)
		game.height(9)
		game.cellSize(120)	
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

object gameOver{
	
	var property position = game.at(1,4)
	var property image = "gameOver.png"
	
	method position() = position
	method image()= image
	
}



object finalPartida{
	
	method controlNivel(nivel,contadorDeMuertesEnemigas){
		if(nivel.CantidadEnemigos()==contadorDeMuertesEnemigas){ // nivel.CantidadEnemigos() me da la cantidad de enemidos segun el nivel
			self.ganar(nivel1.puntaje())
		} 
		
	}
	
	method ganar(puntaje){
		configJuego.contadorDeMuertes(0)
		game.clear()
		game.addVisual(youWin)
		keyboard.any().onPressDo({
			configJuego.removeVisuals()
			configJuego.menuGeneral()
		})
		
		//ganado.addVisual()
		//agragar la cant de puntos en pantalla
	}
	
	method perder(){
		game.clear()
		game.addVisual(gameOver)
		keyboard.any().onPressDo({
			configJuego.removeVisuals()
			configJuego.menuGeneral()
		})
		
		//
		//debe volver al menu
	}
}
