Pod::Spec.new do |spec|
  spec.name         = "DTStringPicker"
  spec.version      = "0.0.6"
  spec.summary      = "Modern String Picker with search functionality for iOS"
  spec.description  = "String Picker with search, and a section. Might be an alternative for ActionSheetPicker, at least for the string picker"
  spec.homepage     = "https://github.com/didats/DTStringPicker"
  spec.screenshots  = "https://raw.githubusercontent.com/didats/DTStringPicker/master/screenshot-sample.gif"

  spec.license      = "MIT"

  spec.authors            = { "Didats Triadi" => "didats@gmail.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/didats/DTStringPicker.git", :tag => "#{spec.version}" }
  spec.swift_version = '5.0'

  spec.source_files  = "DTStringPicker/**/*"

end
