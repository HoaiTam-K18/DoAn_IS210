
package com.senko.warehousemanagement.view.stuff;

import com.senko.warehousemanagement.controller.ChiTietNhapController;
import com.senko.warehousemanagement.controller.NhanVienController;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Arrays;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;


public class ChiTietHoaDonTable extends JTable {
    private DefaultTableModel model;
    private ChiTietNhapController controller = new ChiTietNhapController();
    private int maGiaoDich;
    
    public void setMaGiaoDich(int maGiaoDich){
        this.maGiaoDich = maGiaoDich;
    }
    
    String[] columns = {"Vật tư","Số lượng","Thành tiền", "Nhà cung cấp"};
    
    int editingRow = -1;
    
    public ChiTietHoaDonTable(){
        
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
    
    
    public Object[][] extractTable(Object[][] data){
        int row = data.length;
        int col = 4;
        Object[][] obj = new Object[row][col];
        for(int i = 0;i<row ;i++){
            obj[i][0] = data[i][1];
            obj[i][1] = data[i][2];
            obj[i][2] = data[i][3];
            obj[i][3] = data[i][4];
        }
        return obj;
    }
    
    public void loadData(){
        Object[][] data = controller.getChiTietFromModel(maGiaoDich);
        Object[][] dataTable = extractTable(data);
        model = new DefaultTableModel(dataTable, columns);
        setModel(model);
        
        PopupMenu menu = new PopupMenu();
        
        
        menu.getAddItem().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                model.addRow(new Object[]{"","","",""});
                editingRow = model.getRowCount()-1;
                repaint();
                revalidate();
            }
            
        });
        
        menu.getDeleteItem().addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    String vatTu = getValueAt(getSelectedRow(), 0).toString();
                    controller.xoaChiTietNhap(maGiaoDich, vatTu);
                    refresh();
                }catch(Exception ex){
                    JOptionPane.showConfirmDialog(null,"Chưa chọn chi tiết","Thông báo", JOptionPane.PLAIN_MESSAGE);
                }
            }
            
        });
                
        
        addMouseListener(new MouseAdapter(){
            @Override
            public void mousePressed(MouseEvent e) {
                if(e.isPopupTrigger()){
                    menu.show(e.getComponent(), e.getX(), e.getY());
                }
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                if(e.isPopupTrigger()){
                    menu.show(e.getComponent(), e.getX(), e.getY());
                }
            }
            
        });
        
        
        getModel().addTableModelListener(new TableModelListener(){
            @Override
            public void tableChanged(TableModelEvent e) {
                if(e.getType()==TableModelEvent.UPDATE){
                    int row = e.getFirstRow();
                    
                    DefaultTableModel modelChuan = (DefaultTableModel) e.getSource();
                    
                    boolean isFull = true;
                    for(int i = 0;i<model.getColumnCount();i++){
                        Object obj = modelChuan.getValueAt(row, i);
                        if(obj==null || obj.toString().trim().isEmpty()){
                            isFull = false;
                            break;
                        }
                    }
                    
                    if(isFull){
                        String tenVatTu = (String)modelChuan.getValueAt(row, 0);
                        String soLuong = modelChuan.getValueAt(row, 1).toString();
                        String thanhTien = modelChuan.getValueAt(row, 2).toString();
                        String nhaCungCap = (String) modelChuan.getValueAt(row, 3);
                        if(row == editingRow){
                            controller.themChiTietNhapVaoModel(tenVatTu, soLuong, thanhTien, nhaCungCap, maGiaoDich);
                            editingRow = -1;
                        }
                        else{
                            controller.capNhatChiTietNhapVaoModel(tenVatTu, soLuong, thanhTien, nhaCungCap, maGiaoDich);
                        }
                    }
                    
                }
            }
            
        });
        
        
    }
    
    public void refresh(){
        Object[][] data = controller.getChiTietFromModel(maGiaoDich);
        Object[][] dataTable = extractTable(data);
        model = new DefaultTableModel(dataTable, columns);
        setModel(model);
        repaint();
        revalidate();
    }
    
//    public void addItem(String tenNhanVien, String ngayVaoLam, String luong, String chucVu){
//        controller.themNhanVienVaoModel(tenNhanVien, ngayVaoLam, luong, chucVu);
//        refresh();
//    }
//    
//    public void deleteItem(){
//        int maNhanVien = (Integer) model.getValueAt(getSelectedRow(), 0);
//        controller.xoaNhanVien(maNhanVien);
//        refresh();
//    }
//    
//    public void editItem(String tenNhanVien, String ngayVaoLam, String luong, String chucVu){
//        int maNhanVien = (Integer) model.getValueAt(getSelectedRow(), 0);
//        controller.capNhatNhanVienVaoModel(tenNhanVien, ngayVaoLam, luong, chucVu, maNhanVien);
//        refresh();
//    }
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
