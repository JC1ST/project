import React from 'react';
import { Button, Form } from 'react-bootstrap';

const JoinForm = () => {
  return (
    <Form>
      <Form.Group className="mb-3" controlId="formBasicID">
        <Form.Label>ID</Form.Label>
        <Form.Control type="text" placeholder="Enter ID" name="ID" />
        <Form.Text className="text-muted"></Form.Text>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicPassword">
        <Form.Label>PASSWORD</Form.Label>
        <Form.Control
          type="password"
          placeholder="Enter PASSWORD"
          name="PASSWORD"
        />
      </Form.Group>

      <Button variant="primary" type="submit">
        Join
      </Button>
    </Form>
  );
};

export default JoinForm;
