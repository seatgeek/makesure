module Makesure
  
  class Cmd
    
    attr_reader :cron, :command
    
    def initialize(cron, command)
      @cron    = cron
      @command = command
    end
    
  end
  
end