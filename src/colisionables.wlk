import wollok.game.*
import nave.*
import configuracion.*
import direcciones.*



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
	const listaImagenes = ["Disparo_up.png","Disparo_down.png","Disparo_left.png","Disparo_right.png"]
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
	
	method avanzar(direccion){
		game.onTick(50,"movimientoBala",{direccion.moverA(self)})
		self.imagenDireccionada(direccion)
	}
	
	method imagenDireccionada(direccion){
		if(nave_actual.direccion() == up){
 			lugar = 0
 		}else if(nave_actual.direccion() == down){
 			lugar = 1 
 		}else if (nave_actual.direccion() == left){
 			lugar = 2
 		}else if(nave_actual.direccion() == right){
 			lugar = 3
 
 		}
	}
	
	/*
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
	* 
	*/

	
	
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
 		self.avanzar(bala)
 		bala.objetivoAlcanzado()
	}
	
	//esta bien esto?
	
	method avanzar(objeto){
		game.onTick(50,"movimientoBala",{down.moverA(objeto)})
	}
	/* 
	method disparoEnemigoTeledirijido(){
		const bala = new Bala(positionBala = position.down(1))
 		game.addVisual(bala)
 		//bala.avanzar(self)
 		// usar mismo sistema que en el seguir(), pero solo una componente, x o y
 		bala.objetivoAlcanzado()
	}
	* 
	*/
	
	
	method atacar(){
		game.onTick(2000,"disparoEnemigo",{self.disparoEnemigo()})
	}
	
	
	method seguir(){
		position = anterior
		self.ubicacionGeneral()
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
	
	method ubicacionGeneral(){
		game.onTick(700,"movimientoBala",{self.obetenerUbicacionXY()})
	}
	
	method obetenerUbicacionXY() {
			self.seguirAvanzandoX(nave_actual.position().x()-self.position().x())
			self.seguirAvanzandoY(nave_actual.position().y()-self.position().y())
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



