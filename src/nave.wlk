import wollok.game.*
import colisionables.*


object nave_actual {
	
	// luego un properyNave
	//const image = "nave.png"
	var vida = 3
	var lugar = 0
	var position = game.origin()
	var anterior 
	
	const listaImagenes = ["0.png","1.png","2.png"]
	
	method imageRotativa(){
		game.onTick(400,"movimientoNave",{self.lugarImagen()})
		
	}
	
	method atacante() = false

	
	method lugarImagen(){
		if(lugar == 2){
				lugar = 0
			}else{
				lugar++
			}
		}
		
    method image() = listaImagenes.get(lugar)
 
 //esto desp se cambia tengamos otras naves
 
 	method disparar(){
 		const bala = new Bala(positionBala = position.right(1).up(3))
 		game.addVisual(bala)
 		bala.avanzar(self)
 		bala.objetivoAlcanzado()
 	}
 	
	method recibirDisparo(){
		vida= vida -1
		if(vida<=0){
			self.morir()
		}
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
	}
	method izquierda() {
		anterior = position
		position = position.left(1)
	}
	method derecha() {
		anterior = position
		position = position.right(1)
	}
	method abajo() {
		anterior = position
		position = position.down(1)
	}
	
}
