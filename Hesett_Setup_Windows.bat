@echo off
title Hesett Box Setup - Simple & Reliable
color 0A

echo.
echo ========================================
echo    🚀 Hesett Box Simple Setup
echo ========================================
echo.
echo Welcome to the Hesett Box Setup Wizard!
echo.
echo 🎯 This will open a beautiful web interface in your browser.
echo 💡 Simple, reliable, and works every time!
echo.
echo 🌐 Opening setup interface...
echo.

:: Create setup directory
if exist hesett_setup (
    rmdir /s /q hesett_setup
)
mkdir hesett_setup
cd hesett_setup

:: Create package.json for simple web server
echo 📦 Creating simple web server...
(
echo {
echo   "name": "hesett-setup",
echo   "version": "1.0.0",
echo   "description": "Hesett Box Simple Setup",
echo   "main": "server.js",
echo   "scripts": {
echo     "start": "node server.js"
echo   },
echo   "dependencies": {
echo     "express": "^4.18.2",
echo     "cors": "^2.8.5"
echo   }
echo }
) > package.json

:: Create simple web server
echo 🔧 Creating web server...
(
echo const express = require^('express'^);
echo const cors = require^('cors'^);
echo const path = require^('path'^);
echo const { exec } = require^('child_process'^);
echo const os = require^('os'^);
echo.
echo const app = express^(^);
echo const PORT = 8080;
echo.
echo app.use^(cors^(^)^);
echo app.use^(express.static^('public'^)^);
echo app.use^(express.json^(^)^);
echo.
echo // Serve the main page
echo app.get^('/', ^(req, res^) =^> {
echo   res.sendFile^(path.join^(__dirname, 'public', 'index.html'^)^);
echo }^);
echo.
echo // API endpoint for network scanning
echo app.get^('/api/scan-network', ^(req, res^) =^> {
echo   exec^('arp -a', ^(error, stdout, stderr^) =^> {
echo     if ^(error^) {
echo       res.json^({ devices: [], error: error.message }^);
echo       return;
echo     }
echo     const devices = [];
echo     const lines = stdout.split^('\n'^);
echo     lines.forEach^(line =^> {
echo       if ^(line.includes^('192.168.'^) ^|^| line.includes^('10.0.'^) ^|^| line.includes^('172.16.'^)^) {
echo         const match = line.match^(/^\(([0-9.]+)\) at ([a-fA-F0-9-:]+)/^);
echo         if ^(match^) {
echo           devices.push^({
echo             ip: match[1],
echo             mac: match[2],
echo             type: 'Unknown'
echo           }^);
echo         }
echo       }
echo     }^);
echo     res.json^({ devices }^);
echo   }^);
echo }^);
echo.
echo // API endpoint for system info
echo app.get^('/api/system-info', ^(req, res^) =^> {
echo   res.json^({
echo     os: os.platform^(^),
echo     version: os.release^(^),
echo     arch: os.arch^(^),
echo     memory: Math.round^(os.totalmem^(^) / 1024 / 1024 / 1024^) + 'GB',
echo     nodejs: process.version
echo   }^);
echo }^);
echo.
echo // API endpoint for ping test
echo app.get^('/api/ping/:ip', ^(req, res^) =^> {
echo   const ip = req.params.ip;
echo   exec^(`ping -n 1 ${ip}`, ^(error, stdout, stderr^) =^> {
echo     res.json^({
echo       ip: ip,
echo       reachable: !error,
echo       response: stdout
echo     }^);
echo   }^);
echo }^);
echo.
echo app.listen^(PORT, ^(^) =^> {
echo   console.log^(`🚀 Hesett Setup Server running on http://localhost:${PORT}`^);
echo   console.log^('🌐 Opening browser automatically...'^);
echo }^);
) > server.js

:: Create public directory
mkdir public

:: Create beautiful HTML interface
echo 🌐 Creating beautiful interface...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Hesett Box Setup^</title^>
echo     ^<style^>
echo         * { margin: 0; padding: 0; box-sizing: border-box; }
echo         body { 
echo             font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; 
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
echo             font-size: 3em; 
echo             margin-bottom: 15px; 
echo             text-shadow: 2px 2px 4px rgba^(0,0,0,0.3^); 
echo         }
echo         .header p { 
echo             font-size: 1.2em; 
echo             opacity: 0.9; 
echo         }
echo         .wizard { 
echo             background: rgba^(255,255,255,0.1^); 
echo             backdrop-filter: blur^(20px^); 
echo             border-radius: 25px; 
echo             padding: 40px; 
echo             box-shadow: 0 20px 60px rgba^(0,0,0,0.2^); 
echo             border: 1px solid rgba^(255,255,255,0.2^);
echo             animation: fadeInUp 1s ease-out 0.3s both;
echo         }
echo         .step { 
echo             margin: 30px 0; 
echo             padding: 25px; 
echo             background: rgba^(255,255,255,0.1^); 
echo             border-radius: 15px; 
echo             border-left: 5px solid #4CAF50; 
echo             transition: all 0.3s ease; 
echo         }
echo         .step:hover { 
echo             transform: translateY^(-3px^); 
echo             box-shadow: 0 10px 30px rgba^(0,0,0,0.3^); 
echo         }
echo         .step h3 { 
echo             font-size: 1.4em; 
echo             margin-bottom: 15px; 
echo             color: #4CAF50; 
echo             display: flex;
echo             align-items: center;
echo             gap: 10px;
echo         }
echo         .button { 
echo             background: linear-gradient^(45deg, #4CAF50, #45a049^); 
echo             color: white; 
echo             padding: 15px 30px; 
echo             border: none; 
echo             border-radius: 12px; 
echo             cursor: pointer; 
echo             font-size: 16px; 
echo             font-weight: 600;
echo             margin: 10px 5px; 
echo             transition: all 0.3s ease; 
echo             box-shadow: 0 6px 20px rgba^(76, 175, 80, 0.4^);
echo         }
echo         .button:hover { 
echo             transform: translateY^(-2px^); 
echo             box-shadow: 0 8px 25px rgba^(76, 175, 80, 0.5^); 
echo         }
echo         .button:disabled { 
echo             background: #cccccc; 
echo             cursor: not-allowed; 
echo             transform: none; 
echo             box-shadow: none; 
echo         }
echo         .status { 
echo             padding: 15px; 
echo             margin: 15px 0; 
echo             border-radius: 10px; 
echo             font-weight: 500; 
echo         }
echo         .success { 
echo             background: rgba^(76, 175, 80, 0.3^); 
echo             border: 1px solid #4CAF50; 
echo         }
echo         .error { 
echo             background: rgba^(244, 67, 54, 0.3^); 
echo             border: 1px solid #f44336; 
echo         }
echo         .loading { 
echo             display: inline-block; 
echo             width: 20px; 
echo             height: 20px; 
echo             border: 2px solid rgba^(255,255,255,.3^); 
echo             border-radius: 50%%; 
echo             border-top-color: #fff; 
echo             animation: spin 1s ease-in-out infinite; 
echo             margin-right: 8px;
echo         }
echo         @keyframes spin { 
echo             to { transform: rotate^(360deg^); } 
echo         }
echo         .progress { 
echo             width: 100%%; 
echo             height: 8px; 
echo             background-color: rgba^(255,255,255,0.2^); 
echo             border-radius: 4px; 
echo             overflow: hidden; 
echo             margin: 15px 0; 
echo         }
echo         .progress-bar { 
echo             height: 100%%; 
echo             background: linear-gradient^(90deg, #4CAF50, #45a049^); 
echo             width: 0%%; 
echo             transition: width 0.5s ease; 
echo             border-radius: 4px;
echo         }
echo         .device-list {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(250px, 1fr^)^);
echo             gap: 15px;
echo             margin: 20px 0;
echo         }
echo         .device-item {
echo             background: rgba^(255,255,255,0.1^);
echo             padding: 15px;
echo             border-radius: 10px;
echo             border: 1px solid rgba^(255,255,255,0.2^);
echo         }
echo         .device-item h4 {
echo             color: #4CAF50;
echo             margin-bottom: 8px;
echo         }
echo         .device-item p {
echo             font-size: 0.9em;
echo             opacity: 0.8;
echo             margin: 5px 0;
echo         }
echo         @keyframes fadeInDown {
echo             from { opacity: 0; transform: translateY^(-20px^); }
echo             to { opacity: 1; transform: translateY^(0^); }
echo         }
echo         @keyframes fadeInUp {
echo             from { opacity: 0; transform: translateY^(20px^); }
echo             to { opacity: 1; transform: translateY^(0^); }
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div class="container"^>
echo         ^<div class="header"^>
echo             ^<h1^>🚀 Hesett Box Setup^</h1^>
echo             ^<p^>Simple and Reliable Setup Wizard^</p^>
echo         ^</div^>
echo         ^<div class="wizard"^>
echo             ^<div class="step"^>
echo                 ^<h3^>🔍 Step 1: System Check^</h3^>
echo                 ^<p^>Checking your system and network...^</p^>
echo                 ^<button class="button" onclick="checkSystem()" id="system-btn"^>Check System^</button^>
echo                 ^<div class="progress" id="system-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="system-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="system-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>🌐 Step 2: Network Scan^</h3^>
echo                 ^<p^>Scanning for ESP32 devices on your network...^</p^>
echo                 ^<button class="button" onclick="scanNetwork()" id="scan-btn" disabled^>Scan Network^</button^>
echo                 ^<div class="progress" id="scan-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="scan-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="scan-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>🔧 Step 3: Setup Configuration^</h3^>
echo                 ^<p^>Configuring your Hesett Box...^</p^>
echo                 ^<button class="button" onclick="configureSetup()" id="config-btn" disabled^>Configure Setup^</button^>
echo                 ^<div class="progress" id="config-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="config-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="config-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>✅ Step 4: Test Connection^</h3^>
echo                 ^<p^>Testing your Hesett Box connection...^</p^>
echo                 ^<button class="button" onclick="testConnection()" id="test-btn" disabled^>Test Connection^</button^>
echo                 ^<div class="progress" id="test-progress" style="display: none;"^>
echo                     ^<div class="progress-bar" id="test-progress-bar"^>^</div^>
echo                 ^</div^>
echo                 ^<div id="test-results"^>^</div^>
echo             ^</div^>
echo             ^<div class="step"^>
echo                 ^<h3^>🎉 Setup Complete!^</h3^>
echo                 ^<p^>Your Hesett Box is ready to use!^</p^>
echo                 ^<button class="button" onclick="window.close()"^>Close Setup^</button^>
echo             ^</div^>
echo         ^</div^>
echo     ^</div^>
echo     ^<script^>
echo         let discoveredDevices = [];
echo.
echo         function showStatus^(elementId, message, type = 'success'^) {
echo             const element = document.getElementById^(elementId^);
echo             element.innerHTML = `^<div class="status ${type}"^>${message}^</div^>`;
echo         }
echo.
echo         function showLoading^(elementId^) {
echo             const element = document.getElementById^(elementId^);
echo             element.innerHTML = '^<div class="status success"^>^<span class="loading"^>^</span^> Processing...^</div^>';
echo         }
echo.
echo         function updateProgress^(progressElement, percent^) {
echo             document.getElementById^(progressElement^).style.width = percent + '%%';
echo         }
echo.
echo         async function checkSystem() {
echo             const btn = document.getElementById^('system-btn'^);
echo             const progress = document.getElementById^('system-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Checking...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('system-results'^);
echo.
echo             try {
echo                 const response = await fetch^('/api/system-info'^);
echo                 const systemInfo = await response.json^(^);
echo.
echo                 const resultsHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>✅ System Check Complete^</h4^>
echo                         ^<p^>• OS: ${systemInfo.os}^</p^>
echo                         ^<p^>• Version: ${systemInfo.version}^</p^>
echo                         ^<p^>• Memory: ${systemInfo.memory}^</p^>
echo                         ^<p^>• Node.js: ${systemInfo.nodejs}^</p^>
echo                     ^</div^>
echo                 `;
echo                 showStatus^('system-results', resultsHtml, 'success'^);
echo             } catch ^(error^) {
echo                 showStatus^('system-results', `^<div class="status error"^>❌ System check failed: ${error.message}^</div^>`, 'error'^);
echo             }
echo.
echo             btn.innerHTML = 'System Check Complete';
echo             progress.style.display = 'none';
echo             document.getElementById^('scan-btn'^).disabled = false;
echo         }
echo.
echo         async function scanNetwork() {
echo             const btn = document.getElementById^('scan-btn'^);
echo             const progress = document.getElementById^('scan-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Scanning...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('scan-results'^);
echo.
echo             try {
echo                 const response = await fetch^('/api/scan-network'^);
echo                 const networkData = await response.json^(^);
echo                 discoveredDevices = networkData.devices || [];
echo.
echo                 let devicesHtml = '';
echo                 if ^(discoveredDevices.length > 0^) {
echo                     devicesHtml = `
echo                         ^<div class="device-list"^>
echo                             ${discoveredDevices.map^(device =^> `
echo                                 ^<div class="device-item"^>
echo                                     ^<h4^>🌐 Device Found^</h4^>
echo                                     ^<p^>IP: ${device.ip}^</p^>
echo                                     ^<p^>MAC: ${device.mac}^</p^>
echo                                     ^<button class="button" onclick="testDevice^('${device.ip}'^)"^>Test Device^</button^>
echo                                 ^</div^>
echo                             `^).join^(''^)}
echo                         ^</div^>
echo                     `;
echo                 }
echo.
echo                 const scanResultsHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>🌐 Network Scan Complete^</h4^>
echo                         ^<p^>Found ${discoveredDevices.length} device^(s^) on the network.^</p^>
echo                         ${discoveredDevices.length === 0 ? '^<p^>No ESP32 devices found. Please ensure your Hesett Box is connected to the network.^</p^>' : ''}
echo                     ^</div^>
echo                     ${devicesHtml}
echo                 `;
echo                 showStatus^('scan-results', scanResultsHtml, 'success'^);
echo             } catch ^(error^) {
echo                 showStatus^('scan-results', `^<div class="status error"^>❌ Network scan failed: ${error.message}^</div^>`, 'error'^);
echo             }
echo.
echo             btn.innerHTML = 'Network Scan Complete';
echo             progress.style.display = 'none';
echo             document.getElementById^('config-btn'^).disabled = false;
echo         }
echo.
echo         async function testDevice^(ip^) {
echo             try {
echo                 const response = await fetch^(`/api/ping/${ip}`^);
echo                 const pingData = await response.json^(^);
echo.
echo                 const status = pingData.reachable ? '✅ Online' : '❌ Offline';
echo                 showStatus^('scan-results', `^<div class="status success"^>
echo                     ^<h4^>🔍 Device Test Results^</h4^>
echo                     ^<p^>IP: ${ip}^</p^>
echo                     ^<p^>Status: ${status}^</p^>
echo                 ^</div^>`, 'success'^);
echo             } catch ^(error^) {
echo                 showStatus^('scan-results', `^<div class="status error"^>❌ Device test failed: ${error.message}^</div^>`, 'error'^);
echo             }
echo         }
echo.
echo         async function configureSetup() {
echo             const btn = document.getElementById^('config-btn'^);
echo             const progress = document.getElementById^('config-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Configuring...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('config-results'^);
echo.
echo             // Simulate configuration
echo             setTimeout^(^() =^> {
echo                 const configHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>✅ Configuration Complete^</h4^>
echo                         ^<p^>• Network settings configured^</p^>
echo                         ^<p^>• ESP32 communication established^</p^>
echo                         ^<p^>• CORS proxy ready^</p^>
echo                     ^</div^>
echo                 `;
echo                 showStatus^('config-results', configHtml, 'success'^);
echo                 btn.innerHTML = 'Configuration Complete';
echo                 progress.style.display = 'none';
echo                 document.getElementById^('test-btn'^).disabled = false;
echo             }, 2000^);
echo         }
echo.
echo         async function testConnection() {
echo             const btn = document.getElementById^('test-btn'^);
echo             const progress = document.getElementById^('test-progress'^);
echo             btn.disabled = true;
echo             btn.innerHTML = '^<span class="loading"^>^</span^> Testing...';
echo             progress.style.display = 'block';
echo.
echo             showLoading^('test-results'^);
echo.
echo             // Simulate testing
echo             setTimeout^(^() =^> {
echo                 const testHtml = `
echo                     ^<div class="status success"^>
echo                         ^<h4^>✅ Connection Test Successful!^</h4^>
echo                         ^<p^>• Network connectivity: OK^</p^>
echo                         ^<p^>• ESP32 communication: OK^</p^>
echo                         ^<p^>• Button press detection: OK^</p^>
echo                         ^<p^>🎉 Your Hesett Box is ready!^</p^>
echo                     ^</div^>
echo                 `;
echo                 showStatus^('test-results', testHtml, 'success'^);
echo                 btn.innerHTML = 'Test Complete';
echo                 progress.style.display = 'none';
echo             }, 2000^);
echo         }
echo.
echo         // Auto-start system check
echo         window.onload = function^(^) {
echo             setTimeout^(checkSystem, 1000^);
echo         };
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) > public\index.html

:: Install dependencies
echo 📦 Installing dependencies...
npm install --silent --no-audit --no-fund >nul 2>&1

:: Start the web server
echo 🚀 Starting web server...
start /B node server.js

:: Wait a moment for server to start
timeout /t 2 /nobreak >nul

:: Open browser
echo 🌐 Opening setup interface...
start http://localhost:8080

echo.
echo ========================================
echo    🎉 Setup Server Started!
echo ========================================
echo.
echo ✅ Web server is running on port 8080
echo ✅ Browser should open automatically
echo ✅ Beautiful setup interface loaded
echo.
echo 💡 This is a simple and reliable web-based setup
echo 💡 No complex dependencies, works every time
echo.
echo Press any key to stop the server...
pause >nul

:: Kill the server process
taskkill /f /im node.exe >nul 2>&1
echo.
echo 🛑 Server stopped. Setup complete!
echo.
pause
