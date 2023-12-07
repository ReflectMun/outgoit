package com.example.outgoit.review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CampinReviewRepositoryInterface extends JpaRepository<CampingReviewDTO, Long> {
}
