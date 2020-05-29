### Linux User Expiry

SSH to app server 2 and create a user, kareem

    root@stapp02 steve]# useradd -e 2021-03-28 kareem

Next, verify the age of account and password with `chage` command for user ‘kareem‘ after setting account expiry date.

    [root@stapp02 steve]# chage -l kareem
    Last password change                                    : May 04, 2020
    Password expires                                        : never
    Password inactive                                       : never
    Account expires                                         : `Mar 28, 2021`
    Minimum number of days between password change          : 0
    Maximum number of days between password change          : 99999
    Number of days of warning before password expires       : 7
