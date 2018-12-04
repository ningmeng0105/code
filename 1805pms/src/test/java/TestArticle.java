import javax.swing.table.TableColumn;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TArticle;
import com.tjzs.pms.po.TChannel;
import com.tjzs.pms.service.ArticleService;
import com.tjzs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestArticle {

	@Autowired
	ArticleService as;
	
	@Test
	public void testQuery(){
		QueryArticle query=new QueryArticle();
		as.queryByCon(query);
	}
	
	
	public void testDelete(){
		int[] ids={1,2,3};
		as.deleteByIds(ids);
	}
	
	
	public void testUpdate(){
		TArticle article =new TArticle();
		article.setId(1000);
		article.setContent("一定会对你");
		article.setIshot(-1);
		try {
			as.update(article);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public void testAdd(){
		TArticle article =new TArticle();
		article.setTittle("asd");
		article.setContent("zfda");
		article.setAuthor("qwc");
		
		TChannel channel=new TChannel();
		channel.setId(2);
		article.setChannel(channel);
		
		article.setCreateman(1000);
		
		try {
			as.insert(article);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
