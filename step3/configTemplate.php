<?php
    $ipS = getenv('STATIC_APP');
    $ipD = getenv('DYNAMIC_APP');
?>
<VirtualHost *:80>

  ServerName sacha.site.com

  # dynamic host
  ProxyPass '/persons/' '<?php print "$ipD"?>'
  ProxyPassReverse '/persons/' '<?php print "$ipD"?>'

  # static host
  ProxyPass '/' '<?php print "$ipS"?>'
  ProxyPassReverse '/' '<?php print "$ipS"?>'

</VirtualHost>
