-- Minimal schema for SolarPortal

CREATE TABLE homeowners (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    phone TEXT,
    status TEXT,
    verification_code TEXT,
    verification_expires TIMESTAMP,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE installers (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    establishmentDate DATE,
    registrationNumber TEXT,
    licenseNumber TEXT,
    specialties TEXT[],
    serviceCounties TEXT[],
    contact JSONB,
    status TEXT,
    verification_code TEXT,
    verification_expires TIMESTAMP,
    logoDataUrl TEXT,
    about TEXT,
    portfolio JSONB,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    status TEXT,
    role TEXT,
    permissions JSONB,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE projects (
    id TEXT PRIMARY KEY,
    homeownerId TEXT REFERENCES homeowners(id),
    address JSONB,
    energyBill NUMERIC,
    roofType TEXT,
    notes TEXT,
    wantsBattery BOOLEAN,
    photoDataUrl TEXT,
    status TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add more tables as needed for your app (quotes, reviews, blog_posts, etc.)