import wollok.game.*
import colisionables.*
import direcciones.*
import configuracion.*



object naveActual {
	
	// luego un properyNave
	//const image = "nave.png"
	var vida = 1 // poner contador de vidas en pantalla
	var imagen = 0
	var direccion = up
	var position = game.origin()
	var anterior 
	
	const listaImagenes = ["Nave_UP.png","Nave_DOWN.png","Nave_LEFT.png","Nave_RIGHT.png"]
	
	method direccion() = direccion
	
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
		
    method image() = listaImagenes.get(imagen)

 	method disparar(){
 		const bala = new Bala(positionBala = position, balaEnemiga = false)
 		bala.posicionDeDisparo(direccion)
 		game.addVisual(bala)
 		bala.avanzar(direccion)
 	}
 	
	method recibirDisparo(_){
		vida--
		if(vida==0){
			self.morir()
			finalPartida.perder()
		}
	}
	
	method chocarConEnemigo(){
		self.morir()
	}
	
	method morir(){
		game.removeVisual(self)
	}
	
 
	method position() = position 
	
	method rebotar(){
		position = anterior
	}
	
	method arriba() {
		anterior = position
		position = position.up(1)
		direccion = up
		imagen = 0
	}
	method abajo() {
		anterior = position
		position = position.down(1)
		direccion = down
		imagen = 1
	}
	method izquierda() {
		anterior = position
		position = position.left(1)
		direccion = left
		imagen = 2
	}
	method derecha() {
		anterior = position
		position = position.right(1)
		direccion = right
		imagen = 3
	}
	
}
