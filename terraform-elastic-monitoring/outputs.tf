output "kibana_url" {
  value = "http://${aws_instance.elastic.public_ip}:5601"
}

output "elasticsearch_url" {
  value = "http://${aws_instance.elastic.public_ip}:9200"
}
