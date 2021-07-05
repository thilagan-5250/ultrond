

sudo systemctl  stop ultrondiagnosis.service

sudo wget  -O /home/pi/ultrondiagnosis/ultrondiagnosis https://files.aparinnosys.com/s/bn78PJayK7feQjb/download
sudo chmod +x /home/pi/ultrondiagnosis/ultrondiagnosis

echo "done"

systemctl enable ultrondiagnosis.service

 
systemctl daemon-reload
sudo systemctl restart ultrondiagnosis.service
sudo systemctl status  ultrondiagnosis.service
