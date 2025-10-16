#!/bin/bash

# Android Kotlin Project Generator (Vite-style)
# Creates projects from GitHub template

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Template repository
TEMPLATE_REPO="satyam16-ai/android-kotlin-template"
TEMPLATE_BRANCH="main"

print_header() {
    echo ""
    echo "════════════════════════════════════"
    echo "  🚀 Create Android Kotlin App"
    echo "════════════════════════════════════"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}→${NC} $1"
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install git first."
    exit 1
fi

print_header

# Get project details
read -p "Project name: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name is required"
    exit 1
fi

read -p "Package name (e.g., com.example.app): " PACKAGE_NAME
if [ -z "$PACKAGE_NAME" ]; then
    PACKAGE_NAME="com.example.${PROJECT_NAME,,}"
fi

read -p "App display name (default: $PROJECT_NAME): " DISPLAY_NAME
if [ -z "$DISPLAY_NAME" ]; then
    DISPLAY_NAME="$PROJECT_NAME"
fi

echo ""
print_info "Creating project: $PROJECT_NAME"
print_info "Package: $PACKAGE_NAME"
print_info "Display name: $DISPLAY_NAME"
echo ""

# Create project directory
if [ -d "$PROJECT_NAME" ]; then
    print_error "Directory '$PROJECT_NAME' already exists"
    exit 1
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Download template
print_info "Downloading template..."
git clone --depth 1 --branch "$TEMPLATE_BRANCH" \
    "https://github.com/$TEMPLATE_REPO.git" . 2>/dev/null || {
    print_error "Failed to download template from GitHub"
    print_error "Please check your internet connection"
    cd ..
    rm -rf "$PROJECT_NAME"
    exit 1
}

# Remove .git directory and generator script from template
rm -rf .git
rm -f create-android-app.sh

print_success "Template downloaded"

# Replace placeholders
print_info "Customizing project..."

# Convert package name to path (com.example.app -> com/example/app)
PACKAGE_PATH=$(echo "$PACKAGE_NAME" | tr '.' '/')
OLD_PACKAGE_PATH="com/example/myapplication"

# Update package structure only if different
if [ "$PACKAGE_PATH" != "$OLD_PACKAGE_PATH" ]; then
    mkdir -p "app/src/main/java/$PACKAGE_PATH"
    if [ -d "app/src/main/java/$OLD_PACKAGE_PATH" ]; then
        mv app/src/main/java/$OLD_PACKAGE_PATH/*.kt "app/src/main/java/$PACKAGE_PATH/" 2>/dev/null || true
        # Remove old package structure
        rm -rf app/src/main/java/com/example
    fi
fi

# Replace package name in all files
find . -type f \( -name "*.kt" -o -name "*.xml" -o -name "*.gradle" \) -exec \
    sed -i "s/com\.example\.myapplication/$PACKAGE_NAME/g" {} \;

# Replace app name
find . -type f -name "strings.xml" -exec \
    sed -i "s/<string name=\"app_name\">.*<\/string>/<string name=\"app_name\">$DISPLAY_NAME<\/string>/g" {} \;

# Update settings.gradle
sed -i "s/rootProject.name = .*/rootProject.name = \"$PROJECT_NAME\"/g" settings.gradle 2>/dev/null || true

# Update README
cat > README.md << EOF
# $PROJECT_NAME

Android Kotlin application with animated splash screen.

## Quick Start

\`\`\`bash
./setup.sh
\`\`\`

## Package
\`$PACKAGE_NAME\`

## Features
- Animated Splash Screen
- Material Design
- Kotlin Native
- Ready for Development

## Build

\`\`\`bash
# Build APK
./gradlew assembleDebug

# Install on device
./gradlew installDebug

# Clean build
./gradlew clean
\`\`\`

## Requirements
- JDK 8 or higher
- Android SDK
- Connected Android device or emulator
EOF

print_success "Project customized"

# Initialize git
git init > /dev/null 2>&1
git add . > /dev/null 2>&1
git commit -m "Initial commit" > /dev/null 2>&1

print_success "Git initialized"

echo ""
echo "════════════════════════════════════"
echo -e "${GREEN}✅ Done!${NC} Project created at:"
echo "   $(pwd)"
echo "════════════════════════════════════"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  cd $PROJECT_NAME"
echo "  ./setup.sh"
echo ""
