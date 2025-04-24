
package com.senko.warehousemanagement.controller;

import com.senko.warehousemanagement.model.dao.LichSuCapNhatGiaDAO;
import com.senko.warehousemanagement.model.dao.NhanVienDAO;
import com.senko.warehousemanagement.model.dao.VatTuDAO;
import com.senko.warehousemanagement.model.entities.LichSuCapNhatGia;
import com.senko.warehousemanagement.model.entities.NhanVien;
import java.sql.Date;
import java.util.ArrayList;


public class LichSuCapNhatGiaController {
    private LichSuCapNhatGiaDAO model;
    private VatTuDAO modelVT;
    
    public LichSuCapNhatGiaController(){
        model = new LichSuCapNhatGiaDAO();
        modelVT = new VatTuDAO();
    }
    
    public Object[][] getLichSuCapNhatGiaFromModel(){
        ArrayList<LichSuCapNhatGia> lichSuCapNhatGiaList = model.getAllLichSuCapNhatGia();
        
        int colNum = 5;
        int rowNum = lichSuCapNhatGiaList.size();
        Object[][] data = new Object[rowNum][colNum];
        
        for(int i = 0;i<rowNum;i++){
            data[i][0] = lichSuCapNhatGiaList.get(i).getMaLichSuCapNhatGia();
            data[i][1] = lichSuCapNhatGiaList.get(i).getVatTu();
            data[i][2] = lichSuCapNhatGiaList.get(i).getGiaCu();
            data[i][3] = lichSuCapNhatGiaList.get(i).getGiaMoi();
            data[i][4] = lichSuCapNhatGiaList.get(i).getNgayCapNhat();
            
        }
        return data;
    }
    
    public boolean themNhanVienVaoModel(String tenNhanVien, String ngayVaoLam, String luong, String chucVu){
        if(tenNhanVien.trim().isEmpty()||ngayVaoLam.trim().isEmpty()||luong.trim().isEmpty()||chucVu.trim().isEmpty()){
            return false;
        }
        Date nvl = Date.valueOf(ngayVaoLam);
        try{
            model.insertNhanVien(tenNhanVien, nvl, Long.parseLong(luong), chucVu);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
    public boolean xoaNhanVien(int maNhanVien){
        try{
            model.deleteNhanVien(maNhanVien);
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    public boolean capNhatNhanVienVaoModel(String tenNhanVien, String ngayVaoLam, String luong, String chucVu, int maNhanVien){
        if(tenNhanVien.trim().isEmpty()||ngayVaoLam.trim().isEmpty()||luong.trim().isEmpty()||chucVu.trim().isEmpty()){
            return false;
        }
        Date nvl = Date.valueOf(ngayVaoLam);
        try{
            model.updateNhanVien(tenNhanVien, nvl, Long.parseLong(luong), chucVu, maNhanVien);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
}
