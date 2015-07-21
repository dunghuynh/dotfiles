# vim: set ft=ruby:

if defined?(::Rails) && Rails.env
  if Rails::VERSION::MAJOR == 3
    verbose, $VERBOSE = $VERBOSE, nil
    Rails::Console::IRB = ::Pry unless Rails::Console::IRB == ::Pry
    $VERBOSE = verbose

    unless defined? ::Pry::ExtendCommandBundle
      ::Pry::ExtendCommandBundle = Module.new
    end
  end

  if Rails::VERSION::MAJOR == 4
    unless Rails.application.config.console == ::Pry
      Rails.application.config.console = ::Pry
    end
  end

  if ((Rails::VERSION::MAJOR == 3 && Rails::VERSION::MINOR >= 2) ||
      Rails::VERSION::MAJOR == 4)
    unless defined? ::Rails::ConsoleMethods
      require 'rails/console/app'
      require 'rails/console/helpers'

      TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
    end
  end
end
