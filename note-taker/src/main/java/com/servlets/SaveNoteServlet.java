package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
//			System.out.println(note.getId() + " " + note.getAddedDate() + " " + note.getTitle());
			
			// hibernate : save()
			Session session = FactoryProvider.getFactory().openSession();
			Transaction t = session.beginTransaction();
			
			session.save(note);
			t.commit();

			response.getWriter().println("<h1 style='text-align:center;'>Note is added successfully!</h1>");
			response.getWriter().println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
			
			session.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
