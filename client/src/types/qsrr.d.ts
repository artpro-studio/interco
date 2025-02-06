// src/types/ssrContext.d.ts
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { QSsrContext } from 'quasar';

declare module 'quasar' {
  // Расширяем интерфейс QSsrContext
  // Мы добавляем свойство seoData, но не затираем остальные свойства
  interface QSsrContext {
    seoData?: { title: string, description?: string, keywords?: string };
  }
}
