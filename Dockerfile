FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend__s_t_s___b_u_s___v_1_2__ae00a4b8_1440_4992_8f2f_08909545d65e backend__s_t_s___b_u_s___v_1_2__ae00a4b8_1440_4992_8f2f_08909545d65e
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend__s_t_s___b_u_s___v_1_2__ae00a4b8_1440_4992_8f2f_08909545d65e/target/_s_t_s_-_b_u_s_-_v_1_2_-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar _s_t_s_-_b_u_s_-_v_1_2_-0.0.1-SNAPSHOT.jar"]