FROM jboss/keycloak

# Set environment variables
env PROXY_ADDRESS_FORWARDING=true

# Copy theme
ADD themes/ /opt/jboss/keycloak/themes/

USER jboss

expose 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
