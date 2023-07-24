package main.model;

import com.google.gson.annotations.SerializedName;

public class Game {
    private int id;
    private String title;
    private String thumbnail;
    @SerializedName(value = "short_description")
    private String shortDescription;
    @SerializedName(value = "game_url")
    private String gameUrl;
    private String genre;
    private String platform;
    private String publisher;
    private String developer;
    @SerializedName(value = "release_date")
    private String releaseDate;
    @SerializedName(value = "freetogame_profile_url")
    private String freetogameProfileUrl;
    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getGameUrl() {
        return gameUrl;
    }

    public String getGenre() {
        return genre;
    }

    public String getPlatform() {
        return platform;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getDeveloper() {
        return developer;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public String getFreetogameProfileUrl() {
        return freetogameProfileUrl;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Game{");
        sb.append("id=").append(id);
        sb.append(", title='").append(title).append('\'');
        sb.append(", thumbnail='").append(thumbnail).append('\'');
        sb.append(", shortDescription='").append(shortDescription).append('\'');
        sb.append(", gameUrl='").append(gameUrl).append('\'');
        sb.append(", genre='").append(genre).append('\'');
        sb.append(", platform='").append(platform).append('\'');
        sb.append(", publisher='").append(publisher).append('\'');
        sb.append(", developer='").append(developer).append('\'');
        sb.append(", releaseDate='").append(releaseDate).append('\'');
        sb.append(", freetogameProfileUrl='").append(freetogameProfileUrl).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
