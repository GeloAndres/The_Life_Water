package proyecto.agua.services;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import java.io.IOException;
import java.util.List;

public class DirectionsService {
    private static final String API_KEY = "AIzaSyBOVKxcsbPdCWJTg0r_Cm7cu7H46m2AkhM";
    private static final String BASE_URL = "https://maps.googleapis.com/maps/api/directions/json?";

    public static void main(String[] args) throws IOException {
        OkHttpClient client = new OkHttpClient();

        // Coordenadas del origen (por ejemplo, almacén o ubicación inicial del repartidor)
        String origin = "-33.551469,-70.793935"; // Ejemplo: San Francisco

        // Coordenadas de los clientes (sin especificar un destino final)
        List<String> waypoints = List.of(
                "-33.47983,-70.74833", // Casa Marcelo
                "-33.47299,-70.75128", // Casa Luis
                "-33.48763,-70.76511"  // Casa Gelo
        );

        // Construir la URL de la solicitud (con optimización de waypoints)
        String waypointsParam = String.join("|", waypoints);
        String url = BASE_URL + "origin=" + origin + "&destination=" + waypoints.get(waypoints.size() - 1)
                + "&waypoints=optimize:true|" + waypointsParam + "&key=" + API_KEY;

        // Crear solicitud HTTP
        Request request = new Request.Builder()
                .url(url)
                .build();

        // Hacer la solicitud y obtener la respuesta
        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                String jsonResponse = response.body().string();
                System.out.println(jsonResponse);
            } else {
                System.out.println("Error en la solicitud: " + response.message());
            }
        }
    }
}
