
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InitializeBLOB {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "XDU";
	private static final String PASSWORD = "123456";
	private static final String SQL = "UPDATE video SET video = ? WHERE videono = ?";

	public static void main(String[] args) {
		//uploadCourseImg();
		//uploadVideo();
		updateSpkricon();
		//updateLecinfo();
		//updateLecpic();
		
	}

	public static void uploadVideo() {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement("UPDATE video SET video = ? WHERE videono = ?");

			for (int i = 1; i <= 9; i++) {
				String videoName = "VID" + (i < 10 ? "000" + i : "00" + i);
//				byte[] pic = getUpdateFileByteArray("C:\\GD_NCKU\\EA103_javaclass\\專題用假資料\\HTML課程影片\\720P\\" + videoName + ".mp4");
//				byte[] pic = getPictureByteArray("C:\\GD_NCKU\\EA103_javaclass\\專題用假資料\\HTML課程影片\\" + videoName + ".mp4");
				byte[] video = getUpdateFileByteArray("blobpool/VideoFile/" + videoName + ".mp4");
				// windows: "C:/Users/Big data/Desktop/lecimg/img" + i + ".jpg"
				// mac: "/Users/yvon/Desktop/lecimg/img" + i + ".jpg"
				pstmt.setBytes(1, video);
				pstmt.setString(2, videoName);
				pstmt.executeUpdate();
				System.out.println(videoName + " 上傳成功");
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}

	public static void uploadCourseImg() {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement("UPDATE course SET courseimg = ? WHERE courseno = ?");

			for (int i = 2; i <= 16; i++) {
				String imgName = "COUR" + (i < 10 ? "000" + i : "00" + i);
				// 超過 0099 需再另外寫
				byte[] pic = getUpdateFileByteArray("blobpool/CourseImgs/" + imgName + ".png");
				// windows: "C:/Users/Big data/Desktop/lecimg/img" + i + ".jpg"
				// mac: "/Users/yvon/Desktop/lecimg/img" + i + ".jpg"
				pstmt.setBytes(1, pic);
				pstmt.setString(2, imgName);
				pstmt.executeUpdate();
				System.out.println(imgName + " 上傳成功");
			}

		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}

	public static void updateLecinfo() {
		Connection con = null;
		PreparedStatement pstmt = null;

		String INFO_SQL = "UPDATE LECTURE SET LECINFO = ? WHERE LECNO = ?";

		String[] lecinfo = {
				"一支平底鍋和長柄雨傘，再也不需要防狼噴霧劑",
				"現場示範6道法式經典料理 X 法國飲食文化分享",
				"讓一代名車閃電麥坤教您如何挑選第一台跑車",
				"跟著專業裁縫設計師一起發掘生活靈感",
				"筆記怎麼寫最省時清晰，讓你一心多用也不怕",
				"用程式建構出一個世界，需要哪些軟體和語言",
				"把插花置入辦公環境，帶來好心情和工作效率",
				"如何跨出舒適圈，用比旅行更刺激的方式面對生活",
				"自己當寵物溝通師，分享寵物與人的關係與情感建立",
				"不藏私、無業配、正港吃貨的巷弄美食清單",
				"比埋頭苦幹更快、也更快樂的秘訣全部都給你",
				"一口就能喝出幾年哪一款，到底是怎麼做到的",
				"那些股票大亨沒教你、但最該注意的投資細節"
		};

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(INFO_SQL);

			for (int i = 0; i < lecinfo.length; i++) {
				byte[] info = lecinfo[i].getBytes();
				if (i < 9) {
					pstmt.setBytes(1, info);
					pstmt.setString(2, "LEC000" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳info" + (i + 1));
				} else {
					pstmt.setBytes(1, info);
					pstmt.setString(2, "LEC00" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳info" + (i + 1));
				}

			}
		} catch (SQLException se) {
			System.out.println(se);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}
	public static void updateLecpic() {
		Connection con = null;
		PreparedStatement pstmt = null;

		String PIC_SQL = "UPDATE LECTURE SET LECPIC = ? WHERE LECNO = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(PIC_SQL);

			for (int i = 0; i < 13; i++) {
				byte[] pic = getUpdateFileByteArray("blobpool/lecimg/img" + (i+1) + ".jpg");
				if (i < 9) {
					pstmt.setBytes(1, pic);
					pstmt.setString(2, "LEC000" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳lecpic" + (i + 1));
				} else {
					pstmt.setBytes(1, pic);
					pstmt.setString(2, "LEC00" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳lecpic" + (i + 1));
				}

			}
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}
	
	public static void updateSpkrinfo() {
		Connection con = null;
		PreparedStatement pstmt = null;

		String INFO_SQL = "UPDATE LECTURE SET LECINFO = ? WHERE LECNO = ?";

		String[] lecinfo = {
				"一支平底鍋和長柄雨傘，再也不需要防狼噴霧劑",
				"現場示範6道法式經典料理 X 法國飲食文化分享",
				"讓一代名車閃電麥坤教您如何挑選第一台跑車",
				"【 Edna | The Incredibles 】<br>超人特攻隊首席裁縫衣夫人",
				"筆記怎麼寫最省時清晰，讓你一心多用也不怕",
				"用程式建構出一個世界，需要哪些軟體和語言",
				"把插花置入辦公環境，帶來好心情和工作效率",
				"如何跨出舒適圈，用比旅行更刺激的方式面對生活",
				"自己當寵物溝通師，分享寵物與人的關係與情感建立",
				"不藏私、無業配、正港吃貨的巷弄美食清單",
				"比埋頭苦幹更快、也更快樂的秘訣全部都給你",
				"一口就能喝出幾年哪一款，到底是怎麼做到的",
				"那些股票大亨沒教你、但最該注意的投資細節"
				};

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(INFO_SQL);

			for (int i = 0; i < lecinfo.length; i++) {
				byte[] info = lecinfo[i].getBytes();
				if (i < 9) {
					pstmt.setBytes(1, info);
					pstmt.setString(2, "LEC000" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳info" + (i + 1));
				} else {
					pstmt.setBytes(1, info);
					pstmt.setString(2, "LEC00" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳info" + (i + 1));
				}

			}
		} catch (SQLException se) {
			System.out.println(se);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}
	
	public static void updateSpkricon() {
		Connection con = null;
		PreparedStatement pstmt = null;

		String SPKR_SQL = "UPDATE SPEAKER SET SPKRICON = ? WHERE SPKRNO = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(SPKR_SQL);

			for (int i = 0; i < 13; i++) {
				byte[] pic = getUpdateFileByteArray("blobpool/lecimg/spkr" + (i+1) + ".jpg");
				if (i < 9) {
					pstmt.setBytes(1, pic);
					pstmt.setString(2, "SPKR000" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳spkricon" + (i + 1));
				} else {
					pstmt.setBytes(1, pic);
					pstmt.setString(2, "SPKR00" + (i + 1));
					pstmt.executeUpdate();
					System.out.println("已上傳spkricon" + (i + 1));
				}

			}
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}

	public static byte[] getUpdateFileByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}

}
