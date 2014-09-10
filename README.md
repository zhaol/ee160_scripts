# Scripts to Support EE160

## Notes
To bootstrap a workspace:

    curl https://raw.githubusercontent.com/zhaol/ee160_scripts/master/bootstrap.rb | ruby
    
To run a self test:

    (while in grader/test/02_1/Li, Zhao(zhaol) folder)
    rm zhaol_02_1.report
    ruby ../../../../grade check 02_1 zhaol
    cat zhaol_02_1.report