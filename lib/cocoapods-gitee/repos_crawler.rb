require 'uri'
require 'cgi'
require 'open-uri'
require 'nokogiri'
require 'thread/pool'
require 'json'
require 'cocoapods'

module CocoapodsGitee
  class Repos
    @@gitee_repos_api = 'https://gitee.com/api/v5/orgs/mirrors/repos'

    def initialize
      @thread_pool = Thread.pool(20)
      @repo_gits = {}
    end

    def crawl
      page, per_page = 1, 100

      loop do
        url = "#{@@gitee_repos_api}?page=#{page}&per_page=#{per_page}"
        begin
        repos = JSON.parse(URI.open(url).read)
        rescue
        break
        ensure
        page += 1
        end

        repos.each do |repo|
        gitee_url = repo['html_url']

        @thread_pool.process {
          rep_doc = Nokogiri::HTML(URI.open(gitee_url))
          rep_doc.css('div.mirrors-notice a').each do |link|
          github_url = link.attributes['href'].value
          github_url.delete_suffix!('\\')
          github_url.delete_suffix!('.git')
          UI.puts("#{gitee_url} => #{github_url}")
          unless href.nil?
            @repo_gits[gitee_url] = "#{github_url}.git"
          end
          end
        }
        end

        break if repos.size < per_page
      end

      @thread_pool.shutdown

      File.open('gitee_mirrors.json', 'w') do |f|
        f.puts(@repo_gits.to_json)
      end
    end
  end
end
