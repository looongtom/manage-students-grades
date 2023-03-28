package com.example.quanlysv.servlet.dto.response;

public class BaseResponse<T> {
    private int status;
    private String message;
    private T data;

    public void setStatus(int status) {
        this.status = status;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setData(T data) {
        this.data = data;
    }

    private BaseResponse(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }

    public T getData() {
        return data;
    }

    public static class Builder<T> {
        private int status;
        private String message;
        private T data;

        public Builder<T> setStatus(int status) {
            this.status = status;
            return this;
        }

        public Builder<T> setMessage(String message) {
            this.message = message;
            return this;
        }

        public Builder<T> setData(T data) {
            this.data = data;
            return this;
        }

        public BaseResponse<T> build() {
            return new BaseResponse<>(status, message, data);
        }
    }
}

