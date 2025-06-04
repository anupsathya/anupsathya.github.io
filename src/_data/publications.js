require('dotenv').config();
const Airtable = require('airtable');

// Configure Airtable with Personal Access Token
const base = new Airtable({
    apiKey: process.env.AIRTABLE_PAT,
    endpointUrl: 'https://api.airtable.com'
}).base(process.env.AIRTABLE_BASE_ID);

// Helper function to safely get field value
const getField = (record, field, defaultValue = '') => {
    try {
        const value = record.get(field);
        return value !== undefined && value !== null ? value : defaultValue;
    } catch (error) {
        console.error(`Error getting field ${field}:`, error);
        return defaultValue;
    }
};

// Helper function to format date
const formatDate = (dateString) => {
    if (!dateString) return new Date();
    try {
        return new Date(dateString);
    } catch (error) {
        console.error('Error parsing date:', dateString, error);
        return new Date();
    }
};

module.exports = async function() {
    try {
        console.log('Fetching publications from Airtable...');
        
        if (!process.env.AIRTABLE_PAT || !process.env.AIRTABLE_BASE_ID) {
            console.error('Missing Airtable credentials in .env file');
            return [];
        }

        const records = await base('Publications')
            .select({
                view: 'Grid view',
                sort: [{field: 'Date', direction: 'desc'}]
            })
            .all();

        console.log(`Found ${records.length} publications`);

        const publications = records.map(record => {
            try {
                const pub = {
                    id: record.id,
                    conference: getField(record, 'Conference'),
                    title: getField(record, 'Title'),
                    authors: getField(record, 'Authors'),
                    paperUrl: getField(record, 'Paper URL'),
                    pdfUrl: getField(record, 'PDF URL'),
                    date: formatDate(getField(record, 'Date')),
                };

                // Handle preview image with fallback
                const previewImage = getField(record, 'Preview Image');
                pub.previewImage = previewImage && previewImage[0] ? previewImage[0].url : 'https://placehold.co/400x225';

                console.log('Processed publication:', pub.title);
                return pub;
            } catch (error) {
                console.error('Error processing record:', error);
                return null;
            }
        }).filter(Boolean); // Remove any null entries

        return publications;
    } catch (error) {
        console.error('Error fetching publications:', error);
        return [];
    }
}; 