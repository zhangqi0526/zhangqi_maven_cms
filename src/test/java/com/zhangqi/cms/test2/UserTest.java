package com.zhangqi.cms.test2;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhangqi.cms.dao.UserDao;
import com.zhangqi.cms.pojo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class UserTest {

	@Autowired
	private UserDao userDao;
	@Test
	public void test() {
		List<User> userList = userDao.select(null);
		System.out.println(userList);
		User user = new User();
		user.setNickname("lisi");
//		userDao.insert(user);
		user.setId(200);
//		userDao.update(user);
		
//		userDao.delete("200");
		
		User selectById = userDao.selectById(199);
		System.out.println(selectById);
	}
}
