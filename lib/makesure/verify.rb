module Makesure
  
  class Verify
    
    attr_reader :name, :cron, :blk
    
    def initialize(name, cron, blk)
      @name = name
      @cron = cron
      @blk  = blk
    end
    
    def run!
      begin
        
        blk.call
        Makesure.log "Everything is copacetic"
        
      rescue Exception => e
        Makesure.warn "Uh oh, something's up"
        Makesure.warn "\t" + e.message
        
        # send an email with the details
        body = ""
        body << "[#{Time.now.to_s}] Verification failure:\n\n"
        body << e.backtrace.join("\n")
        Makesure.send_alert("FAILED verification alert: #{e.message}", body)
        
        return false
      #else
      #ensure
      end
      
      true
    end
    
  end
  
end