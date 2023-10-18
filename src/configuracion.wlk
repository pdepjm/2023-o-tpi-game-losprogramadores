import wollok.game.*
import nave.*
import colisionables.*


object config_juego {

	//var fondo = ["F0-0000.jpg","F1-0000.jpg","F2-0000.jpg","F3-0000.jpg"]
	//var lugar = 0
	
	method iniciar(){
		self.configPantalla()
		self.configTeclas()
		self.addVisuals()
		self.limites()
		game.start()
	}
	method limites(){
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(-1,n)))}		
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,-1)))}
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(n,9)))}	
		(0..9).forEach{n => game.addVisual(new ParedInvisible(position= game.at(9,n)))}	
			
		//const nuevoLimite = new ParedInvisible(position = game.at(4,4))
		game.onCollideDo(nave_actual,{chocado => chocado.chocarseConNave()})
	}
	
	method addVisuals(){		
		game.addVisual(nave_actual)
		//nave_actual.imageRotativa()
		const naveEnemiga1 = new NaveEnemiga(position = game.at(8,7))
		game.addVisual(naveEnemiga1)
		//naveEnemiga1.seguir()
		
		
	}
	
	method configPantalla(){
		game.width(9)
		game.height(9)
		game.cellSize(120)	
		game.boardGround("fondoEspacio.png")
		//self.avanceFondo()
		game.title("nombreJuegoxd")
	}
	
	method configTeclas(){
		keyboard.up().onPressDo({nave_actual.arriba()})
		keyboard.down().onPressDo({nave_actual.abajo()})
		keyboard.right().onPressDo({nave_actual.derecha()})
		keyboard.left().onPressDo({nave_actual.izquierda()})
		keyboard.space().onPressDo({nave_actual.disparar()})
	}
	/* 
	
	method avanceFondo(){
		game.boardGround(fondo.get(lugar))
	}
	
	method imageRotativa(){
		game.onTick(400,"movimientoFondo",{self.lugarImagen()})
		
	}
	
	method lugarImagen(){
		if(lugar == 3){
				lugar = 0
			}else{
				lugar++
			}
		}
	
	 */
}


