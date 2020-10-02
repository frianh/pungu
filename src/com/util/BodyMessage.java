package com.util;

import java.util.ArrayList;

public class BodyMessage {
	public String messageToCreator(String creatorName, String newName, String newEmail, String newUserId, String newRole) {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>Hi <b>" +creatorName +"</b>,</p>");
		arrBody.add("<p></p>");
		arrBody.add("<p>Anda telah berhasil menambahkan user baru dengan informasi sebagai berikut :</p>");
		arrBody.add("<p></p>");
		
		arrBody.add("<table style='border-collapse: collapse;'>");
        arrBody.add("<tr>");
        arrBody.add("<td>Nama : <b>" +newName +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Email : <b>" +newEmail +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Id : <b>" +newUserId +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Role : <b>" +newRole +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("</table>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("<p>Semoga informasi ini bermanfaat.</p>");
        arrBody.add("Regards,");
        arrBody.add("<p></p>");
        arrBody.add("Pungu Jaya Abadi");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
	
	public String messageToNewUser(String newName, String newEmail, String newUserId, String newPassword) {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>Hi <b>" +newName +"</b>,</p>");
		arrBody.add("<p></p>");
		arrBody.add("<p>Selamat bergabung di Pungu Jaya Abadi, anda telah dibuatkan user baru dengan informasi sebagai berikut :</p>");
		arrBody.add("<p></p>");
		
		arrBody.add("<table style='border-collapse: collapse;'>");
        arrBody.add("<tr>");
        arrBody.add("<td>Nama : <b>" +newName +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Email : <b>" +newEmail +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Id : <b>" +newUserId +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Password : <b>" +newPassword +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("</table>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("<p>Password dibuat random oleh system, silahkan ganti password anda jika diperlukan.</p>");
        arrBody.add("<p>Semoga informasi ini bermanfaat.</p>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("Regards,");
        arrBody.add("<p></p>");
        arrBody.add("Pungu Jaya Abadi");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
	
	public String notificationOtp(String name, String email, String otp) {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>Hi <b>" +name +"</b>,</p>");
		arrBody.add("<p></p>");
		arrBody.add("<p>Berikut adalah kode yang anda request:</p>");
		arrBody.add("<p></p>");
		
		arrBody.add("<table style='border-collapse: collapse;'>");
        arrBody.add("<tr>");
        arrBody.add("<td>OTP : </td>");
        arrBody.add("<td><b>" +otp +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("</table>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("<p>Jika anda tidak melakukan action ini, silahkan abaikan pesan ini.</p>");
        arrBody.add("Regards,");
        arrBody.add("<p></p>");
        arrBody.add("Pungu Jaya Abadi");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
	
	public String successfullyRecover(String name, String email, String newPassword) {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>Hi <b>" +name +"</b>,</p>");
		arrBody.add("<p></p>");
		arrBody.add("<p>Recovery berhasil, password baru anda :</p>");
		arrBody.add("<p></p>");
		
		arrBody.add("<table style='border-collapse: collapse;'>");
        arrBody.add("<tr>");
        arrBody.add("<td>Password : </td>");
        arrBody.add("<td><b>" +newPassword +"</b></td>");
        arrBody.add("</tr>");
        arrBody.add("</table>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("<p>Semoga informasi ini bermanfaat.</p>");
        arrBody.add("Regards,");
        arrBody.add("<p></p>");
        arrBody.add("Pungu Jaya Abadi");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
	
	public String replyForSenderWebContact() {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>Hi</p>");
		arrBody.add("<p></p>");
		arrBody.add("<p>Terima kasih untuk kiriman email anda, akan kami respon secepatnya.</p>");
		arrBody.add("<p></p>");
        arrBody.add("<p>Semoga informasi ini bermanfaat.</p>");
        arrBody.add("Regards,");
        arrBody.add("<p></p>");
        arrBody.add("Pungu Jaya Abadi");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
	
	public String messageForOfficial(String messageFromSender, String senderEmail, String senderName) {
		ArrayList<String> arrBody = new ArrayList<>();
		
		arrBody.add("<p>" +messageFromSender +"</p>");
		arrBody.add("<p><b>Informasi Pengirim</b></p>");
		arrBody.add("<table style='border-collapse: collapse;'>");
        arrBody.add("<tr>");
        arrBody.add("<td>Email : </td>");
        arrBody.add("<td>" +senderEmail +"</td>");
        arrBody.add("</tr>");
        arrBody.add("<tr>");
        arrBody.add("<td>Nama : </td>");
        arrBody.add("<td>" +senderName +"</td>");
        arrBody.add("</tr>");
        arrBody.add("</table>");
        arrBody.add("<p>&nbsp;</p>");
        arrBody.add("<p>Semoga informasi ini bermanfaat.</p>");
        arrBody.add("Regards");
        
        StringBuilder builder = new StringBuilder();
		for(String str: arrBody) {
			builder.append(str);
		}
		
		String bodyMsg = builder.toString();
		return bodyMsg;
	}
}
