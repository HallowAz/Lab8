# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lab#input'
  get 'lab/input'
  get 'lab/show'
end
