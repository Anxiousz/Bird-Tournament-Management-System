/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tournament;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

public class TournamentDAO{

    private final static String GET_TOURNAMENT = "SELECT TOP 3 *\n"
            + "FROM (\n"
            + "    SELECT DISTINCT t.tournamentName, FORMAT(CAST(t.dateTime AS datetime),'dd/MM/yyyy HH:mm:ss') AS dateTime, t.tournamentStatus, t.numberOfPlayer, r.fee, t.prize, t.image\n"
            + "    FROM Tournament t JOIN RegistrationForm r ON t.tournamentID = r.tournamentID\n"
            + "    WHERE t.dateTime >= CURRENT_TIMESTAMP AND t.tournamentStatus = 1\n"
            + ") AS subquery\n"
            + "ORDER BY subquery.dateTime ASC;";

    public List<TournamentDTO> getAllTournament() throws Exception {
        List<TournamentDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_TOURNAMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String tournamentName = rs.getString("tournamentName");
                    String dateTime = rs.getString("dateTime");
                    int tournamentStatus = rs.getInt("tournamentStatus");
                    int numberOfPlayer = rs.getInt("numberOfPlayer");
                    String fee = rs.getString("fee");
                    String prize = rs.getString("prize");
                    String image = rs.getString("image");
                    TournamentDTO tour = new TournamentDTO(tournamentName, dateTime, tournamentStatus, numberOfPlayer, fee, prize, image);
                    list.add(tour);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
}
