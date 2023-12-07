package com.example.outgoit.review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CampinReviewRepositoryInterface extends JpaRepository<CampingReviewDTO, Long> {
}
