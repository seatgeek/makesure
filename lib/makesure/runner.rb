module Makesure
  
  class Runner
    
    attr_accessor :cmd
    
    def initialize(cmd, opts = {})
      @cmd = cmd
      @opts = {
        :test => "val"
      }.merge(opts)
    end
    
    def run!
      io = IO.popen(cmd)
      Makesure.log "Running cmd '#{cmd}' with pid #{io.pid}"

      Process.wait # needed to populate $?
      # seems to grab the exitstatus of the last cmd in a chain, ie:
      #   ls -al | grep -i file-that-exits                        # exits w/ 0
      #   ls -al | grep -i -file-that-does-not-exist              # exits w/ 1
      #   ls -al | grep -i -file-that-does-not-exist | echo "yay" # exits w/ 0
      exitstatus = $?.exitstatus

      Makesure.log "cmd exited with status #{exitstatus}"

      output = io.read

      unless exitstatus == 0
        Makesure.warn "oh shitttt something broke, tell everybody!"
        body = ""
        body << "[#{Time.now.to_s}] #{cmd.inspect} [pid #{io.pid}] exited with status #{exitstatus}, output follows:\n\n"
        body << output
        Makesure.send_alert("ERROR in command alert: #{cmd.inspect}", body)
      end

      if output.empty?
        Makesure.log "no output"
      else
        Makesure.log ">>> begin output"
        output.each_line do |l|
          Makesure.log l
        end
        Makesure.log "<<< end output"
      end
    end

  end

end