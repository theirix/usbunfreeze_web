# encoding: utf-8

require 'sinatra/base'
require 'sprockets'
require 'sprockets-helpers'
require 'sinatra/flash'
require 'uri'
require 'settingslogic'
require 'rack'
require 'haml'
require 'aws-sdk'
require 'json'

module UsbunfreezeWeb

  class App < Sinatra::Application

    set :sprockets, Sprockets::Environment.new(root)
    set :assets_prefix, '/usbunfreeze-assets'

    configure do
      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = true
      end
      sprockets.append_path 'assets/stylesheets'
      sprockets.append_path 'assets/javascripts'
      sprockets.css_compressor = :scss
    end

    helpers Sprockets::Helpers

    enable :sessions
    set :session_secret, Settings.session_secret

    register Sinatra::Flash

    before do
      logger.info "Fired app at #{request.path_info}"
    end

    # GET - an index page
    get '/usbunfreeze' do
      haml :usbunfreeze
    end

    # POST - a form
    post '/usbunfreeze' do

      begin
        send_command
        flash[:notice] = "Command was sent to the notebook. Wait a few seconds."
      rescue => e
        flash[:error] = "Error launching a command: " + e.message
        logger.error "Error: " + e.message + "\nStacktrace:\n" +
          e.backtrace.map{|s| "\t"+s}.join("\n")
      end

      redirect to('/usbunfreeze')
    end

  private

    def send_command
      logger.info "Sending command to SQS"

      sqs = Aws::SQS::Client.new(region: Settings.sqs.region,
                                 access_key_id: Settings.sqs.access_key_id,
                                 secret_access_key: Settings.sqs.secret_access_key)
      raise 'No SQS object' unless sqs

      logger.info "Get queue '#{Settings.sqs.queue_name}' ..."
      q = sqs.get_queue_url(queue_name: Settings.sqs.queue_name)
      raise 'Cannot get queue' unless q

      message = {message: 'unfreeze', timestamp: Time.now.iso8601}.to_json
      m = sqs.send_message(queue_url: q.data.queue_url, message_body: message)
      logger.info "Successfully sent id #{m.message_id}"
    end

  end

end
