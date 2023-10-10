import wollok.game.*
import nave.*
import colisionables.*


object config_juego {
	
	method iniciar(){
		self.configPantalla()
		self.configTeclas()
		self.addVisuals()
		self.limites()
		game.start()
		
	}
	
	method addVisuals(){
		game.addVisual(nave_actual)
		nave_actual.imageRotativa()
		game.addVisual(paredInvisible)
	}
	
	method configPantalla(){
		game.width(15)
		game.height(15)
		game.cellSize(50)	
		game.boardGround("fondoEspacio.png")
		game.title("nombreJuegoxd")
	}
	
	method configTeclas(){
		keyboard.up().onPressDo({nave_actual.arriba()})
		keyboard.down().onPressDo({nave_actual.abajo()})
		keyboard.right().onPressDo({nave_actual.derecha()})
		keyboard.left().onPressDo({nave_actual.izquierda()})
	}
	
	method limites(){
		game.onCollideDo(nave_actual,{chocado => chocado.chocarseConNave()})
		
	}
	
}
