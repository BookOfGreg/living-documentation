import React, { Component } from 'react';
import PropTypes from 'prop-types';

import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem
} from 'reactstrap';

class NavigationBar extends Component {
  constructor(props) {
    super(props);

    this.state = {
      isOpen: false
    };
  }

  toggle = () => {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }

  createNavItems(links) {
    return links.map((link, idx) => {
      return (
        <NavItem key={idx}>
          <NavLink href={link.path}>{link.title}</NavLink>
        </NavItem>
      );
    });
  }

  render() {
    const { navbarBrand, enabledLinks } = this.props;

    return (
      <div>
        <Navbar color="faded" light expand="md">
          <NavbarBrand href="/">{navbarBrand}</NavbarBrand>
          <NavbarToggler onClick={this.toggle} />
          <Collapse isOpen={this.state.isOpen} navbar>
            <Nav className="ml-auto" navbar>
              {this.createNavItems(enabledLinks)}
            </Nav>
          </Collapse>
        </Navbar>
      </div>
    );
  }
};

NavigationBar.propTypes = {
  navbarBrand: PropTypes.string
};

export default NavigationBar;
