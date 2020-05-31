<VirtualHost *:80>

  <?php
    $ip_static = getenv('HTTP_STATIC');
    $ip_dynamique = getenv('HTTP_DYNAMIQUE');
  ?>

  ServerName sacha.site.com

  # dynamic host
  ProxyPass "/persons/" "http://<?php print $ip_dynamique ?>/"
  ProxyPassReverse "/persons/" "http://<?php print $ip_dynamique ?>/"

  # static host
  ProxyPass "/" "http://<?php print $ip_static ?>/"
  ProxyPassReverse "/" "http://<?php print $ip_static ?>/"

</VirtualHost>
