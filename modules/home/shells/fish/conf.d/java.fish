status --is-interactive; and jenv init - | source

# Gradle home
set -x GRADLE_HOME /usr/local/opt/gradle/libexec
set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Java home
#set -x JAVA_HOME (/usr/libexec/java_home -v 14)
source $HOME/.asdf/plugins/java/set-java-home.fish

# Maven home
set -x M2_HOME /usr/local/opt/maven/libexec
set -x MAVEN_OPTS "-Xmx1024M"
