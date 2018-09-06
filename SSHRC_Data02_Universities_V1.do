/* Started August 24 by Kevin

The purpose of this file is to take SSHRC_Data01_MedlineAffiliation_V1.dta and
assign pmids + affiliationinfo to Canadian universities.

Calling this file SSHRC_Data02_Universities_V1.do

*/


clear all
pause on
drop _all
set more off
capture log close


cd "D:\SSHRC\Datasets"

log using "D:\SSHRC\DataLogs\SSHRC_Data02_Universities_`c(current_date)'", replace

use "D:\SSHRC\Datasets\SSHRC_Data01_MedlineAffiliation.dta", clear

*Generate a blank university variable
*Will fill in this blank column afterward with Canadian universities
gen university = ""

*Now generate unique university variables, and fill in the university column
*This includes all Canadian universities

*Will group by province to keep track of all schools

***Important: Different ways to represent particular institutions
***Need to properly distinguish a few names that are commonly used:
	*Universities
	*Government Research Agencies
	*Hospitals
	*English/French version
	
**First starting with public universities

*Alberta
gen Athabasca = strpos(affiliationinfo, "Athabasca")
replace university = "Athabasca University" if Athabasca >0

gen MacEwan = strpos(affiliationinfo, "MacEwan")
replace university = "MacEwan University" if MacEwan >0

gen MountRoyal = strpos(affiliationinfo, "Mount Royal")
replace university = "Mount Royal University" if MountRoyal >0

gen Alberta = strpos(affiliationinfo, "University of Alberta")
replace university = "University of Alberta" if Alberta >0

gen Alberta2 = strpos(affiliationinfo, "Cross Cancer Institute")
replace university = "University of Alberta" if Alberta2 >0

gen Calgary = strpos(affiliationinfo, "University of Calgary")
replace university = "University of Calgary" if Calgary >0

gen Calgary2 = strpos(affiliationinfo, "Southern Alberta Cancer Research")
replace university = "University of Calgary" if Calgary2 >0

gen Calgary3 = strpos(affiliationinfo, "Foothills Hospital")
replace university = "University of Calgary" if Calgary3 >0

gen Lethbridge = strpos(affiliationinfo, "University of Lethbridge")
replace university = "University of Lethbridge" if Lethbridge >0

*British Columbia
gen Capilano = strpos(affiliationinfo, "Capilano")
replace university = "Capilano University" if Capilano >0

gen EmilyCarr = strpos(affiliationinfo, "Emily Carr")
replace university = "Emily Carr University of Art and Design" if EmilyCarr >0

gen Kwantlen = strpos(affiliationinfo, "Kwantlen")
replace university = "Kwantlen Polytechnic University" if Kwantlen >0

gen RoyalRoads = strpos(affiliationinfo, "Royal Roads")
replace university = "Royal Roads University" if RoyalRoads >0

gen SimonFraser = strpos(affiliationinfo, "Simon Fraser")
replace university = "Simon Fraser University" if SimonFraser >0

gen ThompsonRivers = strpos(affiliationinfo, "Thompson Rivers")
replace university = "Thompson Rivers University" if ThompsonRivers >0

gen UBC = strpos(affiliationinfo, "University of British Columbia")
replace university = "University of British Columbia" if UBC >0

gen UBC2 = strpos(affiliationinfo, "British Columbia Cancer")
replace university = "University of British Columbia" if UBC2 >0

gen UBC3 = strpos(affiliationinfo, "Victoria General Hospital")
replace university = "University of British Columbia" if UBC3 >0

gen UBC4 = strpos(affiliationinfo, "Vancouver General Hospital")
replace university = "University of British Columbia" if UBC4 >0

gen UBC5 = strpos(affiliationinfo, "B.C. Cancer")
replace university = "University of British Columbia" if UBC5 >0

gen UBC6 = strpos(affiliationinfo, "British Columbia Childrens Hospital")
replace university = "University of British Columbia" if UBC6 >0

gen Victoria = strpos(affiliationinfo, "University of Victoria")
replace university = "University of Victoria" if Victoria >0

***Note: need to fix this, there's a Fraser Valley Cancer Centre,
***University College of the Fraser Valley,
***Univeristy of the Fraser Valley
gen FraserValley = strpos(affiliationinfo, "Fraser Valley")
replace university = "University of the Fraser Valley" if FraserValley >0

gen NorthernBC = strpos(affiliationinfo, "Northern British Columbia")
replace university = "University of Northern British Columbia" if NorthernBC >0

gen Vancouver = strpos(affiliationinfo, "Vancouver Island")
replace university = "Vancouver Island University" if Vancouver >0

*Manitoba
gen Brandon = strpos(affiliationinfo, "Brandon University")
replace university = "Brandon University" if Brandon >0

gen UCNorth = strpos(affiliationinfo, "University College of the North")
replace university = "University College of the North" if UCNorth >0

gen Manitoba = strpos(affiliationinfo, "University of Manitoba")
replace university = "University of Manitoba" if Manitoba >0

gen Manitoba2 = strpos(affiliationinfo, "Winnipeg General Hospital")
replace university = "University of Manitoba" if Manitoba2 >0

gen Manitoba3 = strpos(affiliationinfo, "Freshwater Institute")
replace university = "University of Manitoba" if Manitoba3 >0

gen Manitoba4 = strpos(affiliationinfo, "St. Boniface General Hospital")
replace university = "University of Manitoba" if Manitoba4 >0

gen Manitoba5 = strpos(affiliationinfo, "Manitoba Institute of Cell Biology")
replace university = "University of Manitoba" if Manitoba5 >0

gen Manitoba6 = strpos(affiliationinfo, "Childrens Hospital, Winnipeg")
replace university = "University of Manitoba" if Manitoba6 >0

gen Winnipeg = strpos(affiliationinfo, "University of Winnipeg")
replace university = "University of Winnipeg" if Winnipeg >0

gen SaintBoniface = strpos(affiliationinfo, "de Saint-Boniface")
replace university = "Université de Saint-Boniface" if SaintBoniface >0

*New Brunswick
gen MountAllison = strpos(affiliationinfo, "Mount Allison")
replace university = "Mount Allison University" if MountAllison >0

gen Thomas = strpos(affiliationinfo, "Thomas University")
replace university = "St. Thomas University" if Thomas >0

gen UNB = strpos(affiliationinfo, "University of New Brunswick")
replace university = "University of New Brunswick" if UNB >0

gen Moncton = strpos(affiliationinfo, "de Moncton")
replace university = "Université de Moncton" if Moncton >0

*Newfoundland
gen Memorial = strpos(affiliationinfo, "Memorial University")
replace university = "Memorial University of Newfoundland" if Memorial >0

*Nova Scotia
gen Acadia = strpos(affiliationinfo, "Acadia University")
replace university = "Acadia University" if Acadia >0

gen CapeBreton = strpos(affiliationinfo, "Cape Breton University")
replace university = "Cape Breton University" if CapeBreton >0

gen Dalhousie = strpos(affiliationinfo, "Dalhousie University")
replace university = "Dalhousie University" if Dalhousie >0

gen Dalhousie2 = strpos(affiliationinfo, "Isaac W. Killam")
replace university = "Dalhousie University" if Dalhousie2 >0

gen King = strpos(affiliationinfo, "University of King")
replace university = "University of King's College" if King >0

gen Vincent = strpos(affiliationinfo, "Vincent University")
replace university = "Mount Saint Vincent University" if Vincent >0

gen NSCAD = strpos(affiliationinfo, "Nova Scotia College of Art and Design")
replace university = "NSCAD University" if NSCAD >0

gen FrancisXavier = strpos(affiliationinfo, "Francis Xavier")
replace university = "Saint Francis Xavier University" if FrancisXavier >0

gen Mary = strpos(affiliationinfo, "Saint Mary")
replace university = "Saint Mary's University" if Mary >0

***Note: need to fix, Sainte-Anne-de-Bellevue is a town
gen Anne = strpos(affiliationinfo, "Sainte-Anne")
replace university = "Université Sainte-Anne" if Anne >0

*Ontario
gen Algoma = strpos(affiliationinfo, "Algoma University")
replace university = "Algoma University" if Algoma >0

gen Brock = strpos(affiliationinfo, "Brock University")
replace university = "Brock University" if Brock >0

gen Carleton = strpos(affiliationinfo, "Carleton University")
replace university = "Carleton University" if Carleton >0

gen Dominican = strpos(affiliationinfo, "Dominican University")
replace university = "Dominican University College" if Dominican >0

gen Lakehead = strpos(affiliationinfo, "Lakehead University")
replace university = "Lakehead University" if Lakehead >0

gen Lakehead2 = strpos(affiliationinfo, "Thunder Bay Regional")
replace university = "Lakehead University" if Lakehead2 >0

gen Laurentian = strpos(affiliationinfo, "Laurentian University")
replace university = "Laurentian University" if Laurentian >0

gen McMaster = strpos(affiliationinfo, "McMaster University")
replace university = "McMaster University" if McMaster >0

gen McMaster2 = strpos(affiliationinfo, "Hamilton Civic Hospital")
replace university = "McMaster University" if McMaster2 >0

gen McMaster3 = strpos(affiliationinfo, "Hamilton General Hospital")
replace university = "McMaster University" if McMaster3 >0

gen Josephs = strpos(affiliationinfo, "St. Josephs Hospital")
replace university = "McMaster University" if Josephs >0

gen Nipissing = strpos(affiliationinfo, "Nipissing University")
replace university = "Nipissing University" if Nipissing >0

gen OCAD = strpos(affiliationinfo, "Ontario College of Art and Design")
replace university = "OCAD University" if OCAD >0

gen Queen = strpos(affiliationinfo, "Queens University")
replace university = "Queen's University" if Queen >0

gen Paul = strpos(affiliationinfo, "Saint Paul University")
replace university = "Saint Paul University" if Paul >0

gen RMCC = strpos(affiliationinfo, "Royal Military College")
replace university = "Royal Military College of Canada" if RMCC >0

gen Ryerson = strpos(affiliationinfo, "Ryerson University")
replace university = "Ryerson University" if Ryerson >0

gen Trent = strpos(affiliationinfo, "Trent University")
replace university = "Trent University" if Trent >0

gen Guelph1 = strpos(affiliationinfo, "University of Guelph")
replace university = "University of Guelph" if Guelph1 >0

gen Guelph2 = strpos(affiliationinfo, "Guelph University")
replace university = "University of Guelph" if Guelph2 >0

gen UOIT = strpos(affiliationinfo, "Ontario Institute of Technology")
replace university = "University of Ontario Institute of Technology" if UOIT >0

gen Ottawa = strpos(affiliationinfo, "University of Ottawa")
replace university = "University of Ottawa" if Ottawa >0

gen Ottawa2 = strpos(affiliationinfo, "Ottawa University")
replace university = "University of Ottawa" if Ottawa2 >0

gen Ottawa3 = strpos(affiliationinfo, "Ottawa Regional Cancer Centre")
replace university = "University of Ottawa" if Ottawa3 >0

gen Ottawa4 = strpos(affiliationinfo, "Ottawa Civic Hospital")
replace university = "University of Ottawa" if Ottawa4 >0

gen Toronto = strpos(affiliationinfo, "University of Toronto")
replace university = "University of Toronto" if Toronto >0

gen Toronto2 = strpos(affiliationinfo, "University Health Network")
replace university = "University of Toronto" if Toronto2 >0

gen Toronto3 = strpos(affiliationinfo, "Rotman Research Institute")
replace university = "University of Toronto" if Toronto3 >0

gen Toronto4 = strpos(affiliationinfo, "Hospital for Sick Children")
replace university = "University of Toronto" if Toronto4 >0

gen Toronto5 = strpos(affiliationinfo, "Clarke Institute of Psychiatry")
replace university = "University of Toronto" if Toronto5 >0

gen Toronto6 = strpos(affiliationinfo, "Toronto Hospital")
replace university = "University of Toronto" if Toronto6 >0

gen Toronto7 = strpos(affiliationinfo, "Toronto-Bayview Regional")
replace university = "University of Toronto" if Toronto7 >0

gen Toronto8 = strpos(affiliationinfo, "Mount Sinai Hospital")
replace university = "University of Toronto" if Toronto8 >0

gen Toronto9 = strpos(affiliationinfo, "Toronto General Hospital")
replace university = "University of Toronto" if Toronto9 >0

gen Toronto10 = strpos(affiliationinfo, "Sunnybrook Health Science")
replace university = "University of Toronto" if Toronto10 >0

gen Toronto11 = strpos(affiliationinfo, "Baycrest Centre")
replace university = "University of Toronto" if Toronto11 >0

gen Toronto12 = strpos(affiliationinfo, "Princess Margaret Hospital")
replace university = "University of Toronto" if Toronto12 >0

gen Toronto13 = strpos(affiliationinfo, "Toronto Western Hospital")
replace university = "University of Toronto" if Toronto13 >0

gen Toronto14 = strpos(affiliationinfo, "St. Michaels Hospital")
replace university = "University of Toronto" if Toronto14 >0

gen Huron = strpos(affiliationinfo, "Huron University")
replace university = "Huron University College" if Huron >0

gen Waterloo = strpos(affiliationinfo, "University of Waterloo")
replace university = "University of Waterloo" if Waterloo >0

gen Western = strpos(affiliationinfo, "Western Ontario")
replace university = "University of Western Ontario" if Western >0

gen Western2 = strpos(affiliationinfo, "Childrens Psychiatric Research Institute")
replace university = "University of Western Ontario" if Western2 >0

gen Western3 = strpos(affiliationinfo, "University Hospital, London")
replace university = "University of Western Ontario" if Western3 >0

gen Western4 = strpos(affiliationinfo, "University of Western, Ontario")
replace university = "University of Western Ontario" if Western4 >0

gen Western5 = strpos(affiliationinfo, "Lawson Research Institute")
replace university = "University of Western Ontario" if Western5 >0

gen Western6 = strpos(affiliationinfo, "London Health Sciences")
replace university = "University of Western Ontario" if Western6 >0

gen Western7 = strpos(affiliationinfo, "Victoria Hospital, London")
replace university = "University of Western Ontario" if Western7 >0

gen Windsor = strpos(affiliationinfo, "University of Windsor")
replace university = "University of Windsor" if Windsor >0

gen Laurier = strpos(affiliationinfo, "Wilfred Laurier")
replace university = "Wilfred Laurier University" if Laurier >0

gen Laurier2 = strpos(affiliationinfo, "Wilfrid Laurier")
replace university = "Wilfred Laurier University" if Laurier2 >0

gen York = strpos(affiliationinfo, "York University")
replace university = "York University" if York >0

*PEI
gen PEI = strpos(affiliationinfo, "University of Prince Edward")
replace university = "University of Prince Edward Island" if PEI >0

*Quebec
***French characters really tricky... need to be careful
gen Bishop = strpos(affiliationinfo, "Bishops University")
replace university = "Bishop's University" if Bishop >0

gen Concordia = strpos(affiliationinfo, "Concordia University")
replace university = "Concordia University" if Concordia >0

gen ETS = strpos(affiliationinfo, "cole de technologie")
replace university = "École de technologie supérieure" if ETS >0

gen ENDP = strpos(affiliationinfo, "administration publique")
replace university = "École nationale d'administration publique" if ENDP >0

gen EPM = strpos(affiliationinfo, "Polytechnique de Mont")
replace university = "École Polytechnique de Montréal" if EPM >0

gen EPM2 = strpos(affiliationinfo, "Ecole Polytechnique")
replace university = "École Polytechnique de Montréal" if EPM2 >0

gen HEC = strpos(affiliationinfo, "HEC Mont")
replace university = "HEC Montréal" if HEC >0

gen INRS = strpos(affiliationinfo, "recherche scientifique")
replace university = "Institut national de la recherche scientifique" if INRS >0

gen McGill = strpos(affiliationinfo, "McGill University")
replace university = "McGill University" if McGill >0

gen McGill2 = strpos(affiliationinfo, "Montreal General Hospital Research Institute")
replace university = "McGill University" if McGill2 >0

gen McGill3 = strpos(affiliationinfo, "Jewish General Hospital")
replace university = "McGill University" if McGill3 >0

gen McGill4 = strpos(affiliationinfo, "Royal Victoria Hospital")
replace university = "McGill University" if McGill4 >0

gen McGill5 = strpos(affiliationinfo, "Shriners Hospital")
replace university = "McGill University" if McGill5 >0

gen McGill6 = strpos(affiliationinfo, "UniversitÃ© McGill")
replace university = "McGill University" if McGill6 >0

gen McGill7 = strpos(affiliationinfo, "Montreal General Hospital")
replace university = "McGill University" if McGill7 >0

gen Montreal = strpos(affiliationinfo, "Universite de Montreal")
replace university = "Université de Montréal" if Montreal >0

gen Montreal2 = strpos(affiliationinfo, "Centre de recherche en sciences neurologiques")
replace university = "Université de Montréal" if Montreal2 >0

gen Montreal3 = strpos(affiliationinfo, "Notre-Dame Hospital")
replace university = "Université de Montréal" if Montreal3 >0

gen Montreal4 = strpos(affiliationinfo, "University of Montreal")
replace university = "Université de Montréal" if Montreal4 >0

gen Montreal5 = strpos(affiliationinfo, "UniversitÃ© de MontrÃ©al")
replace university = "Université de Montréal" if Montreal5 >0

gen Montreal6 = strpos(affiliationinfo, "HÃ´pital Notre-Dame")
replace university = "Université de Montréal" if Montreal6 >0

gen Montreal7 = strpos(affiliationinfo, "HÃ´tel-Dieu de MontrÃ©al")
replace university = "Université de Montréal" if Montreal7 >0

gen Montreal8 = strpos(affiliationinfo, "Maisonneuve-Rosemont Hospital")
replace university = "Université de Montréal" if Montreal8 >0

gen Montreal9 = strpos(affiliationinfo, "Institut de Cardiologie de MontrÃ©al")
replace university = "Université de Montréal" if Montreal9 >0

gen Montreal10 = strpos(affiliationinfo, "Montreal Heart Institute")
replace university = "Université de Montréal" if Montreal10 >0

gen Montreal11 = strpos(affiliationinfo, "Institut de Recherches Cliniques de MontrÃ©al")
replace university = "Université de Montréal" if Montreal11 >0

gen Montreal12 = strpos(affiliationinfo, "hÃ´pital du SacrÃ©-Coeur de MontrÃ©al")
replace university = "Université de Montréal" if Montreal12 >0

gen Montreal13 = strpos(affiliationinfo, "Institut du cancer de MontrÃ©al")
replace university = "Université de Montréal" if Montreal13 >0

gen Montreal14 = strpos(affiliationinfo, "Sainte-Justine")
replace university = "Université de Montréal" if Montreal14 >0

gen Montreal15 = strpos(affiliationinfo, "Hospital St. Justine")
replace university = "Université de Montréal" if Montreal15 >0

gen Montreal16 = strpos(affiliationinfo, "Sainte-Justice")
replace university = "Université de Montréal" if Montreal16 >0

gen IRCM = strpos(affiliationinfo, "Clinical Research Institute of Montreal")
replace university = "Université de Montréal" if IRCM >0

gen Sherbrooke = strpos(affiliationinfo, "de Sherbrooke")
replace university = "Université de Sherbrooke" if Sherbrooke >0

gen Sherbrooke2 = strpos(affiliationinfo, "University of Sherbrooke")
replace university = "Université de Sherbrooke" if Sherbrooke2 >0

gen Sherbrooke3 = strpos(affiliationinfo, "Centre Hospitalier Universitaire")
replace university = "Université de Sherbrooke" if Sherbrooke3 >0

gen UQ = strpos(affiliationinfo, "UniversitÃ© du QuÃ©bec")
replace university = "Université du Québec" if UQ >0

gen UQAT = strpos(affiliationinfo, "en Abitibi")
replace university = "Université du Québec en Abitibi-Témiscamingue" if UQAT >0

gen UQO = strpos(affiliationinfo, "en Outaouais")
replace university = "Université du Québec en Outaouais" if UQO >0

*Note: includes complexe hospitalier de la sagamie... not affiliated
gen UQAC = strpos(affiliationinfo, "Chicoutimi")
replace university = "Université du Québec à Chicoutimi" if UQAC >0

gen UQAM = strpos(affiliationinfo, "Universite du Quebec a Montreal")
replace university = "Université du Québec à Montréal" if UQAM >0

gen UQAM2 = strpos(affiliationinfo, "UniversitÃ© du QuÃ©bec Ã  MontrÃ©al")
replace university = "Université du Québec à Montréal" if UQAM2 >0

gen UQAR = strpos(affiliationinfo, "Rimouski")
replace university = "Université du Québec à Rimouski" if UQAR >0

gen UQTR = strpos(affiliationinfo, "Trois-Riv")
replace university = "Université du Québec à Trois-Rivières " if UQAR >0

gen Laval = strpos(affiliationinfo, "Universite Laval")
replace university = "Université Laval" if Laval >0

gen Laval2 = strpos(affiliationinfo, "Laval University")
replace university = "Université Laval" if Laval2 >0

gen Laval3 = strpos(affiliationinfo, "St-FranÃ§ois dAssise")
replace university = "Université Laval" if Laval3 >0

gen Laval4 = strpos(affiliationinfo, "UniversitÃ© Laval")
replace university = "Université Laval" if Laval4 >0

gen Laval5 = strpos(affiliationinfo, "University Laval")
replace university = "Université Laval" if Laval5 >0

*Saskatchewan
gen FNUC = strpos(affiliationinfo, "First Nations University")
replace university = "First Nations University of Canada" if FNUC >0

gen Regina = strpos(affiliationinfo, "University of Regina")
replace university = "University of Regina" if Regina >0

gen Saskatchewan = strpos(affiliationinfo, "University of Saskatchewan")
replace university = "University of Saskatchewan" if Saskatchewan >0

gen Saskatchewan2 = strpos(affiliationinfo, "Veterinary Infectious Disease Org")
replace university = "University of Saskatchewan" if Saskatchewan2 >0


**Now onto the private universities

gen Fairleigh = strpos(affiliationinfo, "Fairleigh Dickinson")
replace university = "Fairleigh Dickinson University" if Fairleigh >0

gen NYIT = strpos(affiliationinfo, "New York Institute")
replace university = "New York Institute of Technology" if NYIT >0

gen Quest = strpos(affiliationinfo, "Quest University")
replace university = "Quest University" if Quest >0

gen Trinity = strpos(affiliationinfo, "Trinity Western")
replace university = "Trinity Western University" if Trinity >0

gen UCW = strpos(affiliationinfo, "University Canada West")
replace university = "University Canada West" if UCW >0

gen Booth = strpos(affiliationinfo, "Booth University")
replace university = "Booth University College" if Booth >0

gen Mennonite = strpos(affiliationinfo, "Mennonite")
replace university = "Canadian Mennonite University" if Mennonite >0

gen Kingswood = strpos(affiliationinfo, "Kingswood University")
replace university = "Kingswood University" if Kingswood >0

gen Crandall = strpos(affiliationinfo, "Crandall University")
replace university = "Crandall University" if Crandall >0

gen Stephen = strpos(affiliationinfo, "Stephens University")
replace university = "St. Stephen's University" if Stephen >0

gen Fredericton = strpos(affiliationinfo, "University of Fredericton")
replace university = "University of Fredericton" if Fredericton >0

gen AST = strpos(affiliationinfo, "Atlantic School")
replace university = "Atlantic School of Theology" if AST >0

gen Tyndale = strpos(affiliationinfo, "Tyndale University")
replace university = "Tyndale University College" if Tyndale >0

gen Redeemer = strpos(affiliationinfo, "Redeemer University")
replace university = "Redeemer University College" if Redeemer >0

gen TheKing = strpos(affiliationinfo, "The Kings University")
replace university = "The King's University" if TheKing >0

*Colleges
gen College = strpos(affiliationinfo, "Seneca College")
replace university = "College" if College >0

*Government Organizations
gen Government = strpos(affiliationinfo, "Health and Welfare")
replace university = "Government" if Government >0

gen Government2 = strpos(affiliationinfo, "Agriculture Canada")
replace university = "Government" if Government2 >0

gen Government3 = strpos(affiliationinfo, "National Research Council")
replace university = "Government" if Government3 >0

gen Government4 = strpos(affiliationinfo, "Defence Research Establishment")
replace university = "Government" if Government4 >0

gen Government5 = strpos(affiliationinfo, "Health & Welfare")
replace university = "Government" if Government5 >0

gen Government6 = strpos(affiliationinfo, "Laboratory Centre for Disease Control")
replace university = "Government" if Government6 >0

gen Government7 = strpos(affiliationinfo, "Statistics Canada")
replace university = "Government" if Government7 >0

gen Government8 = strpos(affiliationinfo, "Forensic Laboratory")
replace university = "Government" if Government8 >0

gen Government9 = strpos(affiliationinfo, "Food Research Centre")
replace university = "Government" if Government9 >0

gen Government10 = strpos(affiliationinfo, "Bureau of Drug Research")
replace university = "Government" if Government10 >0

gen Government11 = strpos(affiliationinfo, "Superior Court")
replace university = "Government" if Government11 >0

gen Government12 = strpos(affiliationinfo, "National Cancer Institute")
replace university = "Government" if Government12 >0

gen Government13 = strpos(affiliationinfo, "Island Medical Laboratories")
replace university = "Government" if Government13 >0


tab university
* We only have about 74% of the dataset filled in... need to improve.
** Now we have 79% of observations
*** 84%
**** 86% latest update

/*
                             university |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                      Acadia University |        310        0.06        0.06
                      Algoma University |         37        0.01        0.07
                   Athabasca University |        133        0.03        0.09
            Atlantic School of Theology |          2        0.00        0.09
                    Bishop's University |        120        0.02        0.12
               Booth University College |          1        0.00        0.12
                     Brandon University |        139        0.03        0.14
                       Brock University |      1,620        0.31        0.46
          Canadian Mennonite University |          8        0.00        0.46
                 Cape Breton University |         89        0.02        0.47
                    Capilano University |          2        0.00        0.48
                    Carleton University |      2,862        0.55        1.03
                                College |         13        0.00        1.03
                   Concordia University |      2,544        0.49        1.52
                    Crandall University |          6        0.00        1.52
                   Dalhousie University |     13,329        2.57        4.10
           Dominican University College |          1        0.00        4.10
Emily Carr University of Art and Design |          1        0.00        4.10
         Fairleigh Dickinson University |          3        0.00        4.10
     First Nations University of Canada |          6        0.00        4.10
                             Government |     10,329        1.99        6.09
                           HEC Montréal |         47        0.01        6.10
               Huron University College |          5        0.00        6.10
Institut national de la recherche sci.. |        101        0.02        6.12
        Kwantlen Polytechnic University |         36        0.01        6.13
                    Lakehead University |        889        0.17        6.30
                  Laurentian University |      1,251        0.24        6.54
                     MacEwan University |         72        0.01        6.56
                      McGill University |     47,609        9.19       15.75
                    McMaster University |     25,385        4.90       20.65
    Memorial University of Newfoundland |      4,529        0.87       21.52
               Mount Allison University |        319        0.06       21.59
                 Mount Royal University |        114        0.02       21.61
         Mount Saint Vincent University |        170        0.03       21.64
       New York Institute of Technology |          5        0.00       21.64
                   Nipissing University |        129        0.02       21.67
                        OCAD University |          2        0.00       21.67
                     Queen's University |     12,639        2.44       24.11
                       Quest University |         11        0.00       24.11
            Redeemer University College |         27        0.01       24.12
       Royal Military College of Canada |        243        0.05       24.16
                 Royal Roads University |         33        0.01       24.17
                     Ryerson University |      1,135        0.22       24.39
        Saint Francis Xavier University |        361        0.07       24.46
                Saint Mary's University |        345        0.07       24.52
                  Saint Paul University |         30        0.01       24.53
                Simon Fraser University |      5,169        1.00       25.53
                  St. Thomas University |         24        0.00       25.53
                  The King's University |         11        0.00       25.53
             Thompson Rivers University |        111        0.02       25.56
                       Trent University |        948        0.18       25.74
             Trinity Western University |        151        0.03       25.77
             Tyndale University College |          1        0.00       25.77
                 University Canada West |          4        0.00       25.77
                  University of Alberta |     33,932        6.55       32.32
         University of British Columbia |     47,236        9.12       41.44
                  University of Calgary |     24,159        4.66       46.11
              University of Fredericton |          1        0.00       46.11
                   University of Guelph |     11,894        2.30       48.40
           University of King's College |          5        0.00       48.40
               University of Lethbridge |      1,582        0.31       48.71
                 University of Manitoba |     16,040        3.10       51.81
            University of New Brunswick |      1,521        0.29       52.10
University of Northern British Columbia |        434        0.08       52.18
University of Ontario Institute of Te.. |        311        0.06       52.24
                   University of Ottawa |     18,770        3.62       55.87
     University of Prince Edward Island |      1,181        0.23       56.10
                   University of Regina |      1,037        0.20       56.30
             University of Saskatchewan |     12,394        2.39       58.69
                  University of Toronto |    105,520       20.37       79.06
                 University of Victoria |      4,426        0.85       79.92
                 University of Waterloo |      9,220        1.78       81.70
          University of Western Ontario |     21,984        4.24       85.94
                  University of Windsor |      1,958        0.38       86.32
                 University of Winnipeg |        406        0.08       86.40
        University of the Fraser Valley |        108        0.02       86.42
                       Université Laval |     17,119        3.31       89.73
                 Université Sainte-Anne |         76        0.01       89.74
                  Université de Moncton |        346        0.07       89.81
                 Université de Montréal |     30,503        5.89       95.70
           Université de Saint-Boniface |         16        0.00       95.70
               Université de Sherbrooke |      8,180        1.58       97.28
                   Université du Québec |      2,101        0.41       97.69
Université du Québec en Abitibi-Témis.. |         73        0.01       97.70
      Université du Québec en Outaouais |        160        0.03       97.73
      Université du Québec à Chicoutimi |        427        0.08       97.81
        Université du Québec à Montréal |      2,302        0.44       98.26
 Université du Québec à Trois-Rivières  |        402        0.08       98.34
            Vancouver Island University |        355        0.07       98.40
             Wilfred Laurier University |      1,157        0.22       98.63
                        York University |      5,923        1.14       99.77
        École Polytechnique de Montréal |      1,097        0.21       99.98
        École de technologie supérieure |         81        0.02      100.00
École nationale d'administration publ.. |          7        0.00      100.00
----------------------------------------+-----------------------------------
                                  Total |    517,905      100.00
*/


compress

save "D:\SSHRC\Datasets\SSHRC_Data02_Universities", replace


log close
