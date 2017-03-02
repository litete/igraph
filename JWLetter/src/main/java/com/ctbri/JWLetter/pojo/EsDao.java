package com.ctbri.JWLetter.pojo;

import java.util.ArrayList;

/**
 * Created by lite on 2017/3/2.
 */
public class EsDao {
    private int id;
    private String title;
    private String contents;
    private String author;
    private String submiteDatetime;
    private String attachments;
    private int readornot;
    private int status;
    private int categoryname;
    private ArrayList tagname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSubmiteDatetime() {
        return submiteDatetime;
    }

    public void setSubmiteDatetime(String submiteDatetime) {
        this.submiteDatetime = submiteDatetime;
    }

    public String getAttachments() {
        return attachments;
    }

    public void setAttachments(String attachments) {
        this.attachments = attachments;
    }

    public int getReadornot() {
        return readornot;
    }

    public void setReadornot(int readornot) {
        this.readornot = readornot;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(int categoryname) {
        this.categoryname = categoryname;
    }

    public ArrayList getTagname() {
        return tagname;
    }

    public void setTagname(ArrayList tagname) {
        this.tagname = tagname;
    }
}
