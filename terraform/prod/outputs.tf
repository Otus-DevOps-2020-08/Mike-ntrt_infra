output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}
#output "external_lb_ip_address" {
#  value = element(element(yandex_lb_network_load_balancer.app-lb.listener.*, 0).external_address_spec.*.address, 0)
#}
