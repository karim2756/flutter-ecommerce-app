import 'package:get/get.dart';

// "":"",
class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "1": "Choose Language",
          "2": "Find Favorite Items",
          "3":
              "Search for your favorite products that you want to \n buy within the best price",
          "4": "Easy & Safe Payment",
          "5": "Pay for the proudcts you buy safely \n and easy",
          "6": "Product Delivery",
          "7": "Your product is deliverd to your home \n safely and securely ",
          "8": "Continue",
          "9": "Welcome Back",
          "10": "Sign In",
          "11": "Sign In With Your Email And Password ",
          "12": "Enter Your Email",
          "13": "Email",
          "14": "Enter Your Password",
          "15": "Password",
          "16": "Forgot Password?",
          "17": "Don't have an account? ",
          "18": "Sign Up",
          "19": "Welcome to Trendy Treasures",
          "20": "Sign Up and start shopping now!",
          "21": "Enter Your Name",
          "22": "Username",
          "23": "Enter Your Phone Number",
          "24": "Phone",
          "25": "Already Have An Account? ",
          "26": "Forgot Password",
          "27": "Check Your Email",
          "28":
              "Plesae enter your email address to receive a verification code",
          "29": "Send verification code",
          "30": "Check Verification Code",
          "31": "Please enter the digit code that was sent to your email",
          "32": "Reset password",
          "33": "Reset Your Password",
          "34": "Add new password for the account",
          "35": "Enter Your New Password",
          "36": "New Password",
          "37": "Re-Enter Your Password",
          "38": "Repeated Password",
          "39": "Confirm",
          "40": "Confirm Email",
          "41": "not valid username",
          "42": "not valid email",
          "43": "wrong phone number",
          "44": "can't be empty",
          "45": "can't be less than",
          "46": "can't be more than",
          "47": "Are you sure you want to exit",
          "48": "Alert",
          "49": "Yes",
          "50": "No",
          "51": "Warning",
          "52": "Phone or Email is already exist",
          "53": "Not valid password",
          "54": "Wrong email or password",
          "55": "Search",
          "56": "Discover",
          "57": "Categories",
          "58": "See all",
          "59": "Top Selling",
          "60": "Special Offers",
          "61": "Successful Regesteration",
          "62": "Sign in and start shopping!",
          "63": "Home",
          "64": "Orders",
          "65": "Account",
          "66": "Favorite",
          "67": "Products",
          "68": "Clearance\nSales\n",
          "69": "Added to favorites",
          "70": "Removed from favorites",
          "71": "View cart",
          "72": "Cart",
          "73": "Price",
          "74": "Shipping fee",
          "75": "Total",
          "76": "Order Code",
          "77": "Order Price",
          "78": "Discount coupon applied : Yes",
          "79": "Shipping Address",
          "80": "Payment Method ",
          "81": "Order Status",
          "82": "Total Price",
          "83": "Details",
          "84": "Order Details",
          "85": "Item",
          "86": "QTY",
          "87": "Cancel Order",
          "88": "Welcome",
          "89": "Archive",
          "90": "Your Address",
          "91": "About Us",
          "92": "Contact Us",
          "93": "Log Out",
          "94": "Add discount coupon",
          "95": "Apply",
          "96": "Shipping",
          "97": "Discount",
          "98": "Place Order",
          "99": "Big Sale",
          "100": "Checkout",
          "101": "Confirm",
          "102": "Choose Payment Method",
          "103": "Cash on delivery",
          "104": "E-payment",
          "105": "Select Shipping Address",
          "106": "My Address",
          "107": "City",
          "108": "Street",
          "109": "Building",
          "110": "New Address",
          "111": "add your city and area",
          "112": "add your street",
          "113": "add your building name",
          "114": "Add",
          "115": "New Address Added",
          "116": "Error",
          "117": "Please try again",
          "118": "Alert",
          "119": "Please select payment method",
          "120": "Pending",
          "121": "On the Way",
          "122": "Deliverd",
          "123": "Language",
          "124": "Up to 20%",
          "125": "Cart is empty",
          "126": "Item added to cart",
          "127": "Item Removed from cart",
          "128": "Transaction Completed Successfully",
          "129": "Are you sure you want to cancel order",
          "130": "Order was Canceled",
          "131": "",
          "132": "",
          "133": "",
          "134": "",
          "135": "",
          "136": "",
          "137": "",
          "138": "",
        },
        "ar": {
          "1": "اختر اللغة",
          "2": "ابحث عن العناصر المفضلة لديك",
          "3": "ابحث عن منتجاتك المفضلة التي ترغب في شرائها \n بأفضل الأسعار",
          "4": "دفع سهل وآمن",
          "5": "ادفع ثمن المنتجات  التي تشتريها بأمان \n وسهولة",
          "6": "توصيل المنتج",
          "7": "يتم تسليم منتجك إلى منزلك \n بأمن وأمان",
          "8": "متابعة",
          "9": "مرحبا بعودتك",
          "10": "تسجيل الدخول",
          "11":
              "قم بتسجيل الدخول باستخدام البريد الإلكتروني الخاص بك وكلمة المرور",
          "12": "ادخل بريدك الالكتروني",
          "13": "البريد الالكتروني",
          "14": "ادخل كلمة المرور",
          "15": "كلمة المرور",
          "16": "هل نسيت كلمة السر؟",
          "17": "ليس لديك حساب ؟",
          "18": "انشاء حساب",
          "19": "مرحبا بك في Treandy Tresures",
          "20": "سجل وابدأ التسوق الآن!",
          "21": "ادخل اسمك",
          "22": "اسم المستخدم",
          "23": "ادخل رقم هاتفك",
          "24": "رقم الهاتف",
          "25": "لديك حساب بالفعل؟ ",
          "26": "نسيت كلمة السر",
          "27": "التأكد من بريدك الالكتروني",
          "28": "ادخل بريدك الالكتروني لارسال رمز التحقق",
          "29": "ارسال رمز التحقق",
          "30": "التحقق من الرمز",
          "31": "ادخل كود التحقق المرسل اليك",
          "32": "تغيير كلمة المرور",
          "33": "قم بتغيير كلمة المرور الخاصة بك",
          "34": "قم بإضافة كلمة مرور جديدة للحساب",
          "35": "ادخل كلمة المرور الجديدة",
          "36": "كلمة المرور الجديدة",
          "37": "اعد ادخال كلمة المرور",
          "38": "كلمة المرور مرة اخرى",
          "39": "تأكيد",
          "40": "تأكيد الحساب",
          "41": "اسم المستخدم غير صالح",
          "42": "البريد الالكتروني غير صالح",
          "43": "رقم الهاتف غير صحيح",
          "44": "لا يمكن ان يكون فارغ",
          "45": "لا يمكن ان يكون اقل من",
          "46": "لا يمكن ان يكون اكبر من",
          "47": "هل تريد الخروج من التطبيق",
          "48": "تنبيه",
          "49": "نعم",
          "50": "لا",
          "51": "تحذير",
          "52": "الهاتف او البريد الالكتروني موجود بالفعل",
          "53": "كلمة مرور غير صالحة",
          "54": "خطأ في البريد الالكتروني او كلمة المرور",
          "55": "ابحث",
          "56": "اكتشف",
          "57": "الفئات",
          "58": "عرض الكل",
          "59": "الاكثر مبيعا",
          "60": "الخصومات الخاصة",
          "61": "تم الانشاء بنجاح",
          "62": "قم بتسجيل الدخول وابدأ التسوق !",
          "63": "الرئيسية",
          "64": "الطلبات",
          "65": "الحساب",
          "66": "المفضلة",
          "67": "المنتجات",
          "68": "خصومات\nالتصفية",
          "69": "تمت الاضافة للمفضلة",
          "70": "تمت الازالة من المفضلة",
          "71": "عرض السلة",
          "72": "عربة التسوق",
          "73": "السعر",
          "74": "رسوم الشحن",
          "75": "الاجمالي",
          "76": "رقم الطلب",
          "77": "سعر الطلب",
          "78": "تم تطبيق كوبون الخصم: نعم",
          "79": "عنوان الشحن",
          "80": "طريقة الدفع ",
          "81": "حالة الطلب",
          "82": "السعر الكلي",
          "83": "التفاصيل",
          "84": "تفاصيل الطلب",
          "85": "العنصر",
          "86": "الكمية",
          "87": "الغاء الطلب",
          "88": "مرحبا",
          "89": "الارشيف",
          "90": "عنوانك",
          "91": "حول",
          "92": "تواصل معنا",
          "93": "تسجيل الخروج",
          "94": "ادخل كوبون الخصم",
          "95": "تطبيق",
          "96": "الشحن",
          "97": "الخصم",
          "98": "تاكيد الطلب",
          "99": "خصم كبير",
          "100": "الدفع",
          "101": "تاكيد",
          "102": "اختر طريقة الدفع",
          "103": "دفع عند الاستلام",
          "104": "الدفع الالكتروني",
          "105": "حدد عنوان الشحن",
          "106": "عنواني",
          "107": "المدينة",
          "108": "الشارع",
          "109": "المبنى",
          "110": "عنوان جديد",
          "111": "اضف مدينتك و منطقتك",
          "112": "اضف الشارع",
          "113": "اضف اسم المبنى",
          "114": "اضافة",
          "115": "تم اضافة عنوان جديد",
          "116": "خطأ",
          "117": "حاول مرة اخرى",
          "118": "تحذير",
          "119": "اختر طريقة الدفع",
          "120": "قيد الانتظار",
          "121": "في الطريق اليك",
          "122": "تم التوصيل",
          "123": "اللغة",
          "124": "خصم حتى 20%",
          "125": "السلة فارغة",
          "126": "تمت الاضافة الي السلة",
          "127": "تمت الازالة من السلة",
          "128": "تم الطلب بنجاح ",
          "129": "هل انت متاكد من الغاء الطلب",
          "130": "تم الغاء الطلب",
          "131": "",
        },
      };
}