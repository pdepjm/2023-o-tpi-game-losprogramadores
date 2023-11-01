import wollok.game.*
import nave.*
import configuracion.*
import direcciones.*
import niveles.*



class ParedInvisible {
	
	var position 
	
	method position() = position 
	
	method image() = "limite.png"
	 // cambiar a chocarse con limite, poner un schedule para que luego de un cierto tiempo se haga un deleteVisual(bala)
	 // poner metodo en bala para que no de error
	method chocarseConNave(){
		naveActual.rebotar()
	}
	
	
	
	method chocarConEnemigo(){
		finalPartida.perder()
	}
	
	method recibirDisparo(_){
		
	}
}


class Bala{
	const listaImagenes = ["Disparo_up.png","Disparo_down.png","Disparo_left.png","Disparo_right.png"]
	var property positionBala
	var lugar = 0
	
	const balaEnemiga = false
	
	method balaEnemiga() = balaEnemiga
	
	method position() = positionBala
	
	method position(posicionDeSalida) {
		positionBala = posicionDeSalida
	}
	
	
	
	method posicionDeDisparo(direccion){
		
		self.positionBala(direccion.posicionObejeto(self.position()))
 		
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
	
	method avanzarLateralmente(){
		game.onTick(50,"movimientoBala",{up.moverA(self)})
		self.imagenDireccionada(up)
		self.objetivoAlcanzado()
	
	}
	
	
	
	method imagenDireccionada(direccion){
		
		lugar = direccion.lugar()
		
	}
	

	
	
	method objetivoAlcanzado(){
		game.onCollideDo(self,{chocado => self.chocarseCon(chocado,self)})
	}
	
	method chocarseCon(chocado,objetivoAModificar){
		game.removeVisual(self)
		chocado.recibirDisparo(objetivoAModificar)
		
	}
	
}


class NaveEnemiga{
	
	var property position
	var anterior
	var id 
	var property atacante
	
	
	
	const tiempoDeDisparos = [4000, 6000, 8000]
	
	
	const listaNaves = ["naveEnemiga0.png", "naveEnemiga1.png", "naveEnemiga2.png"]
	
	const imagenDefinida = listaNaves.anyOne()
	
	method id() = id
	
	method inciarComportamientoBasico(){
		self.colisionables()
		self.atacar()
	}
	
	
	method image() = imagenDefinida
	
	method chocarseConNave(){
		
	}
	
	
	
	method avanzarPorTiempo(){
		game.onTick(5000,"avanzarXtiempo"+self.id(),{down.moverA(self)})
	}
	

	
	method morir(){
		game.removeVisual(self)
	}
	
	method recibirDisparo(bala){
		if(not bala.balaEnemiga()){
			self.morir()
		 	if(self.atacante()){ // para saber si hacer el removeOnTick o no. El atacante me dice si me esta disaparando
		 		game.removeTickEvent("disparoEnemigo"+self.id())
			}
		game.sound("ExplosionNave.wav").play()
		configJuego.nivelActual().sumarPuntaje()
		configJuego.sumarMuerte()		
		configJuego.nivelActual().segundaTanda(configJuego.contadorDeMuertes())
		finalPartida.controlNivel(configJuego.nivelActual())
		}
		 
	}
	
	method disparoEnemigo(){
		const bala = new Bala(positionBala = position.down(1), balaEnemiga = true)
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
		game.onTick(tiempoDeDisparos.anyOne(),"disparoEnemigo"+self.id(),{self.disparoEnemigo()})
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
	//corregir para que funcione con direcciones
	//////////////////////////////////////////////////////////////////////



