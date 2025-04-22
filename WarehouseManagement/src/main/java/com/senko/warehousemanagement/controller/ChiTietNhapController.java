
package com.senko.warehousemanagement.controller;

import com.senko.warehousemanagement.model.dao.ChiTietNhapDAO;
import com.senko.warehousemanagement.model.dao.GiaoDichDAO;
import com.senko.warehousemanagement.model.dao.NhaCungCapDAO;
import com.senko.warehousemanagement.model.dao.NhaVanChuyenDAO;
import com.senko.warehousemanagement.model.dao.VatTuDAO;
import com.senko.warehousemanagement.model.entities.ChiTietNhap;
import com.senko.warehousemanagement.model.entities.GiaoDich;
import java.util.ArrayList;

public class ChiTietNhapController {
    private ChiTietNhapDAO model;
    private VatTuDAO modelVT;
    private NhaCungCapDAO modelNCC;
    
    public ChiTietNhapController(){
        model = new ChiTietNhapDAO();
        modelVT = new VatTuDAO();
        modelNCC = new NhaCungCapDAO();
    }
    
    public Object[][] getChiTietFromModel(int maGiaoDich){
        ArrayList<ChiTietNhap> chiTietNhapList = model.getAllChiTietNhap(maGiaoDich);
        
        int colNum = 5;
        int rowNum = chiTietNhapList.size();
        Object[][] data = new Object[rowNum][colNum];
        
        for(int i = 0;i<rowNum;i++){
            data[i][0] = chiTietNhapList.get(i).getMaGiaoDich();
            data[i][1] = chiTietNhapList.get(i).getVatTu();
            data[i][2] = chiTietNhapList.get(i).getSoLuong();
            data[i][3] = chiTietNhapList.get(i).getThanhTien();
            data[i][4] = chiTietNhapList.get(i).getNhaCungCap();
        }
        return data;
    }
    
    public boolean themChiTietNhapVaoModel(String vatTu, String soLuong, String thanhTien, String nhaCungCap, int maGiaoDich){
        if(vatTu.trim().isEmpty()||soLuong.trim().isEmpty()||thanhTien.trim().isEmpty()||nhaCungCap.trim().isEmpty()){
            return false;
        }
        int maVatTu = modelVT.getMaVatTu(vatTu);
        int maNhaCungCap = modelNCC.getMaNhaCungCap(nhaCungCap);
        try{
            model.insertChiTietNhap(maVatTu, Integer.parseInt(soLuong), Long.parseLong(thanhTien), maNhaCungCap, maGiaoDich);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
    
    public boolean xoaChiTietNhap(int maGiaoDich, String vatTu){
        try{
            int maVatTu = modelVT.getMaVatTu(vatTu);
            model.deleteChiTietNhap(maGiaoDich, maVatTu);
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public boolean capNhatChiTietNhapVaoModel(String vatTu, String soLuong, String thanhTien, String nhaCungCap, int maGiaoDich){
        if(vatTu.trim().isEmpty()||soLuong.trim().isEmpty()||thanhTien.trim().isEmpty()||nhaCungCap.trim().isEmpty()){
            return false;
        }
        int maVatTu = modelVT.getMaVatTu(vatTu);
        int maNhaCungCap = modelNCC.getMaNhaCungCap(nhaCungCap);
        try{
            model.updateChiTietNhap(maVatTu, Integer.parseInt(soLuong), Long.parseLong(thanhTien), maNhaCungCap, maGiaoDich);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
}
