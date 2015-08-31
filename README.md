# Scripts to Support EE160

## Bootstrapping
To bootstrap a workspace:

    curl https://raw.githubusercontent.com/zhaol/ee160_scripts/master/bootstrap.rb | ruby
    
## Self-grading
To self-check:
  (while in 02_1 - e.g. the folder where your assignment files are in)
  
    ruby ~/ee160_scripts/grade check ASSIGNMENT UH_USERNAME
  example
  
    ruby ~/ee160_scripts/grade check 02_1 zhaol
    
## Grading
To grade entire class (or section):
  (while in 02_1 - e.g. parent folder of Laulima zip download)
  
    ruby ~/ee160_scripts/grade score_class ASSIGNMENT
  example
  
    ruby ~/ee160_scripts/grade score_class 02_1
    
To compile entire class (or section):
  (while in 02_1 - e.g. parent folder of Laulima zip download)  
  
    ruby ~/ee160_scripts/grade compile_class ASSIGNMENT
  example
  
    ruby ~/ee160_scripts/grade compile_class 02_1

To remove all *.report files (so the report file does not contain output from the previous checking):
  (while in 02_1 - e.g. parent folder of Laulima zip download)  
  
    find . -name "*.report" -type f -delete
  It is safer to see which files will be deleted first prior to actually deleting the files:
  
    find . -name "*.report" -type f
    
To consolidate student reports into master class report:
  (while in 02_1 - e.g. parent folder of Laulima zip download)  
  
    ruby ~/ee160_scripts/grade consolidate_reports ASSIGNMENT
  example
  
    ruby ~/ee160_scripts/grade consolidate_reports 02_1
    
## Developing
To run a self test:
  (while in grader/test/02_1/Li, Zhao(zhaol) folder)
  
    rm zhaol_02_1.report
    ruby ../../../../grade check 02_1 zhaol
    cat zhaol_02_1.report
    
A suggested workflow:

    git checkout master
    git fetch origin
    git rebase origin/master # bring your local master branch up to date; similar to git pull origin master but safer
    git checkout -b feature/02_1
      * modify source code
        1. git add .
        2. git commit -m 'adding blah blah'
        3. repeat
    git checkout master
    git fetch origin
    git rebase origin/master
    git merge feature/02_1 --no-ff
    git push origin master
    
Regular Expression (regex, regexp) References:

[Regex Tutorial](http://regexone.com)

[Regex Testing](http://rubular.com)
