
package com.senko.warehousemanagement.controller;

import com.senko.warehousemanagement.model.dao.GiaoDichDAO;
import com.senko.warehousemanagement.model.dao.NhaVanChuyenDAO;
import com.senko.warehousemanagement.model.entities.GiaoDich;
import java.sql.Date;
import java.util.ArrayList;

public class GiaoDichController {
    private GiaoDichDAO model;
    private NhaVanChuyenDAO modelNVC;
    
    public GiaoDichController(){
        model = new GiaoDichDAO();
        modelNVC = new NhaVanChuyenDAO();
    }
    
    public Object[][] getGiaoDichFromModel(){
        ArrayList<GiaoDich> giaoDichList = model.getAllGiaoDich();
        
        int colNum = 5;
        int rowNum = giaoDichList.size();
        Object[][] data = new Object[rowNum][colNum];
        
        for(int i = 0;i<rowNum;i++){
            data[i][0] = giaoDichList.get(i).getMaGiaoDich();
            data[i][1] = giaoDichList.get(i).getLoaiGiaoDich();
            data[i][2] = giaoDichList.get(i).getThoiGian();
            data[i][3] = giaoDichList.get(i).getThanhTien();
            data[i][4] = giaoDichList.get(i).getNhaVanChuyen();
            
        }
        return data;
    }
    
    public boolean themGiaoDichVaoModel(String loaiGiaoDich,  String nhaVanChuyen){
        if(loaiGiaoDich.trim().isEmpty()||nhaVanChuyen.trim().isEmpty()){
            return false;
        }
        int maNhaVanChuyen = modelNVC.getNhaVanChuyen(nhaVanChuyen);
        try{
            model.insertGiaoDich(loaiGiaoDich, maNhaVanChuyen);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
    public boolean xoaGiaoDich(int maGiaoDich){
        try{
            model.deleteGiaoDich(maGiaoDich);
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    public boolean capNhatGiaoDichVaoModel(String loaiGiaoDich,  String nhaVanChuyen, int maGiaoDich){
        if(loaiGiaoDich.trim().isEmpty()||nhaVanChuyen.trim().isEmpty()){
            return false;
        }
        int maNhaVanChuyen = modelNVC.getNhaVanChuyen(nhaVanChuyen);
        try{
            model.updateGiaoDich(loaiGiaoDich, maNhaVanChuyen, maGiaoDich);
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    
    }
}
