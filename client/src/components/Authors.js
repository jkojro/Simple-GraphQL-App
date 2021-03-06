import React, { Component } from 'react';
import { Query } from 'react-apollo';
import gql from 'graphql-tag';
import query from '../queries/getAuthors';

import {
  Loader,
  Segment,
  Dimmer,
  Card,
  Container
} from 'semantic-ui-react';
import { Link } from 'react-router-dom';

class Authors extends Component {
  render() {
    return (
      <Query
        query={query}
      >
        {({ loading, error, data }) => {
          if (loading) return(
            <Segment>
              <Dimmer active>
                <Loader />
              </Dimmer>
            </Segment>
          );
          if (error) return <p>Error</p>;

          return (
            <Container>
              <Card.Group centered>
                {data.authors.map(({ id, name }) => (
                <Card key={id} as={Link} to={`/authors/${id}`}>
                  <Card.Content>
                    <Card.Header>{name}</Card.Header>
                  </Card.Content>
                  <Card.Content extra>
                  </Card.Content>
                </Card>
                ))}
              </Card.Group>
            </Container>
          );
        }}
      </Query>
    )
  }
}
export default Authors;
