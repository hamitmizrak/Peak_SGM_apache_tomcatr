# Apache Tomcat
[Apache Tomcat GitHub Backend](https://github.com/hamitmizrak/Peak_SGM_apache_tomcatr)
[Apache Tomcat GitHub Tomcat Version](https://github.com/hamitmizrak/peak_sgm_apache-tomcat-9.0.89)
---

## Gereksinimler
- JDK 19
- Intellij Idea Ultimate
--

## \conf\tomcat-user.xml (Rol Management)
```sh
<!-- Rolles -->
<role rolename="admin-gui" />
<role rolename="manager-gui" />
<role rolename="manager-script" />


<!-- User -->
<user username="root" password="root" roles="admin-gui,manager-gui,manager-script"/>
<user username="admin" password="admin123" roles="admin-gui"/>
<user username="manager" password="manager123" roles="admin-gui,manager-gui"/>
<user username="script" password="script123" roles="manager-script"/>
</tomcat-users>
```

## \conf\server.xml (Port Change) 
```sh
	<Connector   
	
          port="9999"  (Sistem Port) 
          protocol="HTTP/1.1" (HTTP Protokolü)
          connectionTimeout="20000" (İstemci Bağlantısını kurarken maksimum bekleme süresi 1000ms=1s)
          redirectPort="8443" (HTTP isteklerini HTTPS yönlendirelecek port)
          maxParameterCount="1000" 
          maxThreads="200" (Aynı anda işlenebilecek maksimum istek sayısı)
          minSpareThreads="20" (Boşta bekleyen minumum thread sayısı)
          maxSpareThreads="100" (Boşta bekleyen maksimum thread sayısı)
          acceptCount="100" (Eğer tüm threadler dolu ise kuyrukta bekleyecek maksimum request sayısı)
          >
    </Connector>
```

## \webapps\manager\WEB-INF\web.xml (Deployment Max )
```sh
  <servlet>
	    <multipart-config>
          <!-- 50 MiB max -->
          <max-file-size>104857600</max-file-size>
          <max-request-size>104857600</max-request-size>
          <file-size-threshold>0</file-size-threshold>
      </multipart-config>
  </servlet>
```

## \webapps\manager\WEB-INF\web.xml (Deployment Max )
```sh
<web-app>
     <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.jsf</welcome-file>
    </welcome-file-list>
</web-app>

```


## \bin\catalina.bat (Ram, Garbarage Collection )
```sh
  set JAVA_OPTS=-Xms512m -Xmx1024m -XX:UseG1GC -XX:MaxGCPauseMillis=200
  
  -Xms512m (Minumum Ram)
  -Xmx1024m  (Maksimum Ram)
  -XX:UseG1GC (Garbarage Collection)
  -XX:MaxGCPauseMillis=200
```

---
## \conf\context ( DataSource )
```sh
    <!-- DataSource(Veri kaynagi)-->
    <!-- Mysql Database JDBC: Java Database Connectivity -->
    <Resource 
    name="jdbc/mydb" 
    auth="Container"
    type="javax.sql.DataSource"
    username="root"
    password="root"
    driverClassName="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/blog"
    maxTotal="100"
    maxIdle="30"
    maxWaitMillis="15000"
    
    />
    <!-- 
    name="jdbc/mydb" ==> Uygulama adı
    auth="Container" ==> Authentication(Kimlik doğrulama) yetkisini container yöneticisi
    type="javax.sql.DataSource" ==> Veri kaynağı türü
    username="root" ==> Veritabanı kullanıcı adı
    password="root" ==> Veritabanı şifresi
    driverClassName="com.mysql.cj.jdbc.Driver" ==> Veritabanı sürücüsü
    url="jdbc:mysql://localhost:3306/blog" ==> Veritabanı bağlantı adresi
    maxTotal="100" ==> Maksimum bağlantı sayısı
     maxIdle="30" ==> Havuzda boşta bekleyen max  bağlantı sayısı
     maxWaitMillis="15000" ==> Bağlantı havuzunda boşta bekleyen bağlantıların maksimum bekleme süresi
    -->

</Context>
```

## \conf\web.xml ( DataSource )
```sh
    <!-- DataSource(Veri kaynagi)-->
    <!-- Mysql Database JDBC: Java Database Connectivity -->
       <!-- Data Source Mysql -->
       
<web-app>
    <resource-ref>
        <description>MYSQL Database Connection</description>
        <res-ref-name>jdbc/mydbApacheTomcat</res-ref-name>
        <res-type>javax.sql.DataSource</res-type>
        <res-auth>Container</res-auth>
    </resource-ref>

</web-app>

```




## \conf\web.xml ( DataSource )
```sh
    <!-- DataSource(Veri kaynagi)-->
    <!-- Mysql Database JDBC: Java Database Connectivity -->
       <!-- Data Source Mysql -->
       
<web-app>
    <resource-ref>
        <description>MYSQL Database Connection</description>
        <res-ref-name>jdbc/mydbApacheTomcat</res-ref-name>
        <res-type>javax.sql.DataSource</res-type>
        <res-auth>Container</res-auth>
    </resource-ref>

</web-app>

```

## \conf\web.xml ( DataSource )
```sh
      <!-- ==================== Oturum (Session) ================= -->
      <!-- sisteme girmiş bir kişi herhangi bir şey yapmazsa 30dakika sonra logout olsun -->
    <session-config>
        <session-timeout>30</session-timeout>
    </session-config>

    <session-config>
        <cookie-config>
            <name>mycookie</name> <!-- oturum cerez adi-->
            <domain>data.com</domain><!-- DNS: Domain Name Server -->
            <path>/</path><!-- Yolu -->
            <http-only>true</http-only> <!-- Cerezin sadece ama sadece HTTP üzerinden erişim olsun -->
            <secure>true</secure> <!-- Cerezin sadece HTTPS üzerinden erişim olsun -->
            <max-age>3600</max-age> <!-- Cerezin ömrü -->
        </cookie-config>
    </session-config>

</web-app>

```

---
## \conf\logging.properties 
```sh
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## Logging Level
# 1. SEVERE
# 2. WARNING
# 3. INFO
## INFO >WARNING>SEVERE


handlers = 1catalina.org.apache.juli.AsyncFileHandler, 2localhost.org.apache.juli.AsyncFileHandler, 3manager.org.apache.juli.AsyncFileHandler, 4host-manager.org.apache.juli.AsyncFileHandler, java.util.logging.ConsoleHandler

.handlers = 1catalina.org.apache.juli.AsyncFileHandler, java.util.logging.ConsoleHandler

############################################################
# Handler specific properties.
# Describes specific configuration info for Handlers.
############################################################

1catalina.org.apache.juli.AsyncFileHandler.level = FINE
1catalina.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}/logs
1catalina.org.apache.juli.AsyncFileHandler.prefix = catalina.
1catalina.org.apache.juli.AsyncFileHandler.maxDays = 90
1catalina.org.apache.juli.AsyncFileHandler.encoding = UTF-8

2localhost.org.apache.juli.AsyncFileHandler.level = FINE
2localhost.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}/logs
2localhost.org.apache.juli.AsyncFileHandler.prefix = localhost.
2localhost.org.apache.juli.AsyncFileHandler.maxDays = 90
2localhost.org.apache.juli.AsyncFileHandler.encoding = UTF-8

3manager.org.apache.juli.AsyncFileHandler.level = FINE
3manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}/logs
3manager.org.apache.juli.AsyncFileHandler.prefix = manager.
3manager.org.apache.juli.AsyncFileHandler.maxDays = 90
3manager.org.apache.juli.AsyncFileHandler.encoding = UTF-8

4host-manager.org.apache.juli.AsyncFileHandler.level = FINE
4host-manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}/logs
4host-manager.org.apache.juli.AsyncFileHandler.prefix = host-manager.
4host-manager.org.apache.juli.AsyncFileHandler.maxDays = 90
4host-manager.org.apache.juli.AsyncFileHandler.encoding = UTF-8

java.util.logging.ConsoleHandler.level = FINE

# Tek Satır (1.yol)
java.util.logging.ConsoleHandler.formatter = org.apache.juli.OneLineFormatter
java.util.logging.ConsoleHandler.encoding = UTF-8

##  SimpleFormatter (2.yol)
# java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter
# 1catalina.org.apache.juli.FileHandler.formatter = java.util.logging.SimpleFormatter


############################################################
# Facility specific properties.
# Provides extra control for each logger.
############################################################

## Global log level
#.level = INFO

# Catalina (Tomcat ana işlemleri) için log seviyesi
org.apache.catalina.level = INFO


# Localhost (localhost uygulamaları) için log seviyesi
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].level = INFO
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].handlers = 2localhost.org.apache.juli.AsyncFileHandler

# Manager uygulaması için log seviyesi
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].[/manager].level = INFO
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].[/manager].handlers = 3manager.org.apache.juli.AsyncFileHandler

# Host-Manager uygulaması için log seviyesi
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].[/host-manager].level = INFO
org.apache.catalina.core.ContainerBase.[Catalina].[localhost].[/host-manager].handlers = 4host-manager.org.apache.juli.AsyncFileHandler

# For example, set the org.apache.catalina.util.LifecycleBase logger to log
# each component that extends LifecycleBase changing state:
#org.apache.catalina.util.LifecycleBase.level = FINE

# To see debug messages in TldLocationsCache, uncomment the following line:
#org.apache.jasper.compiler.TldLocationsCache.level = FINE

# To see debug messages for HTTP/2 handling, uncomment the following line:
#org.apache.coyote.http2.level = FINE

# To see debug messages for WebSocket handling, uncomment the following line:
#org.apache.tomcat.websocket.level = FINE

###############################################################
###############################################################
###############################################################

## Log Rotation
## Günlük olarak log tutmaya yarar.
1catalina.org.apache.juli.FileHandler.rotatable = true
1catalina.org.apache.juli.FileHandler.suffix = .yyyy-MMM-dd



```







