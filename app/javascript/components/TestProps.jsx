import React from 'react';
import { Table } from 'reactstrap';

class TestProps extends React.Component {
  render() {
    const { data } = this.props;
    console.log('----data', data);
    return (
      <div>
        hi
      </div>
    );
  }
}

export default TestProps;
