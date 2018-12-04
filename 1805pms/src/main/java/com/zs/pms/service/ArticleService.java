package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryAriticle;

public interface ArticleService {
	//查询分页
	public List<TArticle> queryByPage(QueryAriticle query,int page)throws AppException;
}
