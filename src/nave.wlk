import wollok.game.*
import colisionables.*
import direcciones.*



object nave_actual {
	
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
 	
 	//esto desp se cambia tengamos otras naves
 	
 	method disparar(){
 		const bala = new Bala(positionBala = position)
 		game.addVisual(bala)
 		bala.avanzar(direccion)
 		
 		
 		// como hacer para 
 		//direccion.moverA(bala)
		//bala.moverA(direccion)
 		/*if(lugar == 0){
 			bala.imagen_Up()
 			bala.position(position.up(1))
 		}else if(lugar == 1){
 			bala.imagen_Down()
 			bala.position(position.down(1))
 		}else if (lugar == 2){
 			bala.imagen_Left()
 			bala.position(position.left(1))
 		}else if(lugar == 3){
 			bala.imagen_Right()
 			bala.position(position.right(1))
 		}
 		bala.avanzar(self)
 		bala.objetivoAlcanzado()
 	*/
 	}
 	
	method recibirDisparo(){
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
