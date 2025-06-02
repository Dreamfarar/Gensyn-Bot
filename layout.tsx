export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  // дожидаемся headers()
  const headerList = await headers();

  // теперь можно вызвать .get
  const initialState = cookieToInitialState(
    config,
    headerList.get("cookie") ?? undefined,
  );

  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers initialState={initialState}>{children}</Providers>
      </body>
    </html>
  );
}
