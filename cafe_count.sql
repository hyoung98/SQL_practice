/*�һ���ν����������_��(���)����_����_202206
  ���������� ���� �ڷ� �̿�*/

/*��ȣ��  name
��Ǿ����ߺз��� class
�õ���  city */
CREATE TABLE CAFECOUNT_DATA
(
    BRAND_NAME VARCHAR(100)
,   CLASSN VARCHAR(100)
,   CITY VARCHAR(50)
);

/*DROP TABLE CAFECOUNT_DATA; */
/*�ڵ� �ۼ��ϱ�*/
SELECT COUNT(*) FROM CAFECOUNT_DATA; /*346229*/

/*���̺� �����*/
CREATE TABLE CAFECOUNT
(
    BRAND_NAME VARCHAR(100)
,   CLASSN VARCHAR(100)
,   CITY VARCHAR(50)
);

SELECT * FROM CAFECOUNT_DATA;

/*�����ͺм��� �ϱ� ���ؼ� ���̺� ������ ���纻 �����*/
INSERT INTO CAFECOUNT
	SELECT
   	  BRAND_NAME
 	, CLASSN
 	, CITY
	FROM CAFECOUNT_DATA;

SELECT COUNT(*) FROM CAFECOUNT; /*346229*/
SELECT * FROM CAFECOUNT;

/*��Ÿ���� ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%��Ÿ����%'; 
/*ī���̸� �߿� ��Ÿ������ ���Ե� ī���̸��� �� 465��*/

/*�̵�� ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%�̵��%' OR BRAND_NAME LIKE '%�̵��%';
/*ī���̸� �߿� �̵�߰� ���Ե� ī���̸��� �� 458��*/

/*�����÷��̽� ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%����%'; 
/*ī���̸� �߿� ������ ���Ե� ī���̸��� �� 250��*/

/*���ٹ� ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%���ٹ�%'; 
/*ī���̸� �߿� ���ٹ��� ���Ե� ī���̸��� �� 163��*/

/*�ް� ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%�ް�%'; 
/*ī���̸� �߿� �ް� ���Ե� ī���̸��� �� 390��*/

/*������ ���� Ȯ���ϱ�*/
SELECT COUNT(*)  FROM CAFECOUNT
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%������%'; 
/*ī���̸� �߿� ����� ���Ե� ī���̸��� �� 191��*/


/*������ ��Ÿ���� ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%��Ÿ����%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* ��Ÿ����
  ������ : 76���� ���� ���� ������ �־���.
  �߱� : 42
  ���ʱ� : 38�� */
  

/*�̵�� ��Ÿ���� ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%�̵��%' OR BRAND_NAME LIKE '%�̵��%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* �̵��
  ������ : 41���� ���� ���� ������ �־���.
  ������ : 29
  ���ı� : 29�� */


/*������ ���� ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%����%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* ����
  ������ : 33���� ���� ���� ������ �־���.
  �߱� : 25
  ������ : 18�� */
  

/*������ ���ٹ� ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%���ٹ�%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* ���ٹ�
  ���ϱ� : 13���� ���� ���� ������ �־���.
  ����� : 11
  ������ : 10�� */


/*������ �ް� ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%�ް�%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* �ް�
  ������ : 30���� ���� ���� ������ �־���.
  ���ı� : 21
  ���α� : 21�� */
  
/*������ ������ ���� Ȯ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%������%'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC
; 
/* ������
  ������ : 17���� ���� ���� ������ �־���.
  �߱� : 13
  ���ʱ� : 13�� */
  
  /*��� : ��Ÿ������ �������� ���� ������, Ư�� �������� ���� �����ϰ� �ִ�. 
        -> �������� �����α����� ���ų� �����α����� ���ٴ� ���̶�� ���� ������ �� �ִ�.*/
        
        
/*������ ī�� �� ���ϱ�*/
SELECT A.CITY ,COUNT(*)
FROM CAFECOUNT A
WHERE CLASSN = 'Ŀ����/ī��'
GROUP BY A.CITY
ORDER BY COUNT(*) DESC;
/*������ : 2138
  ������ : 1550
  ���ʱ� : 1178
  ���ı� : 1173
  ������ : 1080*/
  
/*������ ��Ÿ����, �̵��, ����, ���ٹ�, �ް�, ������ ������������ ī�� �� ���ϱ�*/
SELECT A.CITY ,COUNT(*)
    FROM CAFECOUNT A
        WHERE CLASSN = 'Ŀ����/ī��' AND BRAND_NAME LIKE '%��Ÿ����%' OR BRAND_NAME LIKE '%�̵��%' OR BRAND_NAME LIKE '%�̵��%'
            OR BRAND_NAME LIKE '%����%' OR BRAND_NAME LIKE '%���ٹ�%'
            OR BRAND_NAME LIKE '%�ް�%' OR BRAND_NAME LIKE '%������%'
        GROUP BY A.CITY
        ORDER BY COUNT(*) DESC;
/*������ : 200
  ������	: 136
  ���ı�	: 128
  ������	: 111
  �߱�	: 109*/
    
    
   /*��� : �������� ī���� ���� ���� ���� ���� �� �� �ִ�.
        -> �������� �����α����� ���ų� �����α����� ���ٴ� ���̶�� ���� ������ �� �ִ�.*/
    
    
    
