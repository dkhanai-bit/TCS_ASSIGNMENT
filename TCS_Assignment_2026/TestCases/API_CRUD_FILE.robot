*** Settings ***
Documentation    API CRUD Test for Assessment Part B with Evidence Logging
Library          RequestsLibrary
Library          Collections
Library          DateTime
Library          OperatingSystem

*** Variables ***
${BASE_URL}      https://petstore.swagger.io/v2

*** Test Cases ***
Verify Pet API CRUD Operations
    # 1. Connect to the API server
    Create Session    api_session    ${BASE_URL}

    # 2. CREATE: Generate a unique dynamic ID using current timestamp
    ${current_time}=     Get Current Date    result_format=epoch
    ${pet_id}=           Evaluate    int(${current_time})

    ${headers}=          Create Dictionary    Content-Type=application/json
    ${payload}=          Create Dictionary    id=${pet_id}    name=oreo    status=alive

    ${post_response}=    POST On Session    api_session    /pet    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${post_response.status_code}    200

    # 3. READ: Get the pet by ID and verify name & ID match
    ${get_response}=     GET On Session    api_session    /pet/${pet_id}
    Should Be Equal As Integers    ${get_response.status_code}    200

    ${response_data}=    Set Variable    ${get_response.json()}
    Should Be Equal As Integers    ${response_data}[id]      ${pet_id}
    Should Be Equal As Strings     ${response_data}[name]    oreo
    Should Be Equal As Strings     ${response_data}[status]    alive

    # 4. UPDATE: Modify the pet's name using PUT
    ${update_payload}=    Create Dictionary    id=${pet_id}    name=oreoUpdated    status=old
    ${put_response}=      PUT On Session    api_session    /pet    json=${update_payload}    headers=${headers}
    Should Be Equal As Integers    ${put_response.status_code}    200

    # Verify the name changed successfully
    ${check_update}=     GET On Session    api_session    /pet/${pet_id}
    Should Be Equal As Strings    ${check_update.json()}[name]    oreoUpdated
    Should Be Equal As Strings    ${check_update.json()}[status]    old

    # 5. DELETE: Delete the pet and confirm it returns 404 on a subsequent GET
    ${delete_response}=  DELETE On Session    api_session    /pet/${pet_id}
    Should Be Equal As Integers    ${delete_response.status_code}    200

    # Try to fetch the deleted pet (expecting 404 Not Found)
    ${final_get}=        GET On Session    api_session    /pet/${pet_id}    expected_status=404
    Should Be Equal As Integers    ${final_get.status_code}    404

    # Save API Test Result Evidence into the TestCases directory
    ${execution_log}=    Catenate    SEPARATOR=\n
    ...                  --- API CRUD TEST EXECUTION SUMMARY ---
    ...                  Pet ID: ${pet_id}
    ...                  CREATE Status: ${post_response.status_code}
    ...                  READ Status: ${get_response.status_code}
    ...                  UPDATE Status: ${put_response.status_code}
    ...                  DELETE Status: ${delete_response.status_code}
    ...                  Final GET Status (404 Confirmed): ${final_get.status_code}
    ...                  Test Status: PASSED SUCCESSFULLY

    Create File          TCS_Assignment_2026/TestCases/api_test_results.txt    ${execution_log}