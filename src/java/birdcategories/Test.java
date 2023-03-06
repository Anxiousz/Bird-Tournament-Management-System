/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdcategories;

import java.util.List;

/**
 *
 * @author anh12
 */
public class Test {
    public static void main(String[] args) throws Exception {
        BirdCategoriesDAO b = new BirdCategoriesDAO();
        List<BirdCategoriesDTO> list = b.LoadBirdCate();
        for (BirdCategoriesDTO birdCategoriesDTO : list) {
            System.out.println(birdCategoriesDTO);
        }
    }
}
