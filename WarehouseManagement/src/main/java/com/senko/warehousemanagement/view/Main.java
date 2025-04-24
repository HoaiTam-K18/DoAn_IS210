
package com.senko.warehousemanagement.view;
import com.senko.warehousemanagement.view.event.EventMenuSelected;
import com.senko.warehousemanagement.view.form.GiaoDichForm;
import com.senko.warehousemanagement.view.form.KhachHangForm;
import com.senko.warehousemanagement.view.form.LichSuCapNhatForm;
import com.senko.warehousemanagement.view.form.LichSuKiemKeForm;
import com.senko.warehousemanagement.view.form.NhanVienForm;
import com.senko.warehousemanagement.view.form.VatTuForm;
import java.net.URL;
import javax.swing.ImageIcon;
import javax.swing.JComponent;


public class Main extends javax.swing.JFrame {

    
    public Main() {
        initComponents();
        ImageIcon icon = new ImageIcon("/icon/appicon2.jpg");
        setIconImage(icon.getImage());
        menu1.addEventMenuSelected(new EventMenuSelected(){
            @Override
            public void selected(int index) {
                if(index == 0){
                    System.out.println("cccc");
                    addForm(new VatTuForm());
                }
                else if(index==1){
                     addForm(new KhachHangForm());
                }
                else if(index==2){
                     addForm(new NhanVienForm());
                }
                else if(index==3){
                     addForm(new GiaoDichForm());
                }
                else if(index==4){
                     addForm(new LichSuCapNhatForm());
                }
                else if (index==5){
                     addForm(new LichSuKiemKeForm());
                }
            }   
        });
        addForm(new VatTuForm());
    }
    
    
    public void addForm(JComponent com){
        mainPanel.removeAll();
        mainPanel.add(com);
        mainPanel.repaint();
        mainPanel.revalidate();
    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelBorder1 = new com.senko.warehousemanagement.view.stuff.PanelBorder();
        menu1 = new com.senko.warehousemanagement.view.component.Menu();
        mainPanel = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("WarehouseManager-1.0");

        panelBorder1.setBackground(new java.awt.Color(255, 255, 255));
        panelBorder1.setOpaque(false);

        mainPanel.setLayout(new javax.swing.BoxLayout(mainPanel, javax.swing.BoxLayout.LINE_AXIS));

        javax.swing.GroupLayout panelBorder1Layout = new javax.swing.GroupLayout(panelBorder1);
        panelBorder1.setLayout(panelBorder1Layout);
        panelBorder1Layout.setHorizontalGroup(
            panelBorder1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelBorder1Layout.createSequentialGroup()
                .addComponent(menu1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(mainPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 983, Short.MAX_VALUE))
        );
        panelBorder1Layout.setVerticalGroup(
            panelBorder1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(menu1, javax.swing.GroupLayout.DEFAULT_SIZE, 768, Short.MAX_VALUE)
            .addComponent(mainPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelBorder1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelBorder1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    
    public static void main(String args[]) {
        
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel mainPanel;
    private com.senko.warehousemanagement.view.component.Menu menu1;
    private com.senko.warehousemanagement.view.stuff.PanelBorder panelBorder1;
    // End of variables declaration//GEN-END:variables
}
