Pod::Spec.new do |spec|
  spec.name         = 'MailCore2'
  spec.version      = '1.0.0'
  spec.summary      = 'MailCore2 - Email framework for iOS'
  spec.homepage     = 'https://github.com/qqq1010440810/MailCore2'
  spec.license      = { :type => 'BSD', :file => 'LICENSE' }
  spec.author       = { 'YourName' => 'qqq1010440810@163.com' }
  spec.platform     = :ios, '12.0'
  spec.source       = { :git => 'https://github.com/qqq1010440810/MailCore2.git', :tag => spec.version }

  # Public headers location
  spec.public_header_files = 'include/**/*.h'
  spec.source_files = [
    'include/**/*.{h,hpp}',
    'src/**/*.{h,hpp,c,cpp,m,mm}'
  ]

  spec.exclude_files = [
    'bin',
    'build-android',
    'build-linux',
    'build-mac',
    'build-windows',
    'cocoapods',
    'deps',
    'example',
    'scripts'
  ]

  # Header Search Paths
  spec.header_search_paths = [
    'include',
    'src',
    'src/async',
    'src/async/imap',
    'src/async/pop',
    'src/async/nntp',
    'src/async/smtp',
    'src/core',
    'src/core/renderer',
    'src/core/abstract',
    'src/core/imap',
    'src/core/pop',
    'src/core/rfc822',
    'src/core/nntp',
    'src/core/smtp',
    'src/core/provider',
    'src/core/security',
    'src/core/basetypes',
    'src/core/basetypes/icu-ucsdet',
    'src/core/basetypes/icu-ucsdet/include',
    'src/core/zip',
    'src/core/zip/MiniZip',
    'src/objc/abstract',
    'src/objc/imap',
    'src/objc/nntp',
    'src/objc/pop',
    'src/objc/provider',
    'src/objc/rfc822',
    'src/objc/smtp',
    'src/objc/utils'
  ]

  # Dependencies
  spec.dependency 'libetpan'
  spec.dependency 'tidy-html5'
  spec.dependency 'ctemplate'

  # ARC settings
  spec.requires_arc = false
  # Link libraries
  s.libraries = ["xml2", "iconv", "z", "c++", "resolv"]
  s.frameworks = ["CFNetwork", "Security", "Foundation"]

end
