import moment from 'moment';

export const relativeTime = (date) => {
  const now = moment();
  const messageTime = moment(date);
  const diff = now.diff(messageTime, 'days');

  if (diff < 1){
    return messageTime.format('HH:mm');
  } else if (1 <= diff && diff <= 7){
    return `${diff} days ago`;
  } else {
    return messageTime.format('DD/MM/YYYY');
  }
};
