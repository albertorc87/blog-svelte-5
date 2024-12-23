export function getFirstParagraph(htmlContent: string): string {
	const match = htmlContent.match(/<p>.*?<\/p>/s);
	return match ? match[0] : '';
}
