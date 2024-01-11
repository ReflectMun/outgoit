package com.example.outgoit.encrypt;

import com.example.outgoit.review.camping.CampingReview;
import com.example.outgoit.review.trail.TrailReview;
import org.springframework.lang.NonNull;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class EncryptService {
    public String getEncryptedPassword(@NonNull String password){
        return BCrypt.hashpw(password, BCrypt.gensalt(10));
    }

    public Boolean isPasswordMatch_Camping(@NonNull String password, @NonNull CampingReview review){
        return BCrypt.checkpw(password, review.getPassword());
    }

    public Boolean isPasswordMatch_Trail(@NonNull String password, @NonNull TrailReview review){
        return BCrypt.checkpw(password, review.getPassword());
    }
}
