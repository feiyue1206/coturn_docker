# coturn_docker

## release

docker hub
https://hub.docker.com/r/feiyue1206/rrcoturnimg

###
use tag v3_conf

docker pull feiyue1206/rrcoturnimg:v3_conf

docker run -d -p 3478:3478 -p 3478:3478/udp -p 9000-9999:9000-9999/udp --volume /root/coturn/logs/:/rrcoturn/logs/ --volume /root/coturn/conf/:/rrcoturn/conf/ --name testcoturn feiyue1206/rrcoturnimg:v3_conf


###
use tag v2_run

docker pull feiyue1206/rrcoturnimg:v2_run

docker run -d -p 3478:3478 -p 3478:3478/udp -p 9000-9999:9000-9999/udp  --volume /root/logs/:/rrcoturn/logs/ --name testcoturn feiyue1206/rrcoturnimg:v2_run



3478 port ( and more 3479,5349,5350...) 是用于coturn对外提供功能的接口port
ports (9000-9999) 是用于 p2p通信时relay

## auth

coturn 支持不同的认证方式

1、static username + password
    现在使用的方式
    
2、use-auth-secret，分为static(配置文件中hardcode）和dynamic(存在数据库）
    static 验证过
    dynamic未验证
    
3、oAuth
    未验证

## performance
  to do



