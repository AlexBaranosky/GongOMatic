require File.dirname(__FILE__) + '/../src/practice_routine_part_parser'
require File.dirname(__FILE__) + '/../src/console_printer'
require File.dirname(__FILE__) + '/../src/audio_player'

class GongOMatic

  def initialize
    @console_printer = ConsolePrinter.new
    @audio_player = AudioPlayer.new
  end

  def run(file_name)
    routine_parts = read_practice_routine(file_name)
    @console_printer.print_schedule(routine_parts)
    @audio_player.play(routine_parts)
  end

  private

  def read_practice_routine(file_name)
    raise('practice routine file not found') unless File.exists?(file_name)

    routine_parts = File.open(file_name).inject([]) do |parts, line|
      parts << PracticeRoutinePartParser.parse(line)
    end
    routine_parts.reject { |p| p.nil? }
  end
end

