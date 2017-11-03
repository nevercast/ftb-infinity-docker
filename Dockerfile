FROM dlord/minecraft:java8
MAINTAINER Joshua Lloyd j.nevercast@gmail.com

ENV FTB_URL https://addons-origin.cursecdn.com/files/2481/284/FTBPresentsSkyfactory3Server_3.0.15.zip
ENV LAUNCHWRAPPER net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar

RUN curl -SL $FTB_URL -o /tmp/ftb.zip && \
    unzip /tmp/ftb.zip -d /opt/minecraft && \
    mkdir -p /opt/minecraft/$(dirname libraries/${LAUNCHWRAPPER}) && \
    curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o /opt/minecraft/libraries/$LAUNCHWRAPPER && \
    find /opt/minecraft -name "*.log" -exec rm -f {} \; && \
    rm -rf /opt/minecraft/ops.* /opt/minecraft/whitelist.* /opt/minecraft/logs/* /tmp/*

ENV MINECRAFT_VERSION 1.10.2
ENV MINECRAFT_OPTS -server -Xms2048m -Xmx3072m -XX:MaxPermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC
ENV MINECRAFT_STARTUP_JAR FTBserver-1.10.2-12.18.3.2477.jar
