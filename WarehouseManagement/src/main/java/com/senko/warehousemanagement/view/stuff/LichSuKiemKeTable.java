
package com.senko.warehousemanagement.view.stuff;

import com.senko.warehousemanagement.controller.LichSuCapNhatGiaController;
import com.senko.warehousemanagement.controller.LichSuKiemKeController;
import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;


public class LichSuKiemKeTable extends JTable {
    private DefaultTableModel model;
    private LichSuKiemKeController controller = new LichSuKiemKeController();
    
    Object[][] data = controller.getLichSuKiemKeFromModel();
    
    String[] columns = {"Mã lịch sử kiểm kê","Nhân viên","Thời gian","Vật tư","Số lượng còn lại","Tình trạng"};
    
    public LichSuKiemKeTable(){
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
        Object[][] data = controller.getLichSuKiemKeFromModel();
        model = new DefaultTableModel(data,columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
    public void addItem(String nhanVien, String vatTu, String soLuongConLai, String tinhTrang){
        controller.themLichSuKiemKeVaoModel(nhanVien,vatTu,soLuongConLai,tinhTrang);
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
