require 'fileutils'

class ProcessorService
  include Singleton

  def parse_commands(log)
    separator = '#####SEPARATOR#####'

    log.gsub(/(.*@)(mx960-01-hon>\s*)/, separator)
      .split(separator)
      .inject([]) do |cmd_logs, block|
        result = block.lines
        name = result.slice!(0).chomp

        next cmd_logs if name.blank? || result.blank?

        cmd_logs << {
          name: name,
          result: result.join
        }
      end
  end
end
