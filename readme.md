# Project MarvelDetail

This is an iOS app that show a MArcel characters list, and allows to see the detail of each of them individually.

## Characteristics

- Use Marvel API [documentation](https://developer.marvel.com/docs).
- Fetches list of characters: *GET* `/v1/public/characters` .
- Fetches a single character by id: *GET* `/v1/public/characters/{characterid}` .
- Show list of characters.
- Navigate to a character detail.

## HowTo install

### Requirements

- [Xcode](https://developer.apple.com/xcode/)
- [Brew](https://brew.sh)
- [Swiftlint](https://github.com/realm/SwiftLint)
- [fastlane](https://fastlane.tools)
- [Carthage](https://github.com/Carthage/Carthage)

### Getting the source

First, check out the source, including all the dependencies:

    $ git clone --recurse-submodules https://github.com/madcato/MarvelDetail

### Installing other dependencies

#### [Brew](https://brew.sh)

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### [Fastlane](https://docs.fastlane.tools/getting-started/ios/setup/)

    $ xcode-select --install
    $ brew cask install fastlane

#### [SwiftLint](https://github.com/realm/SwiftLint)

    $ brew install swiftlint

Configure SwiftLint editing file `.swiftlint.yml` in the root of the project.

#### [Carthage](https://github.com/Carthage/Carthage)

    $ brew install carthage

### Building it

First, update carthage:

    $ carthage update --use-xcframeworks --platform ios

Open the project, HolaBarcelona.xcodeproj, and build and run.

### Build with fastlane

    $  bundle exec fastlane build

The computer where fastlane is going to run must have the provissioning and private key installed

### Send app to TestFlight with fastlane

    $  bundle exec fastlane beta

The computer where fastlane is going to run must have the provissioning and private key installed

### Launch tests with fastlane

    $  bundle exec fastlane tests

## Files

- README.md (this file)
- CHANGELOG [How to keep a CHANGELOG](https://keepachangelog.com/en/0.3.0/)

#### Project directory estructure

```
MarvelDetail
│
└───MarvelDetail
│   │
│   └───Startup                // App start related classes, like Migrations
│   │   │   AppDelegate.swift
│   │   │
│   │   └───Migration          // Classes and models for persisted data migrations
│   │                          //  between versions
│   │
│   └───Features             // Classes, resources, storyboards related to only one feature
│   │   |
│   │   └───MarvelCharacters
│   │   │   │   Feature001Model.swift
│   │   │   │   Feature001UI.storyboard
│   │   │   │   Feature001ViewController.swift
│   │   │   │
│   │   │   └───Cells
│   │   │
│   │
│   └───ComplexFeature001
│   │   │
│   │   └───Subfeature002
│   │   │
│   │   └───Subfeature003
│   │
│   └───Library                 // keep in this group all shared code between features
│   │   │
│   │   └───Configuration       // Classes with the app configuration, like serverURL 
│   │   └───Model               // Persisted data model
│   │   └───Feed
│   │   └───Services
│   │   └───Extensions
│   │
│   └───Resources               // Resource files, like images, grouped by type
│   │   │   Images.xcassets     // Keep all images in one asset to help searches
│   │   │
│   │   └───Environments        // Plist files with the configuration of each environment
│   │   │   │   integration.plist
│   │   │   │   production.plist
│   │   │   │   staging.plist
│   │   │
│   │   └───pdf
│   │   └───certificates
│   │   └───html
│   │   └───json
│   │   └───video
│   │   └───plist
│   │
│   └───Supporting Files
│       │   MarvelDetail.entitlements
│       │   Info.plist
│
└───Frameworks                // External projects,libraries and frameworks
│    │
│    └───Alamofire.xcodeproj
│    └───AlamofireNetworkActivityIndicator.framework
│    └───AlamofireImage.framework
│
└───MarvelDetailTests
│
└───MarvelDetailUITests
│
└───Products
```

### External frameworks

Included in the project directly using [Carthage](https://github.com/Carthage/Carthage). This way is easier to manage versions of this external frameworks. Carthage does not add much build time, because it builds the frameworks previously and add them to the repository.

- [Alamofire](https://github.com/Alamofire/Alamofire)
  For accesing remote http servers
- [AlamofireNetworkActivityIndicator](https://github.com/Alamofire/AlamofireNetworkActivityIndicator)
  To manage the network activity indicator automatically with Alamofire
- [AlamofireImage](https://github.com/Alamofire/AlamofireImage)
  AlamofireImage is an image component library for Alamofire

#### Carthage version setting

[Read about Semver](http://semver.org/) to know the meaning of each component in the version code string: a.b.c

\>= 1.0 for “at least version 1.0”       
~> 1.0 for “compatible with version 1.0”    
== 1.0 for “exactly version 1.0”    

### Integrations

- [fastlane](https://fastlane.tools)
  To manage the build of the project and publish the app into TestFlight and App Store
- [Swiftlint](https://github.com/realm/SwiftLint)
  To analyze statically code quality

## Tests

## UI tests

## Recommended links

- https://medium.com/cocoaacademymag/unit-testing-network-request-3a75061fcf4c
- https://kean.github.io/post/api-client
- https://clean-swift.com/clean-swift-ios-architecture/

## Screenshots with fastlane

- [fastlane screenshots documentation](https://docs.fastlane.tools/getting-started/ios/screenshots/)

Define where to capture screens in the file `SnapshotUITest\SnapshotUITest.swift`
```swift
    func testSnapshot() {
        let app = XCUIApplication()
        snapshot("01MainScreen")
        app.navigationBars["Root View Controller"].buttons["Login"].tap()
        app.tables.buttons["Sign in"].tap()
        snapshot("02LoginScreen")
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
        snapshot("03LoginFailScreen")
    }
```

Then capture screenshots by running: `$ fastlane snapshot`

Upload those screenshots files to the App Store with: `$ fastlane deliver`