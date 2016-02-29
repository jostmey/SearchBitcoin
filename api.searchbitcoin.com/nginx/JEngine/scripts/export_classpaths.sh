#!/bin/sh

BASE_PATH=/usr/share/nginx/JEngine

# Include MySQL Connector.
export CLASSPATH=/usr/share/java/mysql.jar

# Include JSoup for parsing the DOM.
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/jsoup-1.6.1.jar

# Include Web-crawler.
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/crawler4j-2.6.1.jar
# Include Web-crawler dependencies.
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/commons-codec-1.4.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/commons-logging-1.1.1.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/dsiutils-1.0.10.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/fastutil-5.1.5.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/httpclient-4.0.1.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/httpcore-4.0.1.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/je-4.0.71.jar
export CLASSPATH=$CLASSPATH:$BASE_PATH/lib/log4j-1.2.15.jar

# Include my scripts.
export CLASSPATH=$CLASSPATH:$BASE_PATH/src

