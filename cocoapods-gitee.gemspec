# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-gitee/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = CocoapodsGitee::NAME
  spec.version       = CocoapodsGitee::VERSION
  spec.authors       = ['SyMind']
  spec.email         = ['dacongsama@live.com']
  spec.description   = %q{CocoaPod 插件用于使用 gitee 镜像下载依赖。}
  spec.summary       = %q{使用 gitee 镜像仓库下载原存储在 github 仓库下的依赖，提升安装速度。}
  spec.homepage      = 'https://github.com/SyMind/cocoapods-gitee'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
