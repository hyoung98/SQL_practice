/*������ ������, ����, ���ɴ뺰 �α��� ���ϱ�*/
/*
��������
��ü�α���
���ɺ� �α���
����
���ɱ���*/
CREATE TABLE TB_TEMPER_DATA
(
    DISTRICT CHAR(21)
,   TOTAL_P NUMBER(10,1)
,   AGE_P NUMBER(10,1)
,   GENDER CHAR(3)
,   SECTION CHAR(15)
);

/*�ڵ� �ۼ��ϱ�*/
SELECT COUNT(*) FROM TB_TEMPER;
SELECT COUNT(*) FROM TB_TEMPER_DATA;

/*���̺� �����*/
CREATE TABLE TB_TEMPER
(
    DISTRICT CHAR(21)
,   TOTAL_P NUMBER(10,1)
,   AGE_P NUMBER(10,1)
,   GENDER CHAR(3)
,   AGE_SECTION CHAR(15)
);

SELECT * FROM TB_TEMPER_DATA;

/*�����ͺм��� �ϱ� ���ؼ� ���̺� ������ ���纻 �����*/
INSERT INTO TB_TEMPER
	SELECT
   	  DISTRICT
 	, TOTAL_P
 	, AGE_P
 	, GENDER
 	, SECTION
	FROM TB_TEMPER_DATA;

SELECT * FROM TB_TEMPER;
SELECT COUNT(*) FROM TB_TEMPER; 


COMMIT; 

SELECT *
FROM (TB_TEMPER);

/*1*/
/*�������� �α��� �հ� ���ϱ�*/
SELECT
A.DISTRICT 
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.DISTRICT 
;

/*2*/
/*������������ Ȯ���ϱ�*/
SELECT
A.DISTRICT 
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.DISTRICT 
ORDER BY SUM_AGE_P DESC
;
/* �α������� ���� ����
��⵵->���->�λ�->��󳲵�->��õ->���ϵ�->�뱸->��û����->���󳲵�->����ϵ�->��û�ϵ�->������->����->����->���->����->����*/

/*2-1*/
/*���ɴ뺰 �α��� ���*/
SELECT
A.AGE_SECTION
, ROUND(AVG(A.AGE_P),2) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.AGE_SECTION
ORDER BY SUM_AGE_P DESC
;

/*3*/
/*������ ������ �α��� Ȯ���ϱ�*/
SELECT
A.DISTRICT ,A.GENDER 
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.DISTRICT, A.GENDER 
ORDER BY A.GENDER,SUM_AGE_P DESC
;

/*3-3*/
SELECT
A.GENDER 
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
WHERE A.GENDER IN ('��','��')
GROUP BY A.GENDER
ORDER BY SUM_AGE_P DESC
;
/*
 �� : 51479294
 �� : 51144608 */


/*4*/
SELECT
A.AGE_SECTION
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.AGE_SECTION
ORDER BY SUM_AGE_P DESC
;

/*50�� -> 40�� -> 60�� -> 30�� -> 20�� -> 10�� -> 10��̸� -> 70�� -> 80�� -> 90�� -> 100�� �̻�*/
/*50���� �α����� ���� ���ٴ� ���� �� �� �ִ�.*/

/*5 ���ɺ� �� ���� ���� �α���*/
SELECT
A.AGE_SECTION,A.GENDER 
, SUM(A.AGE_P) AS SUM_AGE_P
FROM TB_TEMPER A
GROUP BY A.AGE_SECTION,A.GENDER 
ORDER BY A.AGE_SECTION,SUM_AGE_P DESC
;

/*���ɺ� �� ���� ���� �α���
 * 10��̸� = ��
 * 10�� = ��
 * 20�� = ��
 * 30�� = ��
 * 40�� = ��
 * 50�� = ��
 * 60�� = ��
 * 70�� = ��
 * 80�� = ��
 * 90�� = ��
 * 100���̻� = �� */