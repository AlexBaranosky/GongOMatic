class ConsolePrinter
  TIME_DELIMITER = ':'

  def print_schedule(practice_segments)
    puts '<<< The Schedule >>>'
    total_duration = 0
    practice_segments.each_with_index do |segment, idx|
      total_duration += segment.duration
      puts "#{(idx+1).to_s.rjust(2)}) #{hours_minutes_and_seconds(segment.duration)}   #{segment.message}"
    end
    puts "total time: #{hours_minutes_and_seconds(total_duration)}"
    puts '********************'
  end

  def hours_minutes_and_seconds(seconds)
    [seconds/3600, seconds/60 % 60, seconds % 60].map  { |time| time.to_s.rjust(2, '0') }.join(TIME_DELIMITER)
  end
end