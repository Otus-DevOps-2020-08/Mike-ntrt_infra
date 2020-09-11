# Mike-ntrt_infra
Mike-ntrt Infra repository

### HW Lec 5 - Cloud Bastion

bastion_IP = 178.154.224.60
someinternalhost_IP = 10.130.0.11

ssh connect oneline through Jumphost(otion `-J`):
`ssh -i .ssh/appuser -A -J appuser@178.154.224.60 appuser@10.130.0.11`
