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
	
	method chocarConEnemigo(){
		
	}
	
	method recibirDisparo(){
		//schedule() para que pare la accion, luego de que el disparo sale de la pared
		//game.schedule(100, {}) 
	}
}

class Bala{
	const listaImagenes = ["Disparo_UP.png","Disparo_DOWN.png","Disparo_LEFT.png","Disparo_RIGHT.png"]
	var positionBala
	var lugar = 0
	method position() = positionBala
	
	method position(posicionDeSalida) {
		positionBala = posicionDeSalida
	}
	
	method image() = listaImagenes.get(lugar)
	
	method recibirDisparo(){
		
	}
	
	method chocarseConNave(){
		
	}
	
	method avanzar(disparador){
		if(disparador.atacante()){
			game.onTick(200,"movimientoBala",{self.moverseHaciaAbajo()})
		}else{
			if(lugar == 0){
 				game.onTick(50,"movimientoBala",{self.moverseHaciaArrba()})
 			}else if(lugar == 1){
 				game.onTick(50,"movimientoBala",{self.moverseHaciaAbajo()})
 			}else if (lugar == 2){
 				game.onTick(50,"movimientoBala",{self.moverseHaciaIzquierda()})
 			}else if(lugar == 3){
 				game.onTick(50,"movimientoBala",{self.moverseHaciaDerecha()})
 			}
		}
		
	}
	method moverseHaciaArrba() {
		 positionBala = positionBala.up(1)
	}
	
	method moverseHaciaIzquierda(){
		positionBala = positionBala.left(1)
	}
	
	method moverseHaciaDerecha(){
		positionBala = positionBala.right(1)
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
	
	method imagen_Up(){
		lugar = 0
	}
	method imagen_Down(){
		lugar = 1
	}
	method imagen_Left(){
		lugar = 2
	}
	method imagen_Right(){
		lugar = 3
	}
	
	
}


class NaveEnemiga{
	
	var position
	var anterior
	
	method atacante() = true
	
	method position() = position 
	
	method image() = "naveEnemiga.png"
	
	method chocarseConNave(){
		
	}
	
	method morir(){
		game.removeVisual(self)
	}
	
	method recibirDisparo(){
		 self.morir()
		 // razon del error cuando no esta activado el atacar() en configuracion
		 game.removeTickEvent("disparoEnemigo")
	}
	
	method disparoEnemigo(){
		const bala = new Bala(positionBala = position.down(1))
		//
 		game.addVisual(bala)
 		bala.avanzar(self)
 		bala.objetivoAlcanzado()
	}
	
	method disparoEnemigoTeledirijido(){
		const bala = new Bala(positionBala = position.down(1))
 		game.addVisual(bala)
 		bala.avanzar(self)
 		// usar mismo sistema que en el seguir(), pero solo una componente, x o y
 		bala.objetivoAlcanzado()
	}
	
	
	method atacar(){
		game.onTick(2000,"disparoEnemigo",{self.disparoEnemigo()})
	}
	
	
	method seguir(){
		position = anterior
		self.obetenerUbicacionEnX()
		self.obetenerUbicacionEnY()
	}
	
	method colisionables(){
		game.onCollideDo(self,{chocado=>chocado.chocarConEnemigo()})
	}
	
	method chocarConEnemigo(){
		self.rebotar()
	}
	
	method rebotar(){
		position = anterior
	}
	
	
	method obetenerUbicacionEnX() {
			game.onTick(700,"avanceEnemigoX",{self.seguirAvanzandoX(nave_actual.position().x()-self.position().x())})
	} 
	method obetenerUbicacionEnY() {
			game.onTick(700,"avanceEnemigoY",{self.seguirAvanzandoY(nave_actual.position().y()-self.position().y())})
	} 
	//--------------------------------
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



