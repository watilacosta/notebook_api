class ApplicationController < ActionController::API
  before_action :ensure_json_request

  # Responder apenas quando na request tiver o header Accept = json
  def ensure_json_request             # |-> OPERADOR CORRESPONDENTE(=~) permite que você faça uma pesquisa rápida de índice usando uma expressão regular 
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render nothing: true, status: 406
  end
end
