class RepositoriesController < ApplicationController
  def index
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.body = { name: params[:name] }.to_json
      req.headers['Authorization'] = "token #{session[:token]}"
      req.headers['Accept'] = 'application/json'
    end
    redirect_to '/'
  end
end
