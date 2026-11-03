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
