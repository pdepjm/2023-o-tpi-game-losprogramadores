import wollok.game.*
import colisionables.*
import direcciones.*
import configuracion.*



object naveActual {
	
	// luego un properyNave
	//const image = "nave.png"
	var property vida = 3 // poner contador de vidas en pantalla
	var imagen = 0
	var property direccion = up
	var position = game.origin()//game.at(5,5)
	var anterior 
	const listaImagenes = ["Nave_UP.png","Nave_DOWN.png","Nave_LEFT.png","Nave_RIGHT.png"]
	
	method vidas() = vida
	
	//method direccion() = direccion
	
	method atacante() = false
	/*
	method imageRotativa(){
		game.onTick(400,"movimientoNave",{self.lugarImagen()})
	}
	
	method lugarImagen(){
		if(lugar == 2){
				lugar = 0
			}else{
				lugar++
			}
	}
	*/
		
	method inicializarImagen(){
		imagen = 0
	}
		
	method modifarPosicion(posicionNueva) {
		position = posicionNueva
	}
	
    method image() = listaImagenes.get(imagen)

 	method disparar(){
 		const bala = new Bala(positionBala = position, balaEnemiga = false)
 		bala.posicionDeDisparo(direccion)
 		game.addVisual(bala)
 		bala.avanzar(direccion)
 		//ak desarrollar movimiento lateral
 		
 		
 	}
 	
 	method dispararMovimientoLateral(){
 		const bala = new Bala(positionBala = position, balaEnemiga = false)
 		bala.posicionDeDisparo(up)
 		game.addVisual(bala)
 		bala.avanzarLateralmente()
 	}
 	
	method recibirDisparo(_){
		vida--
		if(vida==0){
			self.morir()
		}
	}
	
	method chocarConEnemigo(){
		self.morir()
	}
	
	method morir(){
		game.removeVisual(self)
		finalPartida.perder()
	}
	
 
	method position() = position 
	
	method rebotar(){
		position = anterior
	}
	
	method arriba() {
		anterior = position
		position = position.up(1)
		direccion = up
		imagen = direccion.lugar()
	}
	method abajo() {
		anterior = position
		position = position.down(1)
		direccion = down
		imagen = direccion.lugar()
	}
	method izquierda() {
		anterior = position
		position = position.left(1)
		direccion = left
		imagen = direccion.lugar()
	}
	method derecha() {
		anterior = position
		position = position.right(1)
		direccion = right
		imagen = direccion.lugar()
	}
	
	// Desplazamiento para movimiento lateral
	
	method izquierdaMoviemientoLateral() {
		anterior = position
		position = position.left(1)
		direccion = left
	}
	method derechaMoviemientoLateral() {
		anterior = position
		position = position.right(1)
		direccion = right
	}
	
}
