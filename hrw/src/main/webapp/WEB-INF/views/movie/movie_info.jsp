<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UtF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 상제 정보</title>
    <link rel="stylesheet" href="../css/movie/movie_info.css"/>
    <link rel="stylesheet" href="../css/common.css">
</head>
<body>

    <jsp:include page="../include/header.jsp" />
    
    <main>
        <section id="movie_info_section">

            <div id="basic_movie_info_title">
                <h1>${MovieInfo.title}</h1>
            </div>

            <article id="basic_movie_info">
                <div id="basic_movie_info_poster">
                    <img src="../images/poster_rank/${MovieInfo.code}.jpg">
                </div>

                <div id="movie_basic_info_list">
                    <dl id="movie_basic_info_description_list">
                        <div class="movie_basic_info_list_item">
                            <dt>코드</dt>
                            <dd>${MovieInfo.code}</dd>
                        </div> 

                        <div class="movie_basic_info_list_item">
                            <dt>A.K.A.</dt>
                            <dd>${MovieInfo.aka}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>요약정보</dt>
                            <dd>${MovieInfo.summary}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>등급분류</dt>
                            <dd><img src="../images/ic_grade/${MovieInfo.rating}.png" id="movie_basic_info_rating_img"></dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>개봉일</dt>
                            <dd>${MovieInfo.releaseDate}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>제작연도</dt>
                            <dd>${MovieInfo.productionYear}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>제작상태</dt>
                            <dd>${MovieInfo.productionCondition}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>크랭크인/업</dt>
                            <dd>${MovieInfo.crankInUp}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>촬영회차</dt>
                            <dd>${MovieInfo.filmingCount}</dd>
                        </div>

                        <div class="movie_basic_info_list_item">
                            <dt>상영타입</dt>
                            <dd>${MovieInfo.screenType}</dd>
                        </div>

                    </dl>
                </div>

            </article>

            <article class="movie_info_content">
                <div class="movie_content_title"> 
                    <h2>시놉시스</h2>
                </div>

                <div class="movie_synopsis_text">
                    ${MovieInfo.synopsis}
                </div>

            </article>

            <article class="movie_info_content">
                <div class="movie_content_title"> 
                    <h2>감독 / 배우</h2>
                </div>

                <div class="movie_info_table_content">
                  <table class="movie_info_table">
                    <tr>
                        <th>감독</th>
                        <td>${MovieInfo.director}</td>
                    </tr>

                    <tr>
                        <th>배우</th>
                        <td>${MovieInfo.actor}</td>
                    </tr>


                  </table>
                </div>

            </article>

            <article class="movie_info_content">
                <div class="movie_content_title"> 
                    <h2>영화사</h2>
                </div>

                <div class="movie_info_table_content">
                  <table class="movie_info_table">
                    <tr>
                        <th>제작사</th>
                        <td>${MovieInfo.producer}</td>
                    </tr>

                    <tr>
                        <th>배급사</th>
                        <td>${MovieInfo.distributor}</td>
                    </tr>

                    <tr>
                        <th>수입사</th>
                        <td>${MovieInfo.importer}</td>
                    </tr>

                  </table>
                </div>

            </article>

        </section>
    </main>
    
      <jsp:include page="../include/footer.jsp" />
</body>
</html>