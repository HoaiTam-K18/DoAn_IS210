
package com.senko.warehousemanagement.view.form;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;


public class GiaoDichForm extends javax.swing.JPanel {

    
    public GiaoDichForm() {
        initComponents();
        functionBar1.getThemButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                ThemGiaoDichDialog dialog = new ThemGiaoDichDialog(null,true);
                dialog.setTable(giaoDichTable1);
                dialog.setVisible(true);
                
            }
                
        });
        
        functionBar1.getXoaButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    giaoDichTable1.deleteItem();
                    giaoDichTable1.repaint();
                    giaoDichTable1.revalidate();
                    JOptionPane.showConfirmDialog(null,"Xóa thành công","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }catch (ArrayIndexOutOfBoundsException aibe){
                    JOptionPane.showConfirmDialog(null,"Chưa chọn giao dịch","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }
            }
                
        });
        
        functionBar1.getSuaButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    ThemGiaoDichDialog addDialog = new ThemGiaoDichDialog(null,true);
                    addDialog.setEdit(true);
                    addDialog.setTable(giaoDichTable1);
                    addDialog.initEditFrame();
                    addDialog.setVisible(true);
                    addDialog.repaint();
                    addDialog.revalidate();
                }catch (ArrayIndexOutOfBoundsException aibe){
                    JOptionPane.showConfirmDialog(null,"Chưa chọn giao dịch","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }
            }
            
                
        });
    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        giaoDichTable1 = new com.senko.warehousemanagement.view.stuff.GiaoDichTable();
        jButton1 = new javax.swing.JButton();
        functionBar1 = new com.senko.warehousemanagement.view.component.FunctionBar();

        jScrollPane1.setViewportView(giaoDichTable1);

        jButton1.setText("Chi tiết");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 813, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 694, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(38, 38, 38)
                        .addComponent(jButton1))
                    .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 420, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        try{
            ChiTietGiaoDichForm dialog = new ChiTietGiaoDichForm(null,true);
            dialog.setTable(giaoDichTable1);
            String loaiGiaoDich = giaoDichTable1.getValueAt(giaoDichTable1.getSelectedRow(), 1).toString();
            dialog.initDetails(loaiGiaoDich);
            dialog.setVisible(true);
        } catch(Exception e){
            JOptionPane.showConfirmDialog(null,"Chưa chọn giao dịch","Thông báo", JOptionPane.PLAIN_MESSAGE);
        }
    }//GEN-LAST:event_jButton1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.senko.warehousemanagement.view.component.FunctionBar functionBar1;
    private com.senko.warehousemanagement.view.stuff.GiaoDichTable giaoDichTable1;
    private javax.swing.JButton jButton1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
