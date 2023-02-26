/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tournament;

public class TournamentDTO {

    private int tournamentID;
    private int accountID;
    private String tournamentName;
    private String sponsor;
    private String prize;
    private int numberOfPlayer;
    private String dateTime;
    private int tournamentStatus;
    private int fee;
    private String image;

    public TournamentDTO(int tournamentID, int accountID, String tournamentName, String sponsor, String prize, int numberOfPlayer, String dateTime, int tournamentStatus, int fee, String image) {
        this.tournamentID = tournamentID;
        this.accountID = accountID;
        this.tournamentName = tournamentName;
        this.sponsor = sponsor;
        this.prize = prize;
        this.numberOfPlayer = numberOfPlayer;
        this.dateTime = dateTime;
        this.tournamentStatus = tournamentStatus;
        this.fee = fee;
        this.image = image;
    }

    public TournamentDTO(String tournamentName, String dateTime, int tournamentStatus, int numberOfPlayer, int fee, String prize, String image) {
        this.tournamentName = tournamentName;
        this.dateTime = dateTime;
        this.tournamentStatus = tournamentStatus;
        this.numberOfPlayer = numberOfPlayer;
        this.fee = fee;
        this.prize = prize;
        this.image = image;
    }

    TournamentDTO() {
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getTournamentName() {
        return tournamentName;
    }

    public void setTournamentName(String tournamentName) {
        this.tournamentName = tournamentName;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public int getNumberOfPlayer() {
        return numberOfPlayer;
    }

    public void setNumberOfPlayer(int numberOfPlayer) {
        this.numberOfPlayer = numberOfPlayer;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public int getTournamentStatus() {
        return tournamentStatus;
    }

    public void setTournamentStatus(int tournamentStatus) {
        this.tournamentStatus = tournamentStatus;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    @Override
    public String toString() {
        return "TournamentDTO{" + "tournamentID=" + tournamentID + ", accountID=" + accountID + ", tournamentName=" + tournamentName + ", sponsor=" + sponsor + ", prize=" + prize + ", numberOfPlayer=" + numberOfPlayer + ", dateTime=" + dateTime + ", tournamentStatus=" + tournamentStatus + ", fee=" + fee + ", image=" + image + '}';
    }

    
}
