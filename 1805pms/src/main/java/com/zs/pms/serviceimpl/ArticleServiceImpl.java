package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryAriticle;
@Service
@Repository
public class ArticleServiceImpl implements ArticleService{
@Autowired
private ArticleDao ad;
	@Override
	public List<TArticle> queryByPage(QueryAriticle query, int page) throws AppException {
		// TODO Auto-generated method stub
		//把当前页设置到query中，也可以在下边set（start和end），因为在querypage中已经计算好了
		query.setPage(page);
		return ad.queryByPage(query);
	}

}
