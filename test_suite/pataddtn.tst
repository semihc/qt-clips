(set-strategy depth)
(unwatch all)
; pataddtn.clp test
(clear)
(open "Results//pataddtn.rsl" pataddtn "w")
(load "compline.clp")
(dribble-on "Actual//pataddtn.out")
(load "pataddtn.clp")
(reset)
(agenda)
(dribble-off)
(printout pataddtn "pataddtn.clp differences are as follows:" crlf)
(compare-files "Expected//pataddtn.out" "Actual//pataddtn.out" pataddtn)
; close result file
(close pataddtn)
