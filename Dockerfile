FROM jboss/keycloak

# Set environment variables
ENV PROXY_ADDRESS_FORWARDING=true

ADD libs/dd-java-agent.jar dd-java-agent.jar
ENV JAVA_OPTS="-javaagent:/dd-java-agent.jar"
# Copy theme
ADD themes/ /opt/jboss/keycloak/themes/

USER jboss

expose 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
