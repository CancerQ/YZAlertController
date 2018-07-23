
Pod::Spec.new do |s|
s.name         = 'YZAlertController'
s.summary      = 'Harness the YZAlertController with a simplified, chainable and expressive syntax.'
s.version      = '0.0.1'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.authors      = { 'CancerQ' => 'superyezhqiang@163.com' }
s.social_media_url   = 'https://github.com/CancerQ'
s.homepage     = 'https://github.com/CancerQ/YZAlertController'
s.platform     = :ios, '8.0'
s.ios.deployment_target = '8.0'
s.source       = { :git => 'https://github.com/CancerQ/YZAlertController.git', :tag => s.version.to_s }

s.requires_arc = true
s.source_files = 'YZAlertController/*.{h,m}'

s.frameworks = 'UIKit', 'CoreFoundation'

end
