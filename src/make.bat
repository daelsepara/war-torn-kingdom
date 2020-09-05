@echo off
del *.xzap *.zap *.z?
zilf -w wartorn.zil
zapf -ab wartorn.zap > wartorn_freq.xzap
del wartorn_freq.zap
zapf wartorn.zap
