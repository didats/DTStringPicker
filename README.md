# DTStringPicker
[![GitHub release](https://img.shields.io/github/release/didats/DTStringPicker.svg)](https://github.com/didats/DTStringPicker/releases)
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![License](https://img.shields.io/cocoapods/l/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![Platform](https://img.shields.io/cocoapods/p/DTStringPicker?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/DTStringPicker)

A modern String Picker with search functionality. You are able to set the text alignment, background color, text color, font as well.

## Screenshot
<img src="https://github.com/didats/DTStringPicker/raw/master/DTStringPicker.gif" width="300">

##  Requirements
* Base SDK: iOS 12
* Deployment Target: iOS 12.0 or greater

## Installation
Add following in your Podfile.

```
pod 'DTStringPicker', :git => 'https://github.com/didats/DTStringPicker'
```

## Usage without section
```swift
// specify the strings
let rows = ["Number 1", "Another option 2", "The third choice", "4th item", "Other option", "Anything option"]

// create configuration
var config = DTStringPickerConfig(color: UIColor.black, background: UIColor.white)
config.title = "Choose one option"
config.alignment = .right

DTStringPicker.show(with: config, rowItems: rows.map({ DTStringPickerModelItem(text: $0) }), done: { item in
	print("Item: \(item)")
}, cancel: {
	print("Cancel ===")
}, from: self)
```

## Usage with section and complete configuration
```swift
// specify the strings
let rows: [DTStringPickerModelSection] = [
	DTStringPickerModelSection(
		title: "Header 1",
		items: [
			DTStringPickerModelItem(text: "Pilih satu dua"),
			DTStringPickerModelItem(text: "Ini nomor dua"),
			DTStringPickerModelItem(text: "Di sini nomor ketiga"),
		]),
	DTStringPickerModelSection(
		title: "Second Header",
		items: [
			DTStringPickerModelItem(text: "Pilih satu dua"),
			DTStringPickerModelItem(text: "Ini nomor dua"),
			DTStringPickerModelItem(text: "Di sini nomor ketiga"),
		]),
]

// custom ui
var config = DTStringPickerConfig(color: UIColor.black, background: UIColor.white)
config.title = "Choose one option"
config.alignment = .left
config.itemFont = UIFont.systemFont(ofSize: 17, weight: .regular)
config.color = UIColor.black
config.backgroundColor = UIColor.white
config.shadowColor = UIColor.black
config.titleFont = UIFont.systemFont(ofSize: 30, weight: .bold)
config.titleColor = UIColor.black
config.sectionBackground = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
config.sectionFont = UIFont.systemFont(ofSize: 16, weight: .bold)
config.sectionColor = UIColor.black

DTStringPicker.show(with: config, rowSections: rows, done: { item in
	print("Item: \(item)")
}, cancel: {
	print("Cancel ===")
}, from: self)
```


## Author
**Didats Triadi**  
http://rimbunesia.com  
http://didatstriadi.com


## License

Copyright (c) 2019 Didats Triadi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
