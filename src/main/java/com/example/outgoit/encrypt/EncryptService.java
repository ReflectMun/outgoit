//package com.example.outgoit.encrypt;
//
//import com.example.outgoit.review.camping.CampingReview;
//import org.springframework.security.crypto.bcrypt.BCrypt;
//import org.springframework.stereotype.Service;
//
//@Service
//public class EncryptService {
//    public String getRandomSalt(){
//        return BCrypt.gensalt(128);
//    }
//
//    public String getEncryptedPassword(String password, String salt){
//        return BCrypt.hashpw(password, salt);
//    }
//
//    public Boolean isPasswordMatch_Camping(String password, CampingReview review){
//        return review.getPassword().equals(password);
//    }
//}
