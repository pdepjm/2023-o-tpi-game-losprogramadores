import wollok.game.*
import nave.*
import colisionables.*


object configJuego {

	//var fondo = ["F0-0000.jpg","F1-0000.jpg","F2-0000.jpg","F3-0000.jpg"]
	//var lugar = 0
	
	method iniciar(){
		
		self.configPantalla()
		self.comenzarJuego()
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
	
	method comenzarJuego(){
				
		
		game.addVisual(opcion1)
		game.addVisual(opcion2)
		game.addVisual(opcion3)
		game.addVisual(flechita)
		
		keyboard.i().onPressDo({flechita.cambiarPosicion()})
		keyboard.enter().onPressDo({
			
			flechita.seleccionarOpcion()
			game.removeVisual(opcion1)
			game.removeVisual(opcion2)
			game.removeVisual(opcion3)
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
		//naveEnemiga2.seguir()
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
		configJuego.addVisuals()
		configJuego.limites()
		configJuego.configTeclasJuego()
	}
	
	
}

object opcion2{
	const position= game.at(3,4)
	method image() = "selectLevel.png"
	method position() = position
	
	method accion(){
		configJuego.addVisuals()
		configJuego.limites()
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

object flechita{
	
	var position = game.at(opcion1.position().x() - 1, opcion1.position().y())
	
	method position() = position
	
	method image() = "flechaSeleccionadora.png"
	
	method cambiarPosicion(){
		if(position.y()<=3){
			position = game.at(position.x(), 5)
		}else{
			position = game.at(position.x(), position.y()-1)
		}
	}
	
	method seleccionarOpcion(){
		if(position.y()==5){
			opcion1.accion()
		}
		else if(position.y()==4){
			opcion2.accion()
		}
		else{
			opcion3.accion()
		}
	}
	
	
}

