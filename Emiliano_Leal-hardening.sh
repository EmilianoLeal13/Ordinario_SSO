os=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

if [ $os ==  '"centos"' ]
then
    echo "The OS distribution is centOS"
    echo  "The repositories will be uptaded"
    sudo yum update -y
    echo "Epel is going to be installed"
    sudo yum install epel-release
    echo "The repositories are now updated to the lastet version"
    if ! command -v clamscan &> /dev/null
    then
        sudo yum install clamav clamav-daemon -y
        echo "clamAV is already installed"
    else
        echo "clamAV is going to be delete and then its be reinstalled"

         echo "clamAV is going to be stopped"
         sudo systemctl stop clamav-freshclam
         echo "clamAV is going to be deleted"
         sudo yum remove clamav clamav-daemon -y
         echo "clamAV is going to be installed"
         sudo yum install clamav clamav-daemon -y
         echo "clamAV is installed"
         echo "Done!"
    fi
fi
if [ $os ==  'ubuntu' ]
then
    echo "The OS distribution is Ubuntu"
    echo  "The repositories will be uptaded"
    sudo apt-get upgrade -y
    echo "The repositories are now updated to the lastet version"
    if ! command -v clamscan &> /dev/null
    then
        sudo apt-get install clamav clamav-daemon -y
        echo "clamAV is already installed"
    else
        echo "clamAV is going to be delete and then its be reinstalled"

         echo "clamAV is going to be stopped"
         sudo systemctl stop clamav-freshclam
         echo "clamAV is going to be deleted"
         sudo apt-get autoremove clamav clamav-daemon -y
         echo "clamAV is going to be installed"
         sudo apt-get install clamav clamav-daemon -y
         echo "clamAV is installed"
         echo "Done!"
    fi
fi
