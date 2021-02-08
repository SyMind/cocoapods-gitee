require 'cocoapods'
require 'cocoapods-gitee/gem_version'

Pod::HooksManager.register(CocoapodsGitee::NAME, :pre_install) do |_, options|
  module Pod
    module Downloader
      class Request
        @@options = {}

        def self.options=(options)
          @@options = options
        end

        alias_method :original_initialize, :initialize

        def initialize(*args)
          e = original_initialize(*args)

          gitee_mirrors_path = File.expand_path('../../../gitee_mirrors.json', __FILE__)
          gitee_mirrors = JSON.parse(File.open(gitee_mirrors_path, 'r').read)
          gitee_mirrors.merge!(@@options)
          unless gitee_mirrors[@params[:git]].nil?
            @params[:git] = gitee_mirrors[@params[:git]]
          end

          e
        end
      end
    end
  end

  Pod::Downloader::Request.options = options
end
