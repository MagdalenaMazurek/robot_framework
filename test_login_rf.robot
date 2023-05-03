*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description  #automated tests for scout website

*** Variables ***

${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          ff
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDAPLAYER URL}   https://scouts-test.futbolkolektyw.pl/en/players/add
${ADDAPLAYERBUTTON}  xpath=//*[@id='__next']/div[1]/main/div[3]/div[2]/div/div/a/button/span[1]
${EMAILFIELD}       xpath=//div[1]/div/div/input
${NAMEFIELD}        xpath =//div[2]/div/div/input
${SURNAMEFIELD}     xpath =//div[3]/div/div/input
${AGEFIELD}     xpath =//div[7]/div/div/input
${MAINPOSITIONFIELD}        xpath =//div[12]/div/div/input
${SUBMITBUTTON}     xpath =//div[3]/button[1]/span[1]
${SIGNOUTBUTTON}        xpath =//*[text()='Sign out']
${DISTRICTLISTBOX}      xpath =//*[@id='mui-component-select-district']
${LEGLISTBOX}       xpath =//*[@id='mui-component-select-leg']
${CLUBFIELD}        xpath =//div[9]/div/div/input
${LEVELFIELD}        xpath =//div[10]/div/div/input
${CLEARBUTTON}      xpath =/html/body/div/div[1]/main/div[2]/form/div[3]/button[2]/span[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    [Teardown]    Close Browser

Przypadek testowy 1
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click on the add player button
    Add a Player Type in Email
    Add a Player Type in Name
    Add a Player Type in Surname
    Add a Player Type in Age
    Add a Player Type in Main Position
    Add a Player Click on the Submit button

Przypadek testowy 2
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Sign out button

Przypadek testowy 3
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click on the add player button
    Add a Player Type in Email
    Add a Player Click District listbox
    Add a Player Click Leg listbox
    Add a Player Click on the Submit button

Przypadek testowy 4
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click on the add player button
    Add a Player Type in Email
    Add a Player Type in Club
    Add a Player Type in Level
    Add a Player Click on the Submit button

Przypadek testowy 5
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click on the add player button
    Add a Player Type in Email
    Add a Player Click clear button

*** Keywords ***

Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png


Click on the add player button
    Click Element    ${ADDAPLAYERBUTTON}
Add a Player Type in Email
    Input Text    ${EMAILFIELD}       mazurek@gmail.com
Add a Player Type in Name
    Input Text    ${NAMEFIELD}  Magdalena
Add a Player Type in Surname
    Input Text    ${SURNAMEFIELD}     Mazurek
Add a Player Type in Age
    Input Text    ${AGEFIELD}   33
Add a Player Type in Main Position
    Input Text    ${MAINPOSITIONFIELD}  goalkeeper
Add a Player Click on the Submit button
    Click Element    ${SUBMITBUTTON}

Click Sign out button
    Click Element    ${SIGNOUTBUTTON}

Add a Player Click District listbox
    Click Element    ${DISTRICTLISTBOX}
    Select From List By Value   Opole
Add a Player Click Leg listbox
    Click Element    ${LEGLISTBOX}
    Select From List By Value    Left_leg

Add a Player Type in Club
    Input Text    ${CLUBFIELD}  Barcelona
Add a Player Type in Level
    Input Text    ${LEVELFIELD}     1

Add a Player Click clear button
    Click Element    ${CLEARBUTTON}