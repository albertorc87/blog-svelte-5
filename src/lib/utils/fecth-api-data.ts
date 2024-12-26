
export function loadPaginateData(offset: number, url: string): Promise<Response> {
    return new Promise((resolve, reject) => {
        setTimeout(async () => {
            try {
                const response = await fetch(`${url}?offset=${offset}`, {
                    method: 'GET',
                    headers: {
                        Accept: 'application/json',
                        'Content-Type': 'application/json'
                    },
                });

                if (response.ok) {
                    resolve(response);
                } else {
                    reject(new Error(`Failed with status: ${response.status}`));
                }
            } catch (err) {
                reject(err);
            }
        }, 2000);
    });
}