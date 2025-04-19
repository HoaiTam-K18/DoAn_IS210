
package com.senko.warehousemanagement.model.entities;

import java.time.LocalDate;


public class GiaoDich {
    private int maGiaoDich;
    private String loaiGiaoDich;
    private LocalDate thoiGian;
    private long thanhTien;
    private String nhaVanChuyen;

    public GiaoDich(int maGiaoDich, String loaiGiaoDich, LocalDate thoiGian, long thanhTien, String nhaVanChuyen) {
        this.maGiaoDich = maGiaoDich;
        this.loaiGiaoDich = loaiGiaoDich;
        this.thoiGian = thoiGian;
        this.thanhTien = thanhTien;
        this.nhaVanChuyen = nhaVanChuyen;
    }

    public int getMaGiaoDich() {
        return maGiaoDich;
    }

    public void setMaGiaoDich(int maGiaoDich) {
        this.maGiaoDich = maGiaoDich;
    }

    public String getLoaiGiaoDich() {
        return loaiGiaoDich;
    }

    public void setLoaiGiaoDich(String loaiGiaoDich) {
        this.loaiGiaoDich = loaiGiaoDich;
    }

    public LocalDate getThoiGian() {
        return thoiGian;
    }

    public void setThoiGian(LocalDate thoiGian) {
        this.thoiGian = thoiGian;
    }

    public long getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(long thanhTien) {
        this.thanhTien = thanhTien;
    }

    public String getNhaVanChuyen() {
        return nhaVanChuyen;
    }

    public void setNhaVanChuyen(String nhaVanChuyen) {
        this.nhaVanChuyen = nhaVanChuyen;
    }
}
