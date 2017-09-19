#
#  Be sure to run `pod spec lint SmartMall.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Common"
  s.version      = "1.0.0"
  s.summary      = "Common组件"

  s.description  = <<-DESC
  These files are the files of the core infrastructure, 
  These files need to be integrated and managed through cocoapods.
                   DESC

  s.homepage     = "https://github.com/SimilarAndStrange/Common.git"
  s.license      = "MIT"
  s.author       = { "linxia" => "linxia.wang@aorise.org" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/SimilarAndStrange/Common.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files = 'Core/Core/**/*.{h,m}'
  s.resources = 'Core/Resource/Core.bundle'

  s.dependency 'MBProgressHUD', '~> 1.0.0'
  
end