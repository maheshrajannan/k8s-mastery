#InstallSaWebAppLocally.sh
which mvn
mvn --version
mvn Install
java -jar target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar --sa.logic.api.url=http://localhost:5000