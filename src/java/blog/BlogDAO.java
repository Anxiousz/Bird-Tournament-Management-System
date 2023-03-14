/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

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
public class BlogDAO implements Serializable {

    private final static String VIEW_BLOG = "SELECT TOP 3 *\n"
            + "FROM (\n"
            + "SELECT b.blogID, b.accountID, b.Body, b.Title, b.Media, FORMAT(CAST(b.createTime AS datetime),'dd/MM/yyyy HH:mm:ss') AS createTime\n"
            + "FROM Blog b\n"
            + "WHERE createTime >= CURRENT_TIMESTAMP \n"
            + "     ) AS subquery\n"
            + "ORDER BY subquery.createTime ASC";

    private final static String LIST_BLOG = "SELECT b.blogID, b.accountID, b.Body, b.Title, b.Media, FORMAT(CAST(b.createTime AS datetime),'dd/MM/yyyy HH:mm:ss') AS createTime\n"
            + "FROM Blog b";

    private final static String BLOG_DETAIL = "SELECT b.blogID, b.accountID, b.Body, b.Title, b.Media, FORMAT(CAST(b.createTime AS datetime),'dd/MM/yyyy HH:mm:ss') AS createTime\n"
            + "FROM Blog  b\n"
            + "WHERE b.blogID = ?";

    private final static String ANOTHER_DETAIL = "SELECT b.blogID, b.accountID, b.Body, b.Title, b.Media, FORMAT(CAST(b.createTime AS datetime),'dd/MM/yyyy HH:mm:ss') AS createTime\n"
            + "FROM Blog b\n"
            + "WHERE blogID NOT IN (SELECT blogID FROM Blog WHERE blogID = ?);";

    private final static String DELETE_BLOG = "DELETE FROM Blog  \n"
            + "WHERE blogID = ? ";

    public boolean deleteBlog(int blogID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(DELETE_BLOG);
                stm.setInt(1, blogID);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<BlogDTO> listAnotherBlog(int blogID) throws Exception {
        List<BlogDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(ANOTHER_DETAIL);
                stm.setInt(1, blogID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int nblogID = rs.getInt("blogID");
                    int accountID = rs.getInt("accountID");
                    String Body = rs.getString("Body");
                    String Title = rs.getString("Title");
                    String Media = rs.getString("Media");
                    String createTime = rs.getString("createTime");
                    BlogDTO blog = new BlogDTO(nblogID, accountID, Body, Title, Media, createTime);
                    list.add(blog);
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

    public BlogDTO getBlogbyID(int blogID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(BLOG_DETAIL);
                stm.setInt(1, blogID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BlogDTO blog = new BlogDTO();
                    blog.setBlogID(rs.getInt(1));
                    blog.setAccountID(rs.getInt(2));
                    blog.setBody(rs.getString(3));
                    blog.setTitle(rs.getString(4));
                    blog.setMedia(rs.getString(5));
                    blog.setCreateTime(rs.getString(6));
                    return blog;
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

    public List<BlogDTO> listBlog() throws Exception {
        List<BlogDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(LIST_BLOG);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int accountID = rs.getInt("accountID");
                    String Body = rs.getString("Body");
                    String Title = rs.getString("Title");
                    String Media = rs.getString("Media");
                    String createTime = rs.getString("createTime");
                    BlogDTO blog = new BlogDTO(blogID, accountID, Body, Title, Media, createTime);
                    list.add(blog);
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

    public List<BlogDTO> viewBlog() throws Exception {
        List<BlogDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(VIEW_BLOG);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int accountID = rs.getInt("accountID");
                    String Body = rs.getString("Body");
                    String Title = rs.getString("Title");
                    String Media = rs.getString("Media");
                    String createTime = rs.getString("createTime");
                    BlogDTO blog = new BlogDTO(blogID, accountID, Body, Title, Media, createTime);
                    list.add(blog);
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
