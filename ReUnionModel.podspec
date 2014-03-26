Pod::Spec.new do |s|
  s.name         	= "ReUnionModel"
  s.summary      	= "A short description of ReUnionModel."
  s.author       	= { "Tobias Kräntzer" => "info@tobias-kraentzer.de" }
  s.platform     	= :ios, '7.0'
  s.source_files  	= 'ReUnionModel/ReUnionModel/**/*.{h,m}'
  s.resources 		= "ReUnionModel/ReUnionModel/ReUnionModel.xcdatamodeld"
  s.framework  		= 'CoreData'
  s.requires_arc 	= true
end
