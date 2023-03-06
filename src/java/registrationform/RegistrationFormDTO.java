/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registrationform;

import account.AccountDTO;
import bird.BirdDTO;
import java.io.Serializable;
import tournament.TournamentDTO;

/**
 *
 * @author anh12
 */
public class RegistrationFormDTO implements Serializable {

    private int registrationFormID;
    private int tournamentID;
    private int accountID;
    private int birdID;
    private int formStatus;
    private BirdDTO bird;
    private TournamentDTO tour;
    private AccountDTO acc;

    public RegistrationFormDTO() {
    }

    public RegistrationFormDTO(int formStatus, TournamentDTO tour, BirdDTO bird, AccountDTO acc) {
        this.formStatus = formStatus;
        this.tour = tour;
        this.bird = bird;
        this.acc = acc;
    }

    public RegistrationFormDTO(int tournamentID, TournamentDTO tour) {
        this.tournamentID = tournamentID;
        this.tour = tour;
    }

    public RegistrationFormDTO(BirdDTO bird) {
        this.bird = bird;
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

    public int getFormStatus() {
        return formStatus;
    }

    public void setFormStatus(int formStatus) {
        this.formStatus = formStatus;
    }

    public BirdDTO getBird() {
        return bird;
    }

    public void setBird(BirdDTO bird) {
        this.bird = bird;
    }

    public TournamentDTO getTour() {
        return tour;
    }

    public void setTour(TournamentDTO tour) {
        this.tour = tour;
    }

    public AccountDTO getAcc() {
        return acc;
    }

    public void setAcc(AccountDTO acc) {
        this.acc = acc;
    }

    @Override
    public String toString() {
        return "RegistrationFormDTO{" + "registrationFormID=" + registrationFormID + ", tournamentID=" + tournamentID + ", accountID=" + accountID + ", birdID=" + birdID + ", formStatus=" + formStatus + ", bird=" + bird + ", tour=" + tour + ", acc=" + acc + '}';
    }

}
