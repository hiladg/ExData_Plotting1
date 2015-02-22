This file was created by hiladg, a coursera student, and it accomponies the runAnalysis.R file which was created with it.
Some assumptions which I have made while writing the runAnalysis.R:
1. You've extracted the files and the folder tree to your working directory. The format of "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"
should be OK to refer to a specific file.
2. I've used basically only the full X_ (test, train) data, as it is complete enough, and also because it was the only way in which I could actually add the subject and the activity. It was also recommeded on the forums
3. In order to find out which col names are actually the ones that are needed, I used the "grep" function. You can read about it here:	stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html
4. The labeling of the data set I understood to be no more than simply labeling the activity, and that's what I've done. I also changed the column names to be meaningful using the "features.txt" file (otherwise you wouldn't be able to understand any of it)
5. The independent data set is maybe not in the best format, but that's what I have and I didn't want to change any of it.
I didn't diffrentiate between "test" data and "Train" data as they claim there is no actualy difference between the two data sets(they were allocated randomly)
6. I tried my best to give as many comments in the code as possible. I hope the code is clear and concise!