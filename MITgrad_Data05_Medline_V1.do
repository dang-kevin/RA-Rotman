/* Started July 14 by Kevin

The purpose of this file is to use the PMID's from MITgrad_Data03_Authority.dta
to extract data from the Medline dataset.

calling this file MITgrad_Data05_Medline_V1.do

*/


clear all
pause on
drop _all
set more off
capture log close


cd "D:\MITgrad\Datasets\Derived"

log using "D:\MITgrad\DataLogs\MITgrad_Data05_Medline_`c(current_date)'", replace

use "D:\MITgrad\Datasets\Derived\MITgrad_Data03_Authority.dta", clear

forvalues i = 1(1)928{
	merge m:m pmid using "D:\Medline\StataFiles\pubmed18n`i'.dta", force update
		drop if _merge ==2
		drop _merge
	}

* not sure where this comes from...
drop v20-v60
	
compress

save "D:\MITgrad\Datasets\Derived\MITgrad_Data05_Medline.dta", replace

log close
