# frozen_string_literal: true

module HttpProxyHelper
  def start_http_proxy
    @thr = Thread.new do
      require 'webrick'
      require 'webrick/httpproxy'

      proxy = WEBrick::HTTPProxyServer.new Port: 18_755

      trap 'INT'  do proxy.shutdown end
      trap 'TERM' do proxy.shutdown end

      proxy.start
    end
    sleep 2
  end

  def stop_http_proxy
    Thread.kill @thr
  end
end
