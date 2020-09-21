source "yandex" "yc" {
    service_account_key_file = var.yc_service_key
    ssh_username = "ubuntu"
    source_image_family = var.yc_source_image_family
    folder_id = var.yc_folder_id
    preemptible = var.yc_preemptible
    use_ipv4_nat = var.yc_use_ipv4_nat
    image_name =  "${var.yc_image-family}-{{timestamp}}"
    image_family = var.yc_image-family
    platform_id = var.yc_platform_id
    subnet_id = var.yc_subnet_id
}