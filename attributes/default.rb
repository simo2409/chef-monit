default["monit"]["config"]["path"] = "/etc/monitrc"
default["monit"]["host"] = node["host"]["fqdn"] || ""

default["monit"]["alerts"] = {
  "from" => "alerts@#{node["monit"]["host"]}",
  "to" => []
}

default["monit"]["deploy_alerts"] = {
  "from" => "deploys@#{node["monit"]["host"]}",
  "to" => []
}

default["monit"]["web_interface"] = {
  "enabled" => true,
  "port" => 8080,
  "username" => "",
  "password" => ""
}

default["monit"]["smtp"] = {
  "enabled" => true,
  "hostname" => "",
  "username" => "",
  "password" => "",
  "port" => ""
}

# Application to monitor
default["monit"]["application"] = {
  "deploy_dir" => node["application"]["deploy_dir"] || nil,
  "name" => node["application"]["name"] || nil
}

# Services to monitor
default["monit"]["services_to_monitor"] = {
  "nginx" => {
    "pid_file" => node["nginx"]["conf"]["pid_file"] || nil,
    "conf" => node["nginx"]["conf"]["path"] || nil
  },
  "mariadb" => {
    "pid_file" => node["mariadb"]["conf"]["pid_file"] || nil,
    "conf" => node["mariadb"]["conf"]["path"]
  },
  "openssh" => {
    "pid_file" => node["openssh"]["server"]["pid_file"] || nil,
    "conf" => node["openssh"]["conf"]["path"] || nil
  },
  "memcached" => {
    "pid_file" => node["memcached"]["conf"]["pid_file"] || nil,
    "conf" => node["memcached"]["conf"]["path"] || nil
  }
}
