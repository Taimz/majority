$redis = Redis::Namespace.new("majority", :redis => Redis.new(host: "localhost", port: 6390))
