import moment from 'moment';

export const neatDate = (date) => {
  return moment(date).format('DD/MM/YYYY');
};
