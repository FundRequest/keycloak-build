FROM jboss/keycloak:3.4.3.Final

# Set environment variables
ENV PROXY_ADDRESS_FORWARDING=true

ADD libs/dd-java-agent.jar /dd-java-agent.jar

# Copy theme
ADD themes/ /opt/jboss/keycloak/themes/

USER jboss

expose 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
