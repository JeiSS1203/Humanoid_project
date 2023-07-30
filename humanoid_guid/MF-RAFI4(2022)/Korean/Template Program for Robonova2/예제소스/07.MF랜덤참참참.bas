
'****************************************
'***** 메탈파이터 기초 프로그램 *******
'****************************************

'******* 변수선언 ***********************
DIM A AS BYTE
DIM B AS BYTE

'*******모터방향설정*********************
DIR G6A,1,0,0,1,0,0	'왼쪽다리:모터0~5번
DIR G6D,0,1,1,0,1,0	'오른쪽다리:모터18~23번
DIR G6B,1,1,1,1,1,1	'왼쪽팔:모터6~11번
DIR G6C,0,0,0,0,0,0	'오른쪽팔:모터12~17번


'*******모터동시제어설정****************
PTP SETON 		'단위그룹별 점대점동작 설정
PTP ALLON		'전체모터 점대점 동작 설정

'*******모터위치값피드백****************
GOSUB MOTOR_GET

'*******모터사용설정********************
GOSUB MOTOR_ON

'*******피에조소리내기******************
TEMPO 220
MUSIC "O23EAB7EA>3#C"
'***** 초기자세로 **********************
SPEED 5
GOSUB 기본자세
OUT 52,0


MAIN:

    ERX 4800,A,MAIN
    IF A = 1 THEN
        B = RND
        B = B MOD 3

        IF B = 0 THEN
            GOSUB 참참참_왼쪽
        ELSEIF B = 1 THEN
            GOSUB 참참참_오른쪽
        ELSEIF B = 2 THEN
            GOSUB 참참참_정면
        ENDIF
    ELSE
        MUSIC "F"	
    ENDIF

    GOTO MAIN
    '***************************************
참참참_왼쪽:
    HIGHSPEED SETON
    SPEED 10
    MOVE G6B, , , , , , 150
    WAIT
    DELAY 1000
    HIGHSPEED SETOFF

    SPEED 15
    GOSUB 기본자세
    RETURN
    '***************************************
참참참_오른쪽:
    HIGHSPEED SETON
    SPEED 10
    MOVE G6B, , , , , , 50
    WAIT
    DELAY 1000
    HIGHSPEED SETOFF

    SPEED 15 	
    GOSUB 기본자세
    RETURN
    '***************************************
참참참_정면:
    HIGHSPEED SETON
    SPEED 10
    MOVE G6B, , , , , , 110
    WAIT
    MOVE G6B, , , , , , 90
    WAIT	
    MOVE G6B, , , , , , 100
    WAIT	
    DELAY 1000
    HIGHSPEED SETOFF

    SPEED 15 	
    GOSUB 기본자세
    RETURN
    '***************************************

    '************************************
    '************************************
MOTOR_ON: '전포트서보모터사용설정
    MOTOR G24
    RETURN

    '***********************************
MOTOR_OFF: '전포트서보모터설정해제
    MOTOROFF G6B
    MOTOROFF G6C
    MOTOROFF G6A
    MOTOROFF G6D
    RETURN
    '***********************************
MOTOR_GET: '위치값피드백
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,1
    GETMOTORSET G6C,1,1,1,0,0,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN


    '*******기본자세관련*****************

기본자세:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT
    RETURN
    '*************************************	
차렷자세:
    MOVE G6A,100, 56, 182, 76, 100, 100
    MOVE G6D,100, 56, 182, 76, 100, 100
    MOVE G6B,100, 20, 90, 100, 100, 100
    MOVE G6C,100, 20, 90, 100, 100, 100
    WAIT
    RETURN
    '**************************************
앉은자세:

    MOVE G6A,100, 143,  28, 142, 100, 100
    MOVE G6D,100, 143,  28, 142, 100, 100
    MOVE G6B,100,  30,  80
    MOVE G6C,100,  30,  80
    WAIT
    RETURN
    '***************************************