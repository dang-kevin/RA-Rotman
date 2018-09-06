/* Started July 14 by Kevin

the goal of this dofile is have a file to put in torvik_ids for each lab in which the individual has trained.
currently, I have pulled out publications for each grad student in the dataset.

want to replace each of the authors with torvik ids for author.

calling this file MITgrad_Data10_Medline_TorvikID_V1.do

*/


clear all
pause on
drop _all
set more off
capture log close


cd "D:\MITgrad\Datasets\Derived"

log using "D:\MITgrad\DataLogs\MITgrad_Data10_Medline_TorvikID`c(current_date)'", replace

* starting dataset with pmids
use "D:\MITgrad\Datasets\Derived\MITgrad_Data05_Medline.dta", clear

gen auth_count = length(authorlist) - length(subinstr(authorlist, ",", "", .)) + 1
tab auth_count

* restrict the dataset to make our lives easier
drop if auth_count >10

keep pmid auth_count
mkinto12 pmid

sum auth_count, detail
gen pmid_authposn = [_n]
	replace pmid_authposn = 1 if pmid_authposn > `r(max)'

fillin pmid pmid_authposn
	drop _fillin
pulldown12 pmid auth_count
drop if pmid_authposn > auth_count
	drop auth_count

compress

* pull out the torvik_ids
sort pmid pmid_authposn
forvalues i = 1(1)18{
	merge 1:1 pmid pmid_authposn using "D:\Authority\authority2009_part`i'.dta", update
		drop if _merge ==2
			drop _merge
	}
	
* reshape this in preparation for merging back into MITgrad_Data05_Medline
reshape wide torvik_id, i(pmid) j(pmid_authposn)
sort pmid
save temp, replace

*use Data05 again, bring in torvik_ids
use "D:\MITgrad\Datasets\Derived\MITgrad_Data05_Medline.dta", clear
sort pmid 
merge m:1 pmid using temp.dta
* 1,552 not matched
*tab publicationtype if _merge ==1

* regenerate author_numbers
gen auth_count = length(authorlist) - length(subinstr(authorlist, ",", "", .)) + 1
tab auth_count

gen lab_member = pmid_authposn !=auth_count

* Generate an indicator variable for whether the pdoc is the last author on the publication
gen lab_head = pmid_authposn ==auth_count

* Pull out year of publication from pubdate field
gen year = substr(pubdate,1,4)

tab auth_count if _merge ==1

keep if _merge ==3
drop _merge

*let's clean up the merged data a bit. 
keep cliuid_2 year pmid pmid_authposn auth_count lab_member lab_head torvik*
order cliuid_2 year pmid pmid_authposn auth_count lab_member lab_head torvik*
	compress

*let's generate a single variable that matches the torvik_id of the last author. 
gen lauthor_torvik_id =""
forvalues i = 1(1)10{
	replace lauthor_torvik_id = torvik_id`i' if torvik_id`i' !=""
	}
	
order lauthor_torvik_id, before(torvik_id1)
	
sort cliuid_2 year pmid
compress
	
save "D:\MITgrad\Datasets\Derived\MITgrad_Data10_Medline_TorvikID.dta", replace

log close
	