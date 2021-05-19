#Create core
cd /opt/bitnami/solr/server/solr/
sudo -u solr mkdir reviewCore
sudo -u solr cp -r ./configsets/_default/conf* ./reviewCore/

#Install Git
sudo apt update
sudo -u solr apt install git
sudo apt install git
git clone https://github.com/Madlhawa/Hotel-Recommendation-System.git

#Post Documents
cd /opt/bitnami/solr/
sudo -u solr ./bin/post -c reviewCore /home/aprabhath029/Hotel-Recommendation-System/Data/booking/booking.csv 

#Remove Documents
cd /opt/bitnami/solr/
sudo -u solr ./bin/post -c reviewCore -d "<delete><query>*:*</query></delete>"