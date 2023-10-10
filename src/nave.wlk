import wollok.game.*


object nave_actual {
	
	// luego un properyNave
	//const image = "nave.png"
	var lugar = 0
	var position = game.origin()
	var anterior 
	
	const listaImagenes = ["0.png","1.png","2.png"]
	
	method imageRotativa(){
		game.onTick(400,"movimientoNave",{self.lugarImagen()})
		
	}
	method darImagen(lugar1){
		return listaImagenes.get(lugar1)
	}
	
	method lugarImagen(){
		if(lugar == 2){
				lugar = 0
			}else{
				lugar++
			}
		}
		
    method image() = listaImagenes.get(lugar)
 
 //esto desp se cambia tengamos otras naves
 
	method hablar(){
		
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
