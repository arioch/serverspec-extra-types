# frozen_string_literal: true

require 'spec_helper'
SimpleCov.command_name 'serverspec:curl'
context 'Curl Matchers' do
  include WebserverHelper
  include HttpProxyHelper

  before(:all) do
    start_webserver
    start_http_proxy
  end

  (1..5).to_a.each { |num| include_examples "HTTP::#{num}XX" }
  include_examples 'HTTP::http_proxy'

  after(:all) do
    stop_http_proxy
    stop_webserver
  end
end
