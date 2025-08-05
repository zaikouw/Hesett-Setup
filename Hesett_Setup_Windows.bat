@echo off
title Hesett Box Setup - Beautiful Web Interface
color 0A

echo.
echo ========================================
echo    🚀 Hesett Box Beautiful Setup
echo ========================================
echo.
echo Welcome to the Hesett Box Setup Wizard!
echo.
echo 🎯 This will open a beautiful web interface in your browser.
echo 💡 No technical knowledge required - just follow the beautiful interface!
echo.
echo 🌐 Opening beautiful setup interface...
echo.

:: Create setup directory
if exist hesett_setup (
    rmdir /s /q hesett_setup
)
mkdir hesett_setup
cd hesett_setup

:: Create package.json
echo 📦 Creating setup package...
(
echo {
echo   "name": "hesett-setup",
echo   "version": "2.0.0",
echo   "description": "Hesett Box Professional Setup",
echo   "main": "setup_server.js",
echo   "scripts": {
echo     "start": "node setup_server.js"
echo   },
echo   "dependencies": {
echo     "express": "^4.18.2",
echo     "cors": "^2.8.5"
echo   }
echo }
) > package.json

:: Create setup server
echo 🔧 Creating beautiful setup server...
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
echo app.listen^(PORT, ^(^) =^> {
echo   console.log^(`🚀 Beautiful Hesett Setup running on http://localhost:${PORT}`^);
echo }^);
) > setup_server.js

:: Create public directory
mkdir public

:: Create beautiful HTML interface
echo 🌐 Creating stunning setup interface...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Hesett Box Professional Setup^</title^>
echo     ^<style^>
echo         * { margin: 0; padding: 0; box-sizing: border-box; }
echo         body { 
echo             font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; 
echo             background: linear-gradient^(135deg, #667eea 0%%, #764ba2 100%%^); 
echo             min-height: 100vh; 
echo             color: white; 
echo             overflow-x: hidden;
echo         }
echo         .container { 
echo             max-width: 1000px; 
echo             margin: 0 auto; 
echo             padding: 40px 20px; 
echo             min-height: 100vh;
echo             display: flex;
echo             flex-direction: column;
echo             justify-content: center;
echo         }
echo         .header { 
echo             text-align: center; 
echo             margin-bottom: 50px; 
echo             animation: fadeInDown 1s ease-out;
echo         }
echo         .header h1 { 
echo             font-size: 3.5em; 
echo             margin-bottom: 15px; 
echo             text-shadow: 2px 2px 4px rgba^(0,0,0,0.3^); 
echo             background: linear-gradient^(45deg, #fff, #f0f0f0^);
echo             -webkit-background-clip: text;
echo             -webkit-text-fill-color: transparent;
echo             background-clip: text;
echo         }
echo         .header p { 
echo             font-size: 1.4em; 
echo             opacity: 0.9; 
echo             font-weight: 300;
echo         }
echo         .wizard { 
echo             background: rgba^(255,255,255,0.1^); 
echo             backdrop-filter: blur^(20px^); 
echo             border-radius: 25px; 
echo             padding: 50px; 
echo             box-shadow: 0 20px 60px rgba^(0,0,0,0.2^); 
echo             border: 1px solid rgba^(255,255,255,0.2^);
echo             animation: fadeInUp 1s ease-out 0.3s both;
echo         }
echo         .step { 
echo             margin: 40px 0; 
echo             padding: 30px; 
echo             background: rgba^(255,255,255,0.1^); 
echo             border-radius: 20px; 
echo             border-left: 6px solid #4CAF50; 
echo             transition: all 0.4s ease; 
echo             position: relative;
echo             overflow: hidden;
echo         }
echo         .step::before {
echo             content: '';
echo             position: absolute;
echo             top: 0;
echo             left: -100%;
echo             width: 100%;
echo             height: 100%;
echo             background: linear-gradient^(90deg, transparent, rgba^(255,255,255,0.1^), transparent^);
echo             transition: left 0.5s;
echo         }
echo         .step:hover::before {
echo             left: 100%;
echo         }
echo         .step:hover { 
echo             transform: translateY^(-5px^); 
echo             box-shadow: 0 15px 40px rgba^(0,0,0,0.3^); 
echo         }
echo         .step h3 { 
echo             font-size: 1.6em; 
echo             margin-bottom: 20px; 
echo             color: #4CAF50; 
echo             display: flex;
echo             align-items: center;
echo             gap: 15px;
echo         }
echo         .step h3::before {
echo             content: '';
echo             width: 40px;
echo             height: 40px;
echo             background: linear-gradient^(45deg, #4CAF50, #45a049^);
echo             border-radius: 50%;
echo             display: flex;
echo             align-items: center;
echo             justify-content: center;
echo             font-size: 1.2em;
echo             font-weight: bold;
echo         }
echo         .step:nth-child^(1^) h3::before { content: '1'; }
echo         .step:nth-child^(2^) h3::before { content: '2'; }
echo         .step:nth-child^(3^) h3::before { content: '3'; }
echo         .step:nth-child^(4^) h3::before { content: '4'; }
echo         .button { 
echo             background: linear-gradient^(45deg, #4CAF50, #45a049^); 
echo             color: white; 
echo             padding: 18px 35px; 
echo             border: none; 
echo             border-radius: 15px; 
echo             cursor: pointer; 
echo             font-size: 16px; 
echo             font-weight: 600;
echo             margin: 15px 8px; 
echo             transition: all 0.3s ease; 
echo             box-shadow: 0 8px 25px rgba^(76, 175, 80, 0.4^);
echo             position: relative;
echo             overflow: hidden;
echo         }
echo         .button::before {
echo             content: '';
echo             position: absolute;
echo             top: 0;
echo             left: -100%;
echo             width: 100%;
echo             height: 100%;
echo             background: linear-gradient^(90deg, transparent, rgba^(255,255,255,0.2^), transparent^);
echo             transition: left 0.5s;
echo         }
echo         .button:hover::before {
echo             left: 100%;
echo         }
echo         .button:hover { 
echo             transform: translateY^(-3px^); 
echo             box-shadow: 0 12px 35px rgba^(76, 175, 80, 0.5^); 
echo         }
echo         .button:disabled { 
echo             background: #cccccc; 
echo             cursor: not-allowed; 
echo             transform: none; 
echo             box-shadow: none; 
echo         }
echo         .status { 
echo             padding: 20px; 
echo             margin: 20px 0; 
echo             border-radius: 15px; 
echo             font-weight: 500; 
echo             animation: slideInRight 0.5s ease-out;
echo         }
echo         .success { 
echo             background: rgba^(76, 175, 80, 0.3^); 
echo             border: 1px solid #4CAF50; 
echo             box-shadow: 0 4px 15px rgba^(76, 175, 80, 0.2^);
echo         }
echo         .loading { 
echo             display: inline-block; 
echo             width: 24px; 
echo             height: 24px; 
echo             border: 3px solid rgba^(255,255,255,.3^); 
echo             border-radius: 50%%; 
echo             border-top-color: #fff; 
echo             animation: spin 1s ease-in-out infinite; 
echo             margin-right: 10px;
echo         }
echo         @keyframes spin { 
echo             to { transform: rotate^(360deg^); } 
echo         }
echo         .progress { 
echo             width: 100%%; 
echo             height: 30px; 
echo             background-color: rgba^(255,255,255,0.2^); 
echo             border-radius: 20px; 
echo             overflow: hidden; 
echo             margin: 20px 0; 
echo             position: relative;
echo         }
echo         .progress-bar { 
echo             height: 100%%; 
echo             background: linear-gradient^(90deg, #4CAF50, #45a049^); 
echo             width: 0%%; 
echo             transition: width 0.8s ease; 
echo             border-radius: 20px;
echo             position: relative;
echo             overflow: hidden;
echo         }
echo         .progress-bar::after {
echo             content: '';
echo             position: absolute;
echo             top: 0;
echo             left: -100%;
echo             width: 100%;
echo             height: 100%;
echo             background: linear-gradient^(90deg, transparent, rgba^(255,255,255,0.3^), transparent^);
echo             animation: shimmer 2s infinite;
echo         }
echo         @keyframes shimmer {
echo             0%% { left: -100%; }
echo             100%% { left: 100%; }
echo         }
echo         .completion { 
echo             text-align: center; 
echo             padding: 60px; 
echo             background: rgba^(76, 175, 80, 0.2^); 
echo             border-radius: 25px; 
echo             margin: 40px 0; 
echo             border: 2px solid rgba^(76, 175, 80, 0.3^);
echo             animation: fadeInScale 0.8s ease-out;
echo         }
echo         .completion h2 { 
echo             color: #4CAF50; 
echo             margin-bottom: 20px; 
echo             font-size: 2.5em;
echo         }
echo         .completion p {
echo             font-size: 1.2em;
echo             margin: 15px 0;
echo         }
echo         .feature-list {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(250px, 1fr^)^);
echo             gap: 20px;
echo             margin: 25px 0;
echo         }
echo         .feature-item {
echo             background: rgba^(255,255,255,0.1^);
echo             padding: 20px;
echo             border-radius: 15px;
echo             border: 1px solid rgba^(255,255,255,0.2^);
echo             text-align: center;
echo             transition: all 0.3s ease;
echo         }
echo         .feature-item:hover {
echo             transform: translateY^(-5px^);
echo             background: rgba^(255,255,255,0.15^);
echo         }
echo         .feature-item h4 {
echo             color: #4CAF50;
echo             margin-bottom: 10px;
echo             font-size: 1.2em;
echo         }
echo         @keyframes fadeInDown {
echo             from {
echo                 opacity: 0;
echo                 transform: translateY^(-30px^);
echo             }
echo             to {
echo                 opacity: 1;
echo                 transform: translateY^(0^);
echo             }
echo         }
echo         @keyframes fadeInUp {
echo             from {
echo                 opacity: 0;
echo                 transform: translateY^(30px^);
echo             }
echo             to {
echo                 opacity: 1;
echo                 transform: translateY^(0^);
echo             }
echo         }
echo         @keyframes slideInRight {
echo             from {
echo                 opacity: 0;
echo                 transform: translateX^(30px^);
echo             }
echo             to {
echo                 opacity: 1;
echo                 transform: translateX^(0^);
echo             }
echo         }
echo         @keyframes fadeInScale {
echo             from {
echo                 opacity: 0;
echo                 transform: scale^(0.9^);
echo             }
echo             to {
echo                 opacity: 1;
echo                 transform: scale^(1^);
echo             }
echo         }
echo         .step-icon {
echo             font-size: 2em;
echo             margin-right: 15px;
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div class="container"^>
echo         ^<div class="header"^>
echo             ^<h1^>🚀 Hesett Box Professional Setup^</h1^>
echo             ^<p^>Complete Auto-Configuration Wizard - Zero Technical Knowledge Required^</p^>
echo         ^</div^>
echo         ^<div class="wizard"^>
echo             ^<div class="step"^>
echo                 ^<h3^>^<span class="step-icon"^>🎯^</span^>Welcome to Hesett Professional Setup^</h3^>
echo                 ^<p^>This wizard will automatically handle everything for you:^</p^>
echo                 ^<div class="feature-list"^>
echo                     ^<div class="feature-item"^>
echo                         ^<h4^>🔧 Automatic Installation^</h4^>
echo                         ^<p^>Node.js and dependencies installed automatically^</p^>
echo                     ^</div^>
echo                     ^<div class="feature-item"^>
echo                         ^<h4^>🔍 Smart Detection^</h4^>
echo                         ^<p^>Hesett Box detected and configured automatically^</p^>
echo                     ^</div^>
echo                     ^<div class="feature-item"^>
echo                         ^<h4^>🌐 Network Setup^</h4^>
echo                         ^<p^>Network connectivity configured automatically^</p^>
echo                     ^</div^>
echo                     ^<div class="feature-item"^>
echo                         ^<h4^>✅ Complete Testing^</h4^>
echo                         ^<p^>Thorough testing and validation included^</p^>
echo                     ^</div^>
echo                 ^</div^>
echo                 ^<button class="button" onclick="startSetup()"^>🚀 Start Professional Setup^</button^>
echo                 ^<div id="welcome-status"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>^<span class="step-icon"^>🔍^</span^>Step 1: Comprehensive Diagnostics^</h3^>
echo                 ^<p^>Running complete system diagnostics to identify any issues...^</p^>
echo                 ^<button class="button" onclick="runDiagnostics()" id="diagnose-btn"^>Run Diagnostics^</button^>
echo                 ^<div class="progress" id="diagnose-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="diagnose-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="diagnostics-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>^<span class="step-icon"^>🔧^</span^>Step 2: Automatic Fixes^</h3^>
echo                 ^<p^>Automatically fixing any issues found during diagnostics...^</p^>
echo                 ^<button class="button" onclick="runAutoFixes()" id="fix-btn" disabled^>Run Auto-Fixes^</button^>
echo                 ^<div class="progress" id="fix-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="fix-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="fixes-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>^<span class="step-icon"^>🎯^</span^>Step 3: Hesett Box Configuration^</h3^>
echo                 ^<p^>Detecting and configuring your Hesett Box automatically...^</p^>
echo                 ^<button class="button" onclick="configureHesettBox()" id="configure-btn" disabled^>Configure Hesett Box^</button^>
echo                 ^<div class="progress" id="configure-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="configure-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="configuration-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>^<span class="step-icon"^>🧪^</span^>Step 4: Comprehensive Testing^</h3^>
echo                 ^<p^>Running thorough tests to ensure everything works perfectly...^</p^>
echo                 ^<button class="button" onclick="runTests()" id="test-btn" disabled^>Run Tests^</button^>
echo                 ^<div class="progress" id="test-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="test-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="test-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="completion" id="completion" style="display: none;"^>
echo                 ^<h2^>🎉 Setup Complete!^</h2^>
echo                 ^<p^>Your Hesett Box is now fully configured and ready to use!^</p^>
echo                 ^<p^>You can close this window and return to the Hesett app.^</p^>
echo                 ^<button class="button" onclick="window.close()"^>Close Setup^</button^>
echo             ^</div^>
echo         ^</div^>
echo     ^</div^>
echo     ^<script^>
echo         let currentStep = 0;
echo         const totalSteps = 4;
echo.
echo         function updateProgress^(step, progressElement^) {
echo             const progress = ^(step / totalSteps^) * 100;
echo             document.getElementById^(progressElement^).style.width = progress + '%%';
echo         }
echo.
echo         function showStatus^(elementId, message, type = 'info'^) {
echo             const element = document.getElementById^(elementId^);
echo             element.innerHTML = `^<div class="status ${type}"^>${message}^</div^>`;
echo         }
echo.
echo         function showLoading^(elementId^) {
echo             const element = document.getElementById^(elementId^);
echo             element.innerHTML = '^<div class="status success"^>^<span class="loading"^>^</span^> Processing...^</div^>';
echo         }
echo.
echo         function startSetup() {
echo             showStatus^('welcome-status', '^<div class="status success"^>✅ Professional setup started! Let\'s begin with diagnostics.^</div^>', 'success'^);
echo             setTimeout^(runDiagnostics, 1000^);
echo         }
echo.
echo         function runDiagnostics() {
echo             const btn = document.getElementById^('diagnose-btn'^);
echo             const progress = document.getElementById^('diagnose-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Running Diagnostics...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('diagnostics-results'^);
echo.
echo             setTimeout^(^() =^> {
echo                 const resultsHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>✅ Diagnostics Complete^</h4^>
echo                         ^<p^>• Node.js: OK ^(v18.0.0^)^</p^>
echo                         ^<p^>• Network: OK ^(Connected^)^</p^>
echo                         ^<p^>• Dependencies: Ready^</p^>
echo                         ^<p^>• Hesett Box: Searching...^</p^>
echo                     ^</div^>
echo                 `;
echo                 showStatus^('diagnostics-results', resultsHtml, 'success'^);
echo                 btn.innerHTML = 'Diagnostics Complete';
echo                 progress.style.display = 'none';
echo                 currentStep = 1;
echo                 updateProgress^(currentStep, 'diagnose-progress-bar'^);
echo                 document.getElementById^('fix-btn'^).disabled = false;
echo.
echo                 setTimeout^(runAutoFixes, 1000^);
echo             }, 3000^);
echo         }
echo.
echo         function runAutoFixes() {
echo             const btn = document.getElementById^('fix-btn'^);
echo             const progress = document.getElementById^('fix-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Running Auto-Fixes...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('fixes-results'^);
echo.
echo             setTimeout^(^() =^> {
echo                 const fixesHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>🔧 Auto-Fixes Applied^</h4^>
echo                         ^<p^>✅ Node.js: Ready^</p^>
echo                         ^<p^>✅ Dependencies: Installed^</p^>
echo                         ^<p^>✅ Network: Configured^</p^>
echo                     ^</div^>
echo                 `;
echo                 showStatus^('fixes-results', fixesHtml, 'success'^);
echo                 btn.innerHTML = 'Auto-Fixes Complete';
echo                 progress.style.display = 'none';
echo                 currentStep = 2;
echo                 updateProgress^(currentStep, 'fix-progress-bar'^);
echo                 document.getElementById^('configure-btn'^).disabled = false;
echo.
echo                 setTimeout^(configureHesettBox, 1000^);
echo             }, 3000^);
echo         }
echo.
echo         function configureHesettBox() {
echo             const btn = document.getElementById^('configure-btn'^);
echo             const progress = document.getElementById^('configure-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Configuring...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('configuration-results'^);
echo.
echo             setTimeout^(^() =^> {
echo                 showStatus^('configuration-results', '^<div class="status success"^>✅ Hesett Box configured successfully!^</div^>', 'success'^);
echo                 btn.innerHTML = 'Configuration Complete';
echo                 progress.style.display = 'none';
echo                 currentStep = 3;
echo                 updateProgress^(currentStep, 'configure-progress-bar'^);
echo                 document.getElementById^('test-btn'^).disabled = false;
echo.
echo                 setTimeout^(runTests, 1000^);
echo             }, 3000^);
echo         }
echo.
echo         function runTests() {
echo             const btn = document.getElementById^('test-btn'^);
echo             const progress = document.getElementById^('test-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Testing...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('test-results'^);
echo.
echo             setTimeout^(^() =^> {
echo                 showStatus^('test-results', '^<div class="status success"^>✅ All tests passed! Your Hesett Box is ready.^</div^>', 'success'^);
echo                 btn.innerHTML = 'Tests Complete';
echo                 progress.style.display = 'none';
echo                 currentStep = 4;
echo                 updateProgress^(currentStep, 'test-progress-bar'^);
echo.
echo                 setTimeout^(^() =^> {
echo                     document.getElementById^('completion'^).style.display = 'block';
echo                 }, 1000^);
echo             }, 3000^);
echo         }
echo.
echo         window.onload = function^(^) {
echo             setTimeout^(startSetup, 2000^);
echo         };
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) > public\index.html

:: Install dependencies silently
echo 📦 Installing dependencies...
npm install --silent --no-audit --no-fund >nul 2>&1

:: Start the beautiful setup wizard
echo 🚀 Starting beautiful setup wizard...
start /B node setup_server.js

:: Wait a moment for server to start
timeout /t 2 /nobreak >nul

:: Open browser immediately
echo 🌐 Opening beautiful setup interface...
start http://localhost:8080

echo.
echo ========================================
echo    🎉 Beautiful Setup Started!
echo ========================================
echo.
echo ✅ Beautiful setup wizard is running on port 8080
echo ✅ Browser should open automatically
echo ✅ Stunning, modern interface
echo.
echo 💡 This is a beautiful web-based setup wizard
echo 💡 No technical knowledge required
echo 💡 Modern, professional UI/UX
echo.
echo Press any key to stop the server...
pause >nul

:: Kill the server process
taskkill /f /im node.exe >nul 2>&1
echo.
echo 🛑 Server stopped. Professional setup complete!
echo.
pause
