Pod::Spec.new do |s|
  s.name         = "mailcore2-ios"
  s.version      = "0.6.4"
  s.summary          = 'MailCore2 for iOS and macOS'
  s.description      = <<-DESC
                        A modern and easy-to-use email framework written in C++ and Objective-C.
                       DESC
  s.homepage         = 'https://github.com/your-org/mailcore2'
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  s.author           = { 'gxf' => 'gxf@163.com' }
  s.source           = { :git => 'https://github.com/qqq1010440810/mailcore2.git', :tag => s.version.to_s }

  s.platform     = :ios, '12.0'
  s.osx.deployment_target = '10.13'
  s.requires_arc = false

  s.public_header_files = 'include/**/*.{h,hpp}'
  s.source_files = [
    'include/**/*.{h,hpp}',
    # C++ sources
    'src/**/*.{c,cpp,mm,m}',
  ]

  # Exclude unnecessary files
  s.exclude_files = [
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
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => [
      '$(PODS_TARGET_SRCROOT)/include',
      '$(PODS_TARGET_SRCROOT)/src',
      '$(PODS_TARGET_SRCROOT)/src/async',
      '$(PODS_TARGET_SRCROOT)/src/async/imap',
      '$(PODS_TARGET_SRCROOT)/src/async/pop',
      '$(PODS_TARGET_SRCROOT)/src/async/nntp',
      '$(PODS_TARGET_SRCROOT)/src/async/smtp',
      '$(PODS_TARGET_SRCROOT)/src/core',
      '$(PODS_TARGET_SRCROOT)/src/core/abstract',
      '$(PODS_TARGET_SRCROOT)/src/core/imap',
      '$(PODS_TARGET_SRCROOT)/src/core/pop',
      '$(PODS_TARGET_SRCROOT)/src/core/rfc822',
      '$(PODS_TARGET_SRCROOT)/src/core/nntp',
      '$(PODS_TARGET_SRCROOT)/src/core/smtp',
      '$(PODS_TARGET_SRCROOT)/src/core/provider',
      '$(PODS_TARGET_SRCROOT)/src/core/security',
      '$(PODS_TARGET_SRCROOT)/src/core/basetypes',
      '$(PODS_TARGET_SRCROOT)/src/core/basetypes/icu-ucsdet',
      '$(PODS_TARGET_SRCROOT)/src/core/basetypes/icu-ucsdet/include',
      '$(PODS_TARGET_SRCROOT)/src/core/renderer',
      '$(PODS_TARGET_SRCROOT)/src/core/zip',
      '$(PODS_TARGET_SRCROOT)/src/core/zip/MiniZip',
      '$(PODS_TARGET_SRCROOT)/src/objc/abstract',
      '$(PODS_TARGET_SRCROOT)/src/objc/imap',
      '$(PODS_TARGET_SRCROOT)/src/objc/nntp',
      '$(PODS_TARGET_SRCROOT)/src/objc/pop',
      '$(PODS_TARGET_SRCROOT)/src/objc/provider',
      '$(PODS_TARGET_SRCROOT)/src/objc/rfc822',
      '$(PODS_TARGET_SRCROOT)/src/objc/smtp',
      '$(PODS_TARGET_SRCROOT)/src/objc/utils'
    ].join(' ')
  }

  # Define macros
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'HAVE_CFNETWORK=1'
  }

  # Dependencies (as separate pods or static libraries, if needed)
  s.dependency 'libetpan'
  s.dependency 'tidy-html5'
  s.dependency 'ctemplate'

  # Link libraries
  s.libraries = 'c++', 'z', 'iconv', 'xml2'
  s.frameworks = 'CFNetwork', 'Security', 'Foundation'
end
