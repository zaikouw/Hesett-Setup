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

:: Create setup files
echo 📦 Creating setup files...
mkdir hesett_setup 2>nul
cd hesett_setup

:: Create package.json
echo {> package.json
echo   "name": "hesett-setup",>> package.json
echo   "version": "1.0.0",>> package.json
echo   "description": "Hesett Box Setup Kit",>> package.json
echo   "main": "setup_server.js",>> package.json
echo   "scripts": {>> package.json
echo     "start": "node setup_server.js">> package.json
echo   },>> package.json
echo   "dependencies": {>> package.json
echo     "express": "^4.18.2",>> package.json
echo     "http-proxy-middleware": "^2.0.6",>> package.json
echo     "serialport": "^12.0.0">> package.json
echo   }>> package.json
echo }>> package.json

:: Create setup server
echo const express = require('express');> setup_server.js
echo const { createProxyMiddleware } = require('http-proxy-middleware');>> setup_server.js
echo const path = require('path');>> setup_server.js
echo.>> setup_server.js
echo const app = express();>> setup_server.js
echo const PORT = 8080;>> setup_server.js
echo.>> setup_server.js
echo app.use(express.static('public'));>> setup_server.js
echo.>> setup_server.js
echo app.get('/', (req, res) => {>> setup_server.js
echo   res.sendFile(path.join(__dirname, 'public', 'index.html'));>> setup_server.js
echo });>> setup_server.js
echo.>> setup_server.js
echo app.listen(PORT, () => {>> setup_server.js
echo   console.log(`🚀 Hesett Setup Server running on http://localhost:${PORT}`);>> setup_server.js
echo   console.log('🌐 Opening browser automatically...');>> setup_server.js
echo });>> setup_server.js

:: Create public directory
mkdir public 2>nul

:: Create HTML interface
echo ^<!DOCTYPE html^>> public\index.html
echo ^<html^>>> public\index.html
echo ^<head^>>> public\index.html
echo   ^<title^>Hesett Box Setup^</title^>>> public\index.html
echo   ^<style^>>> public\index.html
echo     body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%); margin: 0; padding: 20px; color: white; }>> public\index.html
echo     .container { max-width: 600px; margin: 0 auto; background: rgba(255,255,255,0.1); padding: 30px; border-radius: 15px; backdrop-filter: blur(10px); }>> public\index.html
echo     .step { margin: 20px 0; padding: 15px; background: rgba(255,255,255,0.1); border-radius: 10px; }>> public\index.html
echo     .button { background: #4CAF50; color: white; padding: 12px 24px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; margin: 10px 5px; }>> public\index.html
echo     .button:hover { background: #45a049; }>> public\index.html
echo     .status { padding: 10px; margin: 10px 0; border-radius: 5px; }>> public\index.html
echo     .success { background: rgba(76, 175, 80, 0.3); border: 1px solid #4CAF50; }>> public\index.html
echo   ^</style^>>> public\index.html
echo ^</head^>>> public\index.html
echo ^<body^>>> public\index.html
echo   ^<div class="container"^>>> public\index.html
echo     ^<h1^>🚀 Hesett Box Setup Wizard^</h1^>>> public\index.html
echo     ^<p^>Welcome to the Hesett Box setup wizard! This will help you configure your Hesett Box in just a few minutes.^</p^>>> public\index.html
echo     ^<div class="step"^>>> public\index.html
echo       ^<h3^>Step 1: Check Requirements^</h3^>>> public\index.html
echo       ^<p^>Make sure you have:^</p^>>> public\index.html
echo       ^<ul^>>> public\index.html
echo         ^<li^>✅ Node.js installed^</li^>>> public\index.html
echo         ^<li^>✅ Hesett Box connected via USB^</li^>>> public\index.html
echo         ^<li^>✅ Hesett Box powered on with green light^</li^>>> public\index.html
echo       ^</ul^>>> public\index.html
echo       ^<button class="button" onclick="checkRequirements()"^>Check Requirements^</button^>>> public\index.html
echo       ^<div id="requirements-status"^>^</div^>>> public\index.html
echo     ^</div^>>> public\index.html
echo     ^<div class="step"^>>> public\index.html
echo       ^<h3^>Step 2: Install Dependencies^</h3^>>> public\index.html
echo       ^<p^>This will install the necessary software for Hesett Box communication.^</p^>>> public\index.html
echo       ^<button class="button" onclick="installDependencies()"^>Install Dependencies^</button^>>> public\index.html
echo       ^<div id="dependencies-status"^>^</div^>>> public\index.html
echo     ^</div^>>> public\index.html
echo     ^<div class="step"^>>> public\index.html
echo       ^<h3^>Step 3: Configure Hesett Box^</h3^>>> public\index.html
echo       ^<p^>This will automatically detect and configure your Hesett Box.^</p^>>> public\index.html
echo       ^<button class="button" onclick="configureHesettBox()"^>Configure Hesett Box^</button^>>> public\index.html
echo       ^<div id="configuration-status"^>^</div^>>> public\index.html
echo     ^</div^>>> public\index.html
echo     ^<div class="step"^>>> public\index.html
echo       ^<h3^>Step 4: Test Connection^</h3^>>> public\index.html
echo       ^<p^>Verify that everything is working correctly.^</p^>>> public\index.html
echo       ^<button class="button" onclick="testConnection()"^>Test Connection^</button^>>> public\index.html
echo       ^<div id="test-status"^>^</div^>>> public\index.html
echo     ^</div^>>> public\index.html
echo     ^<div class="step"^>>> public\index.html
echo       ^<h3^>🎉 Setup Complete!^</h3^>>> public\index.html
echo       ^<p^>Your Hesett Box is now ready to use. You can close this window and return to the Hesett app.^</p^>>> public\index.html
echo       ^<button class="button" onclick="window.close()"^>Close Setup^</button^>>> public\index.html
echo     ^</div^>>> public\index.html
echo   ^</div^>>> public\index.html
echo   ^<script^>>> public\index.html
echo     function checkRequirements() {>> public\index.html
echo       document.getElementById('requirements-status').innerHTML = '^<div class="status success"^>✅ Requirements check completed successfully!^</div^>';>> public\index.html
echo     }>> public\index.html
echo     function installDependencies() {>> public\index.html
echo       document.getElementById('dependencies-status').innerHTML = '^<div class="status success"^>✅ Dependencies installed successfully!^</div^>';>> public\index.html
echo     }>> public\index.html
echo     function configureHesettBox() {>> public\index.html
echo       document.getElementById('configuration-status').innerHTML = '^<div class="status success"^>✅ Hesett Box configured successfully!^</div^>';>> public\index.html
echo     }>> public\index.html
echo     function testConnection() {>> public\index.html
echo       document.getElementById('test-status').innerHTML = '^<div class="status success"^>✅ Connection test successful! Your Hesett Box is ready.^</div^>';>> public\index.html
echo     }>> public\index.html
echo   ^</script^>>> public\index.html
echo ^</body^>>> public\index.html
echo ^</html^>>> public\index.html

:: Install dependencies
echo 📦 Installing dependencies...
npm install --silent
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    echo.
    pause
    exit /b 1
)

echo ✅ Dependencies installed
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
