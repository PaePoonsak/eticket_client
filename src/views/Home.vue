<template>
    <div>
      <Navbar />
      <div class="carousel-container">
        <div class="carousel">
          <!-- เพิ่มรูปใน Template -->
          <div class="carousel-item" v-bind:class="{ active: currentSlide === 0 }">
            <img src="@/assets/slide1.jpg" alt="Slide 1" />
          </div>
          <div class="carousel-item" v-bind:class="{ active: currentSlide === 1 }">
            <img src="@/assets/slide2.jpg" alt="Slide 2" />
          </div>
          <div class="carousel-item" v-bind:class="{ active: currentSlide === 2 }">
            <img src="@/assets/slide3.jpg" alt="Slide 3" />
          </div>
          <div class="carousel-item" v-bind:class="{ active: currentSlide === 3 }">
            <img src="@/assets/slide4.jpg" alt="Slide 4" />
          </div>
          <div class="carousel-item" v-bind:class="{ active: currentSlide === 4 }">
            <img src="@/assets/slide5.jpg" alt="Slide 5" />
          </div>
  
          <!-- ปุ่มเลื่อน -->
          <button class="prev" @click="prevSlide">❮</button>
          <button class="next" @click="nextSlide">❯</button>
        </div>
  
        <!-- จุดแสดงสถานะ -->
        <div class="carousel-dots">
          <span
            v-for="index in 5"
            :key="index"
            :class="{ active: currentSlide === index - 1 }"
            @click="goToSlide(index - 1)"
          ></span>
        </div>
      </div>
  
      <!-- รายชื่ออุทยาน -->
      <div class="park-list-section">
        <h2>รายชื่ออุทยาน</h2>
        <div class="card-grid">
          <!-- เพิ่มรูปและรายละเอียดใน Template -->
          <div class="card">
            <img src="@/assets/park1.jpg" alt="Park 1" class="card-image" />
            <div class="card-content">
              <h3 class="card-title">ดอยอินทนนท์</h3>
              <p class="card-description">ยอดเขาสูงสุดในประเทศไทย</p>
            </div>
          </div>
          <div class="card">
            <img src="@/assets/park2.jpg" alt="Park 2" class="card-image" />
            <div class="card-content">
              <h3 class="card-title">อุทยานแห่งชาติคลองสุกเพชร</h3>
              <p class="card-description">ธรรมชาติอุดมสมบูรณ์</p>
            </div>
          </div>
          <div class="card">
            <img src="@/assets/park3.jpg" alt="Park 3" class="card-image" />
            <div class="card-content">
              <h3 class="card-title">หมู่เกาะพีพี</h3>
              <p class="card-description">สถานที่ท่องเที่ยวชื่อดัง</p>
            </div>
          </div>
          <div class="card">
            <img src="@/assets/park4.jpg" alt="Park 4" class="card-image" />
            <div class="card-content">
              <h3 class="card-title">ดอยอินทนนท์</h3>
              <p class="card-description">ยอดนิยมในเชียงใหม่</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>  
  
  <script>
export default {
  data() {
    return {
      currentSlide: 0, // เริ่มต้นที่สไลด์แรก
      carouselImages: [
        "@/assets/slide1.jpg",
        "@/assets/slide2.jpg",
        "@/assets/slide3.jpg",
        "@/assets/slide4.jpg",
        "@/assets/slide5.jpg",
      ],
      parks: [
        {
          name: "ดอยอินทนนท์",
          image: "@/assets/park1.jpg",
        },
        {
          name: "อุทยานแห่งชาติคลองสุกเพชร",
          image: "@/assets/park2.jpg",
        },
        {
          name: "หมู่เกาะพีพี",
          image: "@/assets/park3.jpg",
        },
        {
          name: "ดอยอินทนนท์",
          image: "@/assets/park4.jpg",
        },
      ],
    };
  },
  methods: {
    nextSlide() {
      this.currentSlide = (this.currentSlide + 1) % this.carouselImages.length; // เลื่อนไปสไลด์ถัดไป
    },
    prevSlide() {
      this.currentSlide =
        (this.currentSlide - 1 + this.carouselImages.length) %
        this.carouselImages.length; // เลื่อนไปสไลด์ก่อนหน้า
    },
    goToSlide(index) {
      this.currentSlide = index; // เลื่อนไปสไลด์ที่เลือก
    },
  },
};
</script>
  
  <style scoped>
  .carousel-container {
    width: 100%;
    max-width: 900px;
    margin: 20px auto;
    position: relative;
  }
  
  .carousel {
    overflow: hidden;
    position: relative;
    height: 400px;
  }
  
  .carousel-item {
    display: none;
    position: absolute;
    width: 100%;
    height: 400px;
  }
  
  .carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .carousel-item.active {
    display: block;
  }
  
  .prev,
  .next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    font-size: 24px;
    border-radius: 50%;
  }
  
  .prev {
    left: 10px;
  }
  
  .next {
    right: 10px;
  }
  
  .carousel-dots {
    text-align: center;
    margin-top: 10px;
  }
  
  .carousel-dots span {
    display: inline-block;
    width: 8px;
    height: 8px;
    background-color: gray;
    margin: 0 5px;
    border-radius: 50%;
    cursor: pointer;
  }
  
  .carousel-dots span.active {
    background-color: #01350e; /* สีเขียวเข้ม */
  }

  .promotion-section {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 20px auto;
  max-width: 900px;
  padding: 20px;
  background-color: #f8f9fa;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.promotion-image {
  width: 200px;
  height: 200px;
  object-fit: cover;
  border-radius: 8px;
  margin-right: 20px;
}

.promotion-text {
  max-width: 600px;
}

.promotion-text h2 {
  margin: 0;
  color: #01350e;
  font-size: 24px;
}

.promotion-text p {
  margin-top: 10px;
  color: #4a4a4a;
  line-height: 1.6;
}

/* Section รายชื่ออุทยาน */
.park-list-section {
  margin: 20px;
}

.park-list-section h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

/* Layout สำหรับ Card */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
}

/* Mobile: 2 Card ต่อแถว */
@media (max-width: 768px) {
  .card-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Desktop: 3 Card ต่อแถว */
@media (min-width: 769px) {
  .card-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

.card {
  background-color: #fff;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s;
}

.card:hover {
  transform: translateY(-5px);
}

.card-image {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.card-content {
  padding: 10px;
}

.card-title {
  font-size: 18px;
  color: #01350e;
  margin-bottom: 10px;
}

.card-description {
  font-size: 14px;
  color: #555;
}

  </style>
  