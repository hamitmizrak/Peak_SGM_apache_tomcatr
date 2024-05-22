# Apache Tomcat
[Apache Tomcat GitHub](https://github.com/hamitmizrak/Peak_SGM_apache_tomcatr)
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
          />
          
          >
          </Connector>
```

## \webapps\manager\WEB-INF\\web.xml (Deployment Max )
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


## \bin\catalina.bat (Ram, Garbarage Collection )
```sh
  set JAVA_OPTS=-Xms512m -Xmx1024m -XX:UseG1GC -XX:MaxGCPauseMillis=200
  
  -Xms512m (Minumum Ram)
  -Xmx1024m  (Maksimum Ram)
  -XX:UseG1GC (Garbarage Collection)
  -XX:MaxGCPauseMillis=200
```




