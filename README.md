# archbox

**Q:** What is it?  
**A:** archbox provides a Archlinux desktop in a container - simple and easy.  

**Q:** What desktop is provided?   
**A:** By default, Xfce is installed

## Screenshot:
![xfce](https://user-images.githubusercontent.com/37046652/201478186-0a3c18f1-b6cf-469a-912b-4275ddf6cd0b.png)


## USAGE:   
1. Clone/download the repository
2. Unpack/cd into the directory
3. Run
```
$ make
```
4. Run the container
```
$ make run
```
5. Connect to port **6002** (**VNC**) with your favorite **VNC** client

**NOTE:**  
This will expose **VNC** under the port **6002** and **SSH** on port **6001**.  
(You can use your favorite **VNC** client to connect to the given port on your local system)
