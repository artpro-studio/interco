export default function UseMoneyUntil() {
    const moneyFormat = (data: string): string => {
        const money =  parseFloat(data).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1 ').replace('.', ',');
        return `${money} <i class="material-icons" aria-hidden="true" role="presentation">currency_ruble</i>`;
    };

    return {
        moneyFormat
    };
}
