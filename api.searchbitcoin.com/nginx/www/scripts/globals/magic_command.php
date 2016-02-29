<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-05-22
 * Email: jostmey@gmail.com
 * Purpose: Global variable contains the command for determining the file type of an image.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

return 'echo $(/usr/bin/file -ib %f) | /usr/bin/cut -d/ -f2 | /usr/bin/cut -d";" -f1';

