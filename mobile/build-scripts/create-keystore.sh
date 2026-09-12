#!/bin/bash

# Love App - Keystore Generation Script
# This script creates a keystore file for signing the Android app

echo "🔐 Love App - Keystore Generation"
echo "===================================="
echo ""
echo "This will create a keystore file for signing your Android app."
echo "⚠️  IMPORTANT: Keep this file safe and never commit it to Git!"
echo ""

read -p "Enter keystore file name (default: love-app.keystore): " keystore_name
keystore_name=${keystore_name:-love-app.keystore}

read -p "Enter keystore password (min 6 chars): " -s keystore_pass
echo ""
read -p "Confirm password: " -s keystore_pass_confirm
echo ""

if [ "$keystore_pass" != "$keystore_pass_confirm" ]; then
    echo "❌ Passwords don't match!"
    exit 1
fi

read -p "Enter key alias (default: love-app): " key_alias
key_alias=${key_alias:-love-app}

read -p "Enter key password (can be same as keystore): " -s key_pass
echo ""

read -p "Enter organization (e.g., Love App Inc): " org
read -p "Enter organization unit (e.g., Engineering): " org_unit
read -p "Enter your name/company: " name
read -p "Enter city: " city
read -p "Enter state/province: " state
read -p "Enter country code (e.g., US): " country

echo ""
echo "🔨 Generating keystore..."

keytool -genkey -v \
  -keystore "$keystore_name" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias "$key_alias" \
  -storepass "$keystore_pass" \
  -keypass "$key_pass" \
  -dname "CN=$name, OU=$org_unit, O=$org, L=$city, ST=$state, C=$country"

echo ""
if [ -f "$keystore_name" ]; then
    echo "✅ Keystore created successfully!"
    echo ""
    echo "📋 Keystore Details:"
    echo "   File: $keystore_name"
    echo "   Alias: $key_alias"
    echo "   Validity: 10000 days (~27 years)"
    echo ""
    echo "⚠️  IMPORTANT:"
    echo "   1. Add to .gitignore: echo '$keystore_name' >> .gitignore"
    echo "   2. Store safely (backup recommended)"
    echo "   3. Never share or commit this file"
    echo "   4. Save your password somewhere secure"
    echo ""
    echo "Next steps:"
    echo "   1. Add this keystore to your EAS project"
    echo "   2. Run: eas credentials"
    echo "   3. Select 'Android' and configure keystore"
    echo ""
else
    echo "❌ Failed to create keystore"
    exit 1
fi
