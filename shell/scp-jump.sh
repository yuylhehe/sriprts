#!/usr/bin/expect
set host root@[lindex $argv 2]
spawn scp -o "ProxyJump username@ip" \
 -r [lindex $argv 1] \
 ${host}:path
set timeout 60
set otp [lindex $argv 0]
# Two Factor Authentication
expect "*OTP" {send $otp\n}
interact
