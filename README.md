# Scripts to Support EE160

## Notes
To bootstrap a workspace:

    curl https://raw.githubusercontent.com/zhaol/ee160_scripts/master/bootstrap.rb | ruby
    
For students, to use:

    (while in 02_1 - e.g. the folder where your assignment files are in)
    ruby ~/ee160_scripts/grade check ASSIGNMENT UH_USERNAME
  example
    ruby ~/ee160_scripts/grade check 02_1 zhaol
    
For graders, to use:

    (while in 02_1 - e.g. parent folder of Laulima zip download)
    ruby ~/ee160_scripts/graders score_class ASSIGNMENT
  example
    ruby ~/ee160_scripts/graders score_class 02_1
    
For developing, to run a self test:

    (while in grader/test/02_1/Li, Zhao(zhaol) folder)
    rm zhaol_02_1.report
    ruby ../../../../grade check 02_1 zhaol
    cat zhaol_02_1.report