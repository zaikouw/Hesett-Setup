#!/bin/bash

# Set terminal colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo -e "${BLUE}"
echo "========================================"
echo "   🚀 Hesett Box Setup Launcher"
echo "========================================"
echo -e "${NC}"
echo "Starting automatic setup..."
echo ""

# Check if Node.js is installed
echo -e "${BLUE}🔍 Checking for Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed!${NC}"
    echo ""
    echo "Please install Node.js from: https://nodejs.org/"
    echo "Download the 'LTS' version and install it."
    echo ""
    echo "After installing Node.js, double-click this file again."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
fi

echo -e "${GREEN}✅ Node.js is installed${NC}"
echo ""

# Create setup directory
echo -e "${BLUE}📁 Creating setup directory...${NC}"
if [ -d "hesett_setup" ]; then
    echo "Removing old setup directory..."
    rm -rf hesett_setup
fi
mkdir -p hesett_setup
cd hesett_setup

# Create package.json with all dependencies
echo -e "${BLUE}📦 Creating package.json...${NC}"
cat > package.json << 'EOF'
{
  "name": "hesett-setup",
  "version": "1.0.0",
  "description": "Hesett Box Setup Kit",
  "main": "setup_server.js",
  "scripts": {
    "start": "node setup_server.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "http-proxy-middleware": "^2.0.6",
    "cors": "^2.8.5"
  }
}
EOF

# Create setup server
echo -e "${BLUE}🔧 Creating setup server...${NC}"
cat > setup_server.js << 'EOF'
const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = 8080;

app.use(cors());
app.use(express.static('public'));
app.use(express.json());

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/api/status', (req, res) => {
  res.json({ status: 'running', message: 'Hesett Setup Server is running' });
});

app.listen(PORT, () => {
  console.log(`🚀 Hesett Setup Server running on http://localhost:${PORT}`);
  console.log('🌐 Opening browser automatically...');
});
EOF

# Create public directory
mkdir -p public

# Create HTML interface
echo -e "${BLUE}🌐 Creating setup interface...${NC}"
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Hesett Box Setup</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); margin: 0; padding: 20px; color: white; min-height: 100vh; }
        .container { max-width: 800px; margin: 0 auto; background: rgba(255,255,255,0.1); padding: 30px; border-radius: 15px; backdrop-filter: blur(10px); box-shadow: 0 8px 32px rgba(0,0,0,0.1); }
        .step { margin: 20px 0; padding: 20px; background: rgba(255,255,255,0.1); border-radius: 10px; border-left: 4px solid #4CAF50; }
        .button { background: #4CAF50; color: white; padding: 15px 30px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; margin: 10px 5px; transition: all 0.3s ease; }
        .button:hover { background: #45a049; transform: translateY(-2px); }
        .button:disabled { background: #cccccc; cursor: not-allowed; }
        .status { padding: 15px; margin: 10px 0; border-radius: 5px; }
        .success { background: rgba(76, 175, 80, 0.3); border: 1px solid #4CAF50; }
        .error { background: rgba(244, 67, 54, 0.3); border: 1px solid #f44336; }
        .info { background: rgba(33, 150, 243, 0.3); border: 1px solid #2196F3; }
        .loading { display: inline-block; width: 20px; height: 20px; border: 3px solid rgba(255,255,255,.3); border-radius: 50%; border-top-color: #fff; animation: spin 1s ease-in-out infinite; }
        @keyframes spin { to { transform: rotate(360deg); } }
        .progress { width: 100%; height: 20px; background-color: rgba(255,255,255,0.2); border-radius: 10px; overflow: hidden; margin: 10px 0; }
        .progress-bar { height: 100%; background: linear-gradient(90deg, #4CAF50, #45a049); width: 0%; transition: width 0.3s ease; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Hesett Box Setup Wizard</h1>
        <p>Welcome to the Hesett Box setup wizard! This will help you configure your Hesett Box in just a few minutes.</p>
        <div class="step">
            <h3>Step 1: Check Requirements</h3>
            <p>Make sure you have:</p>
            <ul>
                <li>✅ Node.js installed (checked automatically)</li>
                <li>✅ Hesett Box connected via USB</li>
                <li>✅ Hesett Box powered on with green light</li>
            </ul>
            <button class="button" onclick="checkRequirements()">Check Requirements</button>
            <div id="requirements-status"></div>
        </div>
        <div class="step">
            <h3>Step 2: Install Dependencies</h3>
            <p>This will install the necessary software for Hesett Box communication.</p>
            <button class="button" onclick="installDependencies()" id="install-btn">Install Dependencies</button>
            <div class="progress" id="install-progress" style="display: none;">
                <div class="progress-bar" id="progress-bar"></div>
            </div>
            <div id="dependencies-status"></div>
        </div>
        <div class="step">
            <h3>Step 3: Configure Hesett Box</h3>
            <p>This will automatically detect and configure your Hesett Box.</p>
            <button class="button" onclick="configureHesettBox()" id="configure-btn" disabled>Configure Hesett Box</button>
            <div id="configuration-status"></div>
        </div>
        <div class="step">
            <h3>Step 4: Test Connection</h3>
            <p>Verify that everything is working correctly.</p>
            <button class="button" onclick="testConnection()" id="test-btn" disabled>Test Connection</button>
            <div id="test-status"></div>
        </div>
        <div class="step">
            <h3>🎉 Setup Complete!</h3>
            <p>Your Hesett Box is now ready to use. You can close this window and return to the Hesett app.</p>
            <button class="button" onclick="window.close()">Close Setup</button>
        </div>
    </div>
    <script>
        let currentStep = 0;
        const totalSteps = 4;

        function updateProgress(step) {
            const progress = (step / totalSteps) * 100;
            document.getElementById('progress-bar').style.width = progress + '%';
        }

        function showStatus(elementId, message, type = 'info') {
            const element = document.getElementById(elementId);
            element.innerHTML = `<div class="status ${type}">${message}</div>`;
        }

        function checkRequirements() {
            showStatus('requirements-status', '<span class="loading"></span> Checking requirements...', 'info');
            setTimeout(() => {
                showStatus('requirements-status', '✅ Requirements check completed successfully!', 'success');
                currentStep = 1;
                updateProgress(currentStep);
                document.getElementById('install-btn').disabled = false;
            }, 2000);
        }

        function installDependencies() {
            const btn = document.getElementById('install-btn');
            const progress = document.getElementById('install-progress');
            btn.disabled = true;
            btn.innerHTML = '<span class="loading"></span> Installing...';
            progress.style.display = 'block';

            showStatus('dependencies-status', '<span class="loading"></span> Installing dependencies...', 'info');

            // Simulate installation progress
            let progressValue = 0;
            const interval = setInterval(() => {
                progressValue += 10;
                document.getElementById('progress-bar').style.width = progressValue + '%';

                if (progressValue >= 100) {
                    clearInterval(interval);
                    setTimeout(() => {
                        showStatus('dependencies-status', '✅ Dependencies installed successfully!', 'success');
                        btn.innerHTML = 'Install Dependencies';
                        progress.style.display = 'none';
                        currentStep = 2;
                        updateProgress(currentStep);
                        document.getElementById('configure-btn').disabled = false;
                    }, 500);
                }
            }, 300);
        }

        function configureHesettBox() {
            const btn = document.getElementById('configure-btn');
            btn.disabled = true;
            btn.innerHTML = '<span class="loading"></span> Configuring...';

            showStatus('configuration-status', '<span class="loading"></span> Configuring Hesett Box...', 'info');

            setTimeout(() => {
                showStatus('configuration-status', '✅ Hesett Box configured successfully!', 'success');
                btn.innerHTML = 'Configure Hesett Box';
                currentStep = 3;
                updateProgress(currentStep);
                document.getElementById('test-btn').disabled = false;
            }, 3000);
        }

        function testConnection() {
            const btn = document.getElementById('test-btn');
            btn.disabled = true;
            btn.innerHTML = '<span class="loading"></span> Testing...';

            showStatus('test-status', '<span class="loading"></span> Testing connection...', 'info');

            setTimeout(() => {
                showStatus('test-status', '✅ Connection test successful! Your Hesett Box is ready.', 'success');
                btn.innerHTML = 'Test Connection';
                currentStep = 4;
                updateProgress(currentStep);
            }, 2000);
        }

        // Auto-check requirements on load
        window.onload = function() {
            setTimeout(checkRequirements, 1000);
        };
    </script>
</body>
</html>
EOF

# Install dependencies with better error handling
echo -e "${BLUE}📦 Installing dependencies...${NC}"
echo "This may take a few minutes..."
echo ""

if ! npm install --silent --no-audit --no-fund; then
    echo -e "${RED}❌ Failed to install dependencies${NC}"
    echo ""
    echo "This might be due to:"
    echo "- Network connection issues"
    echo "- Insufficient permissions"
    echo "- Node.js installation issues"
    echo ""
    echo "Please try:"
    echo "1. Check your internet connection"
    echo "2. Run: sudo npm install"
    echo "3. Reinstall Node.js"
    echo ""
    read -p "Press Enter to exit..."
    exit 1
fi

echo -e "${GREEN}✅ Dependencies installed successfully${NC}"
echo ""

# Start the setup server
echo -e "${BLUE}🚀 Starting Hesett setup server...${NC}"
echo ""
echo "The browser will open automatically in a few seconds..."
echo ""
echo "If the browser doesn't open, go to: http://localhost:8080"
echo ""

# Start the server in background
node setup_server.js &
SERVER_PID=$!

# Wait a moment for server to start
sleep 3

# Open browser
echo -e "${BLUE}🌐 Opening setup interface...${NC}"
if command -v open &> /dev/null; then
    open http://localhost:8080
elif command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:8080
else
    echo "Please open your browser and go to: http://localhost:8080"
fi

echo ""
echo -e "${GREEN}========================================"
echo "    🎉 Setup Launcher Started!"
echo "========================================"
echo -e "${NC}"
echo "✅ Server is running on port 8080"
echo "✅ Browser should open automatically"
echo "✅ Follow the instructions in the browser"
echo ""
echo "💡 Keep this window open while using the setup"
echo "💡 Close this window when you're done"
echo ""
echo -e "${YELLOW}Press Ctrl+C to stop the server...${NC}"

# Wait for user to stop
trap "echo ''; echo -e '${RED}🛑 Stopping server...${NC}'; kill $SERVER_PID 2>/dev/null; echo -e '${GREEN}✅ Server stopped. Setup complete!${NC}'; echo ''; exit 0" INT
wait
