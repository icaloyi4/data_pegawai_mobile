class ApiUrl {
  ApiUrl._();
  static const baseUrl = "https://sakura.mii.co.id:8080/APIMOBILE/";
  static const baseUrlDev =
      "http://103.101.225.146:8080/APIMOBILE/"; //http//:192.168.1.2:8082/APIMOBILE/
  // static const baseUrlDev =
  //     "http//:192.168.1.2:8082/APIMOBILE/"; //http//:192.168.1.2:8082/APIMOBILE/
  // static const login = "auth";
  static const login = "authenticate";
  static const getListSOByID = "overtime/salesorder/";
  static const getOvertimeManager = "overtime/";
  static const getHistoryOvertime = "overtime/history/";
  static const getOvetimeBaseId = "overtime/employee/";
  static const getDetailOvertime = "overtime/";
  static const updateStatusOvertme = "approval/overtime";
  static const project = "overtime/request/";
  static const holiday = "holiday/year";
  static const insertOvertime = "overtime/request/submit";
  static const reOvertime = "overtime/request/resubmit";

  //Dummy
  static const updateDeviceToken = "login/updateDeviceToken";
  static const pengumuman = "announcement";
  static const faq = "faq";
}
