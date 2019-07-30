# DTStringPicker
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![License](https://img.shields.io/cocoapods/l/DTStringPicker.svg?style=flat)](http://cocoapods.org/pods/DTStringPicker)
[![Platform](https://img.shields.io/cocoapods/p/DTStringPicker?style=flat)](http://cocoapods.org/pods/DTStringPicker)

A modern approach on how string picker should be. Currently it’s only a string picker.

## Screenshot
![Screenshot](https://github.com/didats/DTStringPicker/raw/master/screenshot.gif)

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
