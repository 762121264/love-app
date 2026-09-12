# Love App - Google Play Store Setup Checklist

## Pre-Launch Checklist

### Account Setup
- [ ] Create Google Play Developer account
- [ ] Set up Expo account
- [ ] Generate keystore for app signing
- [ ] Create Google Cloud service account
- [ ] Download service account JSON key
- [ ] Add key to `.gitignore`

### App Configuration
- [ ] Update app name in `app.json`
- [ ] Set package name: `com.loveapp.mobile`
- [ ] Set correct versionCode: `1`
- [ ] Set correct version: `1.0.0`
- [ ] Set all required permissions
- [ ] Configure adaptive icon
- [ ] Create splash screen

### Assets & Graphics
- [ ] Create app icon (512x512 PNG)
- [ ] Create feature graphic (1024x500 PNG)
- [ ] Create 4-8 phone screenshots (1080x1920)
- [ ] Create promotional image (180x120)
- [ ] Create promo video (optional)
- [ ] Add app icon to `mobile/assets/`
- [ ] Add screenshots to `mobile/assets/screenshots/`

### Store Listing
- [ ] Write app title (max 50 chars)
- [ ] Write short description (max 80 chars)
- [ ] Write full description (max 4000 chars)
- [ ] Select appropriate category (Dating)
- [ ] Set content rating
- [ ] Create privacy policy
- [ ] Create terms of service
- [ ] Add contact email
- [ ] Add website URL

### Testing
- [ ] Install EAS CLI: `npm install -g eas-cli`
- [ ] Test app on Android 12+
- [ ] Test all permissions
- [ ] Test messaging functionality
- [ ] Test profile creation
- [ ] Test matching algorithm
- [ ] Test location features
- [ ] Test with slow network

### Build & Submission
- [ ] Build preview APK: `eas build --platform android --profile preview`
- [ ] Test preview APK on device
- [ ] Fix any issues found during testing
- [ ] Build production AAB: `eas build --platform android --profile production`
- [ ] Submit to internal testing track
- [ ] Wait 7 days minimum for testing
- [ ] Collect feedback and fix issues
- [ ] Submit to beta testing track
- [ ] Monitor for 48 hours with 25% rollout
- [ ] Gradually increase rollout to 100%
- [ ] Monitor crashes and ratings

## Google Play Console Setup

### App Details
```
App Name: Love App
Primary Category: Dating
Content Rating: PG-13 or higher (dating)
Targeted Audience: 13+ or 16+
```

### Minimum Requirements
```
Minimum SDK: API 21 (Android 5.0)
Target SDK: API 34 (Android 14)
```

### Permissions Required
- CAMERA - For profile photos
- READ_EXTERNAL_STORAGE - For gallery access
- WRITE_EXTERNAL_STORAGE - For saving images
- ACCESS_FINE_LOCATION - For nearby matches
- ACCESS_COARSE_LOCATION - For general location
- INTERNET - For app communication

## Commands Quick Reference

```bash
# Install EAS
npm install -g eas-cli

# Login to Expo
eas login

# Build preview APK for testing
cd mobile
eas build --platform android --profile preview

# Build production AAB for store
eas build --platform android --profile production

# Submit to Google Play (requires service account key)
eas submit --platform android --latest

# View build status
eas build:list

# View submission status
eas submit:list

# Generate keystore
keytool -genkey -v -keystore love-app.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias love-app
```

## File Structure

```
mobile/
├── app.json                    # Expo config (includes Google Play config)
├── eas.json                    # EAS build config
├── google-play-guide.md        # Full guide
├── GOOGLE_PLAY_SETUP.md       # This checklist
├── google-play-key.json       # Service account key (KEEP SECRET)
├── love-app.keystore          # App signing key (KEEP SECRET)
├── package.json
├── src/
│   └── App.tsx
└── assets/
    ├── icon.png
    ├── splash.png
    ├── adaptive-icon.png
    └── screenshots/
        ├── phone/
        │   ├── screenshot1.png
        │   ├── screenshot2.png
        │   └── ...
        └── tablet/
            ├── screenshot1.png
            └── ...
```

## Important Notes

⚠️ **Security:**
- Never commit `google-play-key.json` to Git
- Never commit `love-app.keystore` to Git
- Store these in a secure location
- Use GitHub Secrets for CI/CD

⚠️ **Versioning:**
- `version` in app.json must increment for each release
- `versionCode` in app.json must always increase
- Cannot go backwards

⚠️ **Content Policy:**
- No explicit content allowed
- Dating app classification required
- Age-appropriate content only
- Must have privacy policy
- Must comply with Google Play policies

## Estimated Timeline

- Pre-launch preparation: 2-3 weeks
- Build & testing: 1-2 weeks
- Internal testing: 1 week minimum
- Beta testing: 1 week
- Final approval: 1-2 days
- **Total: 4-6 weeks to launch**

## Support

For issues or questions:
1. Check Google Play Console Help
2. Review Expo documentation
3. Contact Expo support: https://forums.expo.dev
4. Email: support@love-app.com

---

**Status:** Ready for setup
**Last Updated:** 2024
