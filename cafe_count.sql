/*소상공인시장진흥공단_상가(상권)정보_서울_202206
  공공데이터 포털 자료 이용*/

/*상호명  name
상권업종중분류명 class
시도명  city */
CREATE TABLE CAFECOUNT_DATA
(
    BRAND_NAME VARCHAR(100)
,   CLASSN VARCHAR(100)
,   CITY VARCHAR(50)
);

/*DROP TABLE CAFECOUNT_DATA; */
/*코드 작성하기*/
SELECT COUNT(*) FROM CAFECOUNT_DATA; /*346229*/

/*테이블 만들기*/
CREATE TABLE CAFECOUNT
(
    BRAND_NAME VARCHAR(100)
,   CLASSN VARCHAR(100)
,   CITY VARCHAR(50)
);

SELECT * FROM CAFECOUNT_DATA;

/*데이터분석을 하기 위해서 테이블 데이터 복사본 만들기*/
INSERT INTO CAFECOUNT
	SELECT
   	  BRAND_NAME
 	, CLASSN
 	, CITY
	FROM CAFECOUNT_DATA;

SELECT COUNT(*) FROM CAFECOUNT; /*346229*/
SELECT * FROM CAFECOUNT;

/*스타벅스 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%스타벅스%'; 
/*카페이름 중에 스타벅스가 포함된 카페이름은 총 465개*/

/*이디야 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%이디야%' OR BRAND_NAME LIKE '%이디아%';
/*카페이름 중에 이디야가 포함된 카페이름은 총 458개*/

/*투썸플레이스 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%투썸%'; 
/*카페이름 중에 투썸이 포함된 카페이름은 총 250개*/

/*빽다방 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%빽다방%'; 
/*카페이름 중에 빽다방이 포함된 카페이름은 총 163개*/

/*메가 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%메가%'; 
/*카페이름 중에 메가 포함된 카페이름은 총 390개*/

/*컴포즈 개수 확인하기*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%컴포즈%'; 
/*카페이름 중에 컴포즈가 포함된 카페이름은 총 191개*/


/*지역별 스타벅스 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%스타벅스%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 스타벅스
  강남구 : 76으로 가장 많은 지점이 있었다.
  중구 : 42
  서초구 : 38개 */
  

/*이디야 스타벅스 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%이디야%' OR BRAND_NAME LIKE '%이디아%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 이디야
  강서구 : 41으로 가장 많은 지점이 있었다.
  강남구 : 29
  송파구 : 29개 */


/*지역별 투썸 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%투썸%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 투썸
  강남구 : 33으로 가장 많은 지점이 있었다.
  중구 : 25
  마포구 : 18개 */
  

/*지역별 빽다방 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%빽다방%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 빽다방
  성북구 : 13으로 가장 많은 지점이 있었다.
  노원구 : 11
  강서구 : 10개 */


/*지역별 메가 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%메가%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 메가
  강서구 : 30으로 가장 많은 지점이 있었다.
  송파구 : 21
  구로구 : 21개 */
  
/*지역별 컴포즈 개수 확인하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%컴포즈%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* 컴포즈
  강남구 : 17으로 가장 많은 지점이 있었다.
  중구 : 13
  서초구 : 13개 */
  
  /*결론 : 스타벅스의 지점수가 가장 많으며, 특히 강남구에 많이 분포하고 있다. 
        -> 강남구에 유동인구수가 많거나 거주인구수가 많다는 것이라는 것을 추측할 수 있다.*/
        
        
/*지역별 카페 수 구하기*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = '커피점/카페'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC;
/*강남구 : 2138
  마포구 : 1550
  서초구 : 1178
  송파구 : 1173
  강서구 : 1080*/
  
/*지역별 스타벅스, 이디야, 투썸, 빽다방, 메가, 컴포즈 프렌차이즈점 카페 수 구하기*/
SELECT A.CITY ,COUNT(*)
    FROM CAFECOUNT A
        WHERE CLASSN = '커피점/카페' AND BRAND_NAME LIKE '%스타벅스%' OR BRAND_NAME LIKE '%이디야%' OR BRAND_NAME LIKE '%이디아%'
            OR BRAND_NAME LIKE '%투썸%' OR BRAND_NAME LIKE '%빽다방%'
            OR BRAND_NAME LIKE '%메가%' OR BRAND_NAME LIKE '%컴포즈%'
        GROUP BY A.CITY
        ORDER BY COUNT(*) DESC;
/*강남구 : 200
  강서구	: 136
  송파구	: 128
  마포구	: 111
  중구	: 109*/
    
    
   /*결론 : 강남구에 카페의 수가 가장 많은 것을 알 수 있다.
        -> 강남구에 유동인구수가 많거나 거주인구수가 많다는 것이라는 것을 추측할 수 있다.*/
    
    
    
