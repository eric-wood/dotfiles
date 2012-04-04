require 'irb/completion'
ARGV.concat ['--readline', '--prompt-mode', 'simple']
ruby                    = ENV["rvm_ruby_string"] || "#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'unknown'}-#{RUBY_VERSION}"
prompt                  = {
  :PROMPT_I     => "[#{ruby}] %03n:%i >> ",  # default prompt
  :PROMPT_S     => "[#{ruby}] %03n:%i %l> ", # known continuation
  :PROMPT_C     => "[#{ruby}] %03n:%i >> ",  
  :PROMPT_N     => "[#{ruby}] %03n:%i *> ",  # unknown continuation
  :RETURN       => "# => %s\n",
}

IRB.conf.delete(:AUTO_INDENT) # irb checks for presence, not content... stupid
IRB.conf[:PROMPT][:AWESOME] = prompt
IRB.conf[:PROMPT_MODE]      = :AWESOME
