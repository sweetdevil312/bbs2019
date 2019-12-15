package service;

import pojo.LoginLog;

//登录日志
public interface LoginLogService {
    //插入登陆日志
    boolean addLoginLog(LoginLog loginLog);
}
