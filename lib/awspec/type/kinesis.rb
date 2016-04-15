module Awspec::Type
  class Kinesis < Base
    def initialize(id)
      super
      @resource_via_client = find_kinesis(id)
      @id = @resource_via_client.stream_description.stream_arn if @resource_via_client
    end

    def timeout
      @resource_via_client.timeout
    end
  end
end
