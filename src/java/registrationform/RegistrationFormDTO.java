/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registrationform;

/**
 *
 * @author anh12
 */
public class RegistrationFormDTO {

    private int registrationFormID;
    private int tournamentID;
    private int accountID;
    private int birdID;
    private String location;
    private int fee;
    private int formStatus;
    private String image;
    private String tournamentName;
    private String dateTime;
    private String tournamentStatus;
    private String prize;
    private int numberOfPlayer;
    private String sponsor;

    public RegistrationFormDTO() {
    }

    public RegistrationFormDTO(int tournamentID, String location, int fee, String tournamentStatus, String image, String tournamentName, String dateTime) {
        this.tournamentID = tournamentID;
        this.location = location;
        this.fee = fee;
        this.tournamentStatus = tournamentStatus;
        this.image = image;
        this.tournamentName = tournamentName;
        this.dateTime = dateTime;
    }

    public RegistrationFormDTO(int tournamentID, String image, String tournamentName, String tournamentStatus, String dateTime, String location, int fee, String prize, int numberOfPlayer, String sponsor) {
        this.tournamentID = tournamentID;
        this.image = image;
        this.tournamentName = tournamentName;
        this.tournamentStatus = tournamentStatus;
        this.dateTime = dateTime;
        this.location = location;
        this.fee = fee;
        this.prize = prize;
        this.numberOfPlayer = numberOfPlayer;
        this.sponsor = sponsor;
    }

    public RegistrationFormDTO(int registrationFormID, int tournamentID, int accountID, int birdID, String location, int fee, int formStatus, String image, String tournamentName, String dateTime, String tournamentStatus, String prize, int numberOfPlayer, String sponsor) {
        this.registrationFormID = registrationFormID;
        this.tournamentID = tournamentID;
        this.accountID = accountID;
        this.birdID = birdID;
        this.location = location;
        this.fee = fee;
        this.formStatus = formStatus;
        this.image = image;
        this.tournamentName = tournamentName;
        this.dateTime = dateTime;
        this.tournamentStatus = tournamentStatus;
        this.prize = prize;
        this.numberOfPlayer = numberOfPlayer;
        this.sponsor = sponsor;
    }

    public RegistrationFormDTO(int tournamentID, int accountID, int birdID, String location, int fee, int formStatus) {
        this.tournamentID = tournamentID;
        this.accountID = accountID;
        this.birdID = birdID;
        this.location = location;
        this.fee = fee;
        this.formStatus = formStatus;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    public int getNumberOfPlayer() {
        return numberOfPlayer;
    }

    public void setNumberOfPlayer(int numberOfPlayer) {
        this.numberOfPlayer = numberOfPlayer;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getTournamentStatus() {
        return tournamentStatus;
    }

    public void setTournamentStatus(String tournamentStatus) {
        this.tournamentStatus = tournamentStatus;
    }

    public int getRegistrationFormID() {
        return registrationFormID;
    }

    public void setRegistrationFormID(int registrationFormID) {
        this.registrationFormID = registrationFormID;
    }

    public int getTournamentID() {
        return tournamentID;
    }

    public void setTournamentID(int tournamentID) {
        this.tournamentID = tournamentID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getBirdID() {
        return birdID;
    }

    public void setBirdID(int birdID) {
        this.birdID = birdID;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getFormStatus() {
        return formStatus;
    }

    public void setFormStatus(int formStatus) {
        this.formStatus = formStatus;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTournamentName() {
        return tournamentName;
    }

    public void setTournamentName(String tournamentName) {
        this.tournamentName = tournamentName;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

}
