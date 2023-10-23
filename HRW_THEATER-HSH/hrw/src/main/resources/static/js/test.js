const mysql = require('mysql');

// MySQL 연결 정보 설정
const connection = mysql.createConnection({
  host: 'localhost', // MySQL 호스트 주소
  user: 'root',  // MySQL 사용자명
  password: '1234', // MySQL 비밀번호
  database: 'icidb', // 사용할 데이터베이스명
});

// MySQL에 연결
connection.connect((err) => {
  if (err) {
    console.error('MySQL 연결 오류:', err);
    return;
  }
  console.log('MySQL에 연결되었습니다.');
});

// 현재 시간 쿼리
const query = 'SELECT NOW() AS current_time';
connection.query(query, (err, results, fields) => {
  if (err) {
    console.error('쿼리 오류:', err);
    return;
  }

  const currentTime = results[0].current_time;
  document.getElementById("aaa").textContent = currentTime;
  // MySQL 연결 종료
  connection.end((err) => {
    if (err) {
      console.error('MySQL 연결 종료 오류:', err);
    } else {
      console.log('MySQL 연결이 종료되었습니다.');
    }
  });
});