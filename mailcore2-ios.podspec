Pod::Spec.new do |s|
  s.name             = 'MailCore2'
  s.version          = '0.6.4' # 已更新为实际版本号
  s.summary          = 'A mail framework for iOS'
  s.description      = 'MailCore2 is a mail framework for iOS, supporting IMAP, POP, SMTP and NNTP protocols.'
  s.homepage         = 'https://github.com/MailCore/mailcore2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'qqq1010440810@163.com' }
  s.source           = { :git => 'https://github.com/qqq1010440810/MailCore2.git', :tag => s.version.to_s }
  
  s.default_subspec = 'Core'
  
  # 仅保留iOS平台支持
  s.platform = :ios, '12.0'
  
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++2a',
    'CLANG_C_LANGUAGE_STANDARD' => 'gnu11'
  }
  
  s.subspec 'Core' do |core|
    # 排除文件
    core.exclude_files = [
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
    
    # C 和 Objective-C 源文件
    core.source_files = [
      'src/async/**/*.{cpp,m,mm}',
      'src/core/**/*.{cpp,c,m,mm}',
      'src/objc/**/*.{m,mm}',
      'src/zip/**/*.{c,cpp,m,mm}'
    ]
    
    # 头文件路径
    core.public_header_files = 'include/**/*.h'
    
    # 编译标志
    core.compiler_flags = [
      '-fno-objc-arc',
      '-DHAVE_CFNETWORK=1'
    ]
    
    # 头文件搜索路径
    core.header_mappings_dir = '.'
    core.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => [
        '$(PODS_TARGET_SRCROOT)/include',
        '$(PODS_TARGET_SRCROOT)/src',
        '$(PODS_TARGET_SRCROOT)/src/async',
        '$(PODS_TARGET_SRCROOT)/src/async/imap',
        '$(PODS_TARGET_SRCROOT)/src/async/pop',
        '$(PODS_TARGET_SRCROOT)/src/async/nntp',
        '$(PODS_TARGET_SRCROOT)/src/async/smtp',
        '$(PODS_TARGET_SRCROOT)/src/core',
        '$(PODS_TARGET_SRCROOT)/src/core/renderer',
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
    
    # 依赖库
    core.libraries = ["xml2", "iconv", "z", "c++", "resolv"]
    core.prepare_command = "./scripts/build-mailcore2-ios-cocoapod.sh"

    # 系统框架
    core.frameworks = 'Security', 'CFNetwork', 'Foundation', 'SystemConfiguration'
    
    # 移除仅macOS需要的库（因为现在只支持iOS）
    # core.libraries << 'sasl2' if core.available_platforms.include?(:osx)
    
    # 依赖项
    core.dependency 'libetpan'
    core.dependency 'tidy-html5'
    core.dependency 'ctemplate'
  end
  
  s.subspec 'UnitTests' do |test|
    test.source_files = 'unittest/**/*.{m,mm}'
    test.dependency 'MailCore2/Core'
  end
end
