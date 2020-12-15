// 더보기 요청
@RequestMapping(value = "/searchMoreNotify.do", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
@ResponseBody
public String searchMoreNotify(@RequestParam Map<String> param) throws Exception {
	
	Map<String> searchParam = new HashMap<String>();	// search 파라미터 생성
	searchParam.put("startIndex", param.get("startIndex"));	
	searchParam.put("endIndex", param.get("endIndex"));
	// startIndex ~ endIndex 범위에 해당하는 list 조회 
	
	List<MemberP005VO> addList = memberP005_d001Service.searchOldNotifyList(searchParam);
	for(MemberP005VO vo : addList) {	// 날짜 포맷 변경
		vo.setN_time(Common.formatTimeString(vo.getN_time(), commonService));
	}
	ObjectMapper mapper = new ObjectMapper();
	String jsonStr = mapper.writeValueAsString(addList);
	return jsonStr;
}