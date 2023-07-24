package main.servlet;

import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import main.model.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@WebServlet(urlPatterns = {"/games"})
public class GameServlet extends HttpServlet {
    static Logger LOGGER = LogManager.getLogger(GameServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        URI uri = null;
        String id = req.getParameter("id");
        String platform = req.getParameter("platform");
        String sort_by = req.getParameter("sort-by");
        if (id != null) {
            try {
                uri = new URI("https://www.freetogame.com/api/game?id=" + id);
                viewGamePage(req, resp, uri);
                LOGGER.info("The game with id " + id + " was created");
            } catch (URISyntaxException e) {
                LOGGER.debug(e);
            }
        } else if (platform != null) {
            try {
                uri = new URI("https://www.freetogame.com/api/games?platform=" + platform);
                listGames(req, resp, uri);
                LOGGER.info("The games on the platform " + platform + " were listed");
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                uri = new URI("https://www.freetogame.com/api/games");
                listGames(req, resp, uri);
                LOGGER.info("The games were listed");
            } catch (URISyntaxException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void listGames (HttpServletRequest req, HttpServletResponse resp, URI uri) throws ServletException, IOException {
        HttpRequest request = null;
        request = HttpRequest.newBuilder()
                .uri(uri)
                .GET()
                .build();

        HttpResponse<String> response = null;
            try {
                response = HttpClient.newBuilder()
                        .build()
                        .send(request, HttpResponse.BodyHandlers.ofString());
            } catch (InterruptedException e) {
                LOGGER.debug(e);
            }

            Game[] games = new Gson().fromJson(response.body(), Game[].class);

            req.setAttribute("games", games);
            req.getRequestDispatcher("/jsps/list.jsp").forward(req, resp);
    }

    private void viewGamePage (HttpServletRequest req, HttpServletResponse resp, URI uri) throws ServletException, IOException {
        HttpRequest request = HttpRequest.newBuilder()
                    .uri(uri)
                    .GET()
                    .build();

        HttpResponse<String> response = null;
        try {
            response = HttpClient.newBuilder()
                    .build()
                    .send(request, HttpResponse.BodyHandlers.ofString());
        } catch (InterruptedException e) {
            LOGGER.debug(e);
        }

        Game game = new Gson().fromJson(response.body(), Game.class);
        System.out.printf(game.getTitle());
        req.setAttribute("game", game);
        req.getRequestDispatcher("/jsps/gamePage.jsp").forward(req, resp);
    }
}
