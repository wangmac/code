package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.Constants;
import com.zs.pms.vo.QueryUser;
@Service
@Repository
public class UserServiceImpl implements UserService {
@Autowired
private UserDao ud;
	@Override
	//登录
	public TUser chkLogin(QueryUser query) throws AppException {
		// TODO Auto-generated method stub
	List<TUser> list=	ud.queryByCon(query);
	if (list==null||list.size()!=1) {
		throw new AppException(1002, "用户密码输入有误，请重新输入");
	}
	//获得第一条
	TUser user=list.get(0);
		return ud.queryById(user.getId());
	}
	 //条件查询
	@Override
	public List<TUser> queryByCon(QueryUser query) throws AppException {
		// TODO Auto-generated method stub	
		return ud.queryByCon(query);
	}
	//批量删除
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void deleteByids(int[] ids) {
		// TODO Auto-generated method stub
		ud.deleteByids(ids);
	}
	  //修改
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void update(TUser user) throws AppException {
		if (user.getIsenabled()==-1) {
			throw new AppException(1003, "不可修改不可用用户");
		}
		// TODO Auto-generated method stub
		ud.update(user);
	}
	//新增
	@Override
	
	@Transactional(rollbackFor=Exception.class)
	public int insert(TUser user)throws AppException {
		// TODO Auto-generated method stub
		
		return ud.insert(user);
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void delete(int id) {
		// TODO Auto-generated method stub
		ud.delete(id);
	}
	@Override
	public List<TUser> queryByPage(QueryUser query,int page) throws AppException {
		// TODO Auto-generated method stub
		//把当前页设置到query中，也可以在下边set（start和end），因为在querypage中已经计算好了
		query.setPage(page);
		return ud.queryByPage(query);
	}
	@Override
	public int queryPageCount(QueryUser query) throws AppException {
		// TODO Auto-generated method stub
		int count=ud.queryCount(query);
		//整除
		if (count%Constants.PAGECOUNT==0) {
			return count/Constants.PAGECOUNT;
		}else {
			return count/Constants.PAGECOUNT+1;
		}
		
	}
	@Override
	public TUser queryById(int id) {
		// TODO Auto-generated method stub
		return ud.queryById(id);
	}
	
	

	
}
