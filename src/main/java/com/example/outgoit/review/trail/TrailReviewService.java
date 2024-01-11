package com.example.outgoit.review.trail;

import com.example.outgoit.review.camping.CampingReview;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@Service
public class TrailReviewService {

    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final TrailReviewRepositoryInterface repo;

    public TrailReviewService(TrailReviewRepositoryInterface repo) {
        this.repo = repo;
    }
    ////////////////////////////////////////////////////////////////////////////

    ///////////////////////////// 서비스 구현 /////////////////////////////////////
    // 해당 등산로의 리뷰 모두 불러오는 메서드
    public Page<TrailReview> loadTrailRouteReview(String trailRouteId, Pageable pageable) {
        return this.repo.findAllByTrailRouteIdAndIsDeletedFalse(trailRouteId, pageable);
    }

    // 리뷰 내용을 수정하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public int updateReviewContent(TrailReview trailReview) {
        String encryptedPassword = null;

        try {
            MessageDigest hashing = MessageDigest.getInstance("SHA3-512");
            hashing.reset();
            hashing.update(trailReview.getPassword().getBytes("utf8"));
            encryptedPassword = String.format("%0128x", new BigInteger(1, hashing.digest()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return 0;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return 0;
        }

        try {
            if(!isPasswordMatch(encryptedPassword, trailReview.getCommentNumber())){
                System.out.printf("비밀번호가 일치하지 않아 리뷰를 수정할 수 없음, 댓글번호: %s\n", trailReview.getCommentNumber());
                return 0;
            }
        } catch (IndexOutOfBoundsException e) {
            System.out.printf("이미 삭제됐거나 존재하지 않는 리뷰의 수정을 시도함, 댓글번호: %s\n", trailReview.getCommentNumber());
        }

        return this.repo.updateContentByCommentNumber(
                trailReview.getContent(),
                (long) Math.toIntExact(trailReview.getCommentNumber()),
                trailReview.getRating()
        );
    }

    // 리뷰를 삭제하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public int deleteReview(String password, Long commentNumber) {
        String encryptedPassword = null;

        try {
            MessageDigest hashing = MessageDigest.getInstance("SHA3-512");
            hashing.reset();
            hashing.update(password.getBytes("utf8"));
            encryptedPassword = String.format("%0128x", new BigInteger(1, hashing.digest()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return 0;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return 0;
        }

        try {
            if(!isPasswordMatch(encryptedPassword, commentNumber)){
                System.out.printf("비밀번호가 일치하지 않아 리뷰를 수정할 수 없음, 댓글번호: %s\n", commentNumber);
                return 0;
            }
        } catch (Exception e) {
            System.out.printf("이미 삭제됐거나 존재하지 않는 리뷰의 수정을 시도함, 댓글번호: %s\n", commentNumber);
        }

        int countOfDeletedRecord = this.repo.deleteByCommentNumber(commentNumber);
        System.out.printf("총 %d개의 리뷰가 삭제됨. 레코드 넘버: %d\n", countOfDeletedRecord, commentNumber);
        return 1;
    }

    // 리뷰 작성
    public int submitReview(
            String author,
            String password,
            String content,
            int rating,
            String trailRouteId
    ) {
        if(password == null) {
            System.out.println("비밀번호 값이 null임");
            return 0;
        }
        repo.save(new TrailReview(
                author,
                password,
                content,
                rating,
                trailRouteId
        ));
        System.out.println("새로운 리뷰가 작성됨");
        return 1;
    }

    // 등산로 평점 조회
    public ArrayList<Object> getTrailRouteRating(String trailRouteId) {
        return new ArrayList<>(this.repo.findAvgRatingByTrailRouteId(trailRouteId));
    }

    private Boolean isPasswordMatch(String password, Long commentId){
        TrailReview review = repo.findByCommentNumberAndIsDeletedFalse(commentId).get(0);
        return review.getPassword().equals(password);
    }
}
