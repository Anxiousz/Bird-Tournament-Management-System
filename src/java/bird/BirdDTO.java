/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bird;

import achievement.AchievementDTO;
import java.io.Serializable;

/**
 *
 * @author anh12
 */
public class BirdDTO implements Serializable {

    private int birdID;
    private int accountID;
    private String birdName;
    private String birdPhoto;
    private String height;
    private String weight;
    private String color;
    private int categoriesID;
    private String dentification;
    private int birdStatus;
    private AchievementDTO achivement;

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, int birdStatus, String dentification, AchievementDTO achivement) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.birdStatus = birdStatus;
        this.dentification = dentification;
        this.achivement = achivement;
    }

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, String dentification, int birdStatus) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.dentification = dentification;
        this.birdStatus = birdStatus;
    }

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, int categoriesID, String dentification, int birdStatus) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.categoriesID = this.categoriesID;
        this.dentification = dentification;
        this.birdStatus = birdStatus;
    }

    public BirdDTO(String birdName, String height, String weight, String color, int birdStatus, String birdPhoto, AchievementDTO achivement) {
        this.birdName = birdName;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.birdStatus = birdStatus;
        this.birdPhoto = birdPhoto;
        this.achivement = achivement;
    }

    public BirdDTO(int birdID) {
        this.birdID = birdID;
    }

    public BirdDTO(String birdName, String birdPhoto) {
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
    }

    public BirdDTO() {
    }

    public BirdDTO(String birdName, String height, String weight, String color) {
        this.birdName = birdName;
        this.height = height;
        this.weight = weight;
        this.color = color;
    }

    public BirdDTO(int birdID, int accountID, String birdName, String birdPhoto, String height, String weight, String color, int categoriesID, String dentification, int birdStatus, AchievementDTO achivement) {
        this.birdID = birdID;
        this.accountID = accountID;
        this.birdName = birdName;
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.categoriesID = categoriesID;
        this.dentification = dentification;
        this.birdStatus = birdStatus;
        this.achivement = achivement;
    }

    public BirdDTO(String birdPhoto, String birdName, String height, String weight, String color) {
        this.birdPhoto = birdPhoto;
        this.height = height;
        this.weight = weight;
        this.color = color;
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

    public int getCategories() {
        return categoriesID;
    }

    public void setCategories(int categoriesID) {
        this.categoriesID = categoriesID;
    }

    public String getDentification() {
        return dentification;
    }

    public void setDentification(String dentification) {
        this.dentification = dentification;
    }

    public int getBirdStatus() {
        return birdStatus;
    }

    public void setBirdStatus(int birdStatus) {
        this.birdStatus = birdStatus;
    }

    public AchievementDTO getAchivement() {
        return achivement;
    }

    public void setAchivement(AchievementDTO achivement) {
        this.achivement = achivement;
    }

    @Override
    public String toString() {
        return "BirdDTO{" + "birdID=" + birdID + ", accountID=" + accountID + ", birdName=" + birdName + ", birdPhoto=" + birdPhoto + ", height=" + height + ", weight=" + weight + ", color=" + color + ", categoriesID=" + categoriesID + ", dentification=" + dentification + ", birdStatus=" + birdStatus + ", achivement=" + achivement + '}';
    }


}
