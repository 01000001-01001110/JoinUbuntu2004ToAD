#Join Ubuntu Server to AD Domain
#Alan Newingham
#12/14/2020
#Wrote this as there was very litte that explained the problems I was having. 
#This is from a fresh install.  

sudo apt update
sudo apt-get install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python policykit-1 -y

sudo vi /etc/krb5.conf

#Press insert to start editing. 
#Erase anything that might be in there and add this text: 

[libdefaults]
 dns_lookup_realm = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 rdns = false
 default_realm = TEST.DOMAIN.COM
 default_ccache_name = KEYRING:persistent:%{uid}

#Press the ESC key. 
#Type :wq! to exit and save changes. 
# Note this as this really tripped me up. 
#You need to remove any special characters from your authenticating password in order to join to the domain....

sudo realm join -U authuser@TEST.DOMAIN.COM test.domain.com -v
