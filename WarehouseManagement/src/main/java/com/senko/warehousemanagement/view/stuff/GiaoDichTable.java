
package com.senko.warehousemanagement.view.stuff;

import com.senko.warehousemanagement.controller.GiaoDichController;
import java.awt.Color;
import java.awt.Component;
import java.util.Arrays;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class GiaoDichTable extends JTable{
    private DefaultTableModel model;
    private GiaoDichController controller = new GiaoDichController();
    private TableRowSorter<TableModel> rowSorter;
    
    Object[][] data = controller.getGiaoDichFromModel();
    
    String[] columns = {"Mã giao dịch","Loại giao dịch","Thời gian","Thành tiền","Nhà vận chuyển","Nhân viên"};
    
    public GiaoDichTable(){
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
        rowSorter = new TableRowSorter<>(model);
        setRowSorter(rowSorter);
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
    
    public void filter(String text){
        RowFilter<TableModel, Object> filter = RowFilter.orFilter(Arrays.asList(
        RowFilter.regexFilter("(?i)" + text, 0), // Cột 1 (Tên)
        RowFilter.regexFilter("(?i)" + text, 5)  // Cột 2 (Địa chỉ)
        ));
        if (text.trim().length() == 0) {
            rowSorter.setRowFilter(null); // Hiện lại tất cả
        } else {
            // (?i) = không phân biệt hoa thường
            rowSorter.setRowFilter(filter); // Lọc theo cột thứ 1
        }
    }
}
