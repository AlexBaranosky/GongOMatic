require File.dirname(__FILE__) + '/../src/path_making'
require File.dirname(__FILE__) + '/../src/parser'
require File.dirname(__FILE__) + '/../src/console_printer'
require File.dirname(__FILE__) + '/../src/audio_player'

include PathMaking

SAMPLE_ROUTINE = File.dirname(__FILE__) + '/../resources/sample_routine.txt'
BIKRAM_YOGA_ROUTINE = File.dirname(__FILE__) + '/../resources/bikram_yoga_routine.txt'

class GongOMatic

  def initialize(audio_player = AudioPlayer.new, console_printer = ConsolePrinter.new)
    @audio_player, @console_printer = audio_player, console_printer
  end

  def run(file_name)
    practice_routine_segments = read_practice_routine_from(file_name)
    @console_printer.print_schedule(practice_routine_segments)
    @audio_player.play(practice_routine_segments)
  end                                                                 

  private

  def read_practice_routine_from(file_name)
    raise('durations file not found') unless File.exists?(file_name)

    File.open(file_name).inject([]) do |parsed_lines, file_line|
      practice_routine_segment = Parser.parse_line(file_line)
      practice_routine_segment ? parsed_lines << practice_routine_segment : parsed_lines
    end
  end

end

