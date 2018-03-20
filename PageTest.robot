*** Settings ***
Library    Selenium2Library
*** Variables ***
${BROWSER}        chrome
${GOOGLE URL}    http://10.199.66.227/SoftEn2018/Sec01_BS/News/FormNews.php
${topic}    Please identifies your id number.
${detail}    To every one, we need you to identifies youur id in this page.
${curdir}    C:/Users/Jida/Downloads/testpic
${addsuccess}    เพิ่มข่าวเรียบร้อย
${addnotsuccess}    กรุณาใส่หัวข้อข่าว
*** Keywords ***
go google
    Open Browser    ${GOOGLE URL}    ${BROWSER}
addnews
    Click Element    class:dropdown-toggle
    Click Link    News/FormNews.php
    Wait Until Page Contains    เพิ่มข่าวหรือประกาศ
*** Testcases ***
scenenario-1-AddTopic-AddDetail-Addpic-*A News was added successfully
    go google
    Input text    id:Topic    หัวข้อรูปและเนื้อหา
    Input text    id:Content    เนื้อหา
    Choose File    ImageName[]    ${curdir}/testpic1.jpeg
    Click Button    submit
    Wait Until Page Contains    ${addsuccess}
    close Browser
scenenario-2-AddTopic-AddDetail-Nopic-*A News was added successfully
    go google
    Input text    Topic   หัวข้อและเนื้อหา
    Input text    Content    เนื้อหา
    Click Button    submit
    Wait Until Page Contains    ${addsuccess}
    Close Browser
scenenario-3-AddTopic-Nodetail-Addpic-*A News was added successfully
    go google
    Input text    Topic    หัวข้อและรูป
    Choose File    ImageName[]    ${curdir}/testpic2.jpeg
    Click Button    submit
    Wait Until Page Contains    ${addsuccess}
    Close Browser
scenenario-4-AddTopic-Nodetail-Nopic-*A News was added successfully
    go google
    Input text    Topic    หัวข้อเท่านั้น
    Click Button    submit
    Wait Until Page Contains    ${addsuccess}
    Close Browser
scenenario-5-NoTopic-Adddetail-Addpic-*Please Enter The Topic
    go google
    Input text    Content    เนื้อหาและรูปไม่มีหัวข้อ
    Choose File    ImageName[]    ${curdir}/testpic3.jpeg
    Click Button    submit
    Wait Until Page Contains    ${addnotsuccess}
    Close Browser
scenenario-6-NoTopic-Adddetail-Nopic-*Please Enter The Topic
    go google
    Input text    Content    เนื้อหาเท่านั้นไม่มีหัวข้อ
    Click Button    submit
    Wait Until Page Contains    ${addnotsuccess}
    Close Browser
scenenario-7-NoTopic-Nodetail-Addpic-*Please Enter The Topic
    go google
    Choose File    ImageName[]    ${curdir}/testpic3.jpeg
    Click Button    submit
    Wait Until Page Contains    ${addnotsuccess}
    Close Browser
scenenario-8-NoTopic-Nodetail-Nopic-*Please Enter The Topic
    go google
    Click Button    submit
    Wait Until Page Contains    ${addnotsuccess}
    Close Browser