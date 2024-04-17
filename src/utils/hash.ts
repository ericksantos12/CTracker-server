import bcrypt from 'bcrypt'

export const generateHash = async (password: string): Promise<string> => {
  return bcrypt.hash(password, 10)
}

export const compareHash = async (password: string, hash: string): Promise<boolean> => {
  return bcrypt.compare(password, hash)
}