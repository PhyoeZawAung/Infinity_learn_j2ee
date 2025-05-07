package uni.project.infinitylearn.utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.Part;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class FileUtil {
	
	public String createFile(String folder,ServletContext servletContext, Part part) throws IOException {
		
		String fileLocation = servletContext.getRealPath(File.separator + folder);
		
		System.out.println("the file store in" + fileLocation);
		
		File uploadDir = new File(fileLocation);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String fileName = part.getSubmittedFileName();
		
		System.out.println("this is file name" + fileName);

		File savedFile = new File(uploadDir, fileName);
		
		System.out.println("saved file" + savedFile.getAbsolutePath());
		
		try(InputStream input = part.getInputStream()){
			Files.copy(input, savedFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
		}
		
		
		return folder + File.separator + fileName;
	}
	
	
	public void deleteFile(String folder, String filename) {
		//TODO implement delete file
	}
	
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println("content disposition header" + contentDisp);
		
		String[] tokens = contentDisp.split(";");
		
		for(String token : tokens) {
			if(token.trim().startsWith("filename")) {
				System.out.print(token);
				return token.substring(token.indexOf("=") + 2 , token.length()-1);
			}
		}
		
		return "";
	}

}
