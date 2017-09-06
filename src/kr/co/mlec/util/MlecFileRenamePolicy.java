package kr.co.mlec.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MlecFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
//		f = new File("c:/java/upload/Test.java");
		
		// c:/java/upload/
		String parent = f.getParent();		// 파일명을 제외한 경로까지 가져온다.
		// a.jpg
		String name = f.getName();
		
		// 확장자는 유지하고 파일의 이름부분을 변경
		// 사용자가 선택한 파일의 확장자만 가져오기
		String ext = "";
		int index = name.lastIndexOf(".");
		if (index != -1) {	// 확장자가 있는 경우
			// ext = .jpg
			ext = name.substring(index);
		}
		
		String fName = UUID.randomUUID().toString();		// 유니크(고유)한 아이디를 생성하는 객체
		return new File(parent, fName + ext);
	}
	
	
}
