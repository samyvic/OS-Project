
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   e:	83 39 03             	cmpl   $0x3,(%ecx)
{
  11:	55                   	push   %ebp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  19:	74 13                	je     2e <main+0x2e>
    printf(2, "Usage: ln old new\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 38 08 00 00       	push   $0x838
  22:	6a 02                	push   $0x2
  24:	e8 a7 04 00 00       	call   4d0 <printf>
    exit();
  29:	e8 3b 03 00 00       	call   369 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 8e 03 00 00       	call   3c9 <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 22 03 00 00       	call   369 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 4b 08 00 00       	push   $0x84b
  52:	6a 02                	push   $0x2
  54:	e8 77 04 00 00       	call   4d0 <printf>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	eb e4                	jmp    42 <main+0x42>
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
uint locked;
};

char*
strcpy(char *s, const char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  65:	31 c0                	xor    %eax,%eax
{
  67:	89 e5                	mov    %esp,%ebp
  69:	53                   	push   %ebx
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	89 c8                	mov    %ecx,%eax
  80:	5b                   	pop    %ebx
  81:	5d                   	pop    %ebp
  82:	c3                   	ret    
  83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9e:	0f b6 01             	movzbl (%ecx),%eax
  a1:	0f b6 1a             	movzbl (%edx),%ebx
  a4:	84 c0                	test   %al,%al
  a6:	75 19                	jne    c1 <strcmp+0x31>
  a8:	eb 26                	jmp    d0 <strcmp+0x40>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  b4:	83 c1 01             	add    $0x1,%ecx
  b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ba:	0f b6 1a             	movzbl (%edx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	38 d8                	cmp    %bl,%al
  c3:	74 eb                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	5b                   	pop    %ebx
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ea:	80 3a 00             	cmpb   $0x0,(%edx)
  ed:	74 21                	je     110 <strlen+0x30>
  ef:	31 c0                	xor    %eax,%eax
  f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f8:	83 c0 01             	add    $0x1,%eax
  fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ff:	89 c1                	mov    %eax,%ecx
 101:	75 f5                	jne    f8 <strlen+0x18>
    ;
  return n;
}
 103:	89 c8                	mov    %ecx,%eax
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 12b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12e:	8b 45 0c             	mov    0xc(%ebp),%eax
 131:	89 d7                	mov    %edx,%edi
 133:	fc                   	cld    
 134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 136:	89 d0                	mov    %edx,%eax
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14e:	0f b6 10             	movzbl (%eax),%edx
 151:	84 d2                	test   %dl,%dl
 153:	75 16                	jne    16b <strchr+0x2b>
 155:	eb 21                	jmp    178 <strchr+0x38>
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 164:	83 c0 01             	add    $0x1,%eax
 167:	84 d2                	test   %dl,%dl
 169:	74 0d                	je     178 <strchr+0x38>
    if(*s == c)
 16b:	38 d1                	cmp    %dl,%cl
 16d:	75 f1                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	31 f6                	xor    %esi,%esi
{
 18b:	53                   	push   %ebx
 18c:	89 f3                	mov    %esi,%ebx
 18e:	83 ec 1c             	sub    $0x1c,%esp
 191:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 194:	eb 33                	jmp    1c9 <gets+0x49>
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a6:	6a 01                	push   $0x1
 1a8:	50                   	push   %eax
 1a9:	6a 00                	push   $0x0
 1ab:	e8 d1 01 00 00       	call   381 <read>
    if(cc < 1)
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	85 c0                	test   %eax,%eax
 1b5:	7e 1c                	jle    1d3 <gets+0x53>
      break;
    buf[i++] = c;
 1b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bb:	83 c7 01             	add    $0x1,%edi
 1be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c1:	3c 0a                	cmp    $0xa,%al
 1c3:	74 23                	je     1e8 <gets+0x68>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 1f                	je     1e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	89 fe                	mov    %edi,%esi
 1ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d1:	7c cd                	jl     1a0 <gets+0x20>
 1d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1de:	5b                   	pop    %ebx
 1df:	5e                   	pop    %esi
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	8b 75 08             	mov    0x8(%ebp),%esi
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	01 de                	add    %ebx,%esi
 1f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 93 01 00 00       	call   3a9 <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 2b                	js     248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	ff 75 0c             	pushl  0xc(%ebp)
 223:	89 c3                	mov    %eax,%ebx
 225:	50                   	push   %eax
 226:	e8 96 01 00 00       	call   3c1 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 5c 01 00 00       	call   391 <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23b:	89 f0                	mov    %esi,%eax
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 248:	be ff ff ff ff       	mov    $0xffffffff,%esi
 24d:	eb e9                	jmp    238 <stat+0x38>
 24f:	90                   	nop

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	53                   	push   %ebx
 258:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25b:	0f be 02             	movsbl (%edx),%eax
 25e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 261:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 264:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 269:	77 1a                	ja     285 <atoi+0x35>
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	89 c8                	mov    %ecx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	8b 45 10             	mov    0x10(%ebp),%eax
 29b:	8b 55 08             	mov    0x8(%ebp),%edx
 29e:	56                   	push   %esi
 29f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0f                	jle    2b5 <memmove+0x25>
 2a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <thread_create>:


//thread library
int
thread_create(void(*start_routine)(void*,void*),void* arg1 ,void* arg2)
{
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	83 ec 14             	sub    $0x14,%esp
void* stack;
stack =sbrk(4096);  //pgsize
 2ca:	68 00 10 00 00       	push   $0x1000
 2cf:	e8 1d 01 00 00       	call   3f1 <sbrk>
return clone(start_routine,arg1,arg2,stack);
 2d4:	50                   	push   %eax
 2d5:	ff 75 10             	pushl  0x10(%ebp)
 2d8:	ff 75 0c             	pushl  0xc(%ebp)
 2db:	ff 75 08             	pushl  0x8(%ebp)
 2de:	e8 26 01 00 00       	call   409 <clone>
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <thread_join>:
int thread_join()
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 2fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fd:	50                   	push   %eax
 2fe:	e8 0e 01 00 00       	call   411 <join>
  
  return x;
}
 303:	c9                   	leave  
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <lock_init>:

void lock_init(struct lock_t *lk){
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 320:	5d                   	pop    %ebp
 321:	c3                   	ret    
 322:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 335:	b9 01 00 00 00       	mov    $0x1,%ecx
 33a:	89 e5                	mov    %esp,%ebp
 33c:	8b 55 08             	mov    0x8(%ebp),%edx
 33f:	90                   	nop
 340:	89 c8                	mov    %ecx,%eax
 342:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 345:	85 c0                	test   %eax,%eax
 347:	75 f7                	jne    340 <lock_acquire+0x10>
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <lock_release>:
void lock_release(struct lock_t *lk){
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
 355:	31 c0                	xor    %eax,%eax
 357:	89 e5                	mov    %esp,%ebp
 359:	8b 55 08             	mov    0x8(%ebp),%edx
 35c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 361:	b8 01 00 00 00       	mov    $0x1,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <exit>:
SYSCALL(exit)
 369:	b8 02 00 00 00       	mov    $0x2,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <wait>:
SYSCALL(wait)
 371:	b8 03 00 00 00       	mov    $0x3,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <pipe>:
SYSCALL(pipe)
 379:	b8 04 00 00 00       	mov    $0x4,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <read>:
SYSCALL(read)
 381:	b8 05 00 00 00       	mov    $0x5,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <write>:
SYSCALL(write)
 389:	b8 10 00 00 00       	mov    $0x10,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <close>:
SYSCALL(close)
 391:	b8 15 00 00 00       	mov    $0x15,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <kill>:
SYSCALL(kill)
 399:	b8 06 00 00 00       	mov    $0x6,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <exec>:
SYSCALL(exec)
 3a1:	b8 07 00 00 00       	mov    $0x7,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <open>:
SYSCALL(open)
 3a9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <mknod>:
SYSCALL(mknod)
 3b1:	b8 11 00 00 00       	mov    $0x11,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <unlink>:
SYSCALL(unlink)
 3b9:	b8 12 00 00 00       	mov    $0x12,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <fstat>:
SYSCALL(fstat)
 3c1:	b8 08 00 00 00       	mov    $0x8,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <link>:
SYSCALL(link)
 3c9:	b8 13 00 00 00       	mov    $0x13,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <mkdir>:
SYSCALL(mkdir)
 3d1:	b8 14 00 00 00       	mov    $0x14,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <chdir>:
SYSCALL(chdir)
 3d9:	b8 09 00 00 00       	mov    $0x9,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <dup>:
SYSCALL(dup)
 3e1:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <getpid>:
SYSCALL(getpid)
 3e9:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <sbrk>:
SYSCALL(sbrk)
 3f1:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <sleep>:
SYSCALL(sleep)
 3f9:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <uptime>:
SYSCALL(uptime)
 401:	b8 0e 00 00 00       	mov    $0xe,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <clone>:
SYSCALL(clone)
 409:	b8 16 00 00 00       	mov    $0x16,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <join>:
 411:	b8 17 00 00 00       	mov    $0x17,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    
 419:	66 90                	xchg   %ax,%ax
 41b:	66 90                	xchg   %ax,%ax
 41d:	66 90                	xchg   %ax,%ax
 41f:	90                   	nop

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 3c             	sub    $0x3c,%esp
 429:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 42c:	89 d1                	mov    %edx,%ecx
{
 42e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 431:	85 d2                	test   %edx,%edx
 433:	0f 89 7f 00 00 00    	jns    4b8 <printint+0x98>
 439:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 43d:	74 79                	je     4b8 <printint+0x98>
    neg = 1;
 43f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 446:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 448:	31 db                	xor    %ebx,%ebx
 44a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 450:	89 c8                	mov    %ecx,%eax
 452:	31 d2                	xor    %edx,%edx
 454:	89 cf                	mov    %ecx,%edi
 456:	f7 75 c4             	divl   -0x3c(%ebp)
 459:	0f b6 92 68 08 00 00 	movzbl 0x868(%edx),%edx
 460:	89 45 c0             	mov    %eax,-0x40(%ebp)
 463:	89 d8                	mov    %ebx,%eax
 465:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 468:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 46b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 46e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 471:	76 dd                	jbe    450 <printint+0x30>
  if(neg)
 473:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 476:	85 c9                	test   %ecx,%ecx
 478:	74 0c                	je     486 <printint+0x66>
    buf[i++] = '-';
 47a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 47f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 481:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 486:	8b 7d b8             	mov    -0x48(%ebp),%edi
 489:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 48d:	eb 07                	jmp    496 <printint+0x76>
 48f:	90                   	nop
 490:	0f b6 13             	movzbl (%ebx),%edx
 493:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 496:	83 ec 04             	sub    $0x4,%esp
 499:	88 55 d7             	mov    %dl,-0x29(%ebp)
 49c:	6a 01                	push   $0x1
 49e:	56                   	push   %esi
 49f:	57                   	push   %edi
 4a0:	e8 e4 fe ff ff       	call   389 <write>
  while(--i >= 0)
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	39 de                	cmp    %ebx,%esi
 4aa:	75 e4                	jne    490 <printint+0x70>
    putc(fd, buf[i]);
}
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4af:	5b                   	pop    %ebx
 4b0:	5e                   	pop    %esi
 4b1:	5f                   	pop    %edi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4bf:	eb 87                	jmp    448 <printint+0x28>
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 4e0:	0f b6 1e             	movzbl (%esi),%ebx
 4e3:	84 db                	test   %bl,%bl
 4e5:	0f 84 b4 00 00 00    	je     59f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 4eb:	8d 45 10             	lea    0x10(%ebp),%eax
 4ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4f9:	eb 33                	jmp    52e <printf+0x5e>
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop
 500:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 503:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	74 17                	je     524 <printf+0x54>
  write(fd, &c, 1);
 50d:	83 ec 04             	sub    $0x4,%esp
 510:	88 5d e7             	mov    %bl,-0x19(%ebp)
 513:	6a 01                	push   $0x1
 515:	57                   	push   %edi
 516:	ff 75 08             	pushl  0x8(%ebp)
 519:	e8 6b fe ff ff       	call   389 <write>
 51e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 521:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 524:	0f b6 1e             	movzbl (%esi),%ebx
 527:	83 c6 01             	add    $0x1,%esi
 52a:	84 db                	test   %bl,%bl
 52c:	74 71                	je     59f <printf+0xcf>
    c = fmt[i] & 0xff;
 52e:	0f be cb             	movsbl %bl,%ecx
 531:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 534:	85 d2                	test   %edx,%edx
 536:	74 c8                	je     500 <printf+0x30>
      }
    } else if(state == '%'){
 538:	83 fa 25             	cmp    $0x25,%edx
 53b:	75 e7                	jne    524 <printf+0x54>
      if(c == 'd'){
 53d:	83 f8 64             	cmp    $0x64,%eax
 540:	0f 84 9a 00 00 00    	je     5e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 546:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 54c:	83 f9 70             	cmp    $0x70,%ecx
 54f:	74 5f                	je     5b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 551:	83 f8 73             	cmp    $0x73,%eax
 554:	0f 84 d6 00 00 00    	je     630 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55a:	83 f8 63             	cmp    $0x63,%eax
 55d:	0f 84 8d 00 00 00    	je     5f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 563:	83 f8 25             	cmp    $0x25,%eax
 566:	0f 84 b4 00 00 00    	je     620 <printf+0x150>
  write(fd, &c, 1);
 56c:	83 ec 04             	sub    $0x4,%esp
 56f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 573:	6a 01                	push   $0x1
 575:	57                   	push   %edi
 576:	ff 75 08             	pushl  0x8(%ebp)
 579:	e8 0b fe ff ff       	call   389 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 57e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 581:	83 c4 0c             	add    $0xc,%esp
 584:	6a 01                	push   $0x1
 586:	83 c6 01             	add    $0x1,%esi
 589:	57                   	push   %edi
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 f7 fd ff ff       	call   389 <write>
  for(i = 0; fmt[i]; i++){
 592:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 596:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 599:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 59b:	84 db                	test   %bl,%bl
 59d:	75 8f                	jne    52e <printf+0x5e>
    }
  }
}
 59f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a2:	5b                   	pop    %ebx
 5a3:	5e                   	pop    %esi
 5a4:	5f                   	pop    %edi
 5a5:	5d                   	pop    %ebp
 5a6:	c3                   	ret    
 5a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b8:	6a 00                	push   $0x0
 5ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
 5c0:	8b 13                	mov    (%ebx),%edx
 5c2:	e8 59 fe ff ff       	call   420 <printint>
        ap++;
 5c7:	89 d8                	mov    %ebx,%eax
 5c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cc:	31 d2                	xor    %edx,%edx
        ap++;
 5ce:	83 c0 04             	add    $0x4,%eax
 5d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d4:	e9 4b ff ff ff       	jmp    524 <printf+0x54>
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	eb ce                	jmp    5ba <printf+0xea>
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
        ap++;
 5fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5fd:	57                   	push   %edi
 5fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 601:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 604:	e8 80 fd ff ff       	call   389 <write>
        ap++;
 609:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 60c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60f:	31 d2                	xor    %edx,%edx
 611:	e9 0e ff ff ff       	jmp    524 <printf+0x54>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 620:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
 626:	e9 59 ff ff ff       	jmp    584 <printf+0xb4>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
        s = (char*)*ap;
 630:	8b 45 d0             	mov    -0x30(%ebp),%eax
 633:	8b 18                	mov    (%eax),%ebx
        ap++;
 635:	83 c0 04             	add    $0x4,%eax
 638:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 63b:	85 db                	test   %ebx,%ebx
 63d:	74 17                	je     656 <printf+0x186>
        while(*s != 0){
 63f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 642:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 644:	84 c0                	test   %al,%al
 646:	0f 84 d8 fe ff ff    	je     524 <printf+0x54>
 64c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 64f:	89 de                	mov    %ebx,%esi
 651:	8b 5d 08             	mov    0x8(%ebp),%ebx
 654:	eb 1a                	jmp    670 <printf+0x1a0>
          s = "(null)";
 656:	bb 5f 08 00 00       	mov    $0x85f,%ebx
        while(*s != 0){
 65b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65e:	b8 28 00 00 00       	mov    $0x28,%eax
 663:	89 de                	mov    %ebx,%esi
 665:	8b 5d 08             	mov    0x8(%ebp),%ebx
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
          s++;
 673:	83 c6 01             	add    $0x1,%esi
 676:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	57                   	push   %edi
 67c:	53                   	push   %ebx
 67d:	e8 07 fd ff ff       	call   389 <write>
        while(*s != 0){
 682:	0f b6 06             	movzbl (%esi),%eax
 685:	83 c4 10             	add    $0x10,%esp
 688:	84 c0                	test   %al,%al
 68a:	75 e4                	jne    670 <printf+0x1a0>
 68c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 68f:	31 d2                	xor    %edx,%edx
 691:	e9 8e fe ff ff       	jmp    524 <printf+0x54>
 696:	66 90                	xchg   %ax,%ax
 698:	66 90                	xchg   %ax,%ax
 69a:	66 90                	xchg   %ax,%ax
 69c:	66 90                	xchg   %ax,%ax
 69e:	66 90                	xchg   %ax,%ax

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	f3 0f 1e fb          	endbr32 
 6a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a5:	a1 b4 0b 00 00       	mov    0xbb4,%eax
{
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	57                   	push   %edi
 6ad:	56                   	push   %esi
 6ae:	53                   	push   %ebx
 6af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b7:	39 c8                	cmp    %ecx,%eax
 6b9:	73 15                	jae    6d0 <free+0x30>
 6bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop
 6c0:	39 d1                	cmp    %edx,%ecx
 6c2:	72 14                	jb     6d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c4:	39 d0                	cmp    %edx,%eax
 6c6:	73 10                	jae    6d8 <free+0x38>
{
 6c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ca:	8b 10                	mov    (%eax),%edx
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	72 f0                	jb     6c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 d0                	cmp    %edx,%eax
 6d2:	72 f4                	jb     6c8 <free+0x28>
 6d4:	39 d1                	cmp    %edx,%ecx
 6d6:	73 f0                	jae    6c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 fa                	cmp    %edi,%edx
 6e0:	74 1e                	je     700 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6eb:	39 f1                	cmp    %esi,%ecx
 6ed:	74 28                	je     717 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6f1:	5b                   	pop    %ebx
  freep = p;
 6f2:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 6f7:	5e                   	pop    %esi
 6f8:	5f                   	pop    %edi
 6f9:	5d                   	pop    %ebp
 6fa:	c3                   	ret    
 6fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 700:	03 72 04             	add    0x4(%edx),%esi
 703:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 706:	8b 10                	mov    (%eax),%edx
 708:	8b 12                	mov    (%edx),%edx
 70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 50 04             	mov    0x4(%eax),%edx
 710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 713:	39 f1                	cmp    %esi,%ecx
 715:	75 d8                	jne    6ef <free+0x4f>
    p->s.size += bp->s.size;
 717:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 71a:	a3 b4 0b 00 00       	mov    %eax,0xbb4
    p->s.size += bp->s.size;
 71f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 722:	8b 53 f8             	mov    -0x8(%ebx),%edx
 725:	89 10                	mov    %edx,(%eax)
}
 727:	5b                   	pop    %ebx
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	f3 0f 1e fb          	endbr32 
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	57                   	push   %edi
 738:	56                   	push   %esi
 739:	53                   	push   %ebx
 73a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 740:	8b 3d b4 0b 00 00    	mov    0xbb4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 746:	8d 70 07             	lea    0x7(%eax),%esi
 749:	c1 ee 03             	shr    $0x3,%esi
 74c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 74f:	85 ff                	test   %edi,%edi
 751:	0f 84 a9 00 00 00    	je     800 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 757:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 759:	8b 48 04             	mov    0x4(%eax),%ecx
 75c:	39 f1                	cmp    %esi,%ecx
 75e:	73 6d                	jae    7cd <malloc+0x9d>
 760:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 766:	bb 00 10 00 00       	mov    $0x1000,%ebx
 76b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 76e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 775:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 778:	eb 17                	jmp    791 <malloc+0x61>
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 780:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 782:	8b 4a 04             	mov    0x4(%edx),%ecx
 785:	39 f1                	cmp    %esi,%ecx
 787:	73 4f                	jae    7d8 <malloc+0xa8>
 789:	8b 3d b4 0b 00 00    	mov    0xbb4,%edi
 78f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 791:	39 c7                	cmp    %eax,%edi
 793:	75 eb                	jne    780 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 795:	83 ec 0c             	sub    $0xc,%esp
 798:	ff 75 e4             	pushl  -0x1c(%ebp)
 79b:	e8 51 fc ff ff       	call   3f1 <sbrk>
  if(p == (char*)-1)
 7a0:	83 c4 10             	add    $0x10,%esp
 7a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a6:	74 1b                	je     7c3 <malloc+0x93>
  hp->s.size = nu;
 7a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	83 c0 08             	add    $0x8,%eax
 7b1:	50                   	push   %eax
 7b2:	e8 e9 fe ff ff       	call   6a0 <free>
  return freep;
 7b7:	a1 b4 0b 00 00       	mov    0xbb4,%eax
      if((p = morecore(nunits)) == 0)
 7bc:	83 c4 10             	add    $0x10,%esp
 7bf:	85 c0                	test   %eax,%eax
 7c1:	75 bd                	jne    780 <malloc+0x50>
        return 0;
  }
}
 7c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7c6:	31 c0                	xor    %eax,%eax
}
 7c8:	5b                   	pop    %ebx
 7c9:	5e                   	pop    %esi
 7ca:	5f                   	pop    %edi
 7cb:	5d                   	pop    %ebp
 7cc:	c3                   	ret    
    if(p->s.size >= nunits){
 7cd:	89 c2                	mov    %eax,%edx
 7cf:	89 f8                	mov    %edi,%eax
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7d8:	39 ce                	cmp    %ecx,%esi
 7da:	74 54                	je     830 <malloc+0x100>
        p->s.size -= nunits;
 7dc:	29 f1                	sub    %esi,%ecx
 7de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 7e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 7e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 7e7:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 7ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7ef:	8d 42 08             	lea    0x8(%edx),%eax
}
 7f2:	5b                   	pop    %ebx
 7f3:	5e                   	pop    %esi
 7f4:	5f                   	pop    %edi
 7f5:	5d                   	pop    %ebp
 7f6:	c3                   	ret    
 7f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 b4 0b 00 00 b8 	movl   $0xbb8,0xbb4
 807:	0b 00 00 
    base.s.size = 0;
 80a:	bf b8 0b 00 00       	mov    $0xbb8,%edi
    base.s.ptr = freep = prevp = &base;
 80f:	c7 05 b8 0b 00 00 b8 	movl   $0xbb8,0xbb8
 816:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 819:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 81b:	c7 05 bc 0b 00 00 00 	movl   $0x0,0xbbc
 822:	00 00 00 
    if(p->s.size >= nunits){
 825:	e9 36 ff ff ff       	jmp    760 <malloc+0x30>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 830:	8b 0a                	mov    (%edx),%ecx
 832:	89 08                	mov    %ecx,(%eax)
 834:	eb b1                	jmp    7e7 <malloc+0xb7>
