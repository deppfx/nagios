#! /usr/bin/env bash

while read -r a b ; do 
cat >> /tmp/miss << EOF
define host {
        host_name                       $b
        alias                           $b
        address                         $a
        use                             linux-server
        max_check_attempts              3
        check_period                    24x7
        contacts                        null
        notification_interval           3
        notification_period             24x7
        register                        1
}
EOF
done </tmp/hostmiss

##### /tmp/hostmiss contents should be in the format ####
#10.1.29.42 webserver1
#10.1.29.57 webserver2
