# TCS Assignment 2026  ( Part A )
🛒 E-Commerce UI Automation Suite (Part A)

Robust and scalable web UI test automation built with Robot Framework and SeleniumLibrary.

📖 Description

This repository contains the end-to-end automated UI test suite for Part A of the Technical Assessment. Designed for evaluating online shopping flows on Amazon (https://www.amazon.in), it validates critical user interactions including homepage rendering, category navigation, and search execution, capturing visual evidence at each stage.

✨ Features / Highlights

Homepage Verification: Validates essential navigation header elements (logo, search field).

Category Navigation: Automates menu traversal to sub-categories (e.g., Mobiles) and asserts page loads.

Search Execution: Performs term queries (e.g., "laptop") and asserts search results accuracy.

Visual Audit Logs: Automatically captures full-page .png screenshots upon test completions.

Smart Synchronization: Employs explicit waits and pauses for stable, non-flaky execution.

⚙️ Prerequisites & Requirements

Python: 3.12.5 installed

Browser: Google Chrome (latest version)

IDE: PyCharm / VS Code with terminal support

Environment: Python Virtual Environment (.venv)

📥 Installation Instructions

Run the following commands in your terminal to set up the environment:

# Activate your virtual environment (Windows PowerShell)
.\.venv\Scripts\Activate

# Install required automation libraries
pip install robotframework robotframework-seleniumlibrary


🚀 Usage Examples

Run the UI Test Suite

Execute the test script from your project root directory:

robot TCS_Assignment_2026/TestCases/UI_Automation_Amazon.robot


Generated Output Evidence

amazon_homepage.png — Homepage layout confirmation.

amazon_category_navigation.png — Category destination assertion.

amazon_search_results.png — Product search verification.

log.html & report.html — Interactive execution reports.

🛠️ Configuration

All configurable parameters are defined in the *** Variables *** section of UI_Automation_Amazon.robot:

*** Variables ***
${BASE_URL}      https://www.amazon.in
${BROWSER}       chrome
${TIMEOUT}       15s

# TCS Assignment 2026  ( Part B )

# 🔌 Part B: API CRUD Automation Test Suite (TCS Assessment 2026)

[![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Automation-blue.svg)](https://robotframework.org/)
[![RequestsLibrary](https://img.shields.io/badge/RequestsLibrary-API%20Testing-orange.svg)](https://github.com/MarketSquare/robotframework-requests)
[![Status](https://img.shields.io/badge/Status-Verified%20&%20Passing-success.svg)]()

---

## 📖 Description
This module contains the backend RESTful API CRUD test suite developed for **Part B** of the 2026 Technical Assessment. Built using **Robot Framework** and **RequestsLibrary**, this script validates the complete Create, Read, Update, and Delete lifecycle against the public **Swagger Petstore API** (`https://petstore.swagger.io/v2`), ensuring strict assertion checks, error handling, and automated execution logging.

---

## ✨ Features / Highlights
* **Dynamic ID Generation:** Automatically generates unique record IDs using current epoch timestamps to prevent data collisions during test execution.
* **Full CRUD Lifecycle Coverage:**
  * **CREATE (`POST`):** Instantiates a new pet record with custom payload data.
  * **READ (`GET`):** Fetches the record and asserts matching field attributes (`id`, `name`, `status`).
  * **UPDATE (`PUT`):** Modifies existing pet details and verifies state changes.
  * **DELETE (`DELETE`):** Removes the record and performs negative validation confirming subsequent fetches return a `404 Not Found` status.
* **Automated Evidence Logging:** Generates a structured summary text file (`api_test_results.txt`) upon completion as formal execution proof.

---

## ⚙️ Prerequisites & Requirements
Ensure your local environment meets the following requirements:
* **Python:** Version 3.10 or higher installed.
* **Virtual Environment:** Recommended (`.venv` initialized in the project root).
* **Required Libraries:** Robot Framework and RequestsLibrary.

---

## 📥 Installation Instructions
1. Open your project terminal in PyCharm or your command line interface.
2. Activate your virtual environment:
   ```powershell
   .venv\Scripts\Activate

## 📥 Installation Instructions
Install the required Robot Framework Requests library:
pip install robotframework-requests

## 📥 How To Run The TestCases
robot TCS_Assignment_2026/TestCases/API_CRUD_FILE.robot

📂 Generated Evidence & Artifacts
Upon successful execution, the test runner automatically generates and saves audit evidence inside the TestCases folder:   API Log Summary: api_test_results.txt (contains step-by-step status codes and confirmation summaries)   Execution Reports: log.html and report.html   

🛠️ Configuration & Environment
API Base URL: Configured globally within the script variable ${BASE_URL} as https://petstore.swagger.io/v2.
