require 'bundler/setup'
require 'json'
require 'sinatra'
require 'sass'
require 'erb'
require 'sinatra/assetpack'
require 'tilt/erb'

class App < Sinatra::Application
	def initialize(app=nil)
		super(app)
	end

	register Sinatra::AssetPack
	assets do
		js :application, [
			'js/*.js'
		]

		css :application, [
			'css/*.css'
		]

		js_compression :jsmin
		css_compression :sass
	end

	# 404 Error!
	not_found do
		status 404
		erb :not_found, :layout => :layout
	end

	error do
		erb :error, :layout => :layout
	end

	get '/' do
		erb :index, :layout => :layout
	end

	get '/jimmy' do
		erb :jimmeh, :layout => :new_layout
	end
end
