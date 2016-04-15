module Awspec::Generator
  module Doc
    module Type
      class Kinesis < Base
        def initialize
          super
          @type_name = 'Kinesis'
          @type = Awspec::Type::Kinesis.new('my-kinesis-stream-name')
          @ret = @type.resource_via_client
          @matchers = []
          @ignore_matchers = []
          @describes = []
        end
      end
    end
  end
end
