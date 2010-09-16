require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\path_making'
require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\parser'
require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\console_printer'
require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\audio_player'

include PathMaking

SAMPLE_ROUTINE = resource_path('sample_routine.txt')
BIKRAM_YOGA_ROUTINE = resource_path('bikram_yoga_routine.txt')

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

