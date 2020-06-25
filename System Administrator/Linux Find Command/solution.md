#### Linux Find Command

Use this command to copy all .css files to /blog directroy,

    find /var/www/html/blog -name '*.css' -exec cp --parents \{\} /blog \;

NOTE: This solution is not correct. Kindly, try modifying it. Thanks.
