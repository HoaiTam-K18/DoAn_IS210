
package com.senko.warehousemanagement.view.stuff;

import com.senko.warehousemanagement.controller.GiaoDichController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

public class GiaoDichTable extends JTable{
    private DefaultTableModel model;
    private GiaoDichController controller = new GiaoDichController();
    
    Object[][] data = controller.getGiaoDichFromModel();
    
    String[] columns = {"Mã giao dịch","Loại giao dịch","Thời gian","Thành tiền","Nhà vận chuyển","Nhân viên"};
    
    public GiaoDichTable(){
        model = new DefaultTableModel(data, columns);
        this.setModel(model);
        setShowHorizontalLines(true);
        setRowHeight(30);
        getTableHeader().setReorderingAllowed(false);
        getTableHeader().setDefaultRenderer(new DefaultTableCellRenderer(){
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
                TableHeader header = new TableHeader((String)value);
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
                return com;
            }
            
        });
    }
    
    public void refresh(){
        Object[][] data = controller.getGiaoDichFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String loaiGiaoDich,  String nhaVanChuyen, String nhanVien){
        controller.themGiaoDichVaoModel(loaiGiaoDich, nhaVanChuyen, nhanVien);
        refresh();
    }
    
    public void deleteItem(){
        int maGiaoDich = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.xoaGiaoDich(maGiaoDich);
        refresh();
    }
    
    public void editItem(String loaiGiaoDich,  String nhaVanChuyen, String nhanVien){
        int maGiaoDich= (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.capNhatGiaoDichVaoModel(loaiGiaoDich, nhaVanChuyen, nhanVien, maGiaoDich);
        refresh();
    }
    public Object[] getItemAt(int row){
        DefaultTableModel model = (DefaultTableModel) this.getModel();
        int columnCount = model.getColumnCount();
        Object[] obj = new Object[columnCount];
        for (int i = 0; i < columnCount; i++) {
            obj[i] = model.getValueAt(row, i);
        }
        return obj;
    }
    public int getRow(){
        return getSelectedRow();
    }
}
