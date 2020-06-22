# resource "aws_route53_zone" "xn--53-hmcm3b-com" {
#     name = "xn--53-hmcm3b.com"
# }
# 
# resource "aws_route53_record" "server1-record" {
#     zone_id = aws_route53_zone.xn--53-hmcm3b-com.zone_id
#     name = "server1.xn--53-hmcm3b.com.com"
#     type = "A"
#     ttl = "300"
#     records = ["3.127.65.207"]
#   
# }
# 
# resource "aws_route53_record" "www-record" {
#     zone_id = aws_route53_zone.xn--53-hmcm3b-com.zone_id
#     name = "www.xn--53-hmcm3b.com.com"
#     type = "A"
#     ttl = "300"
#     records = ["3.127.65.207"]
#   
# }
# 
# output "ns-servers" {
#     value = aws_route53_zone.xn--53-hmcm3b-com.name_servers
# }
