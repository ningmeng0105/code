import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tjzs.pms.exception.AppException;
import com.tjzs.pms.po.TDep;
import com.tjzs.pms.po.TPermission;
import com.tjzs.pms.po.TUser;
import com.tjzs.pms.service.UserService;
import com.tjzs.pms.utils.MD5;
import com.tjzs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestUser {
	@Autowired
	UserService us;
	
	
	public void testQuery(){
		QueryUser query=new QueryUser();
		query.setLoginname("qwe");
		query.setPassword("123"); //明码
		//query.setIsenabled(1);
		//query.setPage(2);
		us.queryByCon(query);
	}
	@Test
	public void TestLogin() {
		// TODO Auto-generated constructor stub
		QueryUser query=new 	QueryUser();
		query.setLoginname("qwe");
		query.setPassword("123"); //明码
		query.setIsenabled(-1);
		try {
			TUser user=us.chkLogin(query);
			System.out.println(user.getRealname()+"、"+user.getDept().getName());
			for (TPermission per : user.getPermissions()) {
				System.out.println(per.getPname());
			}
			System.out.println("==========整理后========");
			for (TPermission per1 : user.getMenu()) {
				System.out.println(per1.getPname());
				for (TPermission per2 :per1.getChildren()) {
					System.out.println("\t\t"+per2.getPname());
				}
			}
		} catch (AppException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getErrMsg());
		}catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	
	public void testDelete(){
		int[] ids={2815,2956,3034};
		us.deleteByIds(ids);
	}
	

	public void testUpdate(){
		TUser user=new TUser();
		user.setId(3118);
		//user.setPassword("321");
		user.setSex("女");
		//user.setBirthday(new Date());
		//user.setEmail("vgda@123.com");
		
		//部门
		TDep dep=new TDep();
		dep.setId(6);
	//	user.setDept(dep);
		
	//	user.setRealname("哎呀");
		user.setIsenabled(-1);
	//	user.setUpdator(1002);
		
		try {
			us.update(user);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public void testAdd(){
		TUser user=new TUser();
		user.setLoginname("qiang");
		user.setPassword("321");
		user.setSex("女");
		user.setBirthday(new Date());
		user.setEmail("vgdua@123.com");
		
		//部门
		TDep dep=new TDep();
		dep.setId(6);
		user.setDept(dep);
		
		user.setRealname("二十");
		user.setCreator(1002);
		user.setPicurl("picurl.ssd");
		
		try {
			us.insert(user);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testPage(){
		QueryUser query=new 	QueryUser();
		query.setIsenabled(1);
		System.out.println("当前总页数为"+us.queryPageCount(query));
		for (TUser user : us.queryByPage(query, 1)) {
			System.out.println(user.getRealname());
			
		}
	}
	
}
