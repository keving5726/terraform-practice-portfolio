output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    alb        = module.alb_sg.security_group_id
    web_server = module.web_server_sg.security_group_id
    database   = module.database_sg.security_group_id
  }
}
