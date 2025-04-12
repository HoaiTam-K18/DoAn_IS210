
package com.senko.warehousemanagement.view.form;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;


public class VatTuForm extends javax.swing.JPanel {

    
    public VatTuForm() {
        initComponents();
        functionBar1.getThemButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                ThemVatTuDialog dialog = new ThemVatTuDialog(null,true);
                dialog.setTable(vatTuTable1);
                dialog.setVisible(true);
                
            }
                
        });
        
        functionBar1.getXoaButton().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    vatTuTable1.deleteItem();
                    vatTuTable1.repaint();
                    vatTuTable1.revalidate();
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
                    ThemVatTuDialog addDialog = new ThemVatTuDialog(null,true);
                    addDialog.setEdit(true);
                    addDialog.setTable(vatTuTable1);
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

        jScrollPane1 = new javax.swing.JScrollPane();
        vatTuTable1 = new com.senko.warehousemanagement.view.stuff.VatTuTable();
        functionBar1 = new com.senko.warehousemanagement.view.component.FunctionBar();

        jScrollPane1.setViewportView(vatTuTable1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1)
            .addGroup(layout.createSequentialGroup()
                .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(functionBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 347, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.senko.warehousemanagement.view.component.FunctionBar functionBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.senko.warehousemanagement.view.stuff.VatTuTable vatTuTable1;
    // End of variables declaration//GEN-END:variables
}
