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
		naveActual.rebotar()
	}
	
	
	
	method chocarConEnemigo(){
		
	}
	
	method recibirDisparo(objeto){
		game.removeVisual(objeto)
	}
}


class Bala{
	const listaImagenes = ["Disparo_up.png","Disparo_down.png","Disparo_left.png","Disparo_right.png"]
	var property positionBala
	var lugar = 0
	
	method position() = positionBala
	
	method position(posicionDeSalida) {
		positionBala = posicionDeSalida
	}
	
	
	
	method posicionDeDisparo(direccion){
		if(direccion == up) {
 			 self.positionBala(self.position().up(1))
 		}else if(direccion == down) {
 			self.positionBala(self.position().down(1))
 		}else if(direccion == left) {
 			self.positionBala(self.position().left(1))
 		}else if(direccion == right){
 			self.positionBala(self.position().right(1))
 		}
 	}
	
	
	method image() = listaImagenes.get(lugar)
	
	method recibirDisparo(_){
		
	}
	
	method chocarseConNave(){
		
	}
	
	method avanzar(direccion){
		game.onTick(50,"movimientoBala",{direccion.moverA(self)})
		self.imagenDireccionada(direccion)
		self.objetivoAlcanzado()
	}
	
	method imagenDireccionada(direccion){
		// nose si esta bien con el if o se puede hacer mandando mensajes, entiendo que la responsabilidad es de la misma bala
		if(naveActual.direccion() == up){
 			lugar = 0
 		}else if(naveActual.direccion() == down){
 			lugar = 1 
 		}else if (naveActual.direccion() == left){
 			lugar = 2
 		}else if(naveActual.direccion() == right){
 			lugar = 3
 
 		}
	}
	

	
	
	method objetivoAlcanzado(){
		game.onCollideDo(self,{chocado => self.chocarseCon(chocado,self)})
	}
	
	method chocarseCon(chocado,objetivoAModificar){
		chocado.recibirDisparo(objetivoAModificar)
		
	}
	
}


class NaveEnemiga{
	
	var position
	var anterior
	var id 
	var property atacante
	
	method id() = id
	
	
	
	method position() = position 
	
	method image() = "naveEnemiga.png"
	
	method chocarseConNave(){
		
	}
	
	method morir(){
		game.removeVisual(self)
	}
	
	method recibirDisparo(_){
		 self.morir()
		 // razon del error cuando no esta activado el atacar() en configuracion
		 if(self.atacante()){
		 game.removeTickEvent("disparoEnemigo"+self.id())		 	
		 }
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
	*/
	
	
	method atacar(){
		game.onTick(2000,"disparoEnemigo"+self.id(),{self.disparoEnemigo()})
		self.atacante(true)
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
			self.seguirAvanzandoX(naveActual.position().x()-self.position().x())
			self.seguirAvanzandoY(naveActual.position().y()-self.position().y())
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
	
	//corregir para que funcione con direcciones
	//////////////////////////////////////////////////////////////////////
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



