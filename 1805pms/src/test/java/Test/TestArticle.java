package Test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryAriticle;

@RunWith(SpringJUnit4ClassRunner.class) // 使用spring框架测试
@ContextConfiguration("classpath:applicationcontext.xml") // 引入配置文件
public class TestArticle {
	@Autowired
	ArticleService as;
	@Test
public void testQuery (){
	QueryAriticle qAriticle=new QueryAriticle();
	qAriticle.setIsremod(1);
	try {
		as.queryByPage(qAriticle, 1);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
