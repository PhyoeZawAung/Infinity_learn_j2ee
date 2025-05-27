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
	
	public String createFile(String folder,ServletContext servletContext, Part part) throws IOException, SecurityException {
		// save in user directory
		String userDir = System.getProperty("user.dir");
		
		String fileLocation = userDir + File.separator + "uploads" ;
		
		// prepare the directory
		File uploadDir = new File(fileLocation, folder);
		
		if(!uploadDir.exists()) {
			// create the directory
			Boolean success = uploadDir.mkdirs();
			if(!success) {
				throw new IOException("Failed to create directory: " + uploadDir.getAbsolutePath());
			}
		}
		
		String fileName = part.getSubmittedFileName();	

		String uniqueFileName = generateUniqueFileName(fileName);

		File savedFile = new File(uploadDir, uniqueFileName);	
		
		try(InputStream input = part.getInputStream()){
			Files.copy(input, savedFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
		}
		
		
		return File.separator + folder + File.separator + uniqueFileName;
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

	private String generateUniqueFileName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String extension = "";
		if(dotIndex != -1 && dotIndex < fileName.length()-1) {
			extension = fileName.substring(dotIndex);
			fileName = fileName.substring(0, dotIndex);
		}

		String uuid = java.util.UUID.randomUUID().toString();
		return uuid + extension;
	}

}
