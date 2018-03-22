# Centos 6 with python 3.6 from scl and Pyinstaller ready 
FROM centos:6 

RUN yum makecache fast && yum install -y centos-release-scl-rh && yum install -y rh-python36 xz && yum clean all
RUN source /opt/rh-python36/p/enable && pip3 install --upgrade pip && pip3 install PyInstaller
RUN curl -L  https://github.com/upx/upx/releases/download/v3.94/upx-3.94-amd64_linux.tar.xz | tar -xJ -C /opt/

ENTRYPOINT ["scl", "enable", "rh-python36", "--", "bash", "-c"]
