Aws.config[:kinesis] = {
  stub_responses: {
    list_streams: {
      stream_names: [
        'my-kinesis-stream-name'
      ],
      has_more_streams: false
    },
    describe_stream: [
      {
        stream_description: {
          stream_name: "my-kinesis-stream-name",
          stream_arn: "arn:aws:kinesis:us-east-1:123456789012:stream/my-kinesis-stream-name",
          stream_status: "ACTIVE",
          shards: [
            shard_id: "shardId-000000000000",
            parent_shard_id: nil,
            adjacent_parent_shard_id: nil,
            hash_key_range: {
              starting_hash_key: "0",
              ending_hash_key: "340282366920938463463374607431768211455"
            },
            sequence_number_range: {
              starting_sequence_number: "49560780435139199914490166017021262117199299124947582978",
              ending_sequence_number: nil}
          ],
          has_more_shards: false,
          retention_period_hours: 24
        }
      }
    ]
  }
}
