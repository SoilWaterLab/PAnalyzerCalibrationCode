# PAnalyzerCalibrationCode#

This repository contains a sample P Analyzer output file, file organization, and R code data generated on the O.I. Analytical FS3000 P Analyzer in the Soil & Water Lab.  More information on the P Analyzer can be found at http://soilandwater.bee.cornell.edu/tools.htm. 

# Contact Information #
Author: Sheila Saia
Email: sms493@cornelle.edu
Updated: September 28, 2015

# Repository File Descriptions #

**Pdata_test.xlsx Excel File**
This file contains several tabs that correspond to the various text files that will be needed to run the R script.  The 'raw data' tab includes the data output directly from the P Analyzer.  The 'edit data' tab includes data from the 'raw data' tab but all the blanks in between used for flushing/cleaning the system and adjusting the baseline have been removed.  The 'edit data' tab will be split up for the remaining tabs of the Excel document including: the 'calibration', 'checks', 'di', 'blanks', and 'data' tabs.  The 'calibration' tab includes the data from the 'edit data' tab corresponding to the first 6 cups of the P Analyzer (i.e. the standard curve).  The 'checks' tab includes the standards that are rerun as samples at the end of the sequence.  This is just to check that that machine hasn't drifted.  The 'di' tab includes the distilled water (DI) blanks run at the start of the sequences as well as any filtered DI samples.  This is a simple method blank to ensure that no P has been added to the samples during filtering.  If necessary, additional method blanks may be added in the 'blanks' tab.  The 'data' tab includes all samples that are not part of the 'calibration', 'checks', 'di', or 'blanks' tabs.  Finally the 'new data' tab is obtained by copying the output from R back into the Excel file and is not necessary unless the user wishes to do so.  For this example, it just helps to see what the results should be if the user were to run the entire script as was downloaded.

**Various Text Files**
The repository contains various text files that are needed to run the R code.  They include: 'ptestBlanks.txt', 'ptestCalib.txt', 'ptestCheck.txt', 'ptestData.txt', ptestDI.txt', and ptestNewData.txt'.  For descriptions of these please see the description above concerning the Excel file.  These files should be stored in the directory that the R code is set to (i.e. directory defined with the setwd() command).

**P-calibration-code.R**
This code allows you to run the sample P Analyzer text files included in this repository but can be modified for importing P Analyzer outputs for calibration using R.  The various text files mentioned above must be included in the working directory of R to run this program.  Notice that the working directory name must be modified for the user's computer.  

# Changes to the Code & Licensing #
Please contact Sheila Saia at sms493@cornell.edu if you find any errors or have any issues using the code to run the example P Analyzer input data.  There's no specific license associated with this script.