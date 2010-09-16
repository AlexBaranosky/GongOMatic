require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\practice_routine_segment'
require 'C:\Users\Alex and Paula\Documents\Software Projects\ScheduledGongs\src\string_ext'

class Parser
  PRACTICE_SEGMENT_LINE_REGEX = /^\s*\d\d:\d\d:\d\d\s+\*\*.*$/
  DURATION_PARTS_DELIMITER = ':'

  def self.parse_line(line)
    return nil unless practice_segment_line?(line)
    practice_segment_from(line)
  end

  private

  def self.practice_segment_line?(line)
    !line.comment? and !line.blank?
  end

  def self.practice_segment_from(line)
    raise("invalid line format: \n#{line}") unless(line.match(PRACTICE_SEGMENT_LINE_REGEX))

    duration_part_of_line = line.split(DURATION_PARTS_DELIMITER)
    seconds = parse_seconds_from(duration_part_of_line)
    message = line.split("**")[1]
    PracticeRoutineSegment.new(seconds, message)
  end

  def self.parse_seconds_from(duration_part_of_line)
    hours   = duration_part_of_line[0].to_i
    minutes = duration_part_of_line[1].to_i + (hours * 60)
    duration_part_of_line[2].to_i + (minutes * 60)
  end
end

