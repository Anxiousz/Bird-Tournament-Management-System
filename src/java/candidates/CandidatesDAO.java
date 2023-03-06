/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candidates;

import account.AccountDTO;
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
 * @author thang
 */
public class CandidatesDAO implements Serializable {
    
    public static String GET_APPROVED_CANDIDATES
            = "SELECT Candidates.candidatesID,\n"
            + "  Bird.birdName,\n"
            + "  Account.name,\n"
            + "  Candidates.candidatesStatus,\n"
            + "  Candidates.score,\n"
            + "  Candidates.result\n"
            + "FROM BirdTournament.dbo.Candidates\n"
            + "  INNER JOIN BirdTournament.dbo.RegistrationForm\n"
            + "    ON BirdTournament.dbo.RegistrationForm.formID =\n"
            + "    BirdTournament.dbo.Candidates.formID\n"
            + "  INNER JOIN BirdTournament.dbo.Bird ON BirdTournament.dbo.Bird.birdID =\n"
            + "    BirdTournament.dbo.RegistrationForm.birdID\n"
            + "  INNER JOIN BirdTournament.dbo.Account ON BirdTournament.dbo.Account.accountID\n"
            + "    = BirdTournament.dbo.RegistrationForm.accountID AND\n"
            + "    BirdTournament.dbo.Account.accountID = BirdTournament.dbo.Bird.accountID\n"
            + "WHERE Candidates.candidatesStatus = ? AND Candidates.tournamentID = ? \n"
            + "ORDER BY score desc";
    public static String GET_CANDIDATES_BY_RID
            = "SELECT Candidates.candidatesID,\n"
            + "  Bird.birdName,\n"
            + "  Account.name,\n"
            + "  Candidates.candidatesStatus,\n"
            + "  Candidates.score,\n"
            + "  Candidates.result\n"
            + "FROM BirdTournament.dbo.Candidates\n"
            + "  INNER JOIN BirdTournament.dbo.RegistrationForm\n"
            + "    ON BirdTournament.dbo.RegistrationForm.formID =\n"
            + "    BirdTournament.dbo.Candidates.formID\n"
            + "  INNER JOIN BirdTournament.dbo.Bird ON BirdTournament.dbo.Bird.birdID =\n"
            + "    BirdTournament.dbo.RegistrationForm.birdID\n"
            + "  INNER JOIN BirdTournament.dbo.Account ON BirdTournament.dbo.Account.accountID\n"
            + "    = BirdTournament.dbo.RegistrationForm.accountID AND\n"
            + "    BirdTournament.dbo.Account.accountID = BirdTournament.dbo.Bird.accountID\n"
            + "WHERE Candidates.candidatesStatus = ? AND Candidates.roundID = ? \n"
            + "ORDER BY score desc";
    
    public static String UPDATE_ROUND_CANDIDATES
            = "UPDATE  Candidates SET roundID = ? \n" +
              "WHERE candidatesID = ?";
    
    public static String UPDATE_RESULT_BY_TOP
            = "WITH C AS(\n"
            + "SELECT TOP (?)*\n"
            + "FROM Candidates\n"
            + "WHERE roundID = ?\n"
            + "ORDER BY score desc\n"
            + ")\n"
            + "UPDATE C\n"
            + "SET result = ?";
    
    public static String NUMBER_CANDIDATES_ATTEND 
            = "SELECT COUNT(candidatesID) as birdAttend\n"
            + "FROM Candidates\n"
            + "WHERE roundID = ?";
    public static String NUMBER_CANDIDATES_PASS 
            = "SELECT COUNT(candidatesID) as birdPass\n"
            + "FROM Candidates\n"
            + "WHERE roundID = ? AND result ='pass' ";
    
    public static String GET_FINISH_CANDIDATES
            = "SELECT Candidates.candidatesID,\n"
            + "  Bird.birdName,\n"
            + "  Account.name,\n"
            + "  Candidates.candidatesStatus,\n"
            + "  Candidates.score,\n"
            + "  Candidates.result\n"
            + "FROM BirdTournament.dbo.Candidates\n"
            + "  INNER JOIN BirdTournament.dbo.RegistrationForm\n"
            + "    ON BirdTournament.dbo.RegistrationForm.formID =\n"
            + "    BirdTournament.dbo.Candidates.formID\n"
            + "  INNER JOIN BirdTournament.dbo.Bird ON BirdTournament.dbo.Bird.birdID =\n"
            + "    BirdTournament.dbo.RegistrationForm.birdID\n"
            + "  INNER JOIN BirdTournament.dbo.Account ON BirdTournament.dbo.Account.accountID\n"
            + "    = BirdTournament.dbo.RegistrationForm.accountID AND\n"
            + "    BirdTournament.dbo.Account.accountID = BirdTournament.dbo.Bird.accountID\n"
            + "WHERE Candidates.result IS NOT NULL AND Candidates.roundID = ? \n"
            + "ORDER BY score desc";
    
    public static String UPDATE_FAILED_CANDIDATES
            = "UPDATE Candidates \n"
            + "SET     result = ?, candidatesStatus = ?\n"
            + "WHERE  roundID = ? AND result IS NULL";
    
    public static String RESET_RESULT_CANDIDATES
            = "UPDATE Candidates \n"
            + "SET     result = NULL, score = NULL\n"
            + "WHERE  roundID = ? ";
    
    public static String GET_ID_LIST_BY_TOP
            = "SELECT TOP(?) candidatesID\n"
            + "FROM Candidates\n"
            + "WHERE roundID = ?\n"
            + "ORDER BY score desc";
    
    public static String UPDATE_RESULT_BY_ID
            = "UPDATE Candidates \n"
            + "SET     result = ? \n"
            + "WHERE  candidatesID = ? ";
    public static String UPDATE_SCORE
            = "UPDATE Candidates \n"
            + "SET     score = ? \n"
            + "WHERE  candidatesID = ? ";
    
    public boolean updateScore(int score, int CID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_SCORE);
                stm.setInt(1, score);
                stm.setInt(2, CID);
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
    public boolean updateResultByID(String result, int CID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_RESULT_BY_ID);
                stm.setString(1, result);
                stm.setInt(2, CID);
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
    public List<CandidatesDTO> getIDListByTop(int top, int RID) throws SQLException {
        List<CandidatesDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ID_LIST_BY_TOP);
                stm.setInt(1, top);
                stm.setInt(2, RID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    CandidatesDTO cands = new CandidatesDTO();
                    cands.setCandidatesID(rs.getInt(1));
                    list.add(cands);
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
    public boolean resetResultCandidates(int RID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(RESET_RESULT_CANDIDATES);
                stm.setInt(1, RID);
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
    public boolean updateFailedCandidates(String rs, int cstatus, int RID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_FAILED_CANDIDATES);
                stm.setString(1, rs);
                stm.setInt(2, cstatus);
                stm.setInt(3, RID);
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
    public List<CandidatesDTO> getFinishCandidates(int RID) throws SQLException {
        List<CandidatesDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_FINISH_CANDIDATES);
                stm.setInt(1, RID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    CandidatesDTO cands = new CandidatesDTO();
                    BirdDTO bird = new BirdDTO();
                    AccountDTO acc = new AccountDTO();
                    cands.setCandidatesID(rs.getInt(1));
                    bird.setBirdName(rs.getString(2));
                    cands.setBird(bird);
                    acc.setName(rs.getString(3));
                    bird.setAccount(acc);
                    cands.setBird(bird);
                    cands.setCandidatesStatus(rs.getInt(4));
                    cands.setScore(rs.getInt(5));
                    cands.setResult(rs.getString(6));
                    list.add(cands);
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
    public boolean updateResultByTop(int top, int RID, String result) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_RESULT_BY_TOP);
                stm.setInt(1, top);
                stm.setInt(2, RID);
                stm.setString(3, result);
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
    
    public int numberCAttend(int RID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(NUMBER_CANDIDATES_ATTEND);
                stm.setInt(1, RID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int num = rs.getInt(1);
                    return num;
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
      return 0;
    }        
     public int numberCPass(int RID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(NUMBER_CANDIDATES_PASS);
                stm.setInt(1, RID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int num = rs.getInt(1);
                    return num;
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
      return 0;
    }               
            
    public List<CandidatesDTO> getCandidatesByRID(int candidatesStatus, int RID) throws SQLException {
        List<CandidatesDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_CANDIDATES_BY_RID);
                stm.setInt(1, candidatesStatus);
                stm.setInt(2, RID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    CandidatesDTO cands = new CandidatesDTO();
                    BirdDTO bird = new BirdDTO();
                    AccountDTO acc = new AccountDTO();
                    cands.setCandidatesID(rs.getInt(1));
                    bird.setBirdName(rs.getString(2));
                    cands.setBird(bird);
                    acc.setName(rs.getString(3));
                    bird.setAccount(acc);
                    cands.setBird(bird);
                    cands.setCandidatesStatus(rs.getInt(4));
                    cands.setScore(rs.getInt(5));
                    cands.setResult(rs.getString(6));
                    list.add(cands);
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
    public boolean updateRoundCandidates(int RID, int CID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_ROUND_CANDIDATES);
                stm.setInt(1, RID);
                stm.setInt(2, CID);
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
    
    public List<CandidatesDTO> getApprovedCandidates(int candidatesStatus, int tournamentID) throws SQLException {
        List<CandidatesDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_APPROVED_CANDIDATES);
                stm.setInt(1, candidatesStatus);
                stm.setInt(2, tournamentID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    CandidatesDTO cands = new CandidatesDTO();
                    BirdDTO bird = new BirdDTO();
                    AccountDTO acc = new AccountDTO();
                    cands.setCandidatesID(rs.getInt(1));
                    bird.setBirdName(rs.getString(2));
                    cands.setBird(bird);
                    acc.setName(rs.getString(3));
                    bird.setAccount(acc);
                    cands.setBird(bird);
                    cands.setCandidatesStatus(rs.getInt(4));
                    cands.setScore(rs.getInt(5));
                    cands.setResult(rs.getString(6));
                    list.add(cands);
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
