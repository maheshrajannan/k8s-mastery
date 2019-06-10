#InstallSaWebAppLocally.sh
# find and kill it.
# INFO: It also greps itself and says cannot kill, so that can be ignored.
ps ax | grep sentiment-analysis-web | cut -f1 -d" " - | xargs kill -9
which mvn
mvn --version
mvn clean install
java -jar target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar --sa.logic.api.url=http://localhost:5000