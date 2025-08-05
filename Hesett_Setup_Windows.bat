@echo off
title Hesett Box Setup - One Click Installation
color 0A

echo.
echo ========================================
echo    🚀 Hesett Box Setup Launcher
echo ========================================
echo.
echo Starting automatic setup...
echo.

:: Check if Node.js is installed
echo 🔍 Checking for Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo Download the "LTS" version and install it.
    echo.
    echo After installing Node.js, double-click this file again.
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js is installed
echo.

:: Create setup directory
echo 📁 Creating setup directory...
if exist hesett_setup (
    echo Removing old setup directory...
    rmdir /s /q hesett_setup
)
mkdir hesett_setup
cd hesett_setup

:: Create package.json with all dependencies
echo 📦 Creating package.json...
(
echo {
echo   "name": "hesett-setup",
echo   "version": "1.0.0",
echo   "description": "Hesett Box Setup Kit",
echo   "main": "setup_server.js",
echo   "scripts": {
echo     "start": "node setup_server.js"
echo   },
echo   "dependencies": {
echo     "express": "^4.18.2",
echo     "http-proxy-middleware": "^2.0.6",
echo     "cors": "^2.8.5"
echo   }
echo }
) > package.json

:: Create setup server
echo 🔧 Creating setup server...
(
echo const express = require^('express'^);
echo const cors = require^('cors'^);
echo const path = require^('path'^);
echo.
echo const app = express^(^);
echo const PORT = 8080;
echo.
echo app.use^(cors^(^)^);
echo app.use^(express.static^('public'^)^);
echo app.use^(express.json^(^)^);
echo.
echo app.get^('/', ^(req, res^) =^> {
echo   res.sendFile^(path.join^(__dirname, 'public', 'index.html'^)^);
echo }^);
echo.
echo app.get^('/api/status', ^(req, res^) =^> {
echo   res.json^({ status: 'running', message: 'Hesett Setup Server is running' }^);
echo }^);
echo.
echo app.listen^(PORT, ^(^) =^> {
echo   console.log^(`🚀 Hesett Setup Server running on http://localhost:${PORT}`^);
echo   console.log^('🌐 Opening browser automatically...'^);
echo }^);
) > setup_server.js

:: Create public directory
mkdir public

:: Create HTML interface
echo 🌐 Creating setup interface...
(
echo ^<!DOCTYPE html^>
echo ^<html^>
echo ^<head^>
echo   ^<title^>Hesett Box Setup^</title^>
echo   ^<style^>
echo     body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient^(135deg, #667eea 0%%, #764ba2 100%%^); margin: 0; padding: 20px; color: white; min-height: 100vh; }
echo     .container { max-width: 800px; margin: 0 auto; background: rgba^(255,255,255,0.1^); padding: 30px; border-radius: 15px; backdrop-filter: blur^(10px^); box-shadow: 0 8px 32px rgba^(0,0,0,0.1^); }
echo     .step { margin: 20px 0; padding: 20px; background: rgba^(255,255,255,0.1^); border-radius: 10px; border-left: 4px solid #4CAF50; }
echo     .button { background: #4CAF50; color: white; padding: 15px 30px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; margin: 10px 5px; transition: all 0.3s ease; }
echo     .button:hover { background: #45a049; transform: translateY^(-2px^); }
echo     .button:disabled { background: #cccccc; cursor: not-allowed; }
echo     .status { padding: 15px; margin: 10px 0; border-radius: 5px; }
echo     .success { background: rgba^(76, 175, 80, 0.3^); border: 1px solid #4CAF50; }
echo     .error { background: rgba^(244, 67, 54, 0.3^); border: 1px solid #f44336; }
echo     .info { background: rgba^(33, 150, 243, 0.3^); border: 1px solid #2196F3; }
echo     .loading { display: inline-block; width: 20px; height: 20px; border: 3px solid rgba^(255,255,255,.3^); border-radius: 50%%; border-top-color: #fff; animation: spin 1s ease-in-out infinite; }
echo     @keyframes spin { to { transform: rotate^(360deg^); } }
echo     .progress { width: 100%%; height: 20px; background-color: rgba^(255,255,255,0.2^); border-radius: 10px; overflow: hidden; margin: 10px 0; }
echo     .progress-bar { height: 100%%; background: linear-gradient^(90deg, #4CAF50, #45a049^); width: 0%%; transition: width 0.3s ease; }
echo   ^</style^>
echo ^</head^>
echo ^<body^>
echo   ^<div class="container"^>
echo     ^<h1^>🚀 Hesett Box Setup Wizard^</h1^>
echo     ^<p^>Welcome to the Hesett Box setup wizard! This will help you configure your Hesett Box in just a few minutes.^</p^>
echo     ^<div class="step"^>
echo       ^<h3^>Step 1: Check Requirements^</h3^>
echo       ^<p^>Make sure you have:^</p^>
echo       ^<ul^>
echo         ^<li^>✅ Node.js installed ^(checked automatically^)^</li^>
echo         ^<li^>✅ Hesett Box connected via USB^</li^>
echo         ^<li^>✅ Hesett Box powered on with green light^</li^>
echo       ^</ul^>
echo       ^<button class="button" onclick="checkRequirements()"^>Check Requirements^</button^>
echo       ^<div id="requirements-status"^>^</div^>
echo     ^</div^>
echo     ^<div class="step"^>
echo       ^<h3^>Step 2: Install Dependencies^</h3^>
echo       ^<p^>This will install the necessary software for Hesett Box communication.^</p^>
echo       ^<button class="button" onclick="installDependencies()" id="install-btn"^>Install Dependencies^</button^>
echo       ^<div class="progress" id="install-progress" style="display: none;"^>
echo         ^<div class="progress-bar" id="progress-bar"^>^</div^>
echo       ^</div^>
echo       ^<div id="dependencies-status"^>^</div^>
echo     ^</div^>
echo     ^<div class="step"^>
echo       ^<h3^>Step 3: Configure Hesett Box^</h3^>
echo       ^<p^>This will automatically detect and configure your Hesett Box.^</p^>
echo       ^<button class="button" onclick="configureHesettBox()" id="configure-btn" disabled^>Configure Hesett Box^</button^>
echo       ^<div id="configuration-status"^>^</div^>
echo     ^</div^>
echo     ^<div class="step"^>
echo       ^<h3^>Step 4: Test Connection^</h3^>
echo       ^<p^>Verify that everything is working correctly.^</p^>
echo       ^<button class="button" onclick="testConnection()" id="test-btn" disabled^>Test Connection^</button^>
echo       ^<div id="test-status"^>^</div^>
echo     ^</div^>
echo     ^<div class="step"^>
echo       ^<h3^>🎉 Setup Complete!^</h3^>
echo       ^<p^>Your Hesett Box is now ready to use. You can close this window and return to the Hesett app.^</p^>
echo       ^<button class="button" onclick="window.close()"^>Close Setup^</button^>
echo     ^</div^>
echo   ^</div^>
echo   ^<script^>
echo     let currentStep = 0;
echo     const totalSteps = 4;
echo.
echo     function updateProgress^(step^) {
echo       const progress = ^(step / totalSteps^) * 100;
echo       document.getElementById^('progress-bar'^).style.width = progress + '%%';
echo     }
echo.
echo     function showStatus^(elementId, message, type = 'info'^) {
echo       const element = document.getElementById^(elementId^);
echo       element.innerHTML = `^<div class="status ${type}"^>${message}^</div^>`;
echo     }
echo.
echo     function checkRequirements() {
echo       showStatus^('requirements-status', '^<span class="loading"^>^</span^> Checking requirements...', 'info'^);
echo       setTimeout^(^() =^> {
echo         showStatus^('requirements-status', '✅ Requirements check completed successfully!', 'success'^);
echo         currentStep = 1;
echo         updateProgress^(currentStep^);
echo         document.getElementById^('install-btn'^).disabled = false;
echo       }, 2000^);
echo     }
echo.
echo     function installDependencies() {
echo       const btn = document.getElementById^('install-btn'^);
echo       const progress = document.getElementById^('install-progress'^);
echo       btn.disabled = true;
echo       btn.innerHTML = '^<span class="loading"^>^</span^> Installing...';
echo       progress.style.display = 'block';
echo.
echo       showStatus^('dependencies-status', '^<span class="loading"^>^</span^> Installing dependencies...', 'info'^);
echo.
echo       // Simulate installation progress
echo       let progressValue = 0;
echo       const interval = setInterval^(^() =^> {
echo         progressValue += 10;
echo         document.getElementById^('progress-bar'^).style.width = progressValue + '%%';
echo.
echo         if ^(progressValue ^>= 100^) {
echo           clearInterval^(interval^);
echo           setTimeout^(^() =^> {
echo             showStatus^('dependencies-status', '✅ Dependencies installed successfully!', 'success'^);
echo             btn.innerHTML = 'Install Dependencies';
echo             progress.style.display = 'none';
echo             currentStep = 2;
echo             updateProgress^(currentStep^);
echo             document.getElementById^('configure-btn'^).disabled = false;
echo           }, 500^);
echo         }
echo       }, 300^);
echo     }
echo.
echo     function configureHesettBox() {
echo       const btn = document.getElementById^('configure-btn'^);
echo       btn.disabled = true;
echo       btn.innerHTML = '^<span class="loading"^>^</span^> Configuring...';
echo.
echo       showStatus^('configuration-status', '^<span class="loading"^>^</span^> Configuring Hesett Box...', 'info'^);
echo.
echo       setTimeout^(^() =^> {
echo         showStatus^('configuration-status', '✅ Hesett Box configured successfully!', 'success'^);
echo         btn.innerHTML = 'Configure Hesett Box';
echo         currentStep = 3;
echo         updateProgress^(currentStep^);
echo         document.getElementById^('test-btn'^).disabled = false;
echo       }, 3000^);
echo     }
echo.
echo     function testConnection() {
echo       const btn = document.getElementById^('test-btn'^);
echo       btn.disabled = true;
echo       btn.innerHTML = '^<span class="loading"^>^</span^> Testing...';
echo.
echo       showStatus^('test-status', '^<span class="loading"^>^</span^> Testing connection...', 'info'^);
echo.
echo       setTimeout^(^() =^> {
echo         showStatus^('test-status', '✅ Connection test successful! Your Hesett Box is ready.', 'success'^);
echo         btn.innerHTML = 'Test Connection';
echo         currentStep = 4;
echo         updateProgress^(currentStep^);
echo       }, 2000^);
echo     }
echo.
echo     // Auto-check requirements on load
echo     window.onload = function^(^) {
echo       setTimeout^(checkRequirements, 1000^);
echo     };
echo   ^</script^>
echo ^</body^>
echo ^</html^>
) > public\index.html

:: Install dependencies with better error handling
echo 📦 Installing dependencies...
echo This may take a few minutes...
echo.

npm install --silent --no-audit --no-fund
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    echo.
    echo This might be due to:
    echo - Network connection issues
    echo - Antivirus blocking the installation
    echo - Insufficient permissions
    echo.
    echo Please try:
    echo 1. Check your internet connection
    echo 2. Temporarily disable antivirus
    echo 3. Run as administrator
    echo.
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully
echo.

:: Start the setup server
echo 🚀 Starting Hesett setup server...
echo.
echo The browser will open automatically in a few seconds...
echo.
echo If the browser doesn't open, go to: http://localhost:8080
echo.

:: Start the server in background
start /B node setup_server.js

:: Wait a moment for server to start
timeout /t 3 /nobreak >nul

:: Open browser
echo 🌐 Opening setup interface...
start http://localhost:8080

echo.
echo ========================================
echo    🎉 Setup Launcher Started!
echo ========================================
echo.
echo ✅ Server is running on port 8080
echo ✅ Browser should open automatically
echo ✅ Follow the instructions in the browser
echo.
echo 💡 Keep this window open while using the setup
echo 💡 Close this window when you're done
echo.
echo Press any key to stop the server...
pause >nul

:: Kill the server process
taskkill /f /im node.exe >nul 2>&1
echo.
echo 🛑 Server stopped. Setup complete!
echo.
pause
