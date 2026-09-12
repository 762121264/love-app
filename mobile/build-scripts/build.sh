#!/bin/bash

# Love App - Google Play Build Script
# This script builds the app for Android and submits to Google Play

set -e

echo "🎉 Love App - Google Play Build Script"
echo "========================================"

# Check if eas-cli is installed
if ! command -v eas &> /dev/null; then
    echo "❌ EAS CLI not found. Installing..."
    npm install -g eas-cli
fi

# Check if we're in the mobile directory
if [ ! -f "app.json" ]; then
    echo "❌ app.json not found. Please run from mobile directory."
    exit 1
fi

echo ""
echo "📋 Build Options:"
echo "1. Build Preview APK (for testing)"
echo "2. Build Production AAB (for Google Play)"
echo "3. Submit to Google Play (requires AAB)"
echo "4. Build and Submit (Preview APK only)"
echo ""
read -p "Select option (1-4): " option

case $option in
    1)
        echo ""
        echo "🔨 Building Preview APK..."
        eas build --platform android --profile preview
        echo "✅ Preview APK built successfully!"
        echo "📥 Download from EAS: https://expo.dev/accounts/[your-account]/projects/love-app"
        ;;
    2)
        echo ""
        echo "🔨 Building Production AAB..."
        eas build --platform android --profile production
        echo "✅ Production AAB built successfully!"
        echo "📦 Ready for Google Play submission"
        ;;
    3)
        echo ""
        echo "📤 Submitting to Google Play..."
        
        # Check if service account key exists
        if [ ! -f "google-play-key.json" ]; then
            echo "❌ google-play-key.json not found!"
            echo "   Please add your Google Play service account key."
            exit 1
        fi
        
        echo "📤 Submitting latest build to Google Play..."
        eas submit --platform android --latest
        echo "✅ Submitted to Google Play successfully!"
        ;;
    4)
        echo ""
        echo "🔨 Building Preview APK and submitting..."
        eas build --platform android --profile preview
        echo "✅ Build complete!"
        ;;
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "🎉 Done!"
echo ""
