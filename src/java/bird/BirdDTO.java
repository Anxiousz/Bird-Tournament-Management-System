/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bird;

/**
 *
 * @author anh12
 */
public class BirdDTO {

    private int birdID;
    private int accountID;
    private String birdName;
    private String birdPhoto;
    private String height;
    private String weight;
    private String color;
    private int birdStatus;
    private String identity;
    private String description;
    private String medals;
    private int totalScore;
    private int top;

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, int birdStatus, String identity, String description, String medals, int totalScore, int top) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.birdStatus = birdStatus;
        this.identity = identity;
        this.description = description;
        this.medals = medals;
        this.totalScore = totalScore;
        this.top = top;
    }

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, String identity, int birdStatus) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.identity = identity;
        this.birdStatus = birdStatus;
    }

    public BirdDTO(int birdID) {
        this.birdID = birdID;
    }

    public BirdDTO() {

    }

    public BirdDTO(String birdName, String height, String weight, String color, int birdStatus, int totalScore, String birdPhoto) {
        this.birdName = birdName;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.birdStatus = birdStatus;
        this.totalScore = totalScore;
        this.birdPhoto = birdPhoto;
    }

    public BirdDTO(String birdName) {
        this.birdName = birdName;
    }

    public int getBirdID() {
        return birdID;
    }

    public void setBirdID(int birdID) {
        this.birdID = birdID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getBirdName() {
        return birdName;
    }

    public void setBirdName(String birdName) {
        this.birdName = birdName;
    }

    public String getBirdPhoto() {
        return birdPhoto;
    }

    public void setBirdPhoto(String birdPhoto) {
        this.birdPhoto = birdPhoto;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getBirdStatus() {
        return birdStatus;
    }

    public void setBirdStatus(int birdStatus) {
        this.birdStatus = birdStatus;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMedals() {
        return medals;
    }

    public void setMedals(String medals) {
        this.medals = medals;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    @Override
    public String toString() {
        return "BirdDTO{" + "birdID=" + birdID + ", accountID=" + accountID + ", birdName=" + birdName + ", birdPhoto=" + birdPhoto + ", height=" + height + ", weight=" + weight + ", color=" + color + ", birdStatus=" + birdStatus + ", identity=" + identity + ", description=" + description + ", medals=" + medals + ", totalScore=" + totalScore + ", top=" + top + '}';
    }

}
