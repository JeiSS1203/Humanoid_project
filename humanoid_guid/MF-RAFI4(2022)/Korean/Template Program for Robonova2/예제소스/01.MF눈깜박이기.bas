'****************************************
'*** 메탈파이터 눈깜박거리기 프로그램 ***
'****************************************
'***** 눈 LED 포트 52번 **********
MAIN:	'반복하기위한 라벨선언

    OUT 52,1 	'눈 LED 끄기
    DELAY 1000	'지연시간 1초 기다리기

    OUT 52,0	'눈 LED 켜기
    DELAY 1000	'지연시간 1초 기다리기


    GOTO MAIN	'MAIN 라벨로 가기
'****************************************