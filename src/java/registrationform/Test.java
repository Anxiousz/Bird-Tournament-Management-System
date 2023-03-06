/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registrationform;

import java.sql.SQLException;

/**
 *
 * @author anh12
 */
public class Test {

    public static void main(String[] args) throws SQLException {
        RegistrationFormDAO r = new RegistrationFormDAO();
        int test = r.getNumberRegistered(1, 3);
        System.out.println(test);
    }
}
