Pod::Spec.new do |s|
  s.name           = 'BDGImagePicker'
  s.version        = '0.0.4'
  s.summary        = 'Lightweight wrapper around UIImaPickerController'
  s.license 	   = 'MIT'
  s.description    = 'Ultra lightweight wrapper around UIImagePickerController with completion blocks'
  s.homepage       = 'https://github.com/BobDG/BDGImagePicker'
  s.authors        = {'Bob de Graaf' => 'graafict@gmail.com'}
  s.source         = { :git => 'https://github.com/BobDG/BDGImagePicker.git', :tag => '0.0.4' }
  s.source_files   = '*.{h,m}'  
  s.resources      = ['**/*.lproj']
  s.platform       = :ios
  s.requires_arc   = true
  s.ios.deployment_target = '8.0'
end
