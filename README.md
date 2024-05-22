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
          port="9999" 
          protocol="HTTP/1.1" 
          connectionTimeout="20000" 
          redirectPort="8443" 
          maxParameterCount="1000" />
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




