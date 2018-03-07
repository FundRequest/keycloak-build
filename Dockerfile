FROM jboss/keycloak

# Set environment variables
ENV PROXY_ADDRESS_FORWARDING=true

ADD libs/dd-java-agent.jar /dd-java-agent.jar

ENV JAVA_OPTS="-javaagent:/dd-java-agent.jar -Xms256m -Xmx2048m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true"
# Copy theme
ADD themes/ /opt/jboss/keycloak/themes/

USER jboss

expose 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
