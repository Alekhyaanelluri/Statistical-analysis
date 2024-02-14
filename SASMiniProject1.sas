
/*Author: Alekhyaa Nelluri/                                                                             ;
/*Collaborators: Uttej Kumar Tentu /                                                                       ;
/*Program Purpose: Mini Project 1   ;
/*Date: February 5 2024      
/* Create a permanent library */
libname mylib '/home/u63751954';

/* Import the StudentData Excel dataset */
proc import datafile='/home/u63751954/ST513P1.xlsx'
     out=mylib.StudentData
     dbms=xlsx replace;
     sheet='Sheet1'; /* Specifying the sheet name where data is located */
run;

/* Explore the dataset */
proc contents data=mylib.StudentData;
run;


/* Save the dataset to the permanent library */
data mylib.StudentData;
   set mylib.StudentData;
run;

/* Explore the unique values of Mjob and Fjob */
proc freq data=mylib.StudentData;
  tables Mjob Fjob;
run;

/* Summarize test scores based on Mjob and Fjob */
proc means data=mylib.StudentData mean std min max;
  class Mjob Fjob;
  var G1; 
run;


/* Create bar plots for Mjob */
proc sgplot data=mylib.StudentData;
  vbar Mjob / response=G1 stat=mean;
  title 'bar plot: Mean Math Scores by Mother''s Job';
  xaxis discreteorder=data;
run;

/* Create bar plots for Fjob */
proc sgplot data=mylib.StudentData;
  vbar Fjob / response=G1 stat=mean;
  title 'Bar plot: Mean Math Scores by Father''s Job';
  xaxis discreteorder=data;
run;

/* Create scatter plot for G1 vs Internet */
proc sgplot data=mylib.StudentData;
  scatter x=internet y=G1;
  title 'Scatter Plot: Internet vs G1';
run;

/* Create scatter plot for G2 vs Internet */
proc sgplot data=mylib.StudentData;
  scatter x=internet y=G2;
  title 'Scatter Plot: Internet vs G2';
run;

/* Create scatter plot for G3 vs Internet */
proc sgplot data=mylib.StudentData;
  scatter x=internet y=G3;
  title 'Scatter Plot: Internet vs G3';
run;

/* Create bar plots for Fjob */
proc sgplot data=mylib.StudentData;
  vbar age / response=G1 stat=mean;
  title 'Bar plot: Age vs Mathscore';
  xaxis discreteorder=data;
  run;
  

/* Create scatter plot for relationship between school and G1 */
proc sgplot data=mylib.StudentData;
  scatter x=school y=G1;
  title 'Scatter Plot: Relationship between School and G1';
run;

/* Create scatter plot for relationship between school and G2 */
proc sgplot data=mylib.StudentData;
  scatter x=school y=G2;
  title 'Scatter Plot: Relationship between School and G2';
run;

/* Create scatter plot for relationship between school and G3 */
proc sgplot data=mylib.StudentData;
  scatter x=school y=G3;
  title 'Scatter Plot: Relationship between School and G3';
run;



/* Assuming 'school' is the categorical variable and 'G1', 'G2', 'G3' are the numeric variables */

/* Create bar plot for G1 by school */
proc sgplot data=mylib.StudentData;
  vbar school / response=G1 stat=mean;
  title 'Mean G1 Scores by School';
  xaxis discreteorder=data;
run;

/* Create bar plot for G2 by school */
proc sgplot data=mylib.StudentData;
  vbar school / response=G2 stat=mean;
  title 'Mean G2 Scores by School';
  xaxis discreteorder=data;
run;

/* Create bar plot for G3 by school */
proc sgplot data=mylib.StudentData;
  vbar school / response=G3 stat=mean;
  title 'Mean G3 Scores by School';
  xaxis discreteorder=data;
run;




/* Assuming 'reason' is a categorical variable and 'G1', 'G2', 'G3' are numerical variables */

/* Create scatter plot for G1 vs Reason */
proc sgplot data=mylib.StudentData;
  scatter x=reason y=G1 / markerattrs=(symbol=circlefilled);
  title 'Scatter Plot of G1 Scores by Reason';
  xaxis discreteorder=data;
run;

/* Create scatter plot for G2 vs Reason */
proc sgplot data=mylib.StudentData;
  scatter x=reason y=G2 / markerattrs=(symbol=circlefilled);
  title 'Scatter Plot of G2 Scores by Reason';
  xaxis discreteorder=data;
run;

/* Create scatter plot for G3 vs Reason */
proc sgplot data=mylib.StudentData;
  scatter x=reason y=G3 / markerattrs=(symbol=circlefilled);
  title 'Scatter Plot of G3 Scores by Reason';
  xaxis discreteorder=data;
run;