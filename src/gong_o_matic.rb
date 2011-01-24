require File.dirname(__FILE__) + '/../src/practice_routine_part_parser'
require File.dirname(__FILE__) + '/../src/console_printer'
require File.dirname(__FILE__) + '/../src/audio_player'

class GongOMatic

  def run(file_name, multiplier)
    @multiplier = multiplier
    @file_name = file_name
    routine_parts = read_practice_routine()
    ConsolePrinter.new.print_schedule(routine_parts)
    AudioPlayer.new.play(routine_parts)
  end

  private

  def read_practice_routine()
    raise('practice routine file not found') unless File.exists?(@file_name)

    File.open(@file_name).inject([]) do |parts, line|
      part = PracticeRoutinePartParser.parse(line)
      if part
        part.scale_duration_by(@multiplier)
        parts << part
      else
        parts
      end
    end
  end
end

