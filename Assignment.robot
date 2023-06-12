*** Settings ***
Library    SeleniumLibrary
Library    String
Suite Setup    เปิดเว็บทดสอบ
Suite Teardown    ปิดหน้าเว็บ
Test Setup        Log  กำลังเริ่มทำการทดสอบ
Test Teardown     Reload Page
Resource    page.robot
Resource  variables.robot

*** Test Cases ***
 TC_001 Login ใส่ Username & Password ถูกทั้งสองอย่าง
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 1
     ทำการ Login    tomsmith    SuperSecretPassword!
     ตรวจสอบว่า Login สำเร็จ

 TC_002 Login ใส่ Username & Password โดยกรณี Username ผิดหรือเว้นว่าง
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 2
     ทำการ Login    tomsmit    SuperSecretPassword!
     ตรวจสอบว่า Login ไม่สำเร็จโดย username ผิดหรือเว้นว่าง

TC_003 Login ใส่ Username & Password โดยกรณี Password ผิดหรือเว้นว่าง
    [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 3
    ทำการ Login    tomsmith    SuperSecretPassword!1234
    ตรวจสอบว่า Login ไม่สำเร็จโดย password ผิดหรือเว้นว่าง

TC_004 ไม่กรอกอะไรเลย
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 4
     ทำการ Login    ${EMPTY}    ${EMPTY}
     ตรวจสอบว่า Login ไม่สำเร็จโดย username ผิดหรือเว้นว่าง 

TC_005 Login ใส่ Username & Password โดยกรณี username เว้นว่าง
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 5
     ทำการ Login    ${EMPTY}    SuperSecretPassword!1234
     ตรวจสอบว่า Login ไม่สำเร็จโดย username ผิดหรือเว้นว่าง

TC_006 Login ใส่ Username & Password โดยกรณี password เว้นว่าง
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 6
     ทำการ Login    tomsmith    ${EMPTY}
     ตรวจสอบว่า Login ไม่สำเร็จโดย password ผิดหรือเว้นว่าง

TC_007 Login ใส่ Username & Password โดยกรณีผิดทั้งคู่
     [Setup]    Log  กำลังเริ่มทำการทดสอบ Test Case ที่ 7
     ทำการ Login    abcde    fijk
     ตรวจสอบว่า Login ไม่สำเร็จโดย username ผิดหรือเว้นว่าง
