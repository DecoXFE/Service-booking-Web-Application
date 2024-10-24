package uva.inf.ssw.quickbook.modelo;

import java.io.Serializable;

public class Direccion implements Serializable {

    private final String direccion;
    private double[] coordenadas;

    public Direccion() {
        direccion = null;
        coordenadas = null;
    }

    public Direccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDireccion() {
        return direccion;
    }

    public double[] getCoordenadas() {
        if (coordenadas == null) {
            Nominatim nominatim = new Nominatim();
            coordenadas = nominatim.consultarCoordenadas(direccion);
        }
        return coordenadas;
    }

    /**
     * Calcula la distancia entre dos coordenadas geográficas en metros.
     *
     * @param otraDireccion La otra dirección respecto a la que se quiero
     * calcular la distancia.
     * @return Distancia en metros.
     */
    public int getDistancia(Direccion otraDireccion) {
        // Fuente: https://donnierock.com/2015/03/16/calculando-la-distancia-entre-doos-coordenadas-en-java/

        coordenadas = getCoordenadas();
        double latitud1 = coordenadas[0];
        double longitud1 = coordenadas[1];

        double[] otrasCoordenadas = otraDireccion.getCoordenadas();
        double latitud2 = otrasCoordenadas[0];
        double longitud2 = otrasCoordenadas[1];

        double radioTierra = 6371;

        double dLatitud = Math.toRadians(latitud2 - latitud1);
        double dLongitud = Math.toRadians(longitud2 - longitud1);
        double sindLatitud = Math.sin(dLatitud / 2);
        double sindLongitud = Math.sin(dLongitud / 2);

        double va1 = Math.pow(sindLatitud, 2) + Math.pow(sindLongitud, 2)
                * Math.cos(Math.toRadians(latitud1)) * Math.cos(Math.toRadians(latitud2));
        double va2 = 2 * Math.atan2(Math.sqrt(va1), Math.sqrt(1 - va1));

        double distanciaDec = radioTierra * va2 * 1000;

        return (int) distanciaDec;
    }

}
