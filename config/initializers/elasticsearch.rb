env = 'development'
if !ENV['RAILS_ENV'].nil?
  env = ENV['RAILS_ENV']
end

config = YAML.load(ERB.new(File.read("#{Rails.root}/config/elasticsearch.yml")).result)[env]
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
