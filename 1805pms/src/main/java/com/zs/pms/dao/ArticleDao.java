package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryAriticle;

public interface ArticleDao {
//查询分页
public List<TArticle> queryByPage(QueryAriticle qAriticle);
}
