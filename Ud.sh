mkdir -p /home/pi/ultrondiagnosis


datafile=/home/pi/ultrondiagnosis/data.json

chown -R pi:pi /home/pi/ultrondiagnosis

ServiceFile=/etc/systemd/system/ultrondiagnosis.service


echo '[Unit]'>$ServiceFile
echo 'Description=Ultron Diagnosis'>>$ServiceFile
echo ''>>$ServiceFile
echo '[Service]'>>$ServiceFile
echo 'WorkingDirectory=/home/pi/ultrondiagnosis'>>$ServiceFile
echo 'Environment="TERM=xterm"'>>$ServiceFile
echo 'ExecStart=/home/pi/ultrondiagnosis/ultrondiagnosis'>>$ServiceFile
echo 'Restart=on-failure'>>$ServiceFile
echo ''>>$ServiceFile
echo '[Install]'>>$ServiceFile
echo 'WantedBy=default.target'>>$ServiceFile

echo '{'>$datafile
echo '"storage": []'>>$datafile
echo ''>>$datafile
echo '}'>>$datafile


systemctl daemon-reload
systemctl enable ultrondiagnosis.service

sudo systemctl  stop ultrondiagnosis.service

sudo wget  -O /home/pi/ultrondiagnosis/ultrondiagnosis https://files.aparinnosys.com/s/bn78PJayK7feQjb/download
sudo chmod +x /home/pi/ultrondiagnosis/ultrondiagnosis

echo "done"

sudo systemctl restart ultrondiagnosis.service
sudo systemctl status  ultrondiagnosis.service
