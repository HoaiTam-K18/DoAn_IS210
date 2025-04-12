
package com.senko.warehousemanagement.view.form;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;


public class KhachHangForm extends javax.swing.JPanel {

    
    public KhachHangForm() {
        initComponents();
        functionBar1.getThemButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                ThemKhachHangDialog dialog = new ThemKhachHangDialog(null,true);
                dialog.setTable(khachHangTable1);
                dialog.setVisible(true);
                
            }
                
        });
        
        functionBar1.getXoaButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    khachHangTable1.deleteItem();
                    khachHangTable1.repaint();
                    khachHangTable1.revalidate();
                    JOptionPane.showConfirmDialog(null,"Xóa thành công","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }catch (ArrayIndexOutOfBoundsException aibe){
                    JOptionPane.showConfirmDialog(null,"Chưa chọn vật tư","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }
            }
                
        });
        
        functionBar1.getSuaButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    ThemKhachHangDialog addDialog = new ThemKhachHangDialog(null,true);
                    addDialog.setEdit(true);
                    addDialog.setTable(khachHangTable1);
                    addDialog.initEditFrame();
                    addDialog.setVisible(true);
                    addDialog.repaint();
                    addDialog.revalidate();
                }catch (ArrayIndexOutOfBoundsException aibe){
                    JOptionPane.showConfirmDialog(null,"Chưa chọn vật tư","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }
            }
            
                
        });
    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        functionBar1 = new com.senko.warehousemanagement.view.component.FunctionBar();
        jScrollPane1 = new javax.swing.JScrollPane();
        khachHangTable1 = new com.senko.warehousemanagement.view.stuff.KhachHangTable();

        jScrollPane1.setViewportView(khachHangTable1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addComponent(jScrollPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 383, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.senko.warehousemanagement.view.component.FunctionBar functionBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.senko.warehousemanagement.view.stuff.KhachHangTable khachHangTable1;
    // End of variables declaration//GEN-END:variables
}
