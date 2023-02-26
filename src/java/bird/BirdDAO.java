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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author anh12
 */
public class BirdDAO {

    private final static String GET_BIRD = "SELECT TOP 3 b.birdName, b.height, b.weight, b.color, b.birdStatus, a.totalScore, b.birdPhoto\n"
            + "FROM Bird b JOIN Achievement a ON b.birdID = a.birdID\n"
            + "ORDER BY a.[top] ASC";
    private final static String GET_ALL_BIRD =
             "SELECT birdID, accountID, birdName, birdPhoto, height, weight, color, birdStatus, [identity] FROM Bird ";
    private static final String UPDATE_BIRD = 
            "UPDATE Bird SET accountID = ? , birdName = ? , birdPhoto = ? , height = ? , weight = ? , color = ? , birdStatus = ? , [identity] = ?\n"
            + "WHERE birdID = ? ";
    private final static String GET_BY_ID = 
            "SELECT birdID, accountID, birdName, birdPhoto, height, weight, color, birdStatus, [identity] FROM Bird WHERE birdID = ? ";
    private static final String DELETE_BIRD 
            = "DElETE FROM Bird WHERE birdID = ? ";
    private final static String GET_BIRD_BY_ACCOUNT = 
            "SELECT * FROM Bird WHERE accountID=?";
    public BirdDTO getByID(int birdID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BY_ID);
                stm.setInt(1, birdID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    BirdDTO bird = new BirdDTO();
                    bird.setBirdID(rs.getInt(1));
                    bird.setAccountID(rs.getInt(2));
                    bird.setBirdName(rs.getString(3));
                    bird.setBirdPhoto(rs.getString(4));
                    bird.setHeight(rs.getString(5));
                    bird.setWeight(rs.getString(6));
                    bird.setColor(rs.getString(7));
                    bird.setBirdStatus(rs.getInt(8));
                    bird.setIdentity(rs.getString(9));
                    return bird;
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
    public List<BirdDTO> getAllBird1() throws SQLException {
        List<BirdDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ALL_BIRD);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BirdDTO bird = new BirdDTO();
                    bird.setBirdID(rs.getInt(1));
                    bird.setAccountID(rs.getInt(2));
                    bird.setBirdName(rs.getString(3));
                    bird.setBirdPhoto(rs.getString(4));
                    bird.setHeight(rs.getString(5));
                    bird.setWeight(rs.getString(6));
                    bird.setColor(rs.getString(7));
                    bird.setBirdStatus(rs.getInt(8));
                    bird.setIdentity(rs.getString(9));
                    list.add(bird);
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
//    Get Bird By Account
     public List<BirdDTO> getAllBirdByAccountID(int accountID) throws SQLException {
        List<BirdDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_BIRD_BY_ACCOUNT);
                stm.setInt(1, accountID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BirdDTO bird = new BirdDTO();
                    bird.setBirdID(rs.getInt(1));
                    bird.setAccountID(rs.getInt(2));
                    bird.setBirdName(rs.getString(3));
                    bird.setBirdPhoto(rs.getString(4));
                    bird.setHeight(rs.getString(5));
                    bird.setWeight(rs.getString(6));
                    bird.setColor(rs.getString(7));
                    bird.setBirdStatus(rs.getInt(8));
                    bird.setIdentity(rs.getString(9));
                    list.add(bird);
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
//    ----------------------------------------------------------------------
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
    public boolean updateBird(BirdDTO bird) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_BIRD);
                stm.setInt(1, bird.getAccountID());
                stm.setString(2, bird.getBirdPhoto());
                stm.setString(3, bird.getBirdName());
                stm.setString(4, bird.getHeight());
                stm.setString(5, bird.getWeight());
                stm.setString(6, bird.getColor());
                stm.setInt(7, bird.getBirdStatus());
                stm.setString(8, bird.getIdentity());
                stm.setInt(9, bird.getBirdID());
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
    public boolean deleteBird(int birdID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_BIRD);
                stm.setInt(1, birdID);
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
