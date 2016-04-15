require 'spec_helper'
Awspec::Stub.load 'kinesis'

describe kinesis('my-kinesis-stream-name') do
  it { should exist }
  its(:architecture) { should eq 'x86_64' }
  context 'nested attribute call' do
    its(:resource) { should be_an_instance_of(Awspec::ResourceReader) }
    its(:data) { should be_an_instance_of(Aws::EC2::Types::Image) }
  end
end
