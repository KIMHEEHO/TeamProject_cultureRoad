package com.culture.admin.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.culture.admin.comment.service.AdminCommentService;
import com.culture.admin.comment.vo.AdminCommentVO;
import com.culture.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/*")
public class AdminCommentController {

   @Setter(onMethod_ = @Autowired)
   private AdminCommentService adminCommentService;

   // 한줄평 목록
   @GetMapping("/admincommentList")
   public String commentList(@ModelAttribute AdminCommentVO cvo, Model model) {
      log.info("commentList() 메서드 호출"+cvo.getPageNum()+"asdf"+cvo.getAmount());

      List<AdminCommentVO> adminCommentList = adminCommentService.adminCommentList(cvo);
      model.addAttribute("adminCommentList", adminCommentList);

      log.info("반환값: "+adminCommentList);
      // 전체 레코드수 반환 
      int total = adminCommentService.adminCommentListCnt(cvo); 
      //페이지 처리 관리
      model.addAttribute("pageMaker", new PageDTO(cvo, total));

      return "admin/comment/adminCommentList";
   }

   // 한줄평 상세 페이지
   @GetMapping("/admincommentDetail")
   public String commentDetail(AdminCommentVO cvo, Model model) { // 클릭하면 글 넘버를 가지고 감 => 올때 번호, 제목, 작성자, 내용, 조회수 가지고와야됨
      log.info("boardDetail 호출 성공");
      AdminCommentVO detail = adminCommentService.adminCommentDetail(cvo);
      
      model.addAttribute("detail", detail);
      
      return "admin/comment/adminCommentList";
   }
   
   // 한줄평 삭제
   @GetMapping("/admincommentDelete")
   public String commentDelete(AdminCommentVO cvo, Model model) throws Exception {
      log.info("boardDelete 호출 성공");
      adminCommentService.adminCommentDelete(cvo);
      
      
      return "redirect:/admin/admincommentList";
   }

}