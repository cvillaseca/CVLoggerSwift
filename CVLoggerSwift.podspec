
Pod::Spec.new do |s|
  s.name             = "CVLoggerSwift"
  s.version          = "0.2"
  s.summary          = "A library to show easily a log viewer in your app."

  s.description      = <<-DESC
                        This library provides a app log viewer for your debug mode app.
                       DESC

  s.homepage         = "https://github.com/cvillaseca/CVLoggerSwift.git"
  s.screenshots      = "https://cloud.githubusercontent.com/assets/7700085/13728275/5c5f224e-e912-11e5-9d37-b02210ef8a26.gif"
  s.license          = 'MIT'
  s.author           = { "Cristian Villaseca" => "cvillaseca_basco@hotmail.com" }
  s.source           = { :git => "https://github.com/cvillaseca/CVLoggerSwift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cristianviba'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CVLoggerSwift/Classes/**/*'
  
  s.resource_bundles = {
     'CVLoggerSwift' => ['CVLoggerSwift/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
