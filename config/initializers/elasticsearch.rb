config = {
  host: "http://localhost:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}
env = ENV['RAILS_ENV']
if ENV['RAILS_ENV'].nil?
  env = 'development'
end
config = YAML.load_file("config/elasticsearch.yml")[ENV['RAILS_ENV']] if File.exists?("config/elasticsearch.yml")

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
