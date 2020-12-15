package bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mainServlet
 */
@WebServlet("/mainServlet")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cmd="";
		cmd=request.getParameter("cmd");
		
		if(cmd.equals("search")) {
			BbsDAO bbsdao = new BbsDAO();
			String searchType = request.getParameter("searchType");
			
			if(searchType.equals("all")) {
				ArrayList<Bbs> bbslist = bbsdao.getAll(request.getParameter("searchData"));
				request.setAttribute("bbslist", bbslist);
				request.setAttribute("isEmpty", 0);
			} else if(searchType.equals("title")) {
				ArrayList<Bbs> bbslist = bbsdao.getDatabytitle(request.getParameter("searchData"));
				request.setAttribute("bbslist", bbslist);
				request.setAttribute("isEmpty", 0);
			} else if(searchType.equals("tag")) {
				ArrayList<Bbs> bbslist = bbsdao.getDatabyTag(request.getParameter("searchData"));
				request.setAttribute("bbslist", bbslist);
				request.setAttribute("isEmpty", 0);
			}
			
			if(request.getParameter("searchData")=="")
				request.setAttribute("isEmpty", 1);
			
			RequestDispatcher view = request.getRequestDispatcher("main.jsp");
			view.forward(request, response);
		}
	}

}
