/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candidate;

import bird.BirdDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author anh12
 */
public class CandidatesDAO implements Serializable{
      public static String GET_CANDIDATES1
            = "SELECT Candidates.candidatesID,\n"
            + "  Account.name,\n"
            + "  Bird.birdName,\n"
            + "  Candidates.score,\n"
            + "  Candidates.result,\n"
            + "  Candidates.candidatesStatus,\n"
            + "  Candidates.roundID,\n"
            + "  Candidates.tournamentID\n"
            + "FROM Account\n"
            + "  INNER JOIN RegistrationForm\n"
            + "    ON Account.accountID =\n"
            + "    RegistrationForm.accountID\n"
            + "  INNER JOIN Candidates\n"
            + "    ON RegistrationForm.registrationFormID =\n"
            + "    Candidates.registrationFormID\n"
            + "  INNER JOIN Bird ON Bird.birdID =\n"
            + "    RegistrationForm.birdID AND\n"
            + "    Account.accountID = Bird.accountID\n"
            + "WHERE Candidates.candidatesStatus = ? AND Candidates.tournamentID = ? AND Candidates.roundID = ? AND Bird.birdName IS NOT NULL ";
    public static String GET_CANDIDATES2
            = "SELECT Candidates.candidatesID,\n"
            + "  Account.name,\n"
            + "  Bird.birdName,\n"
            + "  Candidates.score,\n"
            + "  Candidates.result,\n"
            + "  Candidates.candidatesStatus,\n"
            + "  Candidates.roundID,\n"
            + "  Candidates.tournamentID\n"
            + "FROM Account\n"
            + "  INNER JOIN RegistrationForm\n"
            + "    ON Account.accountID =\n"
            + "    RegistrationForm.accountID\n"
            + "  INNER JOIN Candidates\n"
            + "    ON RegistrationForm.registrationFormID =\n"
            + "    Candidates.registrationFormID\n"
            + "  INNER JOIN Bird ON Bird.birdID =\n"
            + "    RegistrationForm.birdID AND\n"
            + "    Account.accountID = Bird.accountID\n"
            + "WHERE Candidates.tournamentID = ? AND Bird.birdName IS NOT NULL ";
    
    public List<CandidatesDTO> getCandidates(int candidatesStatus, int tournamentID, int roundID) throws SQLException {
        List<CandidatesDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                if(roundID != -1){
                stm = con.prepareStatement(GET_CANDIDATES1);
                stm.setInt(1, candidatesStatus);
                stm.setInt(2, tournamentID);
                stm.setInt(3, roundID);
                rs = stm.executeQuery();
                }else{
                stm = con.prepareStatement(GET_CANDIDATES2);
                stm.setInt(1, tournamentID);
                rs = stm.executeQuery();
                }
                
                while (rs.next()) {
                    CandidatesDTO candidates = new CandidatesDTO();
                    candidates.setCandidatesID(rs.getInt(1));
                  //  candidates.setOwner(rs.getString(2));
                    candidates.setBird(new BirdDTO(0, 0, rs.getString(3), null, null, null, null, null, 0));
                    candidates.setScore(rs.getInt(4));
                    candidates.setResult(rs.getString(5));
                    candidates.setCandidatesStatus(rs.getInt(6));
               //     candidates.setRoundID(rs.getInt(7));
                 //   candidates.setTournamentID(rs.getInt(8));
                    list.add(candidates);
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
