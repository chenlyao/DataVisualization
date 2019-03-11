package com.sun.pojo;

/**
 * 自定义异常类
 */
public class CustomException extends Exception {
    //异常信息
    public String message;

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public CustomException(String message) {
        super(message);
        this.message = message;
    }
}
