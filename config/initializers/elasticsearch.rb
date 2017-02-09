env = 'development'
if !ENV['RAILS_ENV'].nil?
  env = ENV['RAILS_ENV']
end
file = File.read("#{Rails.root}/config/elasticsearch.yml")
config = YAML.load(ERB.new(file).result)[env]
Elasticsearch::Model.client = Elasticsearch::Client.new(host: config['host'])
