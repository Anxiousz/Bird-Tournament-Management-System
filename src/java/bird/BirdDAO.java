/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bird;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author anh12
 */
public class BirdDAO implements Serializable {

    private final static String GET_BIRD = "SELECT TOP 3 b.birdName, b.height, b.weight, b.color, b.birdStatus, a.totalScore, b.birdPhoto\n"
            + "FROM Bird b JOIN Achievement a ON b.birdID = a.birdID\n"
            + "ORDER BY a.[top] ASC";

    public List<BirdDTO> getAllBird() throws Exception {
        List<BirdDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String birdName = rs.getString("birdName");
                    String height = rs.getString("height");
                    String weight = rs.getString("weight");
                    String color = rs.getString("color");
                    int birdStatus = rs.getInt("birdStatus");
                    int totalScore = rs.getInt("totalScore");
                    String birdPhoto = rs.getString("birdPhoto");
                    BirdDTO b = new BirdDTO(birdName, height, weight, color, birdStatus, totalScore, birdPhoto);
                    list.add(b);
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

    private final static String GET_BIRD_BY_ID = "SELECT b.birdName\n"
            + "FROM Bird b\n"
            + "INNER JOIN Account a ON b.accountID = a.accountID\n"
            + "WHERE a.accountID = ?";

    public List<BirdDTO> getBirdByID(int accountID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<BirdDTO> list = new ArrayList<>();
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_BY_ID);
                stm.setInt(1, accountID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String birdName = rs.getString("birdName");
                    BirdDTO b = new BirdDTO(birdName);
                    list.add(b);
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
