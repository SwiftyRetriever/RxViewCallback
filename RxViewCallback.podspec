#
#  Be sure to run `pod spec lint RxViewCallback.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "RxViewCallback"
  s.version      = "0.0.4"
  s.summary      = "A rx tools for view, easy to use callback with view."
  s.description  = <<-DESC
                    A rx tools for view, easy to use callback with view
                   DESC

  s.homepage     = "https://github.com/zevwings/RxViewCallback"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "zevwings" => "zev.wings@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/zevwings/RxViewCallback.git", :tag => "#{s.version}" }
  s.source_files = "RxViewCallback/**/*.swift", "RxViewCallback/RxViewCallback.h"
  s.requires_arc = true

  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'

end
