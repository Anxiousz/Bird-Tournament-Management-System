/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package achievement;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBContext;

/**
 *
 * @author anh12
 */
public class AchievementDAO implements Serializable{
    
   
    
    private static final String ADD_ACHIEVEMENT_BY_AID
            ="IF NOT EXISTS (select birdID from Achievement where birdID = (select TOP(1) birdID\n"
            + "from Bird\n"
            + "where accountID = ?\n"
            + "ORDER BY Bird.birdID desc))\n"
            + "BEGIN\n"
            + "insert into Achievement(birdID,medals)\n"
            + "select TOP(1) birdID,'Top1:0;Top2:0;Top3:0;Top4:0'\n"
            + "from Bird\n"
            + "where accountID = ? \n"
            + "ORDER BY Bird.birdID desc\n"
            + "END";
     private static final String GET_MEDALS_BY_ID
            ="SELECT medals from Achievement WHERE birdID = ?";
     private static final String UPDATE_MEDALS
            ="UPDATE Achievement SET medals = ? WHERE birdID = ?";
     
     public boolean updateMedals(String me, int bid) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_MEDALS);
                stm.setString(1, me);
                stm.setInt(2, bid);
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
     public String getMedalsByBid(int BID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_MEDALS_BY_ID);
                stm.setInt(1, BID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String medals = rs.getString(1);
                    return medals;
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
        return null;
    }       
     public boolean addAchievementByAid(int aid) throws SQLException {
        boolean check = true;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ADD_ACHIEVEMENT_BY_AID);
                stm.setInt(1, aid);
                stm.setInt(2, aid);
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
