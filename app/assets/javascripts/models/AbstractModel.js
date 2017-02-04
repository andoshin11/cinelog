import pluralize from 'pluralize';

import ObjectKeyTranslator from './../utils/object_key_translator';

export default class AbstractModel {
  constructor(obj) {
    Object.assign(this, obj);
  }

  get routes() {
    const model = pluralize(ObjectKeyTranslator.camelToSnake(this.constructor.name).toLowerCase());

    return Object.freeze({
      show: `/${model}/${this.id}`,
      edit: `/${model}/${this.id}/edit`,
    });
  }

  static get routes() {
    const model = pluralize(ObjectKeyTranslator.camelToSnake(this.name).toLowerCase());

    return Object.freeze({
      index: `/${model}`,
      new: `/${model}/new`,
    });
  }
}
