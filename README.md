# CloudX iOS SDK

A powerful iOS SDK for maximizing ad revenue through intelligent ad mediation across multiple ad networks. The CloudX SDK helps developers efficiently manage and optimize their ad inventory to ensure the highest possible returns.

## Features

- **Multiple Ad Formats**: Banner, Interstitial, Rewarded, Native, and MREC ads
- **Intelligent Mediation**: Automatic optimization across multiple ad networks
- **Real-time Bidding**: Advanced bidding technology for maximum revenue
- **Comprehensive Analytics**: Detailed reporting and performance metrics
- **Easy Integration**: Simple API with comprehensive delegate callbacks
- **iOS 14.0+ Support**: Modern iOS compatibility

## Requirements

- **iOS**: 14.0 or later
- **Xcode**: 12.0 or later
- **Swift**: 5.0 or later (for Swift projects)
- **Objective-C**: Compatible with all Objective-C projects

## Installation

### CocoaPods (Recommended)

1. Add the CloudX SDK to your `Podfile`:

```ruby
platform :ios, '14.0'

target 'YourApp' do
  use_frameworks!
  
  # CloudX Core SDK
  pod 'CloudXCore'
  
  # Optional: CloudX Adapters (add as needed)
  # pod 'CloudXMetaAdapter'
  # pod 'CloudXPrebidAdapter'
end
```

2. Install the dependencies:

```bash
pod install --repo-update
```

3. Open your project using the `.xcworkspace` file.

### Swift Package Manager

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/cloudx-xenoss/CloudXCoreiOS`
3. Select the latest version and click **Add Package**
4. Choose your target and click **Add Package**

### Manual Installation

1. Download the latest release from [CloudXCoreiOS Releases](https://github.com/cloudx-xenoss/CloudXCoreiOS/releases)
2. Extract the downloaded zip file
3. Drag the `CloudXCore.framework` into your Xcode project
4. Ensure "Copy items if needed" is checked and select your target
5. Add the framework to your target's "Frameworks, Libraries, and Embedded Content" section

## Quick Start

### 1. Import the SDK

**Objective-C:**
```objc
#import <CloudXCore/CloudXCore.h>
```

**Swift:**
```swift
import CloudXCore
```

### 2. Initialize the SDK

**Objective-C:**
```objc
// Initialize with app key only
[[CloudXCore shared] initSDKWithAppKey:@"your-app-key-here" 
                             completion:^(BOOL success, NSError * _Nullable error) {
    if (success) {
        NSLog(@"✅ CloudX SDK initialized successfully");
    } else {
        NSLog(@"❌ Failed to initialize CloudX SDK: %@", error.localizedDescription);
    }
}];

// Initialize with app key and hashed user ID
[[CloudXCore shared] initSDKWithAppKey:@"your-app-key-here" 
                           hashedUserID:@"user-id-optional" 
                             completion:^(BOOL success, NSError * _Nullable error) {
    if (success) {
        NSLog(@"✅ CloudX SDK initialized successfully");
    } else {
        NSLog(@"❌ Failed to initialize CloudX SDK: %@", error.localizedDescription);
    }
}];
```

**Swift:**
```swift
// Initialize with app key only
CloudXCore.shared.initSDK(withAppKey: "your-app-key-here") { success, error in
    if success {
        print("✅ CloudX SDK initialized successfully")
    } else {
        print("❌ Failed to initialize CloudX SDK: \(error?.localizedDescription ?? "Unknown error")")
    }
}

// Initialize with app key and hashed user ID
CloudXCore.shared.initSDK(withAppKey: "your-app-key-here", 
                         hashedUserID: "user-id-optional") { success, error in
    if success {
        print("✅ CloudX SDK initialized successfully")
    } else {
        print("❌ Failed to initialize CloudX SDK: \(error?.localizedDescription ?? "Unknown error")")
    }
}
```

### 3. Check SDK Status

**Objective-C:**
```objc
BOOL isInitialized = [[CloudXCore shared] isInitialised];
NSString *sdkVersion = [[CloudXCore shared] sdkVersion];
```

**Swift:**
```swift
let isInitialized = CloudXCore.shared.isInitialised
let sdkVersion = CloudXCore.shared.sdkVersion
```

## Ad Integration

### Banner Ads

Banner ads are rectangular ads that appear at the top or bottom of the screen.

**Objective-C:**
```objc
@interface YourViewController () <CLXBannerDelegate>
@property (nonatomic, strong) CLXBannerAdView *bannerAd;
@end

@implementation YourViewController

- (void)createBannerAd {
    // Create banner ad
    self.bannerAd = [[CloudXCore shared] createBannerWithPlacement:@"your-banner-placement"
                                                    viewController:self
                                                        delegate:self
                                                            tmax:nil];
    
    if (self.bannerAd) {
        // Add to view hierarchy
        self.bannerAd.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.bannerAd];
        
        // Set constraints
        [NSLayoutConstraint activateConstraints:@[
            [self.bannerAd.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
            [self.bannerAd.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [self.bannerAd.widthAnchor constraintEqualToConstant:320],
            [self.bannerAd.heightAnchor constraintEqualToConstant:50]
        ]];
        
        // Load the ad
        [self.bannerAd load];
    }
}

#pragma mark - CLXBannerDelegate

- (void)didLoadWithAd:(id<CLXAd>)ad {
    NSLog(@"✅ Banner ad loaded successfully");
}

- (void)failToLoadWithAd:(id<CLXAd>)ad error:(NSError *)error {
    NSLog(@"❌ Banner ad failed to load: %@", error.localizedDescription);
}

- (void)didShowWithAd:(id<CLXAd>)ad {
    NSLog(@"👀 Banner ad shown");
}

- (void)didClickWithAd:(id<CLXAd>)ad {
    NSLog(@"👆 Banner ad clicked");
}

- (void)impressionOn:(id<CLXAd>)ad {
    NSLog(@"👁️ Banner ad impression recorded");
}

- (void)didHideWithAd:(id<CLXAd>)ad {
    NSLog(@"🔚 Banner ad hidden");
}

- (void)closedByUserActionWithAd:(id<CLXAd>)ad {
    NSLog(@"✋ Banner ad closed by user");
}

@end
```

**Swift:**
```swift
class YourViewController: UIViewController, CLXBannerDelegate {
    private var bannerAd: CLXBannerAdView?
    
    func createBannerAd() {
        // Create banner ad
        bannerAd = CloudXCore.shared.createBanner(withPlacement: "your-banner-placement",
                                                 viewController: self,
                                                 delegate: self,
                                                 tmax: nil)
        
        if let bannerAd = bannerAd {
            // Add to view hierarchy
            bannerAd.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerAd)
            
            // Set constraints
            NSLayoutConstraint.activate([
                bannerAd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bannerAd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                bannerAd.widthAnchor.constraint(equalToConstant: 320),
                bannerAd.heightAnchor.constraint(equalToConstant: 50)
            ])
            
            // Load the ad
            bannerAd.load()
        }
    }
}

// MARK: - CLXBannerDelegate
extension YourViewController {
    func didLoad(with ad: CLXAd) {
        print("✅ Banner ad loaded successfully")
    }
    
    func failToLoad(with ad: CLXAd, error: Error) {
        print("❌ Banner ad failed to load: \(error.localizedDescription)")
    }
    
    func didShow(with ad: CLXAd) {
        print("👀 Banner ad shown")
    }
    
    func didClick(with ad: CLXAd) {
        print("👆 Banner ad clicked")
    }
    
    func impression(on ad: CLXAd) {
        print("👁️ Banner ad impression recorded")
    }
    
    func didHide(with ad: CLXAd) {
        print("🔚 Banner ad hidden")
    }
    
    func closedByUserAction(with ad: CLXAd) {
        print("✋ Banner ad closed by user")
    }
}
```

### Interstitial Ads

Interstitial ads are full-screen ads that appear between app content.

```objc
@interface YourViewController () <CLXInterstitialDelegate>
@property (nonatomic, strong) id<CLXInterstitial> interstitialAd;
@end

@implementation YourViewController

- (void)createInterstitialAd {
    // Create interstitial ad
    self.interstitialAd = [[CloudXCore shared] createInterstitialWithPlacement:@"your-interstitial-placement"
                                                                      delegate:self];
    
    if (self.interstitialAd) {
        // Load the ad
        [self.interstitialAd load];
    }
}

- (void)showInterstitialAd {
    if (self.interstitialAd.isReady) {
        [self.interstitialAd showFromViewController:self];
    } else {
        NSLog(@"Interstitial ad not ready");
    }
}

#pragma mark - CLXInterstitialDelegate

- (void)didLoadWithAd:(id<CLXAd>)ad {
    NSLog(@"✅ Interstitial ad loaded successfully");
}

- (void)failToLoadWithAd:(id<CLXAd>)ad error:(NSError *)error {
    NSLog(@"❌ Interstitial ad failed to load: %@", error.localizedDescription);
}

- (void)didShowWithAd:(id<CLXAd>)ad {
    NSLog(@"👀 Interstitial ad shown");
}

- (void)failToShowWithAd:(id<CLXAd>)ad error:(NSError *)error {
    NSLog(@"❌ Interstitial ad failed to show: %@", error.localizedDescription);
}

- (void)didHideWithAd:(id<CLXAd>)ad {
    NSLog(@"🔚 Interstitial ad hidden");
    // Reload for next use
    [self createInterstitialAd];
}

- (void)didClickWithAd:(id<CLXAd>)ad {
    NSLog(@"👆 Interstitial ad clicked");
}

- (void)impressionOn:(id<CLXAd>)ad {
    NSLog(@"👁️ Interstitial ad impression recorded");
}

- (void)closedByUserActionWithAd:(id<CLXAd>)ad {
    NSLog(@"✋ Interstitial ad closed by user");
    // Reload for next use
    [self createInterstitialAd];
}

@end
```

```swift
class YourViewController: UIViewController, CLXInterstitialDelegate {
    private var interstitialAd: CLXInterstitial?
    
    func createInterstitialAd() {
        // Create interstitial ad
        interstitialAd = CloudXCore.shared.createInterstitial(withPlacement: "your-interstitial-placement",
                                                             delegate: self)
        
        if let interstitialAd = interstitialAd {
            // Load the ad
            interstitialAd.load()
        }
    }
    
    func showInterstitialAd() {
        if interstitialAd?.isReady == true {
            interstitialAd?.show(from: self)
        } else {
            print("Interstitial ad not ready")
        }
    }
}

// MARK: - CLXInterstitialDelegate
extension YourViewController {
    func didLoad(with ad: CLXAd) {
        print("✅ Interstitial ad loaded successfully")
    }
    
    func failToLoad(with ad: CLXAd, error: Error) {
        print("❌ Interstitial ad failed to load: \(error.localizedDescription)")
    }
    
    func didShow(with ad: CLXAd) {
        print("👀 Interstitial ad shown")
    }
    
    func failToShow(with ad: CLXAd, error: Error) {
        print("❌ Interstitial ad failed to show: \(error.localizedDescription)")
    }
    
    func didHide(with ad: CLXAd) {
        print("🔚 Interstitial ad hidden")
        // Reload for next use
        createInterstitialAd()
    }
    
    func didClick(with ad: CLXAd) {
        print("👆 Interstitial ad clicked")
    }
    
    func impression(on ad: CLXAd) {
        print("👁️ Interstitial ad impression recorded")
    }
    
    func closedByUserAction(with ad: CLXAd) {
        print("✋ Interstitial ad closed by user")
        // Reload for next use
        createInterstitialAd()
    }
}
```

### MREC Ads (Medium Rectangle)

MREC ads are 300x250 pixel banner ads that provide more space for rich content.

```objc
@interface YourViewController () <CLXBannerDelegate>
@property (nonatomic, strong) CLXBannerAdView *mrecAd;
@end

@implementation YourViewController

- (void)createMRECAd {
    // Create MREC ad
    self.mrecAd = [[CloudXCore shared] createMRECWithPlacement:@"your-mrec-placement"
                                                viewController:self
                                                      delegate:self];
    
    if (self.mrecAd) {
        // Add to view hierarchy
        self.mrecAd.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.mrecAd];
        
        // Set constraints for 300x250 size
        [NSLayoutConstraint activateConstraints:@[
            [self.mrecAd.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [self.mrecAd.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20],
            [self.mrecAd.widthAnchor constraintEqualToConstant:300],
            [self.mrecAd.heightAnchor constraintEqualToConstant:250]
        ]];
        
        // Load the ad
        [self.mrecAd load];
    }
}

#pragma mark - CLXBannerDelegate

- (void)didLoadWithAd:(id<CLXAd>)ad {
    NSLog(@"✅ MREC ad loaded successfully");
}

- (void)failToLoadWithAd:(id<CLXAd>)ad error:(NSError *)error {
    NSLog(@"❌ MREC ad failed to load: %@", error.localizedDescription);
}

- (void)didShowWithAd:(id<CLXAd>)ad {
    NSLog(@"👀 MREC ad shown");
}

- (void)didClickWithAd:(id<CLXAd>)ad {
    NSLog(@"👆 MREC ad clicked");
}

- (void)impressionOn:(id<CLXAd>)ad {
    NSLog(@"👁️ MREC ad impression recorded");
}

- (void)didHideWithAd:(id<CLXAd>)ad {
    NSLog(@"🔚 MREC ad hidden");
}

- (void)closedByUserActionWithAd:(id<CLXAd>)ad {
    NSLog(@"✋ MREC ad closed by user");
}

@end
```

```swift
class YourViewController: UIViewController, CLXBannerDelegate {
    private var mrecAd: CLXBannerAdView?
    
    func createMRECAd() {
        // Create MREC ad
        mrecAd = CloudXCore.shared.createMREC(withPlacement: "your-mrec-placement",
                                             viewController: self,
                                             delegate: self)
        
        if let mrecAd = mrecAd {
            // Add to view hierarchy
            mrecAd.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(mrecAd)
            
            // Set constraints for 300x250 size
            NSLayoutConstraint.activate([
                mrecAd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                mrecAd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                mrecAd.widthAnchor.constraint(equalToConstant: 300),
                mrecAd.heightAnchor.constraint(equalToConstant: 250)
            ])
            
            // Load the ad
            mrecAd.load()
        }
    }
}

// MARK: - CLXBannerDelegate
extension YourViewController {
    func didLoad(with ad: CLXAd) {
        print("✅ MREC ad loaded successfully")
    }
    
    func failToLoad(with ad: CLXAd, error: Error) {
        print("❌ MREC ad failed to load: \(error.localizedDescription)")
    }
    
    func didShow(with ad: CLXAd) {
        print("👀 MREC ad shown")
    }
    
    func didClick(with ad: CLXAd) {
        print("👆 MREC ad clicked")
    }
    
    func impression(on ad: CLXAd) {
        print("👁️ MREC ad impression recorded")
    }
    
    func didHide(with ad: CLXAd) {
        print("🔚 MREC ad hidden")
    }
    
    func closedByUserAction(with ad: CLXAd) {
        print("✋ MREC ad closed by user")
    }
}
```

## Advanced Features

### Privacy Compliance & GPP Integration

The CloudX SDK supports privacy compliance for GDPR, CCPA, and COPPA regulations. Publishers are responsible for obtaining consent through their Consent Management Platform (CMP) and providing the privacy signals to our SDK.

**Objective-C:**
```objc
// Set GDPR consent information
[[NSUserDefaults standardUserDefaults] setObject:@"CPcABcABcABcA..." forKey:@"CLXPrivacyGDPRConsent"];
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"CLXPrivacyGDPRApplies"];

// Set CCPA privacy string
[[NSUserDefaults standardUserDefaults] setObject:@"1YNN" forKey:@"CLXPrivacyCCPAPrivacy"];

// Set COPPA compliance
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"CLXPrivacyCOPPAApplies"];

// Optional: Set hashed identifiers for privacy-safe tracking
[[NSUserDefaults standardUserDefaults] setObject:@"hashed-user-id" forKey:@"hashedUserID"];
[[NSUserDefaults standardUserDefaults] setObject:@"hashed-geo-ip" forKey:@"CLXPrivacyHashedGeoIp"];

// Synchronize changes
[[NSUserDefaults standardUserDefaults] synchronize];
```

**Swift:**
```swift
// Set GDPR consent information
UserDefaults.standard.set("CPcABcABcABcA...", forKey: "CLXPrivacyGDPRConsent")
UserDefaults.standard.set(true, forKey: "CLXPrivacyGDPRApplies")

// Set CCPA privacy string
UserDefaults.standard.set("1YNN", forKey: "CLXPrivacyCCPAPrivacy")

// Set COPPA compliance
UserDefaults.standard.set(true, forKey: "CLXPrivacyCOPPAApplies")

// Optional: Set hashed identifiers for privacy-safe tracking
UserDefaults.standard.set("hashed-user-id", forKey: "hashedUserID")
UserDefaults.standard.set("hashed-geo-ip", forKey: "CLXPrivacyHashedGeoIp")

// Synchronize changes
UserDefaults.standard.synchronize()
```

#### Privacy Keys Reference

| Key | Type | Description |
|-----|------|-------------|
| `CLXPrivacyGDPRConsent` | String | GDPR TC String from your CMP |
| `CLXPrivacyGDPRApplies` | Boolean | Whether GDPR applies to this user |
| `CLXPrivacyCCPAPrivacy` | String | CCPA privacy string (e.g., "1YNN") |
| `CLXPrivacyCOPPAApplies` | Boolean | Whether COPPA applies to this user |
| `hashedUserID` | String | Hashed user identifier for privacy-safe tracking |
| `CLXPrivacyHashedGeoIp` | String | Hashed geo IP for privacy-safe tracking |

#### GPP String Integration

If you're using a Global Privacy Platform (GPP) string, you'll need to parse it and extract the individual privacy components before passing them to our SDK:

```objc
// Example: Parse your GPP string and extract components
NSString *gppString = @"DBACNYA~CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA~1YNN";

// Your CMP should parse the GPP string and provide:
NSString *gdprConsent = [yourCMP extractGDPRConsentFromGPP:gppString];
NSString *ccpaString = [yourCMP extractCCPAStringFromGPP:gppString];
BOOL gdprApplies = [yourCMP doesGDPRApplyFromGPP:gppString];

// Then set the individual components
[[NSUserDefaults standardUserDefaults] setObject:gdprConsent forKey:@"CLXPrivacyGDPRConsent"];
[[NSUserDefaults standardUserDefaults] setObject:ccpaString forKey:@"CLXPrivacyCCPAPrivacy"];
[[NSUserDefaults standardUserDefaults] setBool:gdprApplies forKey:@"CLXPrivacyGDPRApplies"];
```

#### Privacy-Aware Ad Serving

The SDK automatically uses privacy information to:
- Determine when to use hashed identifiers instead of device IFA
- Respect Do Not Track (DNT) preferences
- Comply with GDPR, CCPA, and COPPA requirements
- Provide privacy-safe fallbacks for ad targeting

**Note**: Publishers must obtain proper consent through their own Consent Management Platform before providing privacy signals to the SDK.

### User Targeting

**Objective-C:**
```objc
// Set hashed user ID for targeting
[[CloudXCore shared] provideUserDetailsWithHashedUserID:@"hashed-user-id"];

// Set key-value pairs for targeting
[[CloudXCore shared] useHashedKeyValueWithKey:@"age" value:@"25"];
[[CloudXCore shared] useHashedKeyValueWithKey:@"gender" value:@"male"];

// Set multiple key-value pairs
NSDictionary *userData = @{
    @"age": @"25",
    @"gender": @"male",
    @"location": @"US"
};
[[CloudXCore shared] useKeyValuesWithUserDictionary:userData];

// Set bidder-specific targeting
[[CloudXCore shared] useBidderKeyValueWithBidder:@"adnetwork" key:@"custom_key" value:@"custom_value"];
```

**Swift:**
```swift
// Set hashed user ID for targeting
CloudXCore.shared.provideUserDetails(withHashedUserID: "hashed-user-id")

// Set key-value pairs for targeting
CloudXCore.shared.useHashedKeyValue(withKey: "age", value: "25")
CloudXCore.shared.useHashedKeyValue(withKey: "gender", value: "male")

// Set multiple key-value pairs
let userData: [String: String] = [
    "age": "25",
    "gender": "male",
    "location": "US"
]
CloudXCore.shared.useKeyValues(withUserDictionary: userData)

// Set bidder-specific targeting
CloudXCore.shared.useBidderKeyValue(withBidder: "adnetwork", key: "custom_key", value: "custom_value")
```

### Ad Lifecycle Management

**Objective-C:**
```objc
// Check if ad is ready
BOOL isReady = [self.bannerAd isReady];

// Destroy ad and release resources
[self.bannerAd destroy];

// Suspend preloading when not visible (banner only)
self.bannerAd.suspendPreloadWhenInvisible = YES;
```

**Swift:**
```swift
// Check if ad is ready
let isReady = bannerAd?.isReady ?? false

// Destroy ad and release resources
bannerAd?.destroy()

// Suspend preloading when not visible (banner only)
bannerAd?.suspendPreloadWhenInvisible = true
```

## Complete App Example

Here's a complete example showing how to integrate all ad types in a single app:

**Objective-C:**
```objc
// AppDelegate.m
#import "AppDelegate.h"
#import <CloudXCore/CloudXCore.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize CloudX SDK
    [[CloudXCore shared] initSDKWithAppKey:@"your-app-key-here" 
                              hashedUserID:@"user-id-optional" 
                                completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@"✅ CloudX SDK initialized successfully");
        } else {
            NSLog(@"❌ Failed to initialize CloudX SDK: %@", error.localizedDescription);
        }
    }];
    
    return YES;
}

@end

// MainViewController.m
#import "MainViewController.h"
#import <CloudXCore/CloudXCore.h>

@interface MainViewController () <CLXBannerDelegate, CLXInterstitialDelegate, CLXRewardedDelegate, CLXNativeDelegate>
@property (nonatomic, strong) CLXBannerAdView *bannerAd;
@property (nonatomic, strong) id<CLXInterstitial> interstitialAd;
@property (nonatomic, strong) id<CLXRewardedInterstitial> rewardedAd;
@property (nonatomic, strong) CLXNativeAdView *nativeAd;
@property (nonatomic, strong) CLXBannerAdView *mrecAd;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Wait for SDK initialization
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sdkInitialized)
                                                 name:@"cloudXSDKInitialized"
                                               object:nil];
    
    [self setupUI];
}

- (void)setupUI {
    // Create buttons for each ad type
    [self createButtonWithTitle:@"Show Banner" action:@selector(showBanner)];
    [self createButtonWithTitle:@"Show Interstitial" action:@selector(showInterstitial)];
    [self createButtonWithTitle:@"Show Rewarded" action:@selector(showRewarded)];
    [self createButtonWithTitle:@"Show Native" action:@selector(showNative)];
    [self createButtonWithTitle:@"Show MREC" action:@selector(showMREC)];
}

- (void)sdkInitialized {
    // Create all ad instances
    [self createBannerAd];
    [self createInterstitialAd];
    [self createRewardedAd];
    [self createNativeAd];
    [self createMRECAd];
}

// Implementation of ad creation and delegate methods...
// (See individual ad type examples above)

@end
```

**Swift:**
```swift
// AppDelegate.swift
import UIKit
import CloudXCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize CloudX SDK
        CloudXCore.shared.initSDK(withAppKey: "your-app-key-here", 
                                 hashedUserID: "user-id-optional") { success, error in
            if success {
                print("✅ CloudX SDK initialized successfully")
            } else {
                print("❌ Failed to initialize CloudX SDK: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        
        return true
    }
}

// MainViewController.swift
import UIKit
import CloudXCore

class MainViewController: UIViewController {
    private var bannerAd: CLXBannerAdView?
    private var interstitialAd: CLXInterstitial?
    private var rewardedAd: CLXRewardedInterstitial?
    private var nativeAd: CLXNativeAdView?
    private var mrecAd: CLXBannerAdView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Wait for SDK initialization
        NotificationCenter.default.addObserver(self,
                                             selector: #selector(sdkInitialized),
                                             name: NSNotification.Name("cloudXSDKInitialized"),
                                             object: nil)
        
        setupUI()
    }
    
    private func setupUI() {
        // Create buttons for each ad type
        createButton(title: "Show Banner", action: #selector(showBanner))
        createButton(title: "Show Interstitial", action: #selector(showInterstitial))
        createButton(title: "Show Rewarded", action: #selector(showRewarded))
        createButton(title: "Show Native", action: #selector(showNative))
        createButton(title: "Show MREC", action: #selector(showMREC))
    }
    
    @objc private func sdkInitialized() {
        // Create all ad instances
        createBannerAd()
        createInterstitialAd()
        createRewardedAd()
        createNativeAd()
        createMRECAd()
    }
    
    // Implementation of ad creation and delegate methods...
    // (See individual ad type examples above)
}

// MARK: - Ad Delegates
extension MainViewController: CLXBannerDelegate, CLXInterstitialDelegate, CLXRewardedDelegate, CLXNativeDelegate {
    // Implement delegate methods for each ad type
    // (See individual ad type examples above)
}
```

## API Reference

### Core Methods

| Method | Description |
|--------|-------------|
| `initSDKWithAppKey:completion:` | Initialize SDK with app key |
| `initSDKWithAppKey:hashedUserID:completion:` | Initialize SDK with app key and user ID |
| `isInitialised` | Check if SDK is initialized |
| `sdkVersion` | Get SDK version |

### Ad Creation Methods

| Method | Description |
|--------|-------------|
| `createBannerWithPlacement:viewController:delegate:tmax:` | Create banner ad |
| `createMRECWithPlacement:viewController:delegate:` | Create MREC ad |
| `createInterstitialWithPlacement:delegate:` | Create interstitial ad |
| `createRewardedWithPlacement:delegate:` | Create rewarded ad |
| `createNativeAdWithPlacement:viewController:delegate:` | Create native ad |

### User Targeting Methods

| Method | Description |
|--------|-------------|
| `provideUserDetailsWithHashedUserID:` | Set hashed user ID |
| `useHashedKeyValueWithKey:value:` | Set key-value pair |
| `useKeyValuesWithUserDictionary:` | Set multiple key-value pairs |
| `useBidderKeyValueWithBidder:key:value:` | Set bidder-specific targeting |

### Ad Control Methods

| Method | Description |
|--------|-------------|
| `load` | Load ad content |
| `isReady` | Check if ad is ready |
| `showFromViewController:` | Show fullscreen ad |
| `destroy` | Destroy ad and release resources |

### Delegate Callbacks

All ad types support these common callbacks:
- `didLoadWithAd:` - Ad loaded successfully
- `failToLoadWithAd:error:` - Ad failed to load
- `didShowWithAd:` - Ad was shown
- `failToShowWithAd:error:` - Ad failed to show
- `didHideWithAd:` - Ad was hidden
- `didClickWithAd:` - Ad was clicked
- `impressionOn:` - Ad impression recorded
- `closedByUserActionWithAd:` - Ad closed by user

**Rewarded ads additionally support:**
- `userRewarded:` - User earned reward
- `rewardedVideoStarted:` - Video started
- `rewardedVideoCompleted:` - Video completed

## Troubleshooting

### Common Issues

1. **SDK not initialized**
   - Ensure you call `initSDKWithAppKey:completion:` before creating ads
   - Check that the completion block is called with success

2. **Ads not loading**
   - Verify your placement IDs are correct
   - Check network connectivity
   - Ensure you're testing on a real device (not simulator)

3. **Delegate methods not called**
   - Verify your view controller implements the correct delegate protocol
   - Ensure the delegate is set when creating ads

4. **Build errors**
   - Make sure you're using iOS 14.0 or later
   - Verify all required frameworks are linked
   - Check that you're using the correct import statements

### Debug Logging

Enable debug logging to troubleshoot issues:

**Objective-C:**
```objc
// Check SDK logs
NSDictionary *logs = [[CloudXCore shared] logsData];
NSLog(@"SDK Logs: %@", logs);

// Enable verbose logging via environment variable
// Set CLOUDX_VERBOSE_LOG=1 in your scheme's environment variables
// This enables detailed debug output in release builds
```

**Swift:**
```swift
// Check SDK logs
let logs = CloudXCore.shared.logsData
print("SDK Logs: \(logs)")

// Enable verbose logging via environment variable
// Set CLOUDX_VERBOSE_LOG=1 in your scheme's environment variables
// This enables detailed debug output in release builds
```

**Environment Variable Setup:**

1. **In Xcode**: Go to your target's scheme → Edit Scheme → Run → Arguments → Environment Variables
2. **Add Variable**: Name: `CLOUDX_VERBOSE_LOG`, Value: `1`
3. **Debug vs Release**: Verbose logging is enabled by default in debug builds. In release builds, it's only enabled when this environment variable is set.

**Log Levels:**
- **Debug**: Fastest performance, messages not persisted (default in debug builds)
- **Info**: Useful for tracking normal application flow
- **Error**: Persisted for several days, slowest performance

## Support

- **Documentation**: [CloudX iOS Docs](https://cloudx-xenoss.github.io/CloudXCoreiOS/documentation/cloudxcore)
- **Issues**: [GitHub Issues](https://github.com/cloudx-xenoss/CloudXCoreiOS/issues)
- **Email**: eng@cloudx.io

## License

This project is licensed under the same license as the CloudX Core SDK.
