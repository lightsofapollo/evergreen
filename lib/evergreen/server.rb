module Evergreen
  class Server
    attr_reader :suite

    def initialize(suite)
      @suite = suite
    end

    def serve
      server.boot
      server_url = server.url(Evergreen.mounted_at.to_s + '/')
      Launchy.open(server_url)
      puts "Launching server at: #{server_url}"
      sleep
    end

  protected

    def server
      @server ||= Capybara::Server.new(suite.application)
    end
  end
end

