import wollok.game.*
import nave.*
import colisionables.*
import niveles.*


object configJuego {

	//var fondo = ["F0-0000.jpg","F1-0000.jpg","F2-0000.jpg","F3-0000.jpg"]
	//var lugar = 0
	
	var property contadorDeMuertes = 0
	var property nivelActual
	const level1 = new SelectLevel(position=game.at(3,5), image="gameStart.png")
	const level2 = new SelectLevel(position=game.at(3,4), image="gameStart.png")
	const level3 = new SelectLevel(position=game.at(3,3), image="gameStart.png")
	
	method level1() = level1
	method level2() = level2
	method level3() = level3
	
	
	method sumarMuerte(){
		contadorDeMuertes = contadorDeMuertes + 1
	}
	
	method contadorDeMuertes() = contadorDeMuertes

	
	method iniciar(){
		
		self.configPantalla()
		self.menuGeneral()
		//self.addVisuals()
		//self.limites()
		game.start()
	}
	
	method limites(){
		
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(-1,n)))}		
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,-1)))}
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,9)))}	
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(9,n)))}	
		
		game.onCollideDo(naveActual,{chocado => chocado.chocarseConNave()})
		//game.onCollideDO()
		//const nuevoLimite = new ParedInvisible(position = game.at(4,4))
	}
	
	method menuGeneral(){
		
		game.addVisual(opcion1)
		game.addVisual(opcion2)
		game.addVisual(opcion3)
		game.addVisual(flechita)
		
		keyboard.i().onPressDo({flechita.cambiarPosicion()})
		keyboard.c().onPressDo({flechita.seleccionarOpcionMenu()})
		
	}
	
	method menuDeNiveles(){
		
			game.removeVisual(opcion1)
			game.removeVisual(opcion2)
			game.removeVisual(opcion3)
			game.addVisual(self.level1())
			game.addVisual(self.level2())
			game.addVisual(self.level3())
			
			keyboard.enter().onPressDo({
				flechita.seleccionarOpcionNivel()
				game.removeVisual(self.level1())
				game.removeVisual(self.level2())
				game.removeVisual(self.level3())
				game.removeVisual(flechita)
			})
		
	}
	
	method addVisuals(){		
		
		game.addVisual(naveActual)
		const naveEnemiga1 = new NaveEnemiga(position = game.at(8,7), anterior = game.at(8,7),id = 0, atacante = false)
		const naveEnemiga2 = new NaveEnemiga(position = game.at(6,2), anterior = game.at(9,9), id = 1,atacante = false)
		game.addVisual(naveEnemiga1)
		game.addVisual(naveEnemiga2)
		naveEnemiga2.colisionables()
		naveEnemiga1.colisionables()
		naveEnemiga1.atacar()
		naveEnemiga2.seguir()
		//naveActual.imageRotativa()
		
		
	}
	
	method configPantalla(){
		game.width(9)
		game.height(9)
		game.cellSize(120)	
		game.boardGround("F0-0000.jpg")
		game.title("nombreJuegoxd")
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
	const position= game.at(3,5)
	method image() = "gameStart.png"
	method position() = position
	
	method accion(){
		//configJuego.addVisuals() // del propio nivel
		//configJuego.configTeclasJuego() // del propio nivel
		/// seria manejandolo del nivel
		
		game.removeVisual(self)
		game.removeVisual(opcion2)
		game.removeVisual(opcion3)
		game.removeVisual(flechita)
		configJuego.nivelActual(nivel1)
		nivel1.inicarNivel()
		configJuego.limites()
	}
	
	
}

object opcion2{
	const position= game.at(3,4)
	
	
	method image() = "selectLevel.png"
	method position() = position
	
	method accion(){
		configJuego.menuDeNiveles()
	}
	
}

object opcion3{
	const position= game.at(3,3)
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
		configJuego.nivelActual(nivel)
		nivel.inicarNivel()
		configJuego.limites()
	}
	
	
}


object flechita{
	
	var position = game.at(2, 5)
	
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
			opcion1.accion()
		}
		else if(position.y()==4){
			//position = game.at(3,5)
			opcion2.accion()
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
			game.stop()
		}
		else{
			game.stop()
		}
	}
	

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
		configJuego.menuGeneral()
		
		//ganado.addVisual()
		//agragar la cant de puntos en pantalla
	}
	
	method perder(){
		game.clear()
		configJuego.menuGeneral()
		
		//
		//debe volver al menu
	}
}

/* 
object ganado{
	
	method image() = "youWin.png"
	
	method position() = game.center()
}

 */
