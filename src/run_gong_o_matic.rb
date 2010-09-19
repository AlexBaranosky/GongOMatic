require File.dirname(__FILE__) + '/../src/gong_o_matic'

SAMPLE_ROUTINE = File.dirname(__FILE__) + '/../resources/sample_routine.txt'

gong_o_matic = GongOMatic.new
gong_o_matic.run(SAMPLE_ROUTINE)