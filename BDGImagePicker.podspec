Pod::Spec.new do |s|
  s.name           = 'BDGImagePicker'
  s.version        = '0.0.19'
  s.summary        = 'Lightweight wrapper around UIImagePickerController'
  s.license 	   = 'MIT'
  s.description    = 'Ultra lightweight wrapper around UIImagePickerController with completion blocks'
  s.homepage       = 'https://github.com/BobDG/BDGImagePicker'
  s.authors        = {'Bob de Graaf' => 'graafict@gmail.com'}
  s.source         = { :git => 'https://github.com/BobDG/BDGImagePicker.git', :tag => s.version.to_s }
  s.source_files   = 'BDGImagePicker/*.{h,m}'  
  s.platform       = :ios, '8.0'
  s.frameworks     = 'AVFoundation'
  s.requires_arc   = true
  s.dependency     'BDGCategories'
end
