*** Settings ***
Documentation    UI Automation Tests for Assessment Part A (Amazon)
Library          SeleniumLibrary

*** Variables ***
${BASE_URL}      https://www.amazon.in

*** Test Cases ***
1. Home Page Verification
    [Documentation]    Navigate to home page, wait a few seconds, verify key elements, and take screenshot.
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

    # Let the page wait for 3 seconds to fully load
    Sleep    3s

    # Verify key navigation elements are present (Amazon Logo and Search Bar)
    Page Should Contain Element    id=nav-logo-sprites
    Page Should Contain Element    id=twotabsearchtextbox

    # Capture full-page screenshot
    Capture Page Screenshot    amazon_homepage.png
    Close Browser

2. Category Navigation
    [Documentation]    From home page, click a category from the navigation menu and verify the destination page.
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

    Sleep    3s

    # Click on the 'Mobiles' category link from the top navigation bar
    Click Link    //a[contains(text(),'Mobiles')]

    # Let the destination page load for 3 seconds
    Sleep    3s

    # Assert destination page loaded correctly by checking content on the page
    Page Should Contain    Mobile Phones

    # Capture screenshot
    Capture Page Screenshot    amazon_category_navigation.png
    Close Browser

3. Search Functionality
    [Documentation]    Perform a product search and assert the results page displays the search term.
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    
    Sleep    3s

    # Type product name into the search box and click search
    Input Text    id=twotabsearchtextbox    laptop
    Click Button    id=nav-search-submit-button

    # Let the search results page load for 3 seconds
    Sleep    3s

    # Assert results page displays and contains expected search term
    Page Should Contain    laptop

    # Capture screenshot
    Capture Page Screenshot    amazon_search_results.png
    Close Browser