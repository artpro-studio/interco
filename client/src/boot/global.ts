import { defineBoot } from '@quasar/app-vite/wrappers';
import AOS from 'aos';
import 'aos/dist/aos.css';
import store from 'src/store';

export default defineBoot(({ app }) => {
   app.use(store)
   // Инициализация AOS
   AOS.init({
    duration: 500, // Длительность анимации
    once: true, // Анимация происходит только один раз
	offset: 0,     // Сдвиг для активации анимации раньше
  });

  // Можно добавить настройку глобально, если нужно
  app.config.globalProperties.$AOS = AOS;
});
