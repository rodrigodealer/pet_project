config = {
  host: "http://localhost:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}
env = 'development'
env = ENV['RAILS_ENV'] if ENV['RAILS_ENV']
config = YAML.load_file(Rails.root.join('config/elasticsearch.yml'))[env]
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
