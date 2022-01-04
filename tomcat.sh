#!/bin/bash
# AUthor : Shivam Mishra
#date   : 15/12/2020
#lastupdate: 15/12/2020
#this script is for  checking and restarting  tomcat status server and send them to slackchannel by a  bot using json format


service tomcat status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        tomcatstatf=$(service tomcat status)
        curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$tomcatstatf"'"}' https://hooks.slack.com/services/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



        curl -X POST -H 'Content-type: application/json' --data '{"text":"----restarting tomcat service----"}' https://hooks.slack.com/services/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
        sleep 15s
        sudo service tomcat restart > /dev/null
        sleep 15s
        tomcatstatf=$(service tomcat status)

        curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$tomcatstatf"'"}' https://hooks.slack.com/services/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
        
        

fi