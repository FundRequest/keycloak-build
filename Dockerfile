FROM jboss/keycloak:6.0.1

# Set environment variables
ENV PROXY_ADDRESS_FORWARDING=true

ADD libs/dd-java-agent.jar /dd-java-agent.jar

# Copy theme
ADD themes/ /opt/jboss/keycloak/themes/
ADD blacklists/ /opt/jboss/keycloak/standalone/data/password-blacklists/

USER jboss

expose 8080

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.profile.feature.admin_fine_grained_authz=enabled -Dkeycloak.profile.feature.token_exchange=enabled"]
