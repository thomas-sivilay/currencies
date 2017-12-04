Pod::Spec.new do |s|

  s.name             = 'Currencies'
  s.version          = '0.1.1'
  s.summary          = 'Service to retrieve all currencies with rich information like region code, name, currency symbol..'
  s.description      = <<-DESC
A service to retrieve currency code, currency symbol, region code, region name instead of using NSLocale.commonISOCurrencyCodes.
                       DESC
  s.homepage         = 'https://github.com/thomas-sivilay/currencies'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thomas Sivilay' => 'thomas.sivilay@gmail.com' }
  s.source           = { :git => 'https://github.com/thomas-sivilay/Currencies.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thomassivilay'
  s.ios.deployment_target = '9.0'
  s.source_files = 'Currencies/Classes/**/*'

end
