
package com.senko.warehousemanagement.view.component;

import javax.swing.JButton;

public class FunctionBar extends javax.swing.JPanel {

    
    public FunctionBar() {
        initComponents();
        
    }

    public JButton getSuaButton() {
        return suaButton;
    }

    public JButton getThemButton() {
        return themButton;
    }

    public JButton getXoaButton() {
        return xoaButton;
    }
    
    

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        themButton = new javax.swing.JButton();
        xoaButton = new javax.swing.JButton();
        suaButton = new javax.swing.JButton();

        setLayout(new java.awt.GridBagLayout());

        themButton.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        themButton.setText("Thêm");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.ipadx = 18;
        gridBagConstraints.ipady = 15;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(10, 10, 10, 10);
        add(themButton, gridBagConstraints);

        xoaButton.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        xoaButton.setText("Xóa");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.ipadx = 18;
        gridBagConstraints.ipady = 15;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(10, 10, 10, 10);
        add(xoaButton, gridBagConstraints);

        suaButton.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        suaButton.setText("Sửa");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 3;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.ipadx = 18;
        gridBagConstraints.ipady = 15;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.NORTHWEST;
        gridBagConstraints.insets = new java.awt.Insets(10, 10, 10, 400);
        add(suaButton, gridBagConstraints);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton suaButton;
    private javax.swing.JButton themButton;
    private javax.swing.JButton xoaButton;
    // End of variables declaration//GEN-END:variables
}
