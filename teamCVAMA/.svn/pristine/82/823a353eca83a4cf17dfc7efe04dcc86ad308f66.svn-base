package com.cvama.ckorea.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cvama.ckorea.dto.CKoreaDTO;
import com.cvama.ckorea.service.CKoreaService;
import com.cvama.ckoreanow.dto.CKoreaNowDTO;
import com.cvama.cnews.service.CNewsService;
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;

@Controller
//@Log4j
@RequestMapping("/ckorea")
// 생성자에 의해서 멤버 변수를 초기화 시키는 작업을 한다.
// 멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject 사용
//@AllArgsConstructor
public class CKoreaController {

	@Autowired
	@Qualifier("ckorea")
	private CKoreaService cKoreaservice;
	
	@Autowired
	@Qualifier("cnews")
	private CNewsService cNewsService;
	private final String module = "ckorea";
	
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest req, HttpSession session) throws Exception {
//		path 가져오기
//		String path = c.getRealPath("/uploda/exe");
//		HttpSession session = req.getSession();
//		String path = session.getServletContext().getRealPath("/uploda/exe");
//		System.out.println(path);

//		자동 실행
//		Runtime rt = Runtime.getRuntime();
//		Process p = null;
//		String root = "D://workspace//spring//.metadata//.plugins//org.eclipse.wst.server.core//tmp3//wtpwebapps//teamCVAMA//upload//exe//";
//		String exe = "cvamaNews.exe";
//		String execute = root + exe;
//		try {
//			p = rt.exec(execute);
//			p.waitFor();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		List<CKoreaDTO> CKoreaList = cKoreaservice.list();
		CKoreaNowDTO nowList = nowList(CKoreaList);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String stime = format1.format(new Date());
		
		model.addAttribute("stime", stime);
		model.addAttribute("sid", session.getId());
		model.addAttribute("nowList", nowList);
		model.addAttribute("cKoreaList", CKoreaList);
		model.addAttribute("cNewsList", cNewsService.list());

		return module + "/list";
	}
	
	public CKoreaNowDTO nowList(List<CKoreaDTO> nl) {
		List<CKoreaDTO> nowList = new ArrayList<CKoreaDTO>();
		
		nowList.add(nl.get(nl.size()-2));
		nowList.add(nl.get(nl.size()-1));
		
		CKoreaNowDTO nowDTO = new CKoreaNowDTO();
		
		nowDTO.setTestTotal(nowList.get(1).getTestTotal());
		nowDTO.setTestTotal2(nowList.get(1).getTestTotal()-nowList.get(0).getTestTotal());
		
		nowDTO.setTestToday(nowList.get(1).getTestToday());
		nowDTO.setTestToday2(nowList.get(1).getTestToday()-nowList.get(0).getTestToday());
		
		nowDTO.setCoronaTrue(nowList.get(1).getCoronaTrue());
		nowDTO.setCoronaTrue2(nowList.get(1).getCoronaTrue()-nowList.get(0).getCoronaTrue());
		
		nowDTO.setCoronaFalse(nowList.get(1).getCoronaFalse());
		nowDTO.setCoronaFalse2(nowList.get(1).getCoronaFalse()-nowList.get(0).getCoronaFalse());
		
		nowDTO.setDeath(nowList.get(1).getDeath());
		nowDTO.setDeath2(nowList.get(1).getDeath()-nowList.get(0).getDeath());
		
		nowDTO.setSafe(nowList.get(1).getSafe());
		nowDTO.setSafe2(nowList.get(1).getSafe()-nowList.get(0).getSafe());
		
		float a = (float) nowList.get(1).getDeath();
		float a2 = (float) nowList.get(1).getCoronaTrue();
		float a3 = a / a2 * 100;
		float a4 = (float) (Math.round(a3*100)/100.0);
		
		nowDTO.setDeathRate(a4);
		
		return nowDTO;
	}
}
