require File.dirname(__FILE__) + '/../src/gong_o_matic'

KUNGFU_STANCES_ROUTINE = File.dirname(__FILE__) + '/../resources/kungfu_stances_routine.txt'

gong_o_matic = GongOMatic.new
gong_o_matic.run(KUNGFU_STANCES_ROUTINE)