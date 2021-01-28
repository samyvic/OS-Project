
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  2b:	7e 50                	jle    7d <main+0x7d>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 1d 04 00 00       	call   459 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 e5 03 00 00       	call   441 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 b0 03 00 00       	call   419 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 0b 09 00 00       	push   $0x90b
  71:	6a 01                	push   $0x1
  73:	e8 08 05 00 00       	call   580 <printf>
      exit();
  78:	e8 9c 03 00 00       	call   419 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 8d 03 00 00       	call   419 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	56                   	push   %esi
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  9b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9c:	eb 19                	jmp    b7 <cat+0x27>
  9e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 e0 0c 00 00       	push   $0xce0
  a9:	6a 01                	push   $0x1
  ab:	e8 89 03 00 00       	call   439 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 e0 0c 00 00       	push   $0xce0
  c4:	56                   	push   %esi
  c5:	e8 67 03 00 00       	call   431 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 e8 08 00 00       	push   $0x8e8
  e4:	6a 01                	push   $0x1
  e6:	e8 95 04 00 00       	call   580 <printf>
      exit();
  eb:	e8 29 03 00 00       	call   419 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 fa 08 00 00       	push   $0x8fa
  f7:	6a 01                	push   $0x1
  f9:	e8 82 04 00 00       	call   580 <printf>
    exit();
  fe:	e8 16 03 00 00       	call   419 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
uint locked;
};

char*
strcpy(char *s, const char *t)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 115:	31 c0                	xor    %eax,%eax
{
 117:	89 e5                	mov    %esp,%ebp
 119:	53                   	push   %ebx
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	89 c8                	mov    %ecx,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	53                   	push   %ebx
 148:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14e:	0f b6 01             	movzbl (%ecx),%eax
 151:	0f b6 1a             	movzbl (%edx),%ebx
 154:	84 c0                	test   %al,%al
 156:	75 19                	jne    171 <strcmp+0x31>
 158:	eb 26                	jmp    180 <strcmp+0x40>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 164:	83 c1 01             	add    $0x1,%ecx
 167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16a:	0f b6 1a             	movzbl (%edx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	38 d8                	cmp    %bl,%al
 173:	74 eb                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 175:	29 d8                	sub    %ebx,%eax
}
 177:	5b                   	pop    %ebx
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 3a 00             	cmpb   $0x0,(%edx)
 19d:	74 21                	je     1c0 <strlen+0x30>
 19f:	31 c0                	xor    %eax,%eax
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1af:	89 c1                	mov    %eax,%ecx
 1b1:	75 f5                	jne    1a8 <strlen+0x18>
    ;
  return n;
}
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 d7                	mov    %edx,%edi
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	0f b6 10             	movzbl (%eax),%edx
 201:	84 d2                	test   %dl,%dl
 203:	75 16                	jne    21b <strchr+0x2b>
 205:	eb 21                	jmp    228 <strchr+0x38>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	f3 0f 1e fb          	endbr32 
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	57                   	push   %edi
 238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	31 f6                	xor    %esi,%esi
{
 23b:	53                   	push   %ebx
 23c:	89 f3                	mov    %esi,%ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
 241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 244:	eb 33                	jmp    279 <gets+0x49>
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 45 e7             	lea    -0x19(%ebp),%eax
 256:	6a 01                	push   $0x1
 258:	50                   	push   %eax
 259:	6a 00                	push   $0x0
 25b:	e8 d1 01 00 00       	call   431 <read>
    if(cc < 1)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	7e 1c                	jle    283 <gets+0x53>
      break;
    buf[i++] = c;
 267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26b:	83 c7 01             	add    $0x1,%edi
 26e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 23                	je     298 <gets+0x68>
 275:	3c 0d                	cmp    $0xd,%al
 277:	74 1f                	je     298 <gets+0x68>
  for(i=0; i+1 < max; ){
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	89 fe                	mov    %edi,%esi
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7c cd                	jl     250 <gets+0x20>
 283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 288:	c6 03 00             	movb   $0x0,(%ebx)
}
 28b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5f                   	pop    %edi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	8b 75 08             	mov    0x8(%ebp),%esi
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	01 de                	add    %ebx,%esi
 2a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	pushl  0x8(%ebp)
 2c1:	e8 93 01 00 00       	call   459 <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 2b                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2cd:	83 ec 08             	sub    $0x8,%esp
 2d0:	ff 75 0c             	pushl  0xc(%ebp)
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	50                   	push   %eax
 2d6:	e8 96 01 00 00       	call   471 <fstat>
  close(fd);
 2db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2de:	89 c6                	mov    %eax,%esi
  close(fd);
 2e0:	e8 5c 01 00 00       	call   441 <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2eb:	89 f0                	mov    %esi,%eax
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fd:	eb e9                	jmp    2e8 <stat+0x38>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	53                   	push   %ebx
 308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30b:	0f be 02             	movsbl (%edx),%eax
 30e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 319:	77 1a                	ja     335 <atoi+0x35>
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	89 c8                	mov    %ecx,%eax
 337:	5b                   	pop    %ebx
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
 34e:	56                   	push   %esi
 34f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 352:	85 c0                	test   %eax,%eax
 354:	7e 0f                	jle    365 <memmove+0x25>
 356:	01 d0                	add    %edx,%eax
  dst = vdst;
 358:	89 d7                	mov    %edx,%edi
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_create>:


//thread library
int
thread_create(void(*start_routine)(void*,void*),void* arg1 ,void* arg2)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 14             	sub    $0x14,%esp
void* stack;
stack =sbrk(4096);  //pgsize
 37a:	68 00 10 00 00       	push   $0x1000
 37f:	e8 1d 01 00 00       	call   4a1 <sbrk>
return clone(start_routine,arg1,arg2,stack);
 384:	50                   	push   %eax
 385:	ff 75 10             	pushl  0x10(%ebp)
 388:	ff 75 0c             	pushl  0xc(%ebp)
 38b:	ff 75 08             	pushl  0x8(%ebp)
 38e:	e8 26 01 00 00       	call   4b9 <clone>
}
 393:	c9                   	leave  
 394:	c3                   	ret    
 395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <thread_join>:
int thread_join()
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 3aa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ad:	50                   	push   %eax
 3ae:	e8 0e 01 00 00       	call   4c1 <join>
  
  return x;
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    
 3b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <lock_init>:

void lock_init(struct lock_t *lk){
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    
 3d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 3e5:	b9 01 00 00 00       	mov    $0x1,%ecx
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	8b 55 08             	mov    0x8(%ebp),%edx
 3ef:	90                   	nop
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 3f5:	85 c0                	test   %eax,%eax
 3f7:	75 f7                	jne    3f0 <lock_acquire+0x10>
}
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <lock_release>:
void lock_release(struct lock_t *lk){
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	31 c0                	xor    %eax,%eax
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 55 08             	mov    0x8(%ebp),%edx
 40c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 411:	b8 01 00 00 00       	mov    $0x1,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <exit>:
SYSCALL(exit)
 419:	b8 02 00 00 00       	mov    $0x2,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <wait>:
SYSCALL(wait)
 421:	b8 03 00 00 00       	mov    $0x3,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <pipe>:
SYSCALL(pipe)
 429:	b8 04 00 00 00       	mov    $0x4,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <read>:
SYSCALL(read)
 431:	b8 05 00 00 00       	mov    $0x5,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <write>:
SYSCALL(write)
 439:	b8 10 00 00 00       	mov    $0x10,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <close>:
SYSCALL(close)
 441:	b8 15 00 00 00       	mov    $0x15,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <kill>:
SYSCALL(kill)
 449:	b8 06 00 00 00       	mov    $0x6,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <exec>:
SYSCALL(exec)
 451:	b8 07 00 00 00       	mov    $0x7,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <open>:
SYSCALL(open)
 459:	b8 0f 00 00 00       	mov    $0xf,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <mknod>:
SYSCALL(mknod)
 461:	b8 11 00 00 00       	mov    $0x11,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <unlink>:
SYSCALL(unlink)
 469:	b8 12 00 00 00       	mov    $0x12,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <fstat>:
SYSCALL(fstat)
 471:	b8 08 00 00 00       	mov    $0x8,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <link>:
SYSCALL(link)
 479:	b8 13 00 00 00       	mov    $0x13,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <mkdir>:
SYSCALL(mkdir)
 481:	b8 14 00 00 00       	mov    $0x14,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <chdir>:
SYSCALL(chdir)
 489:	b8 09 00 00 00       	mov    $0x9,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <dup>:
SYSCALL(dup)
 491:	b8 0a 00 00 00       	mov    $0xa,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <getpid>:
SYSCALL(getpid)
 499:	b8 0b 00 00 00       	mov    $0xb,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <sbrk>:
SYSCALL(sbrk)
 4a1:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <sleep>:
SYSCALL(sleep)
 4a9:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <uptime>:
SYSCALL(uptime)
 4b1:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <clone>:
SYSCALL(clone)
 4b9:	b8 16 00 00 00       	mov    $0x16,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <join>:
 4c1:	b8 17 00 00 00       	mov    $0x17,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
 4d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4dc:	89 d1                	mov    %edx,%ecx
{
 4de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4e1:	85 d2                	test   %edx,%edx
 4e3:	0f 89 7f 00 00 00    	jns    568 <printint+0x98>
 4e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ed:	74 79                	je     568 <printint+0x98>
    neg = 1;
 4ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4f8:	31 db                	xor    %ebx,%ebx
 4fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 cf                	mov    %ecx,%edi
 506:	f7 75 c4             	divl   -0x3c(%ebp)
 509:	0f b6 92 28 09 00 00 	movzbl 0x928(%edx),%edx
 510:	89 45 c0             	mov    %eax,-0x40(%ebp)
 513:	89 d8                	mov    %ebx,%eax
 515:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 518:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 51b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 51e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 521:	76 dd                	jbe    500 <printint+0x30>
  if(neg)
 523:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 526:	85 c9                	test   %ecx,%ecx
 528:	74 0c                	je     536 <printint+0x66>
    buf[i++] = '-';
 52a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 52f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 531:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 536:	8b 7d b8             	mov    -0x48(%ebp),%edi
 539:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 53d:	eb 07                	jmp    546 <printint+0x76>
 53f:	90                   	nop
 540:	0f b6 13             	movzbl (%ebx),%edx
 543:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 546:	83 ec 04             	sub    $0x4,%esp
 549:	88 55 d7             	mov    %dl,-0x29(%ebp)
 54c:	6a 01                	push   $0x1
 54e:	56                   	push   %esi
 54f:	57                   	push   %edi
 550:	e8 e4 fe ff ff       	call   439 <write>
  while(--i >= 0)
 555:	83 c4 10             	add    $0x10,%esp
 558:	39 de                	cmp    %ebx,%esi
 55a:	75 e4                	jne    540 <printint+0x70>
    putc(fd, buf[i]);
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 56f:	eb 87                	jmp    4f8 <printint+0x28>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	56                   	push   %esi
 589:	53                   	push   %ebx
 58a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 58d:	8b 75 0c             	mov    0xc(%ebp),%esi
 590:	0f b6 1e             	movzbl (%esi),%ebx
 593:	84 db                	test   %bl,%bl
 595:	0f 84 b4 00 00 00    	je     64f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 59b:	8d 45 10             	lea    0x10(%ebp),%eax
 59e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5a1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5a4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a9:	eb 33                	jmp    5de <printf+0x5e>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
 5b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5b3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	74 17                	je     5d4 <printf+0x54>
  write(fd, &c, 1);
 5bd:	83 ec 04             	sub    $0x4,%esp
 5c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5c3:	6a 01                	push   $0x1
 5c5:	57                   	push   %edi
 5c6:	ff 75 08             	pushl  0x8(%ebp)
 5c9:	e8 6b fe ff ff       	call   439 <write>
 5ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5d1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5d4:	0f b6 1e             	movzbl (%esi),%ebx
 5d7:	83 c6 01             	add    $0x1,%esi
 5da:	84 db                	test   %bl,%bl
 5dc:	74 71                	je     64f <printf+0xcf>
    c = fmt[i] & 0xff;
 5de:	0f be cb             	movsbl %bl,%ecx
 5e1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5e4:	85 d2                	test   %edx,%edx
 5e6:	74 c8                	je     5b0 <printf+0x30>
      }
    } else if(state == '%'){
 5e8:	83 fa 25             	cmp    $0x25,%edx
 5eb:	75 e7                	jne    5d4 <printf+0x54>
      if(c == 'd'){
 5ed:	83 f8 64             	cmp    $0x64,%eax
 5f0:	0f 84 9a 00 00 00    	je     690 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5fc:	83 f9 70             	cmp    $0x70,%ecx
 5ff:	74 5f                	je     660 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 601:	83 f8 73             	cmp    $0x73,%eax
 604:	0f 84 d6 00 00 00    	je     6e0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 60a:	83 f8 63             	cmp    $0x63,%eax
 60d:	0f 84 8d 00 00 00    	je     6a0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 613:	83 f8 25             	cmp    $0x25,%eax
 616:	0f 84 b4 00 00 00    	je     6d0 <printf+0x150>
  write(fd, &c, 1);
 61c:	83 ec 04             	sub    $0x4,%esp
 61f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	ff 75 08             	pushl  0x8(%ebp)
 629:	e8 0b fe ff ff       	call   439 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 62e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 631:	83 c4 0c             	add    $0xc,%esp
 634:	6a 01                	push   $0x1
 636:	83 c6 01             	add    $0x1,%esi
 639:	57                   	push   %edi
 63a:	ff 75 08             	pushl  0x8(%ebp)
 63d:	e8 f7 fd ff ff       	call   439 <write>
  for(i = 0; fmt[i]; i++){
 642:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 646:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 649:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 64b:	84 db                	test   %bl,%bl
 64d:	75 8f                	jne    5de <printf+0x5e>
    }
  }
}
 64f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5f                   	pop    %edi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	8b 13                	mov    (%ebx),%edx
 672:	e8 59 fe ff ff       	call   4d0 <printint>
        ap++;
 677:	89 d8                	mov    %ebx,%eax
 679:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67c:	31 d2                	xor    %edx,%edx
        ap++;
 67e:	83 c0 04             	add    $0x4,%eax
 681:	89 45 d0             	mov    %eax,-0x30(%ebp)
 684:	e9 4b ff ff ff       	jmp    5d4 <printf+0x54>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
 698:	6a 01                	push   $0x1
 69a:	eb ce                	jmp    66a <printf+0xea>
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6a6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6a8:	6a 01                	push   $0x1
        ap++;
 6aa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6ad:	57                   	push   %edi
 6ae:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6b1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b4:	e8 80 fd ff ff       	call   439 <write>
        ap++;
 6b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 0e ff ff ff       	jmp    5d4 <printf+0x54>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
 6d6:	e9 59 ff ff ff       	jmp    634 <printf+0xb4>
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
        s = (char*)*ap;
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6e3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6e5:	83 c0 04             	add    $0x4,%eax
 6e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6eb:	85 db                	test   %ebx,%ebx
 6ed:	74 17                	je     706 <printf+0x186>
        while(*s != 0){
 6ef:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6f2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6f4:	84 c0                	test   %al,%al
 6f6:	0f 84 d8 fe ff ff    	je     5d4 <printf+0x54>
 6fc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ff:	89 de                	mov    %ebx,%esi
 701:	8b 5d 08             	mov    0x8(%ebp),%ebx
 704:	eb 1a                	jmp    720 <printf+0x1a0>
          s = "(null)";
 706:	bb 20 09 00 00       	mov    $0x920,%ebx
        while(*s != 0){
 70b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 70e:	b8 28 00 00 00       	mov    $0x28,%eax
 713:	89 de                	mov    %ebx,%esi
 715:	8b 5d 08             	mov    0x8(%ebp),%ebx
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
          s++;
 723:	83 c6 01             	add    $0x1,%esi
 726:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 729:	6a 01                	push   $0x1
 72b:	57                   	push   %edi
 72c:	53                   	push   %ebx
 72d:	e8 07 fd ff ff       	call   439 <write>
        while(*s != 0){
 732:	0f b6 06             	movzbl (%esi),%eax
 735:	83 c4 10             	add    $0x10,%esp
 738:	84 c0                	test   %al,%al
 73a:	75 e4                	jne    720 <printf+0x1a0>
 73c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 73f:	31 d2                	xor    %edx,%edx
 741:	e9 8e fe ff ff       	jmp    5d4 <printf+0x54>
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	f3 0f 1e fb          	endbr32 
 754:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 755:	a1 c0 0c 00 00       	mov    0xcc0,%eax
{
 75a:	89 e5                	mov    %esp,%ebp
 75c:	57                   	push   %edi
 75d:	56                   	push   %esi
 75e:	53                   	push   %ebx
 75f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 762:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 764:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 767:	39 c8                	cmp    %ecx,%eax
 769:	73 15                	jae    780 <free+0x30>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
 770:	39 d1                	cmp    %edx,%ecx
 772:	72 14                	jb     788 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 d0                	cmp    %edx,%eax
 776:	73 10                	jae    788 <free+0x38>
{
 778:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	8b 10                	mov    (%eax),%edx
 77c:	39 c8                	cmp    %ecx,%eax
 77e:	72 f0                	jb     770 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 f4                	jb     778 <free+0x28>
 784:	39 d1                	cmp    %edx,%ecx
 786:	73 f0                	jae    778 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 fa                	cmp    %edi,%edx
 790:	74 1e                	je     7b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 792:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 28                	je     7c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 7a7:	5e                   	pop    %esi
 7a8:	5f                   	pop    %edi
 7a9:	5d                   	pop    %ebp
 7aa:	c3                   	ret    
 7ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7b0:	03 72 04             	add    0x4(%edx),%esi
 7b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 12                	mov    (%edx),%edx
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	75 d8                	jne    79f <free+0x4f>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ca:	a3 c0 0c 00 00       	mov    %eax,0xcc0
    p->s.size += bp->s.size;
 7cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d5:	89 10                	mov    %edx,(%eax)
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
 7e5:	89 e5                	mov    %esp,%ebp
 7e7:	57                   	push   %edi
 7e8:	56                   	push   %esi
 7e9:	53                   	push   %ebx
 7ea:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7f0:	8b 3d c0 0c 00 00    	mov    0xcc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f6:	8d 70 07             	lea    0x7(%eax),%esi
 7f9:	c1 ee 03             	shr    $0x3,%esi
 7fc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7ff:	85 ff                	test   %edi,%edi
 801:	0f 84 a9 00 00 00    	je     8b0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 807:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 809:	8b 48 04             	mov    0x4(%eax),%ecx
 80c:	39 f1                	cmp    %esi,%ecx
 80e:	73 6d                	jae    87d <malloc+0x9d>
 810:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 816:	bb 00 10 00 00       	mov    $0x1000,%ebx
 81b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 81e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 825:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 828:	eb 17                	jmp    841 <malloc+0x61>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 832:	8b 4a 04             	mov    0x4(%edx),%ecx
 835:	39 f1                	cmp    %esi,%ecx
 837:	73 4f                	jae    888 <malloc+0xa8>
 839:	8b 3d c0 0c 00 00    	mov    0xcc0,%edi
 83f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	39 c7                	cmp    %eax,%edi
 843:	75 eb                	jne    830 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	ff 75 e4             	pushl  -0x1c(%ebp)
 84b:	e8 51 fc ff ff       	call   4a1 <sbrk>
  if(p == (char*)-1)
 850:	83 c4 10             	add    $0x10,%esp
 853:	83 f8 ff             	cmp    $0xffffffff,%eax
 856:	74 1b                	je     873 <malloc+0x93>
  hp->s.size = nu;
 858:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	83 c0 08             	add    $0x8,%eax
 861:	50                   	push   %eax
 862:	e8 e9 fe ff ff       	call   750 <free>
  return freep;
 867:	a1 c0 0c 00 00       	mov    0xcc0,%eax
      if((p = morecore(nunits)) == 0)
 86c:	83 c4 10             	add    $0x10,%esp
 86f:	85 c0                	test   %eax,%eax
 871:	75 bd                	jne    830 <malloc+0x50>
        return 0;
  }
}
 873:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 876:	31 c0                	xor    %eax,%eax
}
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    
    if(p->s.size >= nunits){
 87d:	89 c2                	mov    %eax,%edx
 87f:	89 f8                	mov    %edi,%eax
 881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 888:	39 ce                	cmp    %ecx,%esi
 88a:	74 54                	je     8e0 <malloc+0x100>
        p->s.size -= nunits;
 88c:	29 f1                	sub    %esi,%ecx
 88e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 891:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 894:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 897:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 89f:	8d 42 08             	lea    0x8(%edx),%eax
}
 8a2:	5b                   	pop    %ebx
 8a3:	5e                   	pop    %esi
 8a4:	5f                   	pop    %edi
 8a5:	5d                   	pop    %ebp
 8a6:	c3                   	ret    
 8a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ae:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 8b7:	0c 00 00 
    base.s.size = 0;
 8ba:	bf c4 0c 00 00       	mov    $0xcc4,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 8c6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 8cb:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 36 ff ff ff       	jmp    810 <malloc+0x30>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 0a                	mov    (%edx),%ecx
 8e2:	89 08                	mov    %ecx,(%eax)
 8e4:	eb b1                	jmp    897 <malloc+0xb7>
