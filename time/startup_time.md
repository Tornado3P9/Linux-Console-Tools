
```bash
systemd-analyze
# Startup finished in 3.014s (kernel) + 9.281s (userspace) = 12.296s 
# graphical.target reached after 9.271s in userspace.

systemd-analyze blame
# 6.331s NetworkManager-wait-online.service
# 1.985s fwupd.service
#  848ms NetworkManager.service
#  572ms apt-daily.service
#  473ms gpu-manager.service
#  334ms blueman-mechanism.service
#  333ms e2scrub_reap.service
#  317ms systemd-resolved.service
#  312ms apport.service
#  299ms systemd-binfmt.service
#  288ms dev-sdb1.device
#  ...
```

