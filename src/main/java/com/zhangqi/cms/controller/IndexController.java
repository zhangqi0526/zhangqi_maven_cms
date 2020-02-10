package com.zhangqi.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.zhangqi.cms.pojo.Article;
import com.zhangqi.cms.pojo.Category;
import com.zhangqi.cms.pojo.Channel;
import com.zhangqi.cms.pojo.Slide;
import com.zhangqi.cms.pojo.User;
import com.zhangqi.cms.service.ArticleService;
import com.zhangqi.cms.service.SlideService;
import com.zhangqi.cms.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private SlideService slideService;
	@Autowired
	private UserService userService;
	/**
	 * @Title: index   
	 * @Description: 首页   
	 * @param: @param model
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/")
	public String index(Model model) {
		hot(model, 1);
		return "index";
	}
	/**
	 * @Title: hot   
	 * @Description: 热门分页   
	 * @param: @param model
	 * @param: @param pageNum
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/hot/{pageNum}.html")
	public String hot(Model model,@PathVariable Integer pageNum) {
		List<Channel> channelList = articleService.getChannelAll();
		List<Slide> slideList = slideService.getAll();
		PageInfo<Article> pageInfo = articleService.getHotList(pageNum,4);
		model.addAttribute("channelList", channelList);
		model.addAttribute("slideList", slideList);
		model.addAttribute("pageInfo", pageInfo);
		return "index";
	}
	
	/**
	 * @Title: channel   
	 * @Description: 频道页   
	 * @param: @param model
	 * @param: @param channelId
	 * @param: @param cateId
	 * @param: @param pageNum
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/{channelId}/{cateId}/{pageNum}.html")
	public String channel(Model model,@PathVariable Integer channelId,@PathVariable Integer cateId,@PathVariable Integer pageNum) {
		List<Channel> channelList = articleService.getChannelAll();
		List<Slide> slideList = slideService.getAll();
		PageInfo<Article> pageInfo = articleService.getList(channelId,cateId,pageNum,2);
		List<Category> cateList = articleService.getCateListByChannelId(channelId);
		Channel channel = articleService.getChannelByChannelId(channelId);
		List<Article> newArticleList = articleService.getNewList(6);
		model.addAttribute("channelList", channelList);
		model.addAttribute("cateList", cateList);
		model.addAttribute("slideList", slideList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("channel", channel);
		model.addAttribute("newArticleList", newArticleList);
		return "index";
	}
	/**
	 * @Title: articleDetail   
	 * @Description: 文章详情页  
	 * @param: @param id
	 * @param: @param model
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/article/detail/{id}.html")
	public String articleDetail(@PathVariable Integer id,Model model) {
		Article article = articleService.getById(id);
		User user = userService.getById(article.getUser_id());
		article.setNickname(user.getNickname());
		model.addAttribute("article", article);
		/** 设置文章点击量，若点击量大于20成为热点文章 **/
		articleService.setHitsAndHot(id);
		return "article-detail";
	}
}
