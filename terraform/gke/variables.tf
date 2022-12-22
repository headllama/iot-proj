variable "project" {
  default     = "iot-project"
  description = "Nome do Projeto"
}
variable "auth" {
  default     = "./creds/serviceaccount.json"
  description = "Nome da KEY que vai autenticar na GCP"
}
variable "region" {
  default     = "us-central1-a"
  description = "Região onde o recurso sera criado"
}
variable "cluster_name" {
  default     = "iot-gke-01"
  description = "GKE cluster Name"
}
variable "master_network_range" {
  default     = "172.16.0.0/28"
  description = "Cluster master ip range"
}
variable "meu_ip" {
  default     = "187.115.240.33/32"
  description = "Meu ip - Home Office"
}
variable "meu_ip_desc" {
  default     = "Home Office - 1"
  description = "Meu ip descricao"
}
variable "meu_ip2" {
  default     = "45.239.156.84/32"
  description = "Meu ip - Home Office"
}
variable "meu_ip_desc2" {
  default     = "Home Office - SP"
  description = "Meu ip descricao"
}
variable "vpc_name" {
  default     = "iot-vpc-01"
  description = "GCP VPC Name"
}
variable "subnet_name" {
  default     = "iot-subnet-01"
  description = "GCP Subnet Name"
}
variable "cluster_ip_range" {
  default     = "10.171.8.0/21"
  description = "Cluster pods ip range"
}
variable "service_ip_range" {
  default     = "10.171.16.0/21"
  description = "Cluster services ip range"
}
variable "label_ambiente" {
  default     = "dev"
  description = "Ambiente label"
}
variable "label_cliente" {
  default     = "iot"
  description = "Cliente label"
}
variable "gke_num_nodes" {
  default     = "1"
  description = "Number os worker nodes on cluster"
}
variable "preemptible" {
  default     = "true"
  description = "Preemptible true/false"
}
variable "machine_type" {
  default     = "e2-standard-4"
  description = "Cluster Machine Type"
}
variable "network_tag" {
  default     = "iot-tech-gke-01"
  description = "Netork tag"
}
