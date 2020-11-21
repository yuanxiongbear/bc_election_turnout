# BC Election Turnout project
### author: 

## Introduction

In the past 2020 US election, it was reported that the voter turnout rate is substantially higher in battleground states than spectator states [1]. We are interested to know if a similar pattern was also observed in provincial election of British Columbia in the past few years. Therefore, in this data analysis project, we work on publicly available data sets to answer the following inferential question:

    Is a closer election correlated with the higher turnout?. In other word, do we have a higher turnout in a tight elections?

The data we are using are two publicaly available data sets from BC government provincial voter participation and provincial voting results. See the term of use of Elections BC's data here: https://elections.bc.ca/docs/EBC-Open-Data-Licence.pdf. The data provides us voting results from 2005 - 2017 for different Electoral District (ED). This data set gives us the opportunity to investigate the relation between the difference in votes between the winner and the runner up and the turn out at different Electoral District for several years.

To answer our research question, we investigate the relationship between the following two parameters: voter turnout rate and competitiveness. Voter turnout rate is calculated as number of votes divided by number of registered voters per ED per election event. Competitiveness is calculated as difference in share of the votes between winner and runner-up per ED per election event. Then we will use a Pearson correlation test via cor.test() in R to investigate the correlation between these two parameters. The Null hypothsize would be the correlation coefficient is equal to zero between the turnout rate and compatibility. The alternative hypothesis would be the corrrelation coefficient is not equal to zero between turnout rate and compatibility. It will be a two sided test. And we will decide if we can reject null hypothesis or not based on calculated p-value. 

The exploratory data analysis (EDA) is completed and uploaed into the repo. (UBC-MDS/bc_election_turnout/eda/) In the EDA table, we have merged, cleaned and wrangled the datas into a table that contains following columns: event_name, ed_name, votes (turn out rate), competitiveness and candidates. For analysis, we plot our dependent variable: votes based on events_name (we have election data for year 2005, 2009, 2013, and 2017) using violin plot. And we also plot votes against competitiveness in a scattor plots with a trend line. The analysis shows that competitiveness is positively correlated to the turnout rates, which is the same as what we expected. More analysis will be done to complete the project. 

## Reference
1. https://www.nationalpopularvote.com/voter-turnout-substantially-higher-battleground-states-spectator-states




