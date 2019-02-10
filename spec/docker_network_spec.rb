require 'spec_helper'


RSpec.context 'Docker Service' do
  include SwarmHelper
  before(:all) do
    attach_swarm
    create_network('test_network')
  end

  describe docker_network('test_network') do
    it { should be_attachable }
    it { should be_swarm_scoped }
    it { should have_driver('overlay') }
    it { should be_overlay }
    it { should_not be_internal }
    it { should_not be_ingress }
    it { should_not be_IPv6_enabled }
  end

  after(:all){
    delete_networks
    detach_swarm
  }

end