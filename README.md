## Description

![alt text](screenshot.png "Screenshot of homepage.")

Web service for finding items that can be bought using Bitcoins. A Web crawler updates a sequel database with items it finds for sale. Old items are removed as they are taken offline. The database can easily be searched using a text query submitted. All querires are handled by a simple API. The homepage shows a running view of newly found items. 

## Download

* Download: [zip](https://github.com/jostmey/SearchBitcoin/zipball/master)
* Git: `git clone https://github.com/jostmey/SearchBitcoin`

## Setup

The frontend server can be found in the folder `searchbitcoin.com/`. Apache is used as the HTTP webserver, and the necessary files to configure the Apache server may be found in `searchbitcoin.com/config files/`. The website was constructed using a Content Management System called concrete5. The code implementing concrete5 may be found in `searchbitcoin.com/www/`, which has been configured to host the Search Bitcoin webpage. The Apache webserver expects the concrete5 files to be placed at `/var/www/`. The database for concrete5 runs on MySQL, and a copy has been saved in `searchbitcoin.com/concrete5 database/`.

The backend API is found in the folder `api.searchbitcoin.com/`. The backend consists of several compontents...


