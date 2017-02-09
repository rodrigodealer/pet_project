config = {
  host: "http://localhost:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}


config = YAML.load_file("config/elasticsearch.yml")[Rails.env] if File.exists?("config/elasticsearch.yml")

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
