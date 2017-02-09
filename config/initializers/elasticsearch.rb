env = 'development'
if !ENV['RAILS_ENV'].nil?
  env = ENV['RAILS_ENV']
end
config = YAML.load_file(Rails.root.join('config/elasticsearch.yml'))[env]
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
