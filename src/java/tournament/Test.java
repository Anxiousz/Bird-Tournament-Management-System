/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tournament;

import java.sql.SQLException;

/**
 *
 * @author anh12
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        TournamentDAO t = new TournamentDAO();
        boolean test = t.updateTournament(1, "2023-12-10 12:30:00.000", "Binh Duong La", "200.000", "50.000.000", 20);
        if(test == true){
            System.out.println("OK");
        }else{
            System.out.println("KO");
        }
    }
}
