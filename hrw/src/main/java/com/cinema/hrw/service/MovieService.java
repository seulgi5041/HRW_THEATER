package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.dto.OldMovieDTO;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OldMovieEntity;
import com.cinema.hrw.repository.MovieRepository;
import com.cinema.hrw.repository.OldMovieRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieService {
    @PersistenceContext
    private EntityManager entityManager;

    private final MovieRepository movieRepository;
    private final OldMovieRepository oldMovieRepository;
    private static final Logger logger = LoggerFactory.getLogger(MovieService.class);

    public List<MovieDTO> selectAllTitle() { /* 모든영화가져기 */
        List<MovieEntity> movieEntities = movieRepository.findAll();
        logger.info("Movie Entities: {}", movieEntities);

        List<MovieDTO> movieList = new ArrayList<>();
        for (MovieEntity movieEntity : movieEntities) {
            MovieDTO movieDTO = new MovieDTO();
            movieDTO = movieDTO.toMovieDTO(movieEntity);
            movieList.add(movieDTO);
        }

        return movieList;
    }

    public List<MovieDTO> selectTop10ByAdvanceReservationRate() { /* 실시간예매율기준상위 10개만 가져오기 */
        List<MovieEntity> top10Movies = movieRepository.findTop10ByOrderByAdvanceReservationRateDesc();

        List<MovieDTO> movieList = new ArrayList<>();
        for (MovieEntity movieEntity : top10Movies) {
            MovieDTO movieDTO = new MovieDTO();
            movieDTO = movieDTO.toMovieDTO(movieEntity);
            movieList.add(movieDTO);
        }

        return movieList;
    }

    public MovieDTO selectMovieInfo(MovieDTO movieDTO) { /* 선택한 영화 정보가져오기 */
        MovieEntity choicedMovieInfoEntity = movieRepository.findByCode(movieDTO.getCode());

        MovieDTO choicedMovieInfo = movieDTO.toMovieDTO(choicedMovieInfoEntity);
        return choicedMovieInfo;
    }

    public List<MovieDTO> selectNowMovieList(String searchInputKeyword) { /* 현재상영작 주전 */
        StringBuilder whereClauses = new StringBuilder();
        String[] searchKeywords = searchInputKeyword.split("#");
        for (int i = 0; i < searchKeywords.length; i++) {
            searchKeywords[i] = searchKeywords[i].trim();
        }

        for (String term : searchKeywords) {
            if (!term.equals("")) {
                whereClauses.append("CONCAT(m.actor, m.director, m.summary, m.title) LIKE '%" + term + "%' OR ");
            }
        }

        // WHERE 부분 끝 부분 제거
        if (whereClauses.length() > 0) {
            whereClauses.setLength(whereClauses.length() - 4); // " OR "를 제거
        }

        // 동적으로 CASE 문 생성
        StringBuilder caseClauses = new StringBuilder();
        for (String term : searchKeywords) {
            if (!term.equals("")) {
                caseClauses.append("CASE WHEN CONCAT(m.actor, m.director, m.summary, m.title) LIKE '%" + term
                        + "%' THEN 1 ELSE 0 END + ");
            }

        }

        // CASE 문 문자열 끝 부분 제거
        if (caseClauses.length() > 0) {
            caseClauses.setLength(caseClauses.length() - 3); // " + "를 제거
        }

        // JPQL 동적 쿼리 생성
        String jpql = "SELECT m , (" + caseClauses.toString() + ") AS match_count FROM MovieEntity m";
        if (whereClauses.length() > 0) {
            jpql += " WHERE " + whereClauses.toString() + " ORDER BY match_count DESC";

        }

        // JPQL 쿼리를 생성하고 실행
        TypedQuery<Object[]> query = entityManager.createQuery(jpql, Object[].class);
        query.setFirstResult(0); // Offset
        query.setMaxResults(3);
        List<Object[]> results = query.getResultList();

        List<MovieEntity> nowMovieSearchListEntity = new ArrayList<>();
        // 결과 처리
        for (Object[] result : results) {
            MovieEntity nowMovieSearchEntity = (MovieEntity) result[0];
            nowMovieSearchListEntity.add(nowMovieSearchEntity);
        }

        List<MovieDTO> nowMovieSearch = new ArrayList<>();
        for (MovieEntity movieEntity : nowMovieSearchListEntity) {
            MovieDTO movieDTO = new MovieDTO();
            movieDTO.setCode(movieEntity.getCode());
            nowMovieSearch.add(movieDTO);
        }

        return nowMovieSearch;

    }

    public List<OldMovieDTO> selectPrevMovieList(String searchInputKeyword) {/* 지난상역작중 검색어와 관련된영화 10개 가져오기 */
        StringBuilder whereClauses = new StringBuilder();
        String[] searchKeywords = searchInputKeyword.split("#");
        for (int i = 0; i < searchKeywords.length; i++) {
            searchKeywords[i] = searchKeywords[i].trim();
        }

        for (String term : searchKeywords) {
            if (!term.equals("")) {
                whereClauses.append("CONCAT(m.actor, m.director, m.summary, m.title) LIKE '%" + term + "%' OR ");
            }
        }

        // WHERE 부분 끝 부분 제거
        if (whereClauses.length() > 0) {
            whereClauses.setLength(whereClauses.length() - 4); // " OR "를 제거
        }

        // 동적으로 CASE 문 생성
        StringBuilder caseClauses = new StringBuilder();
        for (String term : searchKeywords) {
            if (!term.equals("")) {
                caseClauses.append("CASE WHEN CONCAT(m.actor, m.director, m.summary, m.title) LIKE '%" + term
                        + "%' THEN 1 ELSE 0 END + ");
            }

        }

        // CASE 문 문자열 끝 부분 제거
        if (caseClauses.length() > 0) {
            caseClauses.setLength(caseClauses.length() - 3); // " + "를 제거
        }

        // JPQL 동적 쿼리 생성
        String jpql = "SELECT m , (" + caseClauses.toString() + ") AS match_count FROM OldMovieEntity m";
        if (whereClauses.length() > 0) {
            jpql += " WHERE " + whereClauses.toString() + " ORDER BY match_count DESC";

        }

        // JPQL 쿼리를 생성하고 실행
        TypedQuery<Object[]> query = entityManager.createQuery(jpql, Object[].class);
        query.setFirstResult(0); // Offset
        query.setMaxResults(10);
        List<Object[]> results = query.getResultList();

        List<OldMovieEntity> oldMovieSearchListEntity = new ArrayList<>();
        // 결과 처리
        for (Object[] result : results) {
            OldMovieEntity oldMovieSearchEntity = (OldMovieEntity) result[0];
            double matchRate = ((double) ((Integer) result[1]) / (double) searchKeywords.length) * 100;
            oldMovieSearchEntity.setMatchRate(matchRate);
            oldMovieSearchListEntity.add(oldMovieSearchEntity);
        }

        List<OldMovieDTO> oldMovieSearch = new ArrayList<>();
        for (OldMovieEntity oldMovieEntity : oldMovieSearchListEntity) {
            OldMovieDTO oldMovieDTO = new OldMovieDTO();
            oldMovieDTO.setCode(oldMovieEntity.getCode());
            oldMovieDTO.setTitle(oldMovieEntity.getTitle());
            oldMovieDTO.setMatchRate(oldMovieEntity.getMatchRate());
            oldMovieSearch.add(oldMovieDTO);
        }

        return oldMovieSearch;
    }

    public OldMovieDTO selectOldMovieInfo(OldMovieDTO oldMovieDTO) {

        OldMovieEntity choicedMovieInfoEntity = oldMovieRepository.findByCode(oldMovieDTO.getCode());

        OldMovieDTO choicedMovieInfo = OldMovieDTO.toOldMovieDTO(choicedMovieInfoEntity);
        return choicedMovieInfo;
    }

}