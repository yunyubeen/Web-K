package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller    //viex를 리턴하겠다는  밑 인덱스 파일이 뷰
public class IndexController {
	
	@GetMapping({"", "/"})
	public String index() {
		return "index";
	}
}
