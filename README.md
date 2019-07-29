# # DTStringPicker
[![Version](https://img.shields.io/cocoapods/v/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![License](https://img.shields.io/cocoapods/l/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![Platform](https://img.shields.io/cocoapods/p/DTStringPicker?style=flat)](http://cocoapods.org/pods/DTStringPicker)

A modern approach on how string picker should be. Currently it’s only a string picker.

## Screenshot
<p align="center"><img src ="https://github.com/didats/DTStringPicker/raw/master/screenshot.png" /></p>

##  Requirements
* Base SDK: iOS 12
* Deployment Target: iOS 9.0 or greater

## Installation
Add following in your Podfile

```
pod ‘DTStringPicker’
```

## Usage
```swift
// specify the strings
let rows = [“Choose 1”, “Choose Number 2”,  “Number 3”]

// create configuration
let config = DTStringPickerConfig(cancel: “Cancel”, font: UIFont.systemFont(ofSize: 17, weight: .light), color: UIColor.black)

// show the picker
DTStringPicker.show(with: config, rows: rows, done: { (selected, str) in
	// do something here. you got index selected and the string
}, cancel: {
	// do something here
}, from: self)
```

## Author
**Didats Triadi**
http://rimbunesia.com



