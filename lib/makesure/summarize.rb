module Makesure
  
  class Summarize
    
    attr_reader :name, :cron, :blk
    
    def initialize(name, cron, blk)
      @name = name
      @cron = cron
      @blk  = blk
    end
    
    def run!
      begin
        
        blk.call
        
      rescue Exception => e
        Makesure.warn "Uh oh, something's up"
        Makesure.warn "\t" + e.message
        
        # send an email with the details
        
        return false
      end
      
      true
    end
    
  end
  
end