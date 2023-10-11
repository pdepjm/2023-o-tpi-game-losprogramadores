import wollok.game.*
import nave.*
import configuracion.*



object paredInvisible {
	
	var position = game.center()
	
	method position() = position 
	
	method image() = "limite.png"
	
	method chocarseConNave(){
		nave_actual.rebotar()
	}
}



