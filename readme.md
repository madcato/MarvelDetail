# Project MarvelDetail

This is an iOS app that show a MArcel characters list, and allows to see the detail of each of them individually.

## Characteristics

- Use Marvel API [documentation](https://developer.marvel.com/docs).
- Fetches list of characters: *GET* `/v1/public/characters` .
- Fetches a single character by id: *GET* `/v1/public/characters/{characterid}` .
- Show list of characters.
- Navigate to a character detail.

## Requirements

- Xcode
- Swiftlint


## Files

- Project directory estructure

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
|   |   |
|   |   └───Feature001
│   │   |   │   Feature001Model.swift
│   │   │   │   Feature001UI.storyboard
│   │   │   │   Feature001ViewController.swift
│   │   │   │
│   │   │   └───Cells
│   │   │
│   │   └───Feature002
│   │   |
│   |   └───Feature003
│   │   |
│   |   └───Feature004
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
│   │   └───Epnvironments        // Plist files with the configuration of each environment
│   │   │   |   integration.plist
│   │   │   |   production.plist
│   │   │   |   staging.plist
│   │   │
│   │   └───pdf
│   │   └───certificates
│   │   └───html
│   │   └───json
│   │   └───video
│   │   └───plist
│   │
│   └───Supporting Files
│       │   iOS-Boilerplate.entitlements
│       │   Info.plist
│       │   main.m
│
└───MarvelDetailTests
│
└───MarvelDetailUITests
│
└───Products
```


## Tests

## UI tests




