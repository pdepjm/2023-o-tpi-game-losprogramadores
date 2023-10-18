import wollok.game.*
import nave.*
import configuracion.*



class ParedInvisible {
	
	var position 
	
	method position() = position 
	
	method image() = "0.png"
	 // cambiar a chocarse con limite, poner un schedule para que luego de un cierto tiempo se haga un deleteVisual(bala)
	 // poner metodo en bala para que no de error
	method chocarseConNave(){
		nave_actual.rebotar()
	}
	
	method recibirDisparo(){
		//schedule() para que pare la accion, luego de que el disparo sale de la pared
		//game.schedule(100, {}) 
	}
}

class Bala{
	var positionBala
	
	method position() = positionBala
	
	method image() = "disparo.png"
	
	method recibirDisparo(){
		
	}
	/*
	 
	method terminarMovimiento(){
		self.morir()
	}
	
	method morir(){
		game.removeVisual(self)
	
	}
	 */
	
	method avanzar(disparador){
		if(disparador.atacante()){
			game.onTick(200,"movimientoBala",{self.moverseHaciaAbajo()})
		}else{
			game.onTick(200,"movimientoBala",{self.moverseHaciaArrba()})
		}
		
	}
	method moverseHaciaArrba() {
		 positionBala = positionBala.up(1)
	}
	method moverseHaciaAbajo(){
		positionBala = positionBala.down(1)
	}
	
	method objetivoAlcanzado(){
		game.onCollideDo(self,{chocado => self.chocarseCon(chocado)})
	}
	
	method chocarseCon(chocado){
		chocado.recibirDisparo()
	}
	
	
	
}


class NaveEnemiga{
	
	var position 
	
	method atacante() = true
	
	method position() = position 
	
	method image() = "naveEnemiga.png"
	
	method recibirDisparo(){
		 game.removeVisual(self)
		 game.removeTickEvent("disparoEnemigo")
	}
	
	method disparoEnemigo(){
		const bala = new Bala(positionBala = position.right(1))
 		game.addVisual(bala)
 		bala.avanzar(self)
 		bala.objetivoAlcanzado()
	}
	
	method atacar(){
		game.onTick(2000,"disparoEnemigo",{self.disparoEnemigo()})
		//self.seguir()
	}
	
	method seguir(){
		self.obetenerUbicacionEnX()
		self.obetenerUbicacionEnY()
	}
	
	
	method obetenerUbicacionEnX() {
			game.onTick(400,"avanceEnemigoX",{self.seguirAvanzandoX(nave_actual.position().x()-self.position().x())})
	} 
	method obetenerUbicacionEnY() {
			game.onTick(400,"avanceEnemigoY",{self.seguirAvanzandoY(nave_actual.position().y()-self.position().y())})
	} 
	
	method seguirAvanzandoX(valor){
		var nuevaPos = valor
		if(nuevaPos < 0){
			if(nuevaPos != 0){
				position = position.left(1)
				nuevaPos++
			}
		}else{
			if(nuevaPos != 0){
				position = position.right(1)
				nuevaPos --
			}
	}
	
	//corregir repeticion de codigo
	}
	
	method seguirAvanzandoY(valor){
		var nuevaPos = valor
		if(nuevaPos < 0){
			if(nuevaPos != 0){
				position = position.down(1)
				nuevaPos++
			}
		}else{
			if(nuevaPos != 0){
				position = position.up(1)
				nuevaPos --
			}
		}
	}
	
	
	}



