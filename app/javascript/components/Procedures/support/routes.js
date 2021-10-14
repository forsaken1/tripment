const API_PREFIX = '/api/v1'

export function procedures(search = '') { return `${API_PREFIX}/procedures?search=${search}` }
