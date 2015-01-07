# UsbunfreezeWeb

Web application for Usbunfreeze kit.

## Installation

OmniFiles is a Sinatra/Rack application and can be used as a gem or as a server in local directory.

### As a gem

1. Install a gem

        gem install usbunfreeze_web

2. Point an env variable `USBUNFREEZE_WEB_SETTINGS` to location of a settings file `/path/to/settings.yaml` (see Configurarion).

3. Start an app as a Thin server

        USBUNFREEZE_WEB_SETTINGS=/path/to/settings.yaml usbunfreeze_web
Of course, you can provide any additional Thin options at command line or even a config with `-C /path/to/thin.yaml`.
s
## As a rack app

OmniFiles can be started using `config.ru` with you favourite Rack server.

1. Clone a git repo

2. Install dependencies

        bundle install

3. Point an env variable `USBUNFREEZE_WEB_SETTINGS` to location of a settings file `/path/to/settings.yaml` (see Configurarion).

4. Start Rack app

        rackup

## Configuration

Settings file template can be found at `config/settings.yaml.example`.

Configure Amazon AWS SQS queue and place access, secret key and queue name to the config.

## Usage

Web application is configured to serve at `/usbunfreeze` for a web page and at `/usbunfreeze-assets` for assets.
Configure your HTTP server for secure proxying requests to the web application.

Use URL [http://localhost:9292/usbunfreeze](http://localhost:9292/usbunfreeze) to send a signal message to the SQS
which will be fetched by the companion application usbunfreeze_daemon.

## License information

Please consult with the LICENSE.txt for license information. It is MIT by the way.
