module Makesure
  
  class System
    
    attr_reader :name, :cmds, :verifies, :summarizes
    
    attr_accessor :uid
    
    def initialize(name)
      @name = name
      
      @cmds       = []
      @verifies   = []
      @summarizes = []
    end
    
    # DSL stuff
    
    def schedule(cron_spec, cmd)
      Makesure.debug("scheduling '#{cmd}' at '#{cron_spec}'")
      @cmds << Cmd.new(cron_spec, cmd)
    end
    
    def verify(name, cron_spec, &blk)
      Makesure.debug("scheduling verify at '#{cron_spec}'")
      @verifies << Verify.new(name, cron_spec, blk)
    end
    
    def summarize(name, cron_spec, &blk)
      Makesure.debug("scheduling summarize at '#{cron_spec}'")
      @summarizes << Summarize.new(name, cron_spec, blk)
    end
    
    # internal use
    
    def verify_with_name(name)
      verifies.find { |v| v.name.to_s == name.to_s }
    end
    
    def summarize_with_name(name)
      summarizes.find { |s| s.name.to_s == name.to_s }
    end
    
  end
  
end