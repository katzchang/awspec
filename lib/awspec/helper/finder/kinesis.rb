module Awspec::Helper
  module Finder
    module Kinesis
      def find_kinesis(stream_name)
        kinesis_client.describe_stream({stream_name: stream_name})
      end

      def select_all_kinesis_stream
        kinesis_client.list_streams.stream_names.map do |stream_name|
          find_kinesis(stream_name)
        end
      end
    end
  end
end
