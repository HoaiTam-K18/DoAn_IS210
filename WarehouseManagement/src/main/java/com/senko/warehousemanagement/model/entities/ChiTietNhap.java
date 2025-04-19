
package com.senko.warehousemanagement.model.entities;


public class ChiTietNhap {
    private int maGiaoDich;
    private String vatTu;
    private int soLuong;
    private String nhanVien;
    private long thanhTien;
    private String nhaCungCap;

    public ChiTietNhap(int maGiaoDich, String vatTu, int soLuong, String nhanVien, long thanhTien, String nhaCungCap) {
        this.maGiaoDich = maGiaoDich;
        this.vatTu = vatTu;
        this.soLuong = soLuong;
        this.nhanVien = nhanVien;
        this.thanhTien = thanhTien;
        this.nhaCungCap = nhaCungCap;
    }

    public int getMaGiaoDich() {
        return maGiaoDich;
    }

    public void setMaGiaoDich(int maGiaoDich) {
        this.maGiaoDich = maGiaoDich;
    }

    public String getVatTu() {
        return vatTu;
    }

    public void setVatTu(String vatTu) {
        this.vatTu = vatTu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(String nhanVien) {
        this.nhanVien = nhanVien;
    }

    public long getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(long thanhTien) {
        this.thanhTien = thanhTien;
    }

    public String getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(String nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }
    
}
