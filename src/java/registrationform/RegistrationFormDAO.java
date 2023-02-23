/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registrationform;

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
public class RegistrationFormDAO implements Serializable {

    private final static String GET_TOURNAMENT = "SELECT DISTINCT t.tournamentID, r.location, r.fee, t.tournamentStatus, t.image, t.tournamentName, t.dateTime\n"
            + "FROM RegistrationForm r JOIN Tournament t ON t.tournamentID = r.tournamentID";

    public List<RegistrationFormDTO> getAllTour() throws Exception {
        List<RegistrationFormDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_TOURNAMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tournamentID = rs.getInt("tournamentID");
                    String location = rs.getString("location");
                    String fee = rs.getString("fee");
                    String tournamentStatus = rs.getString("tournamentStatus");
                    String image = rs.getString("image");
                    String tournamentName = rs.getString("tournamentName");
                    String dateTime = rs.getString("dateTime");
                    RegistrationFormDTO r = new RegistrationFormDTO(tournamentID, location, fee, tournamentStatus, image, tournamentName, dateTime);
                    list.add(r);
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

    private final static String GET_ONGOING_TOURNAMENT = "SELECT DISTINCT t.tournamentID, r.location, r.fee, t.tournamentStatus, t.image, t.tournamentName, t.dateTime\n"
            + "FROM RegistrationForm r JOIN Tournament t ON t.tournamentID = r.tournamentID\n"
            + "WHERE t.tournamentStatus = 1";

    public List<RegistrationFormDTO> getOnGoingTour() throws Exception {
        List<RegistrationFormDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_ONGOING_TOURNAMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tournamentID = rs.getInt("tournamentID");
                    String location = rs.getString("location");
                    String fee = rs.getString("fee");
                    String tournamentStatus = rs.getString("tournamentStatus");
                    String image = rs.getString("image");
                    String tournamentName = rs.getString("tournamentName");
                    String dateTime = rs.getString("dateTime");
                    RegistrationFormDTO r = new RegistrationFormDTO(tournamentID, location, fee, tournamentStatus, image, tournamentName, dateTime);
                    list.add(r);
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

    private final static String GET_OLD_TOURNAMENT = "SELECT DISTINCT t.tournamentID, r.location, r.fee, t.tournamentStatus, t.image, t.tournamentName, t.dateTime\n"
            + "FROM RegistrationForm r JOIN Tournament t ON t.tournamentID = r.tournamentID\n"
            + "WHERE t.tournamentStatus = 2";

    public List<RegistrationFormDTO> getOldTour() throws Exception {
        List<RegistrationFormDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_OLD_TOURNAMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tournamentID = rs.getInt("tournamentID");
                    String location = rs.getString("location");
                    String fee = rs.getString("fee");
                    String tournamentStatus = rs.getString("tournamentStatus");
                    String image = rs.getString("image");
                    String tournamentName = rs.getString("tournamentName");
                    String dateTime = rs.getString("dateTime");
                    RegistrationFormDTO r = new RegistrationFormDTO(tournamentID, location, fee, tournamentStatus, image, tournamentName, dateTime);
                    list.add(r);
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

    private final static String GET_DELAY_TOURNAMENT = "SELECT DISTINCT t.tournamentID, r.location, r.fee, t.tournamentStatus, t.image, t.tournamentName, t.dateTime\n"
            + "FROM RegistrationForm r JOIN Tournament t ON t.tournamentID = r.tournamentID\n"
            + "WHERE t.tournamentStatus = 3";

    public List<RegistrationFormDTO> getDelayTour() throws Exception {
        List<RegistrationFormDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_DELAY_TOURNAMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tournamentID = rs.getInt("tournamentID");
                    String location = rs.getString("location");
                    String fee = rs.getString("fee");
                    String tournamentStatus = rs.getString("tournamentStatus");
                    String image = rs.getString("image");
                    String tournamentName = rs.getString("tournamentName");
                    String dateTime = rs.getString("dateTime");
                    RegistrationFormDTO r = new RegistrationFormDTO(tournamentID, location, fee, tournamentStatus, image, tournamentName, dateTime);
                    list.add(r);
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

    private final static String GET_TOURNAMENT_DETAIL = "SELECT DISTINCT t.image, t.tournamentName, t.tournamentStatus, t.dateTime, r.location, r.fee, t.prize, t.numberOfPlayer, t.sponsor\n"
            + "FROM  Tournament t  JOIN RegistrationForm r ON r.tournamentID = t.tournamentID\n"
            + "WHERE t.tournamentID = ?";

    public RegistrationFormDTO getDetailTour(int ID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationFormDTO tour = null;
        try {

            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_TOURNAMENT_DETAIL);
                stm.setInt(1, ID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    String image = rs.getString("image");
                    String tournament = rs.getString("tournamentName");
                    String tournamentStatus = rs.getString("tournamentStatus");
                    String dateTime = rs.getString("dateTime");
                    String location = rs.getString("location");
                    String fee = rs.getString("fee");
                    String prize = rs.getString("prize");
                    int numberOfPlayer = rs.getInt("numberOfPlayer");
                    String sponsor = rs.getString("sponsor");
                    tour = new RegistrationFormDTO(image, tournament, tournamentStatus, dateTime, location, fee, prize, numberOfPlayer, sponsor);
                    return tour;
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
}
