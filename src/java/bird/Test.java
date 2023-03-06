/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bird;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author anh12
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        BirdDAO b = new BirdDAO();
        List<BirdDTO> birds = b.manageBird();
        for (BirdDTO bird : birds) {
            System.out.println(bird);
        }
    }
}
