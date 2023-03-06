/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package round;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tournament.TournamentDTO;
import utils.DBContext;

public class RoundDAO implements Serializable {

    private static String GET_ALL_BY_TID = "SELECT r.roundID, r.tournamentID, r.typeOfRound, r.birdPass, r.birdPass, r.roundStatus\n"
            + "FROM Round r\n"
            + "WHERE tournamentID = ?;";

    private static String ADD_ROUND = "INSERT INTO Round([tournamentID],[typeOfRound],[birdPass],[birdAttend],[roundStatus]) \n"
            + "VALUES(?,?,?,?,?)";

    public List<RoundDTO> getAllByTID(int tournamentID) throws SQLException {
        List<RoundDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_BY_TID);
                stm.setInt(1, tournamentID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    RoundDTO rou = new RoundDTO();
                    TournamentDTO t = new TournamentDTO();
                    rou.setRoundID(rs.getInt(1));
                    t.setTournamentID(rs.getInt(2));
                    rou.setTournament(t);
                    rou.setRoundName(rs.getString(3));
                    rou.setTypeOfRound(rs.getString(4));
                    rou.setBirdPass(rs.getInt(5));
                    rou.setBirdAttend(rs.getInt(6));
                    rou.setRoundStatus(rs.getInt(7));
                    list.add(rou);
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

    public boolean insertRound(RoundDTO round) throws SQLException {
        boolean check = true;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_ROUND);
                stm.setInt(1, round.getTournament().getTournamentID());
                stm.setString(2, round.getTypeOfRound());
                stm.setInt(3, round.getBirdPass());
                stm.setInt(4, round.getBirdAttend());
                stm.setInt(5, round.getRoundStatus());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
