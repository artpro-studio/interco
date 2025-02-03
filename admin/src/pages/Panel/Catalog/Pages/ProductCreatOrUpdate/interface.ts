import {CreateProductCommercialOffersDto, PropertyLinksValuesDto} from 'src/ApiClient/ApiClient';

export interface IPropertyLinksValues extends PropertyLinksValuesDto {
    isLoading: boolean,
};

export interface ICreateProductCommercialOffersDto extends CreateProductCommercialOffersDto {
    isChecked: boolean
}
