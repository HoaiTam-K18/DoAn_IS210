
package com.senko.warehousemanagement.view.stuff;

import com.senko.warehousemanagement.controller.NhaVanChuyenController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;


public class NhaVanChuyenTable extends JTable {
    private DefaultTableModel model;
    private NhaVanChuyenController controller = new NhaVanChuyenController();
    private TableRowSorter<TableModel> rowSorter;
    
    Object[][] data = controller.getNhaVanChuyenFromModel();
    
    String[] columns = {"Mã nhà vận chuyển","Tên nhà vận chuyển","Số điện thoại đại diện"};
    
    public NhaVanChuyenTable(){
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
        Object[][] data = controller.getNhaVanChuyenFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String tenNhaVanChuyen, String soDienThoai){
        controller.themNhaVanChuyenVaoModel(tenNhaVanChuyen, soDienThoai);
        refresh();
    }
    
    public void deleteItem(){
        int maNhaVanChuyen = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.xoaNhaVanChuyen(maNhaVanChuyen);
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
