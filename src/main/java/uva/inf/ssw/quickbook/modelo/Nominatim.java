package uva.inf.ssw.quickbook.modelo;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Nominatim {

    public double[] consultarCoordenadas(String direccion) {
        // URL de la consulta
        String url = "https://nominatim.openstreetmap.org/search?q="
                + direccion.replaceAll(" ", "+")
                + "&format=json&addressdetails=1&limit=1";

        StringBuilder response = null;
        try {
            // Conexión HTTP
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            response = new StringBuilder();
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();
        } catch (IOException ex) {
            Logger.getLogger(Nominatim.class.getName()).log(Level.SEVERE, null, ex);
        }

        Gson gson = new GsonBuilder().create();
        double[] coordenadas = new double[2];

        if (response != null) {
            NominatimResultado[] results = gson.fromJson(response.toString(), NominatimResultado[].class);

            if (results.length > 0) {
                NominatimResultado r = results[0];
                coordenadas[0] = Double.parseDouble(r.lat);
                coordenadas[1] = Double.parseDouble(r.lon);
            }
        }

        return coordenadas;
    }

    // Clase auxiliar para representar los resultados de Nominatim
    private static class NominatimResultado {

        String lat;
        String lon;

    }

}
