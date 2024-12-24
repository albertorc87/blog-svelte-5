export function convertToString(value: FormDataEntryValue | null): string {
	return value ? value.toString() : '';
}
