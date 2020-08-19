@echo off
del *.xzap *.zap *.z?
zilf -w kingdom.zil
zapf -ab kingdom.zap > kingdom_freq.xzap
del kingdom_freq.zap
del zapf -la kingdom.zap



