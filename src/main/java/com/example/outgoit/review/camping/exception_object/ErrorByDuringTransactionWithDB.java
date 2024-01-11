package com.example.outgoit.review.camping.exception_object;

public class ErrorByDuringTransactionWithDB extends Exception{
    public ErrorByDuringTransactionWithDB(){
        super("DB와 통신하는 도중 오류가 발생했습니다");
    }
}