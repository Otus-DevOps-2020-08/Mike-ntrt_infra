output "external_ip_address_app" {
  value = yandex_compute_instance.app[*].network_interface.0.nat_ip_address
}
output "external_lb_ip_address" {
  value = element(element(yandex_lb_network_load_balancer.app-lb.listener.*, 0).external_address_spec.*.address, 0)
}
