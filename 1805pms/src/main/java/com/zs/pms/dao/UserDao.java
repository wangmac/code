package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
//通过条件查询
public List<TUser> queryByCon(QueryUser query);
//查询分页
public List<TUser> queryByPage(QueryUser query);
//通过id查询
public TUser queryById(int id);
//批量删除
public void deleteByids(int[] ids);
//删除
public void delete(int id);
//修改
public void update(TUser user);
//新增
public int insert(TUser user);
//查询条数
public int queryCount(QueryUser query);
}
