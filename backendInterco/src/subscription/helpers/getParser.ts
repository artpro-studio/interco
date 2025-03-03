import { SendsSubscriptionDto } from '../dto/sends-subscription/sends-subscription.dto';

export function publicFormatterSendsSubscription(body: SendsSubscriptionDto) {
    const title: any = {};
    body.title?.forEach((el) => {
        title[el.lang] = el.value;
    });

    const description: any = {};
    body.description?.forEach((el) => {
        description[el.lang] = el.value;
    });

    return {
        ...body,
        title,
        description,
    };
}

export function publicFormatterListSendsSubscription(
    body: SendsSubscriptionDto[]
) {
    console.log(body);
    const result: any = [];
    body.forEach((el) => {
        result.push(publicFormatterSendsSubscription(el));
    });

    return result;
}
