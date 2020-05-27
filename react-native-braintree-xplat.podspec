require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']
  s.authors      = package['author']
  s.homepage     = package['repository']['url']
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'

  s.source       = { :git => package['repository']['url'], :branch => "#dont_include_sdk" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React'
  s.dependency 'Braintree', '4.33'
  s.dependency 'Braintree/DataCollector'
  s.dependency 'Braintree/3D-Secure'
end