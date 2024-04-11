# frozen_string_literal: true

shared_examples 'HTTP::http_proxy' do
  describe curl('http://localhost:18754/200', proxy: 'http://localhost:18755') do
    it { should respond_with_200 }
    it { should respond_with_OK }
    it { should respond_with_ok }
    it { should be_ok }
  end
end
