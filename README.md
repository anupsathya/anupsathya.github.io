# Personal Website

This is my personal website built with [11ty](https://www.11ty.dev/), featuring an interactive canvas animation and a publications showcase powered by Airtable.

## Project Structure

```
.
├── src/
│   ├── _data/          # Site data files
│   │   └── publications.js  # Airtable data fetching
│   ├── _includes/      # Reusable components
│   ├── _layouts/       # Layout templates
│   │   └── base.njk    # Base layout with navigation and footer
│   ├── css/
│   │   └── styles.css  # Main stylesheet
│   ├── images/         # Image assets
│   ├── js/            # JavaScript files
│   ├── about.njk       # About page
│   ├── blog.njk        # Blog listing page
│   ├── index.njk       # Home page with canvas animation
│   └── publications.njk # Publications showcase
├── .eleventy.js        # 11ty configuration
├── package.json        # Project dependencies and scripts
└── README.md          # This file
```

## Features

1. **Interactive Home Page**
   - Canvas animation with eye-tracking effect
   - Pastel color scheme
   - Responsive design

2. **Publications Showcase**
   - Dynamic content from Airtable
   - Clean, academic-style layout
   - Publication previews with images
   - Links to papers and additional resources

3. **Responsive Navigation**
   - Mobile-friendly design
   - Smooth transitions
   - Consistent layout across pages

## Development

### Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)
- Airtable Personal Access Token

### Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Set up Airtable integration:
   - Create a `.env` file in the root directory
   - Add your Airtable Personal Access Token:
     ```
     AIRTABLE_ACCESS_TOKEN=your_access_token_here
     ```

4. Start the development server:
   ```bash
   npm start
   ```

The site will be available at `http://localhost:8080`

### Building for Production

```bash
npm run build
```

The built site will be in the `_site` directory.

## CSS Structure

The CSS is organized into logical sections:

1. **Base Styles and Variables**
   - CSS Custom Properties (variables)
   - Reset styles
   - Typography base

2. **Layout & Navigation**
   - Header and footer styles
   - Navigation components
   - Page layout utilities

3. **Publications Page**
   - Publication card layout
   - Image and content styling
   - Link styles

4. **Home Page Canvas**
   - Canvas container
   - Animation styles

5. **Responsive Design**
   - Mobile-first approach
   - Breakpoint adjustments

## Adding Content

### Publications Management

Publications are managed through Airtable. The base should have a table with the following fields:

- `title`: Publication title
- `authors`: List of authors
- `conference`: Conference or journal name
- `date`: Publication date
- `paperUrl`: Link to the paper
- `pdfUrl`: Link to PDF version (optional)
- `previewImage`: URL to preview image

The data is automatically fetched during build time using the Airtable API. To update publications:

1. Add or modify entries in your Airtable base
2. The changes will be reflected when you rebuild the site

The publications are automatically sorted by year and displayed in reverse chronological order.

## License

MIT License - feel free to use this code for your own personal website! 