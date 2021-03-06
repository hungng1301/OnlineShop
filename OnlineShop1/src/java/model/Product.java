/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Edwars
 */
public class Product {

    private int pid;
    private String thumbnail;
    private String title;
    private double lprice;
    private double sprice;
    private String featured;
    private int productStatus;
    private int categoryID;
    private String breif;
    private int quantity;
    private Date updatedDate;
    private int salesId;
    private User author;
    private Setting cate;
    private double ratedStars;
    private int views;
    

    public Product() {

    }

    public Product(int pid, String thumbnail, String title, double lprice, double sprice, String featured, int productStatus, int categoryID, String breif, int quantity, Date updatedDate, int salesId, double ratedStars) {
        this.pid = pid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.lprice = lprice;
        this.sprice = sprice;
        this.featured = featured;
        this.productStatus = productStatus;
        this.categoryID = categoryID;
        this.breif = breif;
        this.quantity = quantity;
        this.updatedDate = updatedDate;
        this.salesId = salesId;
        this.ratedStars = ratedStars;
    }

    public Product(int pid, String thumbnail, String title, double lprice, double sprice, int categoryID, Date updatedDate, User author, double ratedStars) {
        this.pid = pid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.lprice = lprice;
        this.sprice = sprice;
        this.categoryID = categoryID;
        this.updatedDate = updatedDate;
        this.author = author;
        this.ratedStars = ratedStars;
    }

    public Product(int pid, String thumbnail, String breif, String title, double lprice, double sprice, int categoryID, Date updatedDate, User author, Setting cate, double ratedStars) {
        this.pid = pid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.breif = breif;
        this.lprice = lprice;
        this.sprice = sprice;
        this.categoryID = categoryID;
        this.updatedDate = updatedDate;
        this.author = author;
        this.cate = cate;
        this.ratedStars = ratedStars;
    }
    
    public Product(int pid,String thumbnail, String title, double lprice, double sprice, int views) {
        this.pid = pid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.lprice = lprice;
        this.sprice = sprice;
        this.views = views;
    }
    
    public Product(int pid,String thumbnail, String title, double lprice, double sprice) {
        this.pid = pid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.lprice = lprice;
        this.sprice = sprice;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getLprice() {
        return lprice;
    }

    public void setLprice(double lprice) {
        this.lprice = lprice;
    }

    public double getSprice() {
        return sprice;
    }

    public void setSprice(double sprice) {
        this.sprice = sprice;
    }

    public String getFeatured() {
        return featured;
    }

    public void setFeatured(String featured) {
        this.featured = featured;
    }

    public int getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(int productStatus) {
        this.productStatus = productStatus;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getBreif() {
        return breif;
    }

    public void setBreif(String breif) {
        this.breif = breif;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public int getSalesId() {
        return salesId;
    }

    public void setSalesId(int salesId) {
        this.salesId = salesId;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Setting getCate() {
        return cate;
    }

    public void setCate(Setting cate) {
        this.cate = cate;
    }

    public double getRatedStars() {
        return ratedStars;
    }

    public void setRatedStars(double ratedStars) {
        this.ratedStars = ratedStars;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

}
