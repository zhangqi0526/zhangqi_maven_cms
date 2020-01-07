package com.zhangqi.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseDao<T> {

	/**
	 * @Title: select  
	 * 按条件查询
	 * @param T
	 * @return List<T>
	 */
	List<T> select(T t1);
	/**
	 * @Title: selectById   
	 * @Description: 根据Id查询   
	 * @param: @param id
	 * @param: @return      
	 * @return: T      
	 * @throws
	 */
	T selectById(Integer id);
	/**
	 * @Title: insert   
	 * @Description: 新增   
	 * @param: @param t1
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	int insert(T t1);
	/**
	 * @Title: update   
	 * @Description: 修改   
	 * @param: @param t1
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	int update(T t1);
	/**
	 * @Title: delete   
	 * @Description: 删除   
	 * @param: @param ids
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	int delete(@Param("ids")String ids);
}
