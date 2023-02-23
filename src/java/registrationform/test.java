/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registrationform;

/**
 *
 * @author anh12
 */
public class test {
    public static void main(String[] args) throws Exception {
        RegistrationFormDAO t = new RegistrationFormDAO();
        RegistrationFormDTO test = t.getDetailTour(3);
        System.out.println(test);
    }
}
