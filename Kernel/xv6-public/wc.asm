
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 9d 04 00 00       	call   4d9 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 63 04 00 00       	call   4c1 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 2e 04 00 00       	call   499 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 8b 09 00 00       	push   $0x98b
  73:	6a 01                	push   $0x1
  75:	e8 86 05 00 00       	call   600 <printf>
      exit();
  7a:	e8 1a 04 00 00       	call   499 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 7d 09 00 00       	push   $0x97d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 07 04 00 00       	call   499 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 60 0d 00 00       	push   $0xd60
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 d4 03 00 00       	call   4b1 <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 60 0d 00 00 	movsbl 0xd60(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 68 09 00 00       	push   $0x968
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 7e 09 00 00       	push   $0x97e
 15c:	6a 01                	push   $0x1
 15e:	e8 9d 04 00 00       	call   600 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 6e 09 00 00       	push   $0x96e
 175:	6a 01                	push   $0x1
 177:	e8 84 04 00 00       	call   600 <printf>
    exit();
 17c:	e8 18 03 00 00       	call   499 <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
uint locked;
};

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 d1 01 00 00       	call   4b1 <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 93 01 00 00       	call   4d9 <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 96 01 00 00       	call   4f1 <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 5c 01 00 00       	call   4c1 <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:


//thread library
int
thread_create(void(*start_routine)(void*,void*),void* arg1 ,void* arg2)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 14             	sub    $0x14,%esp
void* stack;
stack =sbrk(4096);  //pgsize
 3fa:	68 00 10 00 00       	push   $0x1000
 3ff:	e8 1d 01 00 00       	call   521 <sbrk>
return clone(start_routine,arg1,arg2,stack);
 404:	50                   	push   %eax
 405:	ff 75 10             	pushl  0x10(%ebp)
 408:	ff 75 0c             	pushl  0xc(%ebp)
 40b:	ff 75 08             	pushl  0x8(%ebp)
 40e:	e8 26 01 00 00       	call   539 <clone>
}
 413:	c9                   	leave  
 414:	c3                   	ret    
 415:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <thread_join>:
int thread_join()
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 42a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 42d:	50                   	push   %eax
 42e:	e8 0e 01 00 00       	call   541 <join>
  
  return x;
}
 433:	c9                   	leave  
 434:	c3                   	ret    
 435:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <lock_init>:

void lock_init(struct lock_t *lk){
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    
 452:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000460 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 465:	b9 01 00 00 00       	mov    $0x1,%ecx
 46a:	89 e5                	mov    %esp,%ebp
 46c:	8b 55 08             	mov    0x8(%ebp),%edx
 46f:	90                   	nop
 470:	89 c8                	mov    %ecx,%eax
 472:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 475:	85 c0                	test   %eax,%eax
 477:	75 f7                	jne    470 <lock_acquire+0x10>
}
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <lock_release>:
void lock_release(struct lock_t *lk){
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	31 c0                	xor    %eax,%eax
 487:	89 e5                	mov    %esp,%ebp
 489:	8b 55 08             	mov    0x8(%ebp),%edx
 48c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 491:	b8 01 00 00 00       	mov    $0x1,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <exit>:
SYSCALL(exit)
 499:	b8 02 00 00 00       	mov    $0x2,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <wait>:
SYSCALL(wait)
 4a1:	b8 03 00 00 00       	mov    $0x3,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <pipe>:
SYSCALL(pipe)
 4a9:	b8 04 00 00 00       	mov    $0x4,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <read>:
SYSCALL(read)
 4b1:	b8 05 00 00 00       	mov    $0x5,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <write>:
SYSCALL(write)
 4b9:	b8 10 00 00 00       	mov    $0x10,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <close>:
SYSCALL(close)
 4c1:	b8 15 00 00 00       	mov    $0x15,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <kill>:
SYSCALL(kill)
 4c9:	b8 06 00 00 00       	mov    $0x6,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <exec>:
SYSCALL(exec)
 4d1:	b8 07 00 00 00       	mov    $0x7,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <open>:
SYSCALL(open)
 4d9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <mknod>:
SYSCALL(mknod)
 4e1:	b8 11 00 00 00       	mov    $0x11,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <unlink>:
SYSCALL(unlink)
 4e9:	b8 12 00 00 00       	mov    $0x12,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <fstat>:
SYSCALL(fstat)
 4f1:	b8 08 00 00 00       	mov    $0x8,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <link>:
SYSCALL(link)
 4f9:	b8 13 00 00 00       	mov    $0x13,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <mkdir>:
SYSCALL(mkdir)
 501:	b8 14 00 00 00       	mov    $0x14,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <chdir>:
SYSCALL(chdir)
 509:	b8 09 00 00 00       	mov    $0x9,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <dup>:
SYSCALL(dup)
 511:	b8 0a 00 00 00       	mov    $0xa,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <getpid>:
SYSCALL(getpid)
 519:	b8 0b 00 00 00       	mov    $0xb,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <sbrk>:
SYSCALL(sbrk)
 521:	b8 0c 00 00 00       	mov    $0xc,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <sleep>:
SYSCALL(sleep)
 529:	b8 0d 00 00 00       	mov    $0xd,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <uptime>:
SYSCALL(uptime)
 531:	b8 0e 00 00 00       	mov    $0xe,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <clone>:
SYSCALL(clone)
 539:	b8 16 00 00 00       	mov    $0x16,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <join>:
 541:	b8 17 00 00 00       	mov    $0x17,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    
 549:	66 90                	xchg   %ax,%ax
 54b:	66 90                	xchg   %ax,%ax
 54d:	66 90                	xchg   %ax,%ax
 54f:	90                   	nop

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55c:	89 d1                	mov    %edx,%ecx
{
 55e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 561:	85 d2                	test   %edx,%edx
 563:	0f 89 7f 00 00 00    	jns    5e8 <printint+0x98>
 569:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 56d:	74 79                	je     5e8 <printint+0x98>
    neg = 1;
 56f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 576:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 578:	31 db                	xor    %ebx,%ebx
 57a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 cf                	mov    %ecx,%edi
 586:	f7 75 c4             	divl   -0x3c(%ebp)
 589:	0f b6 92 a8 09 00 00 	movzbl 0x9a8(%edx),%edx
 590:	89 45 c0             	mov    %eax,-0x40(%ebp)
 593:	89 d8                	mov    %ebx,%eax
 595:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 598:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 59b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 59e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5a1:	76 dd                	jbe    580 <printint+0x30>
  if(neg)
 5a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5a6:	85 c9                	test   %ecx,%ecx
 5a8:	74 0c                	je     5b6 <printint+0x66>
    buf[i++] = '-';
 5aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5bd:	eb 07                	jmp    5c6 <printint+0x76>
 5bf:	90                   	nop
 5c0:	0f b6 13             	movzbl (%ebx),%edx
 5c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5cc:	6a 01                	push   $0x1
 5ce:	56                   	push   %esi
 5cf:	57                   	push   %edi
 5d0:	e8 e4 fe ff ff       	call   4b9 <write>
  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x70>
    putc(fd, buf[i]);
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ef:	eb 87                	jmp    578 <printint+0x28>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	56                   	push   %esi
 609:	53                   	push   %ebx
 60a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 60d:	8b 75 0c             	mov    0xc(%ebp),%esi
 610:	0f b6 1e             	movzbl (%esi),%ebx
 613:	84 db                	test   %bl,%bl
 615:	0f 84 b4 00 00 00    	je     6cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 61b:	8d 45 10             	lea    0x10(%ebp),%eax
 61e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 621:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 624:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 626:	89 45 d0             	mov    %eax,-0x30(%ebp)
 629:	eb 33                	jmp    65e <printf+0x5e>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
 630:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 633:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	74 17                	je     654 <printf+0x54>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	88 5d e7             	mov    %bl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	57                   	push   %edi
 646:	ff 75 08             	pushl  0x8(%ebp)
 649:	e8 6b fe ff ff       	call   4b9 <write>
 64e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 651:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 654:	0f b6 1e             	movzbl (%esi),%ebx
 657:	83 c6 01             	add    $0x1,%esi
 65a:	84 db                	test   %bl,%bl
 65c:	74 71                	je     6cf <printf+0xcf>
    c = fmt[i] & 0xff;
 65e:	0f be cb             	movsbl %bl,%ecx
 661:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 664:	85 d2                	test   %edx,%edx
 666:	74 c8                	je     630 <printf+0x30>
      }
    } else if(state == '%'){
 668:	83 fa 25             	cmp    $0x25,%edx
 66b:	75 e7                	jne    654 <printf+0x54>
      if(c == 'd'){
 66d:	83 f8 64             	cmp    $0x64,%eax
 670:	0f 84 9a 00 00 00    	je     710 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 676:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 67c:	83 f9 70             	cmp    $0x70,%ecx
 67f:	74 5f                	je     6e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 681:	83 f8 73             	cmp    $0x73,%eax
 684:	0f 84 d6 00 00 00    	je     760 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 68a:	83 f8 63             	cmp    $0x63,%eax
 68d:	0f 84 8d 00 00 00    	je     720 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 693:	83 f8 25             	cmp    $0x25,%eax
 696:	0f 84 b4 00 00 00    	je     750 <printf+0x150>
  write(fd, &c, 1);
 69c:	83 ec 04             	sub    $0x4,%esp
 69f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6a3:	6a 01                	push   $0x1
 6a5:	57                   	push   %edi
 6a6:	ff 75 08             	pushl  0x8(%ebp)
 6a9:	e8 0b fe ff ff       	call   4b9 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6b1:	83 c4 0c             	add    $0xc,%esp
 6b4:	6a 01                	push   $0x1
 6b6:	83 c6 01             	add    $0x1,%esi
 6b9:	57                   	push   %edi
 6ba:	ff 75 08             	pushl  0x8(%ebp)
 6bd:	e8 f7 fd ff ff       	call   4b9 <write>
  for(i = 0; fmt[i]; i++){
 6c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6cb:	84 db                	test   %bl,%bl
 6cd:	75 8f                	jne    65e <printf+0x5e>
    }
  }
}
 6cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d2:	5b                   	pop    %ebx
 6d3:	5e                   	pop    %esi
 6d4:	5f                   	pop    %edi
 6d5:	5d                   	pop    %ebp
 6d6:	c3                   	ret    
 6d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e8:	6a 00                	push   $0x0
 6ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	8b 13                	mov    (%ebx),%edx
 6f2:	e8 59 fe ff ff       	call   550 <printint>
        ap++;
 6f7:	89 d8                	mov    %ebx,%eax
 6f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fc:	31 d2                	xor    %edx,%edx
        ap++;
 6fe:	83 c0 04             	add    $0x4,%eax
 701:	89 45 d0             	mov    %eax,-0x30(%ebp)
 704:	e9 4b ff ff ff       	jmp    654 <printf+0x54>
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
 718:	6a 01                	push   $0x1
 71a:	eb ce                	jmp    6ea <printf+0xea>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 720:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 726:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
        ap++;
 72a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 72d:	57                   	push   %edi
 72e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 731:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 734:	e8 80 fd ff ff       	call   4b9 <write>
        ap++;
 739:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 73c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73f:	31 d2                	xor    %edx,%edx
 741:	e9 0e ff ff ff       	jmp    654 <printf+0x54>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 750:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
 756:	e9 59 ff ff ff       	jmp    6b4 <printf+0xb4>
 75b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop
        s = (char*)*ap;
 760:	8b 45 d0             	mov    -0x30(%ebp),%eax
 763:	8b 18                	mov    (%eax),%ebx
        ap++;
 765:	83 c0 04             	add    $0x4,%eax
 768:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 76b:	85 db                	test   %ebx,%ebx
 76d:	74 17                	je     786 <printf+0x186>
        while(*s != 0){
 76f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 772:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 774:	84 c0                	test   %al,%al
 776:	0f 84 d8 fe ff ff    	je     654 <printf+0x54>
 77c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 77f:	89 de                	mov    %ebx,%esi
 781:	8b 5d 08             	mov    0x8(%ebp),%ebx
 784:	eb 1a                	jmp    7a0 <printf+0x1a0>
          s = "(null)";
 786:	bb 9f 09 00 00       	mov    $0x99f,%ebx
        while(*s != 0){
 78b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 78e:	b8 28 00 00 00       	mov    $0x28,%eax
 793:	89 de                	mov    %ebx,%esi
 795:	8b 5d 08             	mov    0x8(%ebp),%ebx
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7a3:	83 c6 01             	add    $0x1,%esi
 7a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7a9:	6a 01                	push   $0x1
 7ab:	57                   	push   %edi
 7ac:	53                   	push   %ebx
 7ad:	e8 07 fd ff ff       	call   4b9 <write>
        while(*s != 0){
 7b2:	0f b6 06             	movzbl (%esi),%eax
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	84 c0                	test   %al,%al
 7ba:	75 e4                	jne    7a0 <printf+0x1a0>
 7bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7bf:	31 d2                	xor    %edx,%edx
 7c1:	e9 8e fe ff ff       	jmp    654 <printf+0x54>
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	f3 0f 1e fb          	endbr32 
 7d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d5:	a1 40 0d 00 00       	mov    0xd40,%eax
{
 7da:	89 e5                	mov    %esp,%ebp
 7dc:	57                   	push   %edi
 7dd:	56                   	push   %esi
 7de:	53                   	push   %ebx
 7df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e7:	39 c8                	cmp    %ecx,%eax
 7e9:	73 15                	jae    800 <free+0x30>
 7eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
 7f0:	39 d1                	cmp    %edx,%ecx
 7f2:	72 14                	jb     808 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f4:	39 d0                	cmp    %edx,%eax
 7f6:	73 10                	jae    808 <free+0x38>
{
 7f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fa:	8b 10                	mov    (%eax),%edx
 7fc:	39 c8                	cmp    %ecx,%eax
 7fe:	72 f0                	jb     7f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 800:	39 d0                	cmp    %edx,%eax
 802:	72 f4                	jb     7f8 <free+0x28>
 804:	39 d1                	cmp    %edx,%ecx
 806:	73 f0                	jae    7f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 808:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80e:	39 fa                	cmp    %edi,%edx
 810:	74 1e                	je     830 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 812:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 815:	8b 50 04             	mov    0x4(%eax),%edx
 818:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 81b:	39 f1                	cmp    %esi,%ecx
 81d:	74 28                	je     847 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 821:	5b                   	pop    %ebx
  freep = p;
 822:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 827:	5e                   	pop    %esi
 828:	5f                   	pop    %edi
 829:	5d                   	pop    %ebp
 82a:	c3                   	ret    
 82b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	75 d8                	jne    81f <free+0x4f>
    p->s.size += bp->s.size;
 847:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 84a:	a3 40 0d 00 00       	mov    %eax,0xd40
    p->s.size += bp->s.size;
 84f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 852:	8b 53 f8             	mov    -0x8(%ebx),%edx
 855:	89 10                	mov    %edx,(%eax)
}
 857:	5b                   	pop    %ebx
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 860:	f3 0f 1e fb          	endbr32 
 864:	55                   	push   %ebp
 865:	89 e5                	mov    %esp,%ebp
 867:	57                   	push   %edi
 868:	56                   	push   %esi
 869:	53                   	push   %ebx
 86a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 870:	8b 3d 40 0d 00 00    	mov    0xd40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 876:	8d 70 07             	lea    0x7(%eax),%esi
 879:	c1 ee 03             	shr    $0x3,%esi
 87c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 87f:	85 ff                	test   %edi,%edi
 881:	0f 84 a9 00 00 00    	je     930 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 887:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 889:	8b 48 04             	mov    0x4(%eax),%ecx
 88c:	39 f1                	cmp    %esi,%ecx
 88e:	73 6d                	jae    8fd <malloc+0x9d>
 890:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 896:	bb 00 10 00 00       	mov    $0x1000,%ebx
 89b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 89e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8a8:	eb 17                	jmp    8c1 <malloc+0x61>
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8b5:	39 f1                	cmp    %esi,%ecx
 8b7:	73 4f                	jae    908 <malloc+0xa8>
 8b9:	8b 3d 40 0d 00 00    	mov    0xd40,%edi
 8bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c1:	39 c7                	cmp    %eax,%edi
 8c3:	75 eb                	jne    8b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8c5:	83 ec 0c             	sub    $0xc,%esp
 8c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8cb:	e8 51 fc ff ff       	call   521 <sbrk>
  if(p == (char*)-1)
 8d0:	83 c4 10             	add    $0x10,%esp
 8d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d6:	74 1b                	je     8f3 <malloc+0x93>
  hp->s.size = nu;
 8d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8db:	83 ec 0c             	sub    $0xc,%esp
 8de:	83 c0 08             	add    $0x8,%eax
 8e1:	50                   	push   %eax
 8e2:	e8 e9 fe ff ff       	call   7d0 <free>
  return freep;
 8e7:	a1 40 0d 00 00       	mov    0xd40,%eax
      if((p = morecore(nunits)) == 0)
 8ec:	83 c4 10             	add    $0x10,%esp
 8ef:	85 c0                	test   %eax,%eax
 8f1:	75 bd                	jne    8b0 <malloc+0x50>
        return 0;
  }
}
 8f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8f6:	31 c0                	xor    %eax,%eax
}
 8f8:	5b                   	pop    %ebx
 8f9:	5e                   	pop    %esi
 8fa:	5f                   	pop    %edi
 8fb:	5d                   	pop    %ebp
 8fc:	c3                   	ret    
    if(p->s.size >= nunits){
 8fd:	89 c2                	mov    %eax,%edx
 8ff:	89 f8                	mov    %edi,%eax
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 908:	39 ce                	cmp    %ecx,%esi
 90a:	74 54                	je     960 <malloc+0x100>
        p->s.size -= nunits;
 90c:	29 f1                	sub    %esi,%ecx
 90e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 911:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 914:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 917:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 91c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 91f:	8d 42 08             	lea    0x8(%edx),%eax
}
 922:	5b                   	pop    %ebx
 923:	5e                   	pop    %esi
 924:	5f                   	pop    %edi
 925:	5d                   	pop    %ebp
 926:	c3                   	ret    
 927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 930:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 937:	0d 00 00 
    base.s.size = 0;
 93a:	bf 44 0d 00 00       	mov    $0xd44,%edi
    base.s.ptr = freep = prevp = &base;
 93f:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 946:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 949:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 94b:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 952:	00 00 00 
    if(p->s.size >= nunits){
 955:	e9 36 ff ff ff       	jmp    890 <malloc+0x30>
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 960:	8b 0a                	mov    (%edx),%ecx
 962:	89 08                	mov    %ecx,(%eax)
 964:	eb b1                	jmp    917 <malloc+0xb7>
