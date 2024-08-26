-- dashboard 2
use bankloan;

-- monthly trend by issue date

SELECT
	MONTH(issue_date) as month_number,
    MONTHNAME(issue_date) AS month_name,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- January	2332	25031650	27578836
-- February	2279	24647825	27717745
-- March	2627	28875700	32264400
-- April	2755	29800800	32495533
-- May  	2911	31738350	33750523
-- June 	3184	34161475	36164533
-- July 	3366	35813900	38827220
-- August	3441	38149600	42682218
-- September3536	40907725	43983948
-- October	3796	44893800	49399567
-- November	4035	47754825	50132030
-- December	4314	53981425	58074380

-- regional analysis by state

SELECT
	address_state,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY address_state
ORDER BY address_state;

/*
AK	78	1031800	1108570
AL	432	4949225	5492272
AR	236	2529700	2777875
AZ	833	9206000	10041986
CA	6894 78484125	83901234
CO	770	8976000	9845810
CT	730	8435575	9357612
DC	214	2652350	2921854
DE	110	1138100	1269136
FL	2773	30046125	31601905
GA	1355	15480325	16728040
HI	170	1850525	2080184
IA	5	56450	64482
ID	6	59750	65329
IL	1486	17124225	18875941
IN	9	86225	85521
KS	260	2872325	3247394
KY	320	3504100	3792530
LA	426	4498900	5001160
MA	1310	15051000	16676279
MD	1027	11911400	12985170
ME	3	9200	10808
MI	685	7829900	8543660
MN	592	6302600	6750746
MO	660	7151175	7692732
MS	19	139125	149342
MT	79	829525	892047
NC	759	8787575	9534813
NE	5	31700	24542
NH	161	1917900	2101386
NJ	1822	21657475	23425159
NM	183	1916775	2084485
NV	482	5307375	5451443
NY	3701	42077050	46108181
OH	1188	12991375	14330148
OK	293	3365725	3712649
OR	436	4720150	4966903
PA	1482	15826525	17462908
RI	196	1883025	2001774
SC	464	5080475	5462458
SD	63	606150	656514
TN	17	162175	141522
TX	2664	31236650	34392715
UT	252	2849225	2952412
VA	1375	15982650	17711443
VT	54	504100	534973
WA	805	8855525	9531739
WI	446	5070450	5485161
WV	167	1830525	1991936
WY	79	890750	1046050
*/
-- loan term analysis

SELECT
	term,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY term
ORDER BY term;

/*
 36 months	28237	273041225	294709458
 60 months	10339	162715850	178361475
 */
 
 -- employee length analysis
 
 SELECT
	emp_length,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY emp_length
ORDER BY emp_length;

/*
< 1 year	4575	44210625	47545011
1 year	3229	32883125	35498348
10+ years	8870	116115950	125871616
2 years	4382	44967975	49206961
3 years	4088	43937850	47551832
4 years	3428	37600375	40964850
5 years	3273	36973625	40397571
6 years	2228	25612650	27908658
7 years	1772	20811725	22584136
8 years	1476	17558950	19025777
9 years	1255	15084225	16516173
*/

-- loan purpose breakdown

 SELECT
	purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY purpose
ORDER BY purpose;

/*
car         	        1497	10223575	11324914
credit card         	4998	58885175	65214084
Debt consolidation   	18214	232459675	253801871
educational         	315	     2161650	2248380
home improvement     	2876	33350775	36380930
house 					366		4824925		5185538
major purchase			2110	17251600	18676927
medical					667		5533225		5851372
moving					559		3748125		3999899
other					3824	31155750	33289676
renewable_energy		94		845750		898931
small business			1776	24123100	23814817
vacation				352		1967950		2116738
wedding					928		9225800		10266856

*/
-- Home ownership analysis

SELECT
	home_ownership,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM financial_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;

/*
MORTGAGE	17198	219329150	238474438
NONE	    3		16800		19053
OTHER		98		1044975		1025257
OWN			2838	29597675	31729129
RENT		18439	185768475	201823056

 */
 
 

