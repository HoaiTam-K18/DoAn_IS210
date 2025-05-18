
package com.senko.warehousemanagement.view.stuff;
import com.senko.warehousemanagement.controller.KhachHangController;
import java.awt.Color;
import java.awt.Component;
import java.util.Arrays;
import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;


public class KhachHangTable extends JTable{
    private DefaultTableModel model;
    private KhachHangController controller = new KhachHangController();
    private TableRowSorter<TableModel> rowSorter;
    
    Object[][] data = controller.getKhachHangFromModel();
    
    String[] columns = {"Mã khách hàng","Tên khách hàng","Số điện thoại"};
    
    public KhachHangTable(){
        model = new DefaultTableModel(data, columns);
        this.setModel(model);
        rowSorter = new TableRowSorter<>(this.getModel());
        setRowSorter(rowSorter);
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
        controller.xoaKhachHang(maKhachHang);
        refresh();
    }
    
    public void editItem(String tenKhachHang, String soDienThoai){
        int maKhachHang = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.capNhatKhachHangVaoModel(tenKhachHang, soDienThoai, maKhachHang);
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
    
    public void filter(String text){
        RowFilter<TableModel, Object> filter = RowFilter.orFilter(Arrays.asList(
        RowFilter.regexFilter("(?i)" + text, 0), // Cột 1 (Tên)
        RowFilter.regexFilter("(?i)" + text, 1)  // Cột 2 (Địa chỉ)
        ));
        if (text.trim().length() == 0) {
            rowSorter.setRowFilter(null); // Hiện lại tất cả
        } else {
            // (?i) = không phân biệt hoa thường
            rowSorter.setRowFilter(filter); // Lọc theo cột thứ 1
        }
    }
}
