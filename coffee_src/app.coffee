os = require 'os'
config = require './config'
redis_ip = config.redis.ip
redis_port = config.redis.port
redis = require('redis').createClient(redis_port, redis_ip)
logger = require './logger'
date_helper = require './helper/date'

CronJob = require('cron-cluster')(redis).CronJob

do ->
  job = new CronJob
    cronTime: '*/3 * * * * *'
    onTick: ()->
      now = date_helper.toJaString new Date()
      message = "running at #{os.hostname()}"
      console.log "#{now} #{message}"
      logger.info message
  job.start()

