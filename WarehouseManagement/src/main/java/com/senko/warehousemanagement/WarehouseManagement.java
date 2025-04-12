

package com.senko.warehousemanagement;

import com.senko.warehousemanagement.view.Main;
import com.formdev.flatlaf.FlatLightLaf;
import javax.swing.UIManager;

public class WarehouseManagement {

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel( new FlatLightLaf() );
        } catch( Exception ex ) {
            System.err.println( "Failed to initialize LaF" );
        }
        Main main = new Main();
        main.setVisible(true);
    }
}
