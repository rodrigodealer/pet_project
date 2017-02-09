config = {
  host: "http://localhost:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}
config = YAML.load_file(Rails.root.join('config/elasticsearch.yml'))[ENV['RAILS_ENV']]
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
