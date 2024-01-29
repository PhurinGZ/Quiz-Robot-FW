*** Settings ***
Library    Selenium2Library
Suite Setup    Open Browser    http://automationexercise.com    chrome

*** Variables ***

${email}    basphurin2502@gmail.com
${passWord}    a01234
${productName}    Stylish Dress

*** Keywords ***

Click on 'Products' button
    Click Element        //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a

Enter product name in search input
    [Arguments]    ${productName}
    Input Text    //*[@name="search"]    ${productName}

click search button
    Click Element    //*[@id="submit_search"]

Add those products to cart
    Click Element    //*[@data-product-id="4"]
    
Click 'Cart' button
    Click Element    //*[@id="cartModal"]/div/div/div[3]/button

go to Cart page
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a

Click 'Signup / Login' button
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

submit login details
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}
Input passWord 
    [Arguments]    ${passWord}
    Input Text    //*[@name="password"]    ${passWord}
Click login 
    Click Element    //*[@data-qa="login-button"]


*** Test Cases ***

Search Products and Verify Cart After Login
    Click on 'Products' button 

    # Page Should Contain    ALL PRODUCTS

    Enter product name in search input    ${productName}

    click search button

    # Page Should Contain    SEARCHED PRODUCTS

    Page Should Contain     ${productName}

    Add those products to cart

    # Click 'Cart' button

    # Page Should Contain    ${PRODUCT_NAME}

    Click 'Signup / Login' button

    go to Cart page

    Page Should Contain    ${PRODUCT_NAME}




