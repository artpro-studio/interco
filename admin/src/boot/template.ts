import { boot } from 'quasar/wrappers';
import { TemplateComponents } from 'src/template/export';

export default boot(async ({ app }) => {
    for (const key in TemplateComponents) {
        console.log('key', key);
        app.component(key, (TemplateComponents as any)[key]);
    }
});
