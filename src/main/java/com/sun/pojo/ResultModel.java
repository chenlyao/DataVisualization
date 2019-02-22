package com.sun.pojo;

public class ResultModel {
    public String type;
    public Object data;

    public ResultModel(){
        type="success";
        data=null;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
