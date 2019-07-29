Pod::Spec.new do |spec|
  spec.name         = "DTStringPicker"
  spec.version      = "0.0.1"
  spec.summary      = "A modern string picker for iOS"
  spec.description  = "A string picker with modern UI for iOS. Might be a replacement for ActionSheetPicker, at least for the string picker"
  spec.homepage     = "https://github.com/didats/DTStringPicker"
  spec.screenshots  = "https://raw.githubusercontent.com/didats/DTStringPicker/master/screenshot.png"

  spec.license      = "MIT"

  spec.authors            = { "Didats Triadi" => "didats@gmail.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/didats/DTStringPicker.git", :tag => "#{spec.version}" }
  spec.swift_version = '5.0'

  spec.source_files  = "DTStringPicker/**/*.swift"

end
