@echo on
FOR /D %%F IN ("..\personal_modwork\*") DO ( 
:: FOR /D %F IN ("..\personal_modwork\*") DO (
	echo "%%F"
	mklink /J ".\%%~nxF" "%%F"
)
pause
