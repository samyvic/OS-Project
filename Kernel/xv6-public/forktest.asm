
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   a:	e8 41 00 00 00       	call   50 <forktest>
  exit();
   f:	e8 45 04 00 00       	call   459 <exit>
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <printf>:
{
  20:	f3 0f 1e fb          	endbr32 
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %ebx
  28:	83 ec 10             	sub    $0x10,%esp
  2b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2e:	53                   	push   %ebx
  2f:	e8 9c 01 00 00       	call   1d0 <strlen>
  34:	83 c4 0c             	add    $0xc,%esp
  37:	50                   	push   %eax
  38:	53                   	push   %ebx
  39:	ff 75 08             	pushl  0x8(%ebp)
  3c:	e8 38 04 00 00       	call   479 <write>
}
  41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  44:	83 c4 10             	add    $0x10,%esp
  47:	c9                   	leave  
  48:	c3                   	ret    
  49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000050 <forktest>:
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	53                   	push   %ebx
  for(n=0; n<N; n++){
  58:	31 db                	xor    %ebx,%ebx
{
  5a:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  5d:	68 0c 05 00 00       	push   $0x50c
  62:	e8 69 01 00 00       	call   1d0 <strlen>
  67:	83 c4 0c             	add    $0xc,%esp
  6a:	50                   	push   %eax
  6b:	68 0c 05 00 00       	push   $0x50c
  70:	6a 01                	push   $0x1
  72:	e8 02 04 00 00       	call   479 <write>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	eb 15                	jmp    91 <forktest+0x41>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
  80:	74 58                	je     da <forktest+0x8a>
  for(n=0; n<N; n++){
  82:	83 c3 01             	add    $0x1,%ebx
  85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8b:	0f 84 92 00 00 00    	je     123 <forktest+0xd3>
    pid = fork();
  91:	e8 bb 03 00 00       	call   451 <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 bc 03 00 00       	call   461 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 36                	js     df <forktest+0x8f>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 ae 03 00 00       	call   461 <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 49                	jne    101 <forktest+0xb1>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 3e 05 00 00       	push   $0x53e
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 3e 05 00 00       	push   $0x53e
  ce:	6a 01                	push   $0x1
  d0:	e8 a4 03 00 00       	call   479 <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
      exit();
  da:	e8 7a 03 00 00       	call   459 <exit>
  write(fd, s, strlen(s));
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	68 17 05 00 00       	push   $0x517
  e7:	e8 e4 00 00 00       	call   1d0 <strlen>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	50                   	push   %eax
  f0:	68 17 05 00 00       	push   $0x517
  f5:	6a 01                	push   $0x1
  f7:	e8 7d 03 00 00       	call   479 <write>
      exit();
  fc:	e8 58 03 00 00       	call   459 <exit>
  write(fd, s, strlen(s));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	68 2b 05 00 00       	push   $0x52b
 109:	e8 c2 00 00 00       	call   1d0 <strlen>
 10e:	83 c4 0c             	add    $0xc,%esp
 111:	50                   	push   %eax
 112:	68 2b 05 00 00       	push   $0x52b
 117:	6a 01                	push   $0x1
 119:	e8 5b 03 00 00       	call   479 <write>
    exit();
 11e:	e8 36 03 00 00       	call   459 <exit>
  write(fd, s, strlen(s));
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	68 4c 05 00 00       	push   $0x54c
 12b:	e8 a0 00 00 00       	call   1d0 <strlen>
 130:	83 c4 0c             	add    $0xc,%esp
 133:	50                   	push   %eax
 134:	68 4c 05 00 00       	push   $0x54c
 139:	6a 01                	push   $0x1
 13b:	e8 39 03 00 00       	call   479 <write>
    exit();
 140:	e8 14 03 00 00       	call   459 <exit>
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
uint locked;
};

char*
strcpy(char *s, const char *t)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 155:	31 c0                	xor    %eax,%eax
{
 157:	89 e5                	mov    %esp,%ebp
 159:	53                   	push   %ebx
 15a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	89 c8                	mov    %ecx,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18e:	0f b6 01             	movzbl (%ecx),%eax
 191:	0f b6 1a             	movzbl (%edx),%ebx
 194:	84 c0                	test   %al,%al
 196:	75 19                	jne    1b1 <strcmp+0x31>
 198:	eb 26                	jmp    1c0 <strcmp+0x40>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 1a             	movzbl (%edx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	38 d8                	cmp    %bl,%al
 1b3:	74 eb                	je     1a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1b5:	29 d8                	sub    %ebx,%eax
}
 1b7:	5b                   	pop    %ebx
 1b8:	5d                   	pop    %ebp
 1b9:	c3                   	ret    
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 3a 00             	cmpb   $0x0,(%edx)
 1dd:	74 21                	je     200 <strlen+0x30>
 1df:	31 c0                	xor    %eax,%eax
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1ef:	89 c1                	mov    %eax,%ecx
 1f1:	75 f5                	jne    1e8 <strlen+0x18>
    ;
  return n;
}
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	89 d7                	mov    %edx,%edi
 223:	fc                   	cld    
 224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 226:	89 d0                	mov    %edx,%eax
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 23e:	0f b6 10             	movzbl (%eax),%edx
 241:	84 d2                	test   %dl,%dl
 243:	75 16                	jne    25b <strchr+0x2b>
 245:	eb 21                	jmp    268 <strchr+0x38>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
 250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 254:	83 c0 01             	add    $0x1,%eax
 257:	84 d2                	test   %dl,%dl
 259:	74 0d                	je     268 <strchr+0x38>
    if(*s == c)
 25b:	38 d1                	cmp    %dl,%cl
 25d:	75 f1                	jne    250 <strchr+0x20>
      return (char*)s;
  return 0;
}
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 268:	31 c0                	xor    %eax,%eax
}
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	31 f6                	xor    %esi,%esi
{
 27b:	53                   	push   %ebx
 27c:	89 f3                	mov    %esi,%ebx
 27e:	83 ec 1c             	sub    $0x1c,%esp
 281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 284:	eb 33                	jmp    2b9 <gets+0x49>
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	8d 45 e7             	lea    -0x19(%ebp),%eax
 296:	6a 01                	push   $0x1
 298:	50                   	push   %eax
 299:	6a 00                	push   $0x0
 29b:	e8 d1 01 00 00       	call   471 <read>
    if(cc < 1)
 2a0:	83 c4 10             	add    $0x10,%esp
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 1c                	jle    2c3 <gets+0x53>
      break;
    buf[i++] = c;
 2a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ab:	83 c7 01             	add    $0x1,%edi
 2ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b1:	3c 0a                	cmp    $0xa,%al
 2b3:	74 23                	je     2d8 <gets+0x68>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 1f                	je     2d8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	89 fe                	mov    %edi,%esi
 2be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c1:	7c cd                	jl     290 <gets+0x20>
 2c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2c8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5f                   	pop    %edi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	8b 75 08             	mov    0x8(%ebp),%esi
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	01 de                	add    %ebx,%esi
 2e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2e2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e8:	5b                   	pop    %ebx
 2e9:	5e                   	pop    %esi
 2ea:	5f                   	pop    %edi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	6a 00                	push   $0x0
 2fe:	ff 75 08             	pushl  0x8(%ebp)
 301:	e8 93 01 00 00       	call   499 <open>
  if(fd < 0)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	78 2b                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 30d:	83 ec 08             	sub    $0x8,%esp
 310:	ff 75 0c             	pushl  0xc(%ebp)
 313:	89 c3                	mov    %eax,%ebx
 315:	50                   	push   %eax
 316:	e8 96 01 00 00       	call   4b1 <fstat>
  close(fd);
 31b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	e8 5c 01 00 00       	call   481 <close>
  return r;
 325:	83 c4 10             	add    $0x10,%esp
}
 328:	8d 65 f8             	lea    -0x8(%ebp),%esp
 32b:	89 f0                	mov    %esi,%eax
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33d:	eb e9                	jmp    328 <stat+0x38>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	0f be 02             	movsbl (%edx),%eax
 34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 359:	77 1a                	ja     375 <atoi+0x35>
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	89 c8                	mov    %ecx,%eax
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	8b 55 08             	mov    0x8(%ebp),%edx
 38e:	56                   	push   %esi
 38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	85 c0                	test   %eax,%eax
 394:	7e 0f                	jle    3a5 <memmove+0x25>
 396:	01 d0                	add    %edx,%eax
  dst = vdst;
 398:	89 d7                	mov    %edx,%edi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <thread_create>:


//thread library
int
thread_create(void(*start_routine)(void*,void*),void* arg1 ,void* arg2)
{
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 14             	sub    $0x14,%esp
void* stack;
stack =sbrk(4096);  //pgsize
 3ba:	68 00 10 00 00       	push   $0x1000
 3bf:	e8 1d 01 00 00       	call   4e1 <sbrk>
return clone(start_routine,arg1,arg2,stack);
 3c4:	50                   	push   %eax
 3c5:	ff 75 10             	pushl  0x10(%ebp)
 3c8:	ff 75 0c             	pushl  0xc(%ebp)
 3cb:	ff 75 08             	pushl  0x8(%ebp)
 3ce:	e8 26 01 00 00       	call   4f9 <clone>
}
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    
 3d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <thread_join>:
int thread_join()
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3ea:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ed:	50                   	push   %eax
 3ee:	e8 0e 01 00 00       	call   501 <join>
  
  return x;
}
 3f3:	c9                   	leave  
 3f4:	c3                   	ret    
 3f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <lock_init>:

void lock_init(struct lock_t *lk){
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    
 412:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 425:	b9 01 00 00 00       	mov    $0x1,%ecx
 42a:	89 e5                	mov    %esp,%ebp
 42c:	8b 55 08             	mov    0x8(%ebp),%edx
 42f:	90                   	nop
 430:	89 c8                	mov    %ecx,%eax
 432:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 435:	85 c0                	test   %eax,%eax
 437:	75 f7                	jne    430 <lock_acquire+0x10>
}
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <lock_release>:
void lock_release(struct lock_t *lk){
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	31 c0                	xor    %eax,%eax
 447:	89 e5                	mov    %esp,%ebp
 449:	8b 55 08             	mov    0x8(%ebp),%edx
 44c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 451:	b8 01 00 00 00       	mov    $0x1,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <exit>:
SYSCALL(exit)
 459:	b8 02 00 00 00       	mov    $0x2,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <wait>:
SYSCALL(wait)
 461:	b8 03 00 00 00       	mov    $0x3,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <pipe>:
SYSCALL(pipe)
 469:	b8 04 00 00 00       	mov    $0x4,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <read>:
SYSCALL(read)
 471:	b8 05 00 00 00       	mov    $0x5,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <write>:
SYSCALL(write)
 479:	b8 10 00 00 00       	mov    $0x10,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <close>:
SYSCALL(close)
 481:	b8 15 00 00 00       	mov    $0x15,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <kill>:
SYSCALL(kill)
 489:	b8 06 00 00 00       	mov    $0x6,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <exec>:
SYSCALL(exec)
 491:	b8 07 00 00 00       	mov    $0x7,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <open>:
SYSCALL(open)
 499:	b8 0f 00 00 00       	mov    $0xf,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <mknod>:
SYSCALL(mknod)
 4a1:	b8 11 00 00 00       	mov    $0x11,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <unlink>:
SYSCALL(unlink)
 4a9:	b8 12 00 00 00       	mov    $0x12,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <fstat>:
SYSCALL(fstat)
 4b1:	b8 08 00 00 00       	mov    $0x8,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <link>:
SYSCALL(link)
 4b9:	b8 13 00 00 00       	mov    $0x13,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <mkdir>:
SYSCALL(mkdir)
 4c1:	b8 14 00 00 00       	mov    $0x14,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <chdir>:
SYSCALL(chdir)
 4c9:	b8 09 00 00 00       	mov    $0x9,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <dup>:
SYSCALL(dup)
 4d1:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <getpid>:
SYSCALL(getpid)
 4d9:	b8 0b 00 00 00       	mov    $0xb,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <sbrk>:
SYSCALL(sbrk)
 4e1:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <sleep>:
SYSCALL(sleep)
 4e9:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <uptime>:
SYSCALL(uptime)
 4f1:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <clone>:
SYSCALL(clone)
 4f9:	b8 16 00 00 00       	mov    $0x16,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <join>:
 501:	b8 17 00 00 00       	mov    $0x17,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    
