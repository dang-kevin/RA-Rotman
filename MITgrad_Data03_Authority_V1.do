/* Started July 13 by Kevin
	
the purpose of this dataset is to pull out Author_ity clusters using MIT grad PMID data.
previously, merged Pdoc author pubs with their advisors. 
also, manually pulled out single representative publications. 

now I want to figure out pull out Torvik ID's. 

working materials: 
*KDang_MITPdoc_Authority_TBFilled_V3Merged
	*this includes cliuid_2
	*unedname
	*pmid
	*pmid_authposn
	
want a code to merge with Authority datasets to pull out Torvik_ids. 

calling this MITgrad_Data03_Authority_V1.do

*/


clear all
pause on
drop _all
set more off
capture log close

cd "D:\MITgrad\Datasets\Derived"

log using "D:\MITgrad\DataLogs\MITgrad_Data03_Authority_`c(current_date)'", replace

*bring in the dataset, using first row as variables
import excel using "D:\MITgrad\Datasets\Source\MITGrad_Data02_LabSetnbCoauth_V5.xlsx", firstrow clear

*clean up the data
drop if pmid ==.

order cliuid_2 pmid pmid_authposn unedname


sort pmid pmid_authposn

*need to remove any duplicates in the file.

egen x = group(pmid pmid_authposn)
bysort x: gen num = [_N]
tab num
*keep if num >1
bysort x: gen count = [_n]
	drop if count >1
drop x num count

sort pmid pmid_authposn

*2 names (same individual with different name variations) was matched. 
*1 observation removed.

*merge into authority
forvalues i = 1(1)18{
	merge 1:1 pmid pmid_authposn using "D:\Authority\authority2009_part`i'.dta", update	
		drop if _merge ==2
			drop _merge
	}

***now want to go back and pull out all pmids associated with each torvik id.
***let's go back and see how many torvik_ids I have pulled out. 

		egen x = group(cliuid_2 torvik_id)
		mkinto12 x
		bysort cliuid_2: gen num = [_N]
		tab num
		
/*
        num |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,123      100.00      100.00
------------+-----------------------------------
      Total |      1,123      100.00
*/

*looks like all the torvik_id's are unique!

keep cliuid_2 torvik_id
save "D:\MITgrad\Datasets\Derived\cliuid_torvikid_xwalk", replace

***let's use this to go back in above and pull out all pubs assoiated with the torvik_id
use "D:\MITgrad\Datasets\Derived\cliuid_torvikid_xwalk", clear

sort torvik_id

*merge back into authority
forvalues i = 1(1)18{
	merge m:m torvik_id using "D:\Authority\authority2009_part`i'.dta", update	
		drop if _merge ==2
			drop _merge
	}

keep cliuid_2 pmid pmid_authposn
compress

save "D:\MITgrad\Datasets\Derived\MITgrad_Data03_Authority.dta", replace

log close
