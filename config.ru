require 'usbunfreeze_web'

map UsbunfreezeWeb::App.assets_prefix do
  run UsbunfreezeWeb::App.sprockets
end

map '/' do
  run UsbunfreezeWeb::App
end
