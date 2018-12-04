package Test;

import java.util.Date;
import java.util.List;

import org.apache.tomcat.jni.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class) // 使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml") // 引入配置文件
public class TestUser {
@Autowired
UserService us;

	public void chkLogin(){
	QueryUser user=new QueryUser();
	user.setLoginname("test1");
	user.setPassword("111");
	
	try {
		TUser users= us.chkLogin(user);
		System.out.println(users.getLoginname()+"、"+users.getDept().getName());
		//getPermissions查出来是一个集合所以需要遍历
		for(TPermission per:users.getPermissions()){
			System.out.println(per.getPname());
		}
		/*System.out.println("----------------整理后------------------------");
		//增强for循环  users.getMenu()得到的是users对象的menu属性他是一个集合
		for (TPermission per1 : users.getMenu()) {
			System.out.println(per1.getPname());
			for (TPermission per2 : per1.getChildren()) {
				System.out.println("\t"+per2.getPname());
			}
		}*/
	} catch (AppException e) {
		// TODO Auto-generated catch block
		System.out.println(e.getErrMsg());
	}catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.getStackTrace();
	}
	
}
	
	public void testQuery(){
		QueryUser query=new QueryUser();
		//query.setPassword("111");
		//query.setLoginname("test1");
		query.setIsenabled(1);
		query.setPage(2);
		try {
			us.queryByCon(query);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void queryDelete(){
		int[] ids={3096,3097};
		us.deleteByids(ids);
	}
	
	public void testUpdate(){
		TUser user=new TUser();
		user.setId(3101);
		user.setBirthday(new Date());
		user.setEmail("123@qq.com");
		user.setIsenabled(1);
		user.setPassword("222");
		user.setPic("aaa.jsp");
		user.setSex("男");
		user.setRelname("小红");
		user.setUpdatime(new Date());
		user.setUpdator(1002);
		TDept dept=new TDept();
		dept.setId(1004);
		try {
			us.update(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testInsert(){
		TUser user=new TUser();
		
		//user.setId(3101);
		user.setBirthday(new Date());
		user.setEmail("123@qq.com");
		//user.setIsenabled(1);
		user.setLoginname("张飞123");
		user.setPassword("222");
		user.setPic("aaa.jsp");
		user.setSex("男");
		user.setRelname("小红");
		user.setCreator(1000);
		//user.setCreatime(new Date());
		TDept dept=new TDept();
		dept.setId(1006);
		user.setDept(dept);
		try {
			us.insert(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testDelete(){
		//int[] ids={1027,1029};
		//us.deleteByids(ids);
		int id=1025;
		us.delete(id);
	}
	@Test
	public void testCount(){
		QueryUser query=new QueryUser();
		query.setSex("男");
		try {
		us.queryByPage(query, 1);
		
			
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
}
