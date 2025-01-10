<template>
    <div>
      <!-- Navbar for Desktop -->
        <header v-if="!isMobile" class="navbar-desktop">
            <div class="logo">
                <img alt="Vue logo" src="@/assets/logo.png" />
                <span class="logo-text">กรมอุทยานแห่งชาติ</span>
            </div>
            <div class="menu-center">
                <router-link to="/">หน้าหลัก</router-link>
                <router-link to="/booking">การจอง</router-link>
                <router-link to="/tickets">ตั๋วของฉัน</router-link>
            </div>
            <div class="account">
                <router-link to="/account" class="avatar-link">
                    <img alt="Avatar" src="@/assets/avatar.png" class="avatar-img" />
                </router-link>
            </div>
        </header>
  
        <!-- Navbar Header for Mobile -->
        <div v-if="isMobile" class="mobile-header">
            <div class="mobile-logo">
            <img alt="Logo" src="@/assets/logo.png" />
            <span class="mobile-logo-text">กรมอุทยานแห่งชาติ</span>
        </div>
        <div class="mobile-notification">
            <i class="fas fa-bell"></i>
        </div>
        </div>
        <!-- Navbar Footer for Mobile -->
        <footer v-if="isMobile" class="navbar-mobile">
            <nav>
                <ul>
                <li><router-link to="/" class="mobile-tab">
                    <i class="fas fa-home"></i>
                    <span>หน้าหลัก</span>
                </router-link></li>
                <li><router-link to="/booking" class="mobile-tab">
                    <i class="fa-regular fa-calendar-days"></i>
                    <span>แ</span>
                </router-link></li>
                <li><router-link to="/booking" class="mobile-tab">
                    <i class="fa-regular fa-calendar-days"></i>
                    <span>การจอง</span>
                </router-link></li>
                <li><router-link to="/tickets" class="mobile-tab">
                    <i class="fa-solid fa-ticket"></i>
                    <span>ตั๋วของฉัน</span>
                </router-link></li>
                <li><router-link to="/account" class="mobile-tab">
                    <i class="fa-regular fa-user"></i>
                    <span>บัญชีของฉัน</span>
                </router-link></li>
                </ul>
            </nav>
        </footer>
    </div>
  </template>
  
  <script>
    export default {
        name: "Navbar",
        data() {
        return {
            isMobile: false,
        };
        },
        mounted() {
        this.checkViewport();
        window.addEventListener("resize", this.checkViewport);
        },
        methods: {
        checkViewport() {
            this.isMobile = window.innerWidth <= 768; // Define breakpoint for mobile
        },
        },
        beforeDestroy() {
        window.removeEventListener("resize", this.checkViewport);
        },
    };
  </script>
  
  <style scoped>
/* Desktop Navbar */
    .navbar-desktop {
        background-color: #4B5320; /* สีเขียว */
        color: #f8f9fa;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: space-between; /* แบ่งตำแหน่งระหว่างโลโก้, เมนูตรงกลาง และ บัญชี */
        align-items: center;
        padding: 5px 20px; /* ลด Padding ด้านบนและล่าง */
        height: 60px; /* กำหนดความสูงแบบคงที่ */
    }

    .navbar-desktop .logo {
        height: 100%; /* ให้รูปภาพเต็มความสูงของ Navbar */
        object-fit: contain; /* รักษาสัดส่วนของรูปภาพ */
        display: flex; /* จัดให้อยู่ในบรรทัดเดียวกับโลโก้ */
        align-items: center; /* จัดให้อยู่ตรงกลางแนวตั้ง */
        margin-left: 10px; /* ให้โลโก้ชิดซ้าย */
    }

    .navbar-desktop .logo img {
        height: 100px; /* กำหนดความสูงของโลโก้ */
        object-fit: contain;
        margin-right: 10px; /* เว้นระยะห่างระหว่างโลโก้กับข้อความ */
    }

    .navbar-desktop .menu-center {
        display: flex;
        justify-content: center;
        flex-grow: 1; /* ให้เมนูตรงกลางใช้พื้นที่ที่เหลือ */
    }

    .navbar-desktop .menu-center a {
        margin: 0 30px; /* เพิ่มระยะห่างระหว่างเมนู */
        text-decoration: none;
        color: white;
        font-size: 14px;
    }

    .navbar-desktop .account {
        margin-right: 50px; /* ให้บัญชีของฉันชิดขวา */
        display: flex;
        align-items: center;
    }

    .navbar-desktop .account a {
        text-decoration: none;
        color: white;
        font-size: 14px;
    }

    .avatar-link {
        text-decoration: none; /* ลบเส้นใต้ */
    }

    .avatar-img {
        width: 40px; /* ขนาด Avatar */
        height: 40px; /* ขนาด Avatar */
        border-radius: 50%; /* ทำให้เป็นวงกลม */
        border: 2px solid white; /* เส้นขอบสีขาว */
        cursor: pointer; /* เปลี่ยนเป็น pointer เมื่อ hover */
        object-fit: cover; /* รักษาสัดส่วนของรูปภาพ */
    }

    .avatar-link:hover .avatar-img {
        border-color: #cccccc; /* เปลี่ยนสีขอบเมื่อ hover */
    }

    .navbar-desktop nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .desktop-tab {
        text-decoration: none;
        color: white;
        font-size: 16px;
    }

    .desktop-tab i {
        margin-right: 5px;
    }
    
/* Mobile Navbar */
    /* Navbar Header (บนสุด) */
        .mobile-header {
            background-color: #4B5320; /* สีเขียว */
            display: flex;
            justify-content: space-between; /* จัดให้โลโก้และกระดิ่งแยกซ้าย-ขวา */
            align-items: center;
            padding: 0px 15px 0px 3px; /* เพิ่มระยะห่างรอบๆ */
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* เงาเบาๆ */
        }

        .mobile-header .mobile-logo {
            display: flex;
            align-items: center;
        }

        .mobile-header .mobile-logo img {
            height: 80px; /* ขนาดโลโก้ */
            margin-left: -30px;
        }

        .mobile-header .mobile-logo-text {
            font-size: 16px; /* ขนาดตัวอักษร */
            font-weight: bold; /* ตัวหนา */
            color: white; /* สีข้อความ */
        }

        /* ไอคอนกระดิ่ง */
        .mobile-header .mobile-notification {
            font-size: 20px; /* ขนาดไอคอน */
            color: white; /* สีไอคอน */
            cursor: pointer; /* เปลี่ยนเป็น cursor แบบ pointer */
        }

        .mobile-header .mobile-notification:hover {
            color: #cccccc; /* เปลี่ยนสีเมื่อ hover */
        }

    /* Navbar Footer (แท็บด้านล่าง) */
        .navbar-mobile {
            background-color: #f8f9fa; /* สีพื้นหลังอ่อน */
            color: #4B5320; /* สีไอคอน */
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            border-top: 1px solid #e0e0e0;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar-mobile nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .mobile-tab {
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 30px;
            color: #01350e; /* สีเขียวเข้ม */
            text-decoration: none;
        }
        
        .mobile-tab i {
            font-size: 24px;
            color: #01350e;
        }

        .mobile-tab span {
            font-size: 12px;
            margin-top: 5px;
        }

        .mobile-tab:hover i,
        .mobile-tab:hover span {
            color: #008f68; /* สีเขียวเข้มเมื่อ Hover */
        }
  
  </style>
  