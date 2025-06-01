
package com.senko.warehousemanagement.view.stuff;
import com.senko.warehousemanagement.controller.LoaiVatTuController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;


public class LoaiVatTuTable extends JTable{
    private DefaultTableModel model;
    private LoaiVatTuController controller = new LoaiVatTuController();
    private TableRowSorter<TableModel> rowSorter;
    
    Object[][] data = controller.getLoaiVatTuFromModel();
    
    String[] columns = {"Mã loại vật tư","Tên loại vật tư"};
    
    public LoaiVatTuTable(){
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
        Object[][] data = controller.getLoaiVatTuFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String tenLoaiVatTu){
        controller.themLoaiVatTuVaoModel(tenLoaiVatTu);
        refresh();
    }
    
    public void deleteItem(){
        int maLoaiVatTu = (Integer) model.getValueAt(getSelectedRow(), 0);
        controller.xoaLoaiVatTu(maLoaiVatTu);
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
