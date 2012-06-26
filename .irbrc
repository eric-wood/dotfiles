require 'irb/completion'
ARGV.concat ['--readline', '--prompt-mode', 'simple']
#ruby                    = ENV["rvm_ruby_string"] || "#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'unknown'}-#{RUBY_VERSION}"
ruby                    = RUBY_VERSION
prompt                  = {
  :PROMPT_I     => "[#{ruby}] %03n:%i >> ",  # default prompt
  :PROMPT_S     => "[#{ruby}] %03n:%i \033[31m%l\033[0m> ", # known continuation
  :PROMPT_C     => "[#{ruby}] %03n:%i >> ",  
  :PROMPT_N     => "[#{ruby}] %03n:%i \033[31m*\033[0m> ",  # unknown continuation
  :RETURN       => "# => %s\n",
}

IRB.conf[:USE_READLINE] = true
IRB.conf.delete(:AUTO_INDENT) # irb checks for presence, not content... stupid
IRB.conf[:PROMPT][:AWESOME] = prompt
IRB.conf[:PROMPT_MODE]      = :AWESOME
