
package com.senko.warehousemanagement.view.stuff;
import com.senko.warehousemanagement.controller.KhachHangController;
import com.senko.warehousemanagement.controller.VatTuController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;


public class KhachHangTable extends JTable{
    private DefaultTableModel model;
    private KhachHangController controller = new KhachHangController();
    
    Object[][] data = controller.getKhachHangFromModel();
    
    String[] columns = {"Mã khách hàng","Tên khách hàng","Số điện thoại"};
    
    public KhachHangTable(){
        model = new DefaultTableModel(data, columns);
        this.setModel(model);
        setShowHorizontalLines(true);
        setRowHeight(30);
        getTableHeader().setReorderingAllowed(false);
        getTableHeader().setDefaultRenderer(new DefaultTableCellRenderer(){
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
                TableHeader header = new TableHeader((String)value);
                if(column==6){
                    header.setHorizontalAlignment(JLabel.CENTER);
                }
                return header;
            }
            
        });
        setDefaultRenderer(Object.class, new DefaultTableCellRenderer(){
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
                Component com = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                if(isSelected){
                    com.setBackground(new Color(224,224,224));
                   
                }
                else {
                    com.setBackground(Color.white);
                }
                //VatTu vt = (VatTu) value;
                if(column!=6){
                    return com;
                }
                return new StatusLabel((int)value);
            }
            
        });
    }
    
    public void refresh(){
        Object[][] data = controller.getKhachHangFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String tenKhachHang, String soDienThoai){
        controller.themKhachHangVaoModel(tenKhachHang, soDienThoai);
        refresh();
    }
    
    public void deleteItem(){
        int maKhachHang = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.xoaVatTu(maKhachHang);
        refresh();
    }
    
    public void editItem(String tenKhachHang, String soDienThoai){
        int maKhachHang = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.capNhatKhachHangVaoModel(tenKhachHang, soDienThoai, maKhachHang);
        refresh();
    }
    public Object[] getItemAt(int row){
        DefaultTableModel model = (DefaultTableModel) this.getModel();
        Object[] obj = {model.getValueAt(row, 0),model.getValueAt(row, 1),model.getValueAt(row, 2),model.getValueAt(row, 3),model.getValueAt(row, 4)};
        return obj;
    }
    
    public int getRow(){
        return getSelectedRow();
    }
}
