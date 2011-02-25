require 'pony'

require 'makesure/runner'
require 'makesure/cron'
require 'makesure/system'
require 'makesure/cmd'
require 'makesure/verify'
require 'makesure/summarize'
require 'makesure/version'

module Makesure
  
  @alert_options = {}
  @systems = []
  
  extend self
  
  # global options
  attr_accessor :uid,
                :chdir,
                :alert_options,
                :log_level
  
  def makesurefile
    File.expand_path(File.join(Dir.pwd, "Makesurefile"))
  end
  
  def load_system_defs
    file = makesurefile
    Makesure.log("Loading Makesurefile")
    load(file)
    abort "No system specifications found" unless Makesure.systems.size > 0
    Makesure.log "Loaded #{Makesure.systems.size} system specifications"
  rescue Exception => e
    if e.instance_of?(SystemExit)
      raise
    else
      Makesure.warn "There was an error loading #{file}"
      Makesure.warn "\t" + e.message
      Makesure.warn "\t" + e.backtrace.join("\n\t")
      abort "Couldn't load your Makesurefile"
    end
  end
  
  def system_with_name(name)
    systems.find { |s| s.name.to_s == name.to_s }
  end
  
  def send_alert(title, details = "")
    opts = { :from => "makesure@unknown" }.merge(Makesure.alert_options)
    Makesure.log "Sending alert to #{opts[:to]}: #{title}"
    msg = Pony.mail(opts.merge(:subject => title, :body => details))
  end
  
  # DSL stuff
  
  attr_reader :systems
  
  def system(name)
    Makesure.debug "Reading specification for system '#{name}'"
    s = Makesure::System.new(name)
    yield s
    @systems << s
  end
  
  # internal utils
  
  def log(msg, level = :info)
    puts "[#{Time.now.to_s}] #{level.to_s.upcase}: #{msg}"
  end
  
  def warn(msg)
    log(msg, :warn)
  end
  
  def debug(msg)
    log(msg, :debug) if log_level == :debug
  end
end
