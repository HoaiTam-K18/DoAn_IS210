
package com.senko.warehousemanagement.view.stuff;
import com.senko.warehousemanagement.controller.VatTuController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;


public class VatTuTable extends JTable{
    private DefaultTableModel model;
    private VatTuController controller = new VatTuController();
    
    Object[][] data = controller.getVatTuFromModel();
    
    String[] columns = {"Mã vật tư","Tên vật tư","Mã loại vật tư","Đơn giá nhập","Đơn giá xuát","Số lượng","Trạng thái"};
    
    public VatTuTable(){
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
        Object[][] data = controller.getVatTuFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String tenVatTu, String loaiVT, String donGiaNhap, String donGiaXuat){
        controller.themVatTuVaoModel(tenVatTu, loaiVT, donGiaNhap, donGiaXuat);
        refresh();
    }
    
    public void deleteItem(){
        int maVatTu = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.xoaVatTu(maVatTu);
        refresh();
    }
    
    public void editItem(String tenVatTu, String loaiVT, String donGiaNhap, String donGiaXuat){
        int maVatTu = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.capNhatVatTuVaoModel(tenVatTu, loaiVT, donGiaNhap, donGiaXuat,maVatTu);
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

