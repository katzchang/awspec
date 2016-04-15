module Awspec::Generator
  module Spec
    class Kinesis
      include Awspec::Helper::Finder
      def generate_all
        kinesis_streams = select_all_kinesis_streams
        raise 'Not Found kinesis' if kinesis_streams.empty?
        ERB.new(kinesis_spec_template, nil, '-').result(binding).chomp
      end

      def kinesis_spec_template
        template = <<-'EOF'
<% kinesis_streams.each do |stream| %>
describe kinesis('<%= stream.stream_name %>') do
  it { should exist }
  its(:stream_name) { should eq '<%= stream.stream_name %>' }
  its(:stream_arn) { should eq '<%= stream.stream_arn %>' }
  its(:stream_status) { should eq '<%= stream.stream_status %>' }
  its(:shards_size) { should eq <%= stream.shards_size %> }
  its(:retention_period_hours) { should eq '<%= stream.retention_period_hours %>' }
end
<% end %>
EOF
        template
      end
    end
  end
end
