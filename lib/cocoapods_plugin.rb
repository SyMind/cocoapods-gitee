require 'cocoapods'
require 'cocoapods-gitee/gem_version'

class Pod::Downloader::Request
  alias_method :original_initialize, :initialize

  def initialize(*args)
    e = original_initialize(*args)

    gitee_mirrors = {
      "https://github.com/robbiehanson/CocoaAsyncSocket.git" => "https://gitee.com/mirrors/CocoaAsyncSocket.git"
    }

    gitee = gitee_mirrors[@params[:git]]
    unless gitee.nil?
      @params[:git] = gitee
    end
  end
end
