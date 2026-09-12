# Google Play Store Publishing Guide for Love App

## Prerequisites

1. **Google Play Developer Account**
   - Create account at https://play.google.com/console
   - Pay $25 one-time registration fee
   - Accept Developer Program Policies

2. **Expo Account**
   - Sign up at https://expo.dev
   - Create organization (optional but recommended)

3. **Keystore File** (for signing)
   - Generate with: `keytool -genkey -v -keystore love-app.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias love-app`
   - Store securely and NEVER commit to git

4. **Service Account Key**
   - Go to Google Play Console → Setup → API access
   - Create service account in Google Cloud Console
   - Download JSON key file
   - Save as `google-play-key.json` (add to .gitignore)

## Step 1: Prepare App Store Assets

### Create Graphics
```
Assets needed:
- App Icon: 512x512 pixels (PNG)
- Feature Graphic: 1024x500 pixels (PNG)
- Screenshots (2-8):
  - Phone: 1080x1920 pixels
  - Tablet: 2560x1600 pixels
- Promo Graphic: 180x120 pixels (PNG)
```

### Create Screenshots Directories
```bash
mkdir -p mobile/assets/screenshots/phone
mkdir -p mobile/assets/screenshots/tablet
```

## Step 2: Build APK for Testing

### Install EAS CLI
```bash
npm install -g eas-cli
eas login
```

### Build Preview APK
```bash
cd mobile
eas build --platform android --profile preview
```

This creates a downloadable APK for testing on devices.

## Step 3: Create Production Build (AAB)

```bash
cd mobile
eas build --platform android --profile production
```

This generates an Android App Bundle (.aab) for Google Play.

## Step 4: Setup Google Play Console

### 1. Create New App
- Go to Google Play Console → All apps → Create app
- App name: "Love App"
- Default language: English
- App category: Dating
- Content rating: Fill out questionnaire (PEGI/ESRB)
- Target audience: 13+ or 16+ (dating app)

### 2. Add App Details

**Store Listing:**
```
Title: Love App ❤️

Short description (50 chars):
Find your perfect match & celebrate love

Full description (4000 chars):
Love App is a modern dating platform that helps you find your perfect match.

Key Features:
✓ Smart Matching Algorithm - Find compatible partners
✓ Real-time Messaging - Instant communication
✓ Verified Profiles - Safe and secure dating
✓ Location-based Discovery - Meet people near you
✓ Event Planning - Organize dates and celebrations
✓ Profile Customization - Showcase your personality

How it works:
1. Create your profile
2. Browse matches based on interests
3. Connect with compatible people
4. Start meaningful conversations
5. Plan dates and celebrations

Safety First:
- Verified phone numbers
- Profile verification
- Safe reporting tools
- 24/7 moderation team
- End-to-end encrypted messages

Join millions of people looking for love!
```

**Category & Contact Info:**
- Category: Dating
- Content rating: Fill questionnaire
- Contact email: support@love-app.com

### 3. Add Graphics and Screenshots

1. Upload icon (512x512 PNG)
2. Upload feature graphic (1024x500 PNG)
3. Upload 2-8 screenshots in portrait orientation
4. Upload promotional graphic (optional)

### 4. Content Rating Questionnaire

Fill out the questionnaire on Google Play:
- Violence: None
- Sexual content: Moderate (dating app)
- Profanity: Light
- Alcohol/Tobacco: None
- Gambling: None

This generates ESRB and IARC ratings.

### 5. Privacy & Security

**Privacy Policy:**
- Create and upload your privacy policy
- Must include:
  - Data collection practices
  - Data sharing practices
  - User rights and choices
  - Data retention period
  - Contact information

**Example URL:** https://love-app.com/privacy

**App Permissions:**
Explain why you need:
- Camera (for profile photos)
- Location (for nearby matches)
- Gallery/Photos (for profile pictures)
- Contacts (optional, for inviting friends)

### 6. Set Pricing & Distribution

- Price: Free
- Countries: Select all or specific regions
- Consent declarations: Accept requirements

## Step 5: First Release to Internal Testing

### Upload AAB to Internal Testing Track

```bash
# Using EAS
eas submit --platform android --latest

# Or manually:
# 1. Go to Google Play Console
# 2. Testing → Internal testing
# 3. Create release
# 4. Upload AAB file
# 5. Add release notes
```

### Test the Build

```bash
# Add test users
# Go to Internal testing → Testers
# Add test emails and get link
# Share link with team for testing

# Minimum testing duration: 7 days
# Gather feedback and fix any issues
```

## Step 6: Staged Rollout to Production

### 1. Move to Closed Testing (Beta)

```bash
eas submit --platform android --track beta
```

- Create release
- Add release notes
- Set to ~25% rollout initially
- Monitor for crashes (Crashlytics)
- Wait 48 hours

### 2. Increase to 50%, then 100%

- Monitor Play Console dashboard
- Check ratings and reviews
- Monitor crash rates
- Gradually increase rollout percentage

### 3. Full Production Release

```bash
eas submit --platform android --track production
```

## Step 7: Monitor Post-Launch

### Key Metrics to Track

- **Install metrics:**
  - Total installs
  - Active installs by country
  - Device breakdown
  - Android version distribution

- **Performance:**
  - Crash rate (should be < 0.01%)
  - ANR rate (should be < 0.05%)
  - Slow render rate
  - Battery usage

- **Engagement:**
  - Daily/Monthly active users
  - Retention rate
  - Session length
  - User ratings

- **Revenue (if applicable):**
  - In-app purchase revenue
  - Subscription revenue

### Setup Firebase Crashlytics

```bash
npm install firebase @react-native-firebase/app @react-native-firebase/crashlytics
```

Add to your app.json:
```json
{
  "plugins": [
    "@react-native-firebase/app",
    "@react-native-firebase/crashlytics"
  ]
}
```

## Versioning & Updates

### Version Bumping

Update in `mobile/app.json`:
```json
{
  "version": "1.0.1",
  "android": {
    "versionCode": 2
  }
}
```

**Rules:**
- `version`: Always increment for new releases (1.0.0 → 1.0.1)
- `versionCode`: Must always increase (1 → 2 → 3)
- Cannot decrease either value

### Release Notes

Always include in each release:
```
Version 1.0.1 - Bug Fixes & Improvements

✓ Fixed messaging notification delay
✓ Improved profile loading performance
✓ Enhanced location accuracy
✓ Better error handling
✓ UI improvements

Thank you for using Love App! ❤️
```

## Troubleshooting

### Build Failures

**Issue:** "Build failed to sign"
- Solution: Check keystore file and password

**Issue:** "Invalid app signing key"
- Solution: Verify service account has appropriate permissions

**Issue:** "Minimum API level"
- Solution: Update `minSdkVersion` in `eas.json`

### Submission Issues

**Issue:** "Policy violation detected"
- Solution: Review content policy and modify app accordingly

**Issue:** "Violates sexual content policy"
- Solution: Ensure profile pictures are appropriate (no explicit content)

### After Launch Issues

**Issue:** "High crash rate"
- Solution: Check Firebase Crashlytics for stack traces
- Publish hotfix immediately

**Issue:** "Low ratings"
- Solution: Respond to reviews, address feedback

## Best Practices

1. **Always test before submitting**
   - Test on multiple device sizes
   - Test all permissions
   - Test with slow network (throttle)

2. **Monitor reviews closely**
   - Respond to all reviews
   - Fix reported bugs quickly
   - Maintain positive rating

3. **Plan updates**
   - Monthly feature updates
   - Regular bug fix releases
   - Security patches immediately

4. **A/B Testing**
   - Use Google Play Console A/B testing
   - Test store listing changes
   - Optimize screenshots and text

5. **Localization**
   - Translate app to 5-10 major languages
   - Translate store listing
   - Increases reach and ratings

## Important Links

- Google Play Console: https://play.google.com/console
- Expo Documentation: https://docs.expo.dev
- Google Play Policies: https://play.google.com/about/developer-content-policy/
- Firebase Console: https://console.firebase.google.com

## Security Considerations

1. **Never commit secrets:**
   ```bash
   echo 'google-play-key.json' >> .gitignore
   echo 'love-app.keystore' >> .gitignore
   ```

2. **Store secrets in GitHub Secrets (for CI/CD):**
   - Go to Repository → Settings → Secrets
   - Add: `GOOGLE_PLAY_KEY` (base64 encoded)
   - Add: `KEYSTORE_PASSWORD`

3. **Rotate keys periodically**
   - Change Play Console passwords quarterly
   - Regenerate service accounts yearly

## Support & Resources

- Google Play Console Help: https://support.google.com/googleplay/android-developer
- Expo Community Forums: https://forums.expo.dev
- Email: support@love-app.com
- Bug Reports: Create issue in GitHub repo

---

**Last Updated:** 2024
**Status:** Complete
