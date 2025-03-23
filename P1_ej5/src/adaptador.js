// Interfaz del cliente
class SistemaMetrico {
    getDistance(){}
}

// Clase que se va a adaptar
class SistemaImperial {
    constructor(distance) {
        this.distance = distance;
    }

    getDistance() {
        return this.distance;
    }
    
}

// Adaptador
class AdaptadorDistancia extends SistemaMetrico{
    constructor(sistemaImperial) {
        super();
        this.sistemaImperial = sistemaImperial;
    }

    getDistance() {
        const miles = this.sistemaImperial.getDistance();
        return miles * 1.60934; // Conversión a kilómetros
    }
}

export { SistemaImperial, AdaptadorDistancia };