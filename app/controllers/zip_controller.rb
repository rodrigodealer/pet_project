class ZipController < ApplicationController
  def fetch
    if params && !params[:cep].nil?
      domain = 'http://www.cepaberto.com/api/v2/ceps.json'
      uri = URI(domain)
      headers = { 'Authorization' => 'Token token=43ba42fe612c05b5b9de94a468cef3c9' }
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.path)
      request.set_form_data({ 'cep' => params[:cep] })
      request = Net::HTTP::Get.new(uri.path + '?' + request.body, headers)
      render :json => http.request(request).body
    end
  end
end
