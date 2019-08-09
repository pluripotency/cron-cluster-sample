SysLogger = require('ain2')

params =
  tag: 'cron-cluster'
  facility: 'local0'
logger = new SysLogger(params)
module.exports = logger

