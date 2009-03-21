module ActiveSupport
  class BufferedLogger
    
    def inspect(message = nil, progname = nil, &block)
      add(DEBUG, "\n#{message.inspect}\n\n", progname, &block)
    end
    
    def red(message = nil, progname = nil, &block)
      add(DEBUG, "\e[31m#{message}\e[0m", progname, &block)
    end
    
    def green(message = nil, progname = nil, &block)
      add(DEBUG, "\e[32m#{message}\e[0m", progname, &block)
    end
    
    def blue(message = nil, progname = nil, &block)
      add(DEBUG, "\e[34m#{message}\e[0m", progname, &block)
    end
    
  end
end