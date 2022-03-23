import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders page 1', () => {
  render(<App />);
  const linkElement = screen.getByText(/page 1/i);
  expect(linkElement).toBeInTheDocument();
});

test('renders page 2', () => {
  render(<App />);
  const linkElement = screen.getByText(/page 2/i);
  expect(linkElement).toBeInTheDocument();
});
