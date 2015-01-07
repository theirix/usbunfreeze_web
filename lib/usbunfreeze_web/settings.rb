require 'settingslogic'

module UsbunfreezeWeb

  class Settings < Settingslogic
    settings_file = (ENV['USBUNFREEZE_WEB_SETTINGS'] or '')
    raise "Please specify a settings file in env USBUNFREEZE_WEB_SETTINGS" unless File.file?(settings_file)
    source settings_file
    namespace 'config'
    load!
  end
end