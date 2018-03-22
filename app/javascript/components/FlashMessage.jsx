import React, { Component } from 'react';
import PropTypes from 'prop-types';

import { UncontrolledAlert } from 'reactstrap';

function FlashMessage({ type, message }) {
  let alertType = type === 'notice' ? 'success' : 'warning';

  if (!message) {
    return <div></div>;
  }

  return (
    <UncontrolledAlert color={alertType}>
      {message}
    </UncontrolledAlert>
  );
}

FlashMessage.propTypes = {
  type: PropTypes.string,
  message: PropTypes.string,
};

export default FlashMessage;
