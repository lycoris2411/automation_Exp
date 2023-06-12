*** Keywords ***
เปืด Google
    Open Browser    url=${url}    browser=${browser}

กรอกคำค้นหา
    [Arguments]    ${inputText}
    Wait Until Element Is Visible    name=q    10s
    Input Text    name=q    ${inputText}

กดค้นหา
    Wait Until Element Is Visible    name=q    10s
    Press Keys    name=q    RETURN

ตรวจสอบช้อมูลคำค้นหา
    [Arguments]    ${expected}    ${search_value}
    Page Should Contain    ${expected}
    Wait Until Element Is Visible    name=q    10s
    ${output}    Get Text    id=result-stats
    Log    ${output}
    ${word}    Split String    ${output}    ${SPACE}
    log    ${word}[1]
    #Should Be Equal    ${word}[1]    ${search_value}

ปิดหน้าเว็บ
    Close Browser

ค้นหาข้อมูล และตรวจสอบข้อมูล
    [Arguments]    ${InputText}    ${expected}    ${search_value}
    กรอกคำค้นหา    ${InputText}
    กดค้นหา
    ตรวจสอบช้อมูลคำค้นหา    ${expected}    ${search_value}
########################################################################### Assignment ###########################################################################
เปิดเว็บทดสอบ
    Open Browser    url=${url}    browser=${browser}

กรอก username
    [Arguments]    ${username}
    Wait Until Element Is Visible    name=username    10s
    Input Text    name=username    ${username}

กรอก password
    [Arguments]    ${password}
    Wait Until Element Is Visible    name=password    10s
    Input Text    name=password    ${password}

กดปุ่ม Login
    Press Keys    xpath=//button[@type='submit']    RETURN

ทำการ Logout
    Click Link    xpath=//*[@id="content"]/div/a

ทำการ Login
    [Arguments]    ${username}    ${password}
    กรอก username   ${username}
    กรอก password    ${password}
    กดปุ่ม Login

ตรวจสอบว่า Login สำเร็จ
    ตรวจสอบข้อมูลหลังกด Login    You logged into a secure area!
    ทำการ Logout

ตรวจสอบว่า Login ไม่สำเร็จโดย username ผิดหรือเว้นว่าง
    ตรวจสอบข้อมูลหลังกด Login    Your username is invalid!

ตรวจสอบว่า Login ไม่สำเร็จโดย password ผิดหรือเว้นว่าง
    ตรวจสอบข้อมูลหลังกด Login    Your password is invalid!

ตรวจสอบข้อมูลหลังกด Login
    [Arguments]    ${expected}
    Element Should Contain    xpath=//*[@id="flash"]    ${expected}

ย้อนกลับไปหน้าก่อนหน้า
    Go Back
