package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
//登录
public TUser chkLogin(QueryUser query)throws AppException;
//条件查询
public List<TUser> queryByCon(QueryUser query)throws AppException;
//查询分页
public List<TUser> queryByPage(QueryUser query,int page)throws AppException;
//批量删除
public void deleteByids(int[] ids);
//删除
public void delete(int id);
//修改
public void update(TUser user)throws AppException;
//新增
public int insert(TUser user)throws AppException;
//通过id查询
public TUser queryById(int id);
//查询条数
public int queryPageCount(QueryUser query)throws AppException;
}
