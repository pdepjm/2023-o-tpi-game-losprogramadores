import wollok.game.*
import nave.*
import configuracion.*



class ParedInvisible {
	
	var position 
	
	method position() = position 
	
	method image() = "0.png"
	
	method chocarseConNave(){
		nave_actual.rebotar()
	}
}

class Bala{
	var positionBala
	
	method position() = positionBala
	
	method image() = "disparo.png"
	
	
	method avanzar(){
		game.onTick(200,"movimientoBala",{self.moverseHaciaArrba()})
	}
	method moverseHaciaArrba() {
		 positionBala = positionBala.up(1)
	}
	
	
	
	method chocarseConNave(){
		nave_actual.restarVida()
	}
}


class NaveEnemiga{
	var position 
	
	method position() = position 
	
	method image() = "0.png"
	
}


