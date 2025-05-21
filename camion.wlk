import cosas.*

object camion {
	const tara = 1000

	const property cosas = #{}
		
	method cargar(cosa) {
		cosas.add(cosa)
	}

	method descargar(cosa) {
	   cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.contains({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso () {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return self.objetosMasPeligrososQue(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelDePeligrosidad) {
		return !self.excedidoDePeso() && !self.superaNivelDePeligrosidad(nivelDePeligrosidad)
	}

	method superaNivelDePeligrosidad(nivelDePeligrosidad) {
		return cosas.any({ cosa => cosa.nivelPeligrosidad() > nivelDePeligrosidad})
	}

	   
}
