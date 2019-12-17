package service;

import pojo.Tab;

import java.util.List;

//板块
public interface TabService {
    List<Tab> getAllTabs();
    Tab getByTabNameEn(String tabName);
}
