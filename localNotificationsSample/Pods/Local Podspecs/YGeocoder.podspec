Pod::Spec.new do |s|

  s.name         = "YGeocoder"
  s.version      = "0.0.1"
  s.summary      = "Yandex geocoder library"

  s.description  = <<-DESC
  Yandex geocoder library from Storozh
                   DESC

  s.homepage     = "https://github.com/storoj/ygeocoder-ios"

  s.license      = { :type => 'MIT', :text => 'license text' }

  s.author             = { "Alexey Storozhev" => "dark.storoj@gmail.com" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/storoj/ygeocoder-ios.git", :commit => "b4fa5766b2efe9c498c96d167774b4d33967f313" }

  s.source_files  = 'ygeocoder/YGeocoder/**/*.{h,m}'

  s.public_header_files = 'ygeocoder/YGeocoder/**/*.h'

end
