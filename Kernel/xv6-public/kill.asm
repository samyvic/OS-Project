
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 30                	jle    51 <main+0x51>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 23 02 00 00       	call   260 <atoi>
  3d:	89 04 24             	mov    %eax,(%esp)
  40:	e8 64 03 00 00       	call   3a9 <kill>
  for(i=1; i<argc; i++)
  45:	83 c4 10             	add    $0x10,%esp
  48:	39 f3                	cmp    %esi,%ebx
  4a:	75 e4                	jne    30 <main+0x30>
  exit();
  4c:	e8 28 03 00 00       	call   379 <exit>
    printf(2, "usage: kill pid...\n");
  51:	50                   	push   %eax
  52:	50                   	push   %eax
  53:	68 48 08 00 00       	push   $0x848
  58:	6a 02                	push   $0x2
  5a:	e8 81 04 00 00       	call   4e0 <printf>
    exit();
  5f:	e8 15 03 00 00       	call   379 <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
uint locked;
};

char*
strcpy(char *s, const char *t)
{
  70:	f3 0f 1e fb          	endbr32 
  74:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  75:	31 c0                	xor    %eax,%eax
{
  77:	89 e5                	mov    %esp,%ebp
  79:	53                   	push   %ebx
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	89 c8                	mov    %ecx,%eax
  90:	5b                   	pop    %ebx
  91:	5d                   	pop    %ebp
  92:	c3                   	ret    
  93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	0f b6 1a             	movzbl (%edx),%ebx
  b4:	84 c0                	test   %al,%al
  b6:	75 19                	jne    d1 <strcmp+0x31>
  b8:	eb 26                	jmp    e0 <strcmp+0x40>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  c4:	83 c1 01             	add    $0x1,%ecx
  c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ca:	0f b6 1a             	movzbl (%edx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	38 d8                	cmp    %bl,%al
  d3:	74 eb                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d5:	29 d8                	sub    %ebx,%eax
}
  d7:	5b                   	pop    %ebx
  d8:	5d                   	pop    %ebp
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  fa:	80 3a 00             	cmpb   $0x0,(%edx)
  fd:	74 21                	je     120 <strlen+0x30>
  ff:	31 c0                	xor    %eax,%eax
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c0 01             	add    $0x1,%eax
 10b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10f:	89 c1                	mov    %eax,%ecx
 111:	75 f5                	jne    108 <strlen+0x18>
    ;
  return n;
}
 113:	89 c8                	mov    %ecx,%eax
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 13b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	89 d7                	mov    %edx,%edi
 143:	fc                   	cld    
 144:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 146:	89 d0                	mov    %edx,%eax
 148:	5f                   	pop    %edi
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	f3 0f 1e fb          	endbr32 
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15e:	0f b6 10             	movzbl (%eax),%edx
 161:	84 d2                	test   %dl,%dl
 163:	75 16                	jne    17b <strchr+0x2b>
 165:	eb 21                	jmp    188 <strchr+0x38>
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret    
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 199:	31 f6                	xor    %esi,%esi
{
 19b:	53                   	push   %ebx
 19c:	89 f3                	mov    %esi,%ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a4:	eb 33                	jmp    1d9 <gets+0x49>
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b6:	6a 01                	push   $0x1
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 d1 01 00 00       	call   391 <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 1c                	jle    1e3 <gets+0x53>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	83 c7 01             	add    $0x1,%edi
 1ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	74 23                	je     1f8 <gets+0x68>
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 1f                	je     1f8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	89 fe                	mov    %edi,%esi
 1de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e1:	7c cd                	jl     1b0 <gets+0x20>
 1e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5f                   	pop    %edi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	8b 75 08             	mov    0x8(%ebp),%esi
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 de                	add    %ebx,%esi
 200:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 202:	c6 03 00             	movb   $0x0,(%ebx)
}
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	6a 00                	push   $0x0
 21e:	ff 75 08             	pushl  0x8(%ebp)
 221:	e8 93 01 00 00       	call   3b9 <open>
  if(fd < 0)
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	78 2b                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 22d:	83 ec 08             	sub    $0x8,%esp
 230:	ff 75 0c             	pushl  0xc(%ebp)
 233:	89 c3                	mov    %eax,%ebx
 235:	50                   	push   %eax
 236:	e8 96 01 00 00       	call   3d1 <fstat>
  close(fd);
 23b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23e:	89 c6                	mov    %eax,%esi
  close(fd);
 240:	e8 5c 01 00 00       	call   3a1 <close>
  return r;
 245:	83 c4 10             	add    $0x10,%esp
}
 248:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24b:	89 f0                	mov    %esi,%eax
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb e9                	jmp    248 <stat+0x38>
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	53                   	push   %ebx
 268:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	0f be 02             	movsbl (%edx),%eax
 26e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 271:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 274:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 279:	77 1a                	ja     295 <atoi+0x35>
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	89 c8                	mov    %ecx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	57                   	push   %edi
 2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 2ab:	8b 55 08             	mov    0x8(%ebp),%edx
 2ae:	56                   	push   %esi
 2af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 0f                	jle    2c5 <memmove+0x25>
 2b6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b8:	89 d7                	mov    %edx,%edi
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <thread_create>:


//thread library
int
thread_create(void(*start_routine)(void*,void*),void* arg1 ,void* arg2)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 14             	sub    $0x14,%esp
void* stack;
stack =sbrk(4096);  //pgsize
 2da:	68 00 10 00 00       	push   $0x1000
 2df:	e8 1d 01 00 00       	call   401 <sbrk>
return clone(start_routine,arg1,arg2,stack);
 2e4:	50                   	push   %eax
 2e5:	ff 75 10             	pushl  0x10(%ebp)
 2e8:	ff 75 0c             	pushl  0xc(%ebp)
 2eb:	ff 75 08             	pushl  0x8(%ebp)
 2ee:	e8 26 01 00 00       	call   419 <clone>
}
 2f3:	c9                   	leave  
 2f4:	c3                   	ret    
 2f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <thread_join>:
int thread_join()
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
 30a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30d:	50                   	push   %eax
 30e:	e8 0e 01 00 00       	call   421 <join>
  
  return x;
}
 313:	c9                   	leave  
 314:	c3                   	ret    
 315:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <lock_init>:

void lock_init(struct lock_t *lk){
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
lk->locked=0; //intialize as unnlocked
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 330:	5d                   	pop    %ebp
 331:	c3                   	ret    
 332:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <lock_acquire>:
void lock_acquire(struct lock_t *lk){
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 345:	b9 01 00 00 00       	mov    $0x1,%ecx
 34a:	89 e5                	mov    %esp,%ebp
 34c:	8b 55 08             	mov    0x8(%ebp),%edx
 34f:	90                   	nop
 350:	89 c8                	mov    %ecx,%eax
 352:	f0 87 02             	lock xchg %eax,(%edx)
while(xchg(&lk->locked,1) != 0);
 355:	85 c0                	test   %eax,%eax
 357:	75 f7                	jne    350 <lock_acquire+0x10>
}
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <lock_release>:
void lock_release(struct lock_t *lk){
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	31 c0                	xor    %eax,%eax
 367:	89 e5                	mov    %esp,%ebp
 369:	8b 55 08             	mov    0x8(%ebp),%edx
 36c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked,0) ;
}
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    

00000371 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 371:	b8 01 00 00 00       	mov    $0x1,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <exit>:
SYSCALL(exit)
 379:	b8 02 00 00 00       	mov    $0x2,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <wait>:
SYSCALL(wait)
 381:	b8 03 00 00 00       	mov    $0x3,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <pipe>:
SYSCALL(pipe)
 389:	b8 04 00 00 00       	mov    $0x4,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <read>:
SYSCALL(read)
 391:	b8 05 00 00 00       	mov    $0x5,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <write>:
SYSCALL(write)
 399:	b8 10 00 00 00       	mov    $0x10,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <close>:
SYSCALL(close)
 3a1:	b8 15 00 00 00       	mov    $0x15,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <kill>:
SYSCALL(kill)
 3a9:	b8 06 00 00 00       	mov    $0x6,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <exec>:
SYSCALL(exec)
 3b1:	b8 07 00 00 00       	mov    $0x7,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <open>:
SYSCALL(open)
 3b9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <mknod>:
SYSCALL(mknod)
 3c1:	b8 11 00 00 00       	mov    $0x11,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <unlink>:
SYSCALL(unlink)
 3c9:	b8 12 00 00 00       	mov    $0x12,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <fstat>:
SYSCALL(fstat)
 3d1:	b8 08 00 00 00       	mov    $0x8,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <link>:
SYSCALL(link)
 3d9:	b8 13 00 00 00       	mov    $0x13,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <mkdir>:
SYSCALL(mkdir)
 3e1:	b8 14 00 00 00       	mov    $0x14,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <chdir>:
SYSCALL(chdir)
 3e9:	b8 09 00 00 00       	mov    $0x9,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <dup>:
SYSCALL(dup)
 3f1:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <getpid>:
SYSCALL(getpid)
 3f9:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <sbrk>:
SYSCALL(sbrk)
 401:	b8 0c 00 00 00       	mov    $0xc,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <sleep>:
SYSCALL(sleep)
 409:	b8 0d 00 00 00       	mov    $0xd,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <uptime>:
SYSCALL(uptime)
 411:	b8 0e 00 00 00       	mov    $0xe,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <clone>:
SYSCALL(clone)
 419:	b8 16 00 00 00       	mov    $0x16,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <join>:
 421:	b8 17 00 00 00       	mov    $0x17,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    
 429:	66 90                	xchg   %ax,%ax
 42b:	66 90                	xchg   %ax,%ax
 42d:	66 90                	xchg   %ax,%ax
 42f:	90                   	nop

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
 439:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 43c:	89 d1                	mov    %edx,%ecx
{
 43e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 441:	85 d2                	test   %edx,%edx
 443:	0f 89 7f 00 00 00    	jns    4c8 <printint+0x98>
 449:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 44d:	74 79                	je     4c8 <printint+0x98>
    neg = 1;
 44f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 456:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 458:	31 db                	xor    %ebx,%ebx
 45a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	31 d2                	xor    %edx,%edx
 464:	89 cf                	mov    %ecx,%edi
 466:	f7 75 c4             	divl   -0x3c(%ebp)
 469:	0f b6 92 64 08 00 00 	movzbl 0x864(%edx),%edx
 470:	89 45 c0             	mov    %eax,-0x40(%ebp)
 473:	89 d8                	mov    %ebx,%eax
 475:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 478:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 47b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 47e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 481:	76 dd                	jbe    460 <printint+0x30>
  if(neg)
 483:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 486:	85 c9                	test   %ecx,%ecx
 488:	74 0c                	je     496 <printint+0x66>
    buf[i++] = '-';
 48a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 48f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 491:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 496:	8b 7d b8             	mov    -0x48(%ebp),%edi
 499:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 49d:	eb 07                	jmp    4a6 <printint+0x76>
 49f:	90                   	nop
 4a0:	0f b6 13             	movzbl (%ebx),%edx
 4a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4a6:	83 ec 04             	sub    $0x4,%esp
 4a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4ac:	6a 01                	push   $0x1
 4ae:	56                   	push   %esi
 4af:	57                   	push   %edi
 4b0:	e8 e4 fe ff ff       	call   399 <write>
  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x70>
    putc(fd, buf[i]);
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4cf:	eb 87                	jmp    458 <printint+0x28>
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	57                   	push   %edi
 4e8:	56                   	push   %esi
 4e9:	53                   	push   %ebx
 4ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 4f0:	0f b6 1e             	movzbl (%esi),%ebx
 4f3:	84 db                	test   %bl,%bl
 4f5:	0f 84 b4 00 00 00    	je     5af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 4fb:	8d 45 10             	lea    0x10(%ebp),%eax
 4fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 501:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 504:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 506:	89 45 d0             	mov    %eax,-0x30(%ebp)
 509:	eb 33                	jmp    53e <printf+0x5e>
 50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop
 510:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 513:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	74 17                	je     534 <printf+0x54>
  write(fd, &c, 1);
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	88 5d e7             	mov    %bl,-0x19(%ebp)
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	ff 75 08             	pushl  0x8(%ebp)
 529:	e8 6b fe ff ff       	call   399 <write>
 52e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 531:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 534:	0f b6 1e             	movzbl (%esi),%ebx
 537:	83 c6 01             	add    $0x1,%esi
 53a:	84 db                	test   %bl,%bl
 53c:	74 71                	je     5af <printf+0xcf>
    c = fmt[i] & 0xff;
 53e:	0f be cb             	movsbl %bl,%ecx
 541:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 544:	85 d2                	test   %edx,%edx
 546:	74 c8                	je     510 <printf+0x30>
      }
    } else if(state == '%'){
 548:	83 fa 25             	cmp    $0x25,%edx
 54b:	75 e7                	jne    534 <printf+0x54>
      if(c == 'd'){
 54d:	83 f8 64             	cmp    $0x64,%eax
 550:	0f 84 9a 00 00 00    	je     5f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 556:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 55c:	83 f9 70             	cmp    $0x70,%ecx
 55f:	74 5f                	je     5c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 561:	83 f8 73             	cmp    $0x73,%eax
 564:	0f 84 d6 00 00 00    	je     640 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56a:	83 f8 63             	cmp    $0x63,%eax
 56d:	0f 84 8d 00 00 00    	je     600 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 573:	83 f8 25             	cmp    $0x25,%eax
 576:	0f 84 b4 00 00 00    	je     630 <printf+0x150>
  write(fd, &c, 1);
 57c:	83 ec 04             	sub    $0x4,%esp
 57f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	ff 75 08             	pushl  0x8(%ebp)
 589:	e8 0b fe ff ff       	call   399 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 58e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 591:	83 c4 0c             	add    $0xc,%esp
 594:	6a 01                	push   $0x1
 596:	83 c6 01             	add    $0x1,%esi
 599:	57                   	push   %edi
 59a:	ff 75 08             	pushl  0x8(%ebp)
 59d:	e8 f7 fd ff ff       	call   399 <write>
  for(i = 0; fmt[i]; i++){
 5a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5ab:	84 db                	test   %bl,%bl
 5ad:	75 8f                	jne    53e <printf+0x5e>
    }
  }
}
 5af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5c8:	6a 00                	push   $0x0
 5ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	8b 13                	mov    (%ebx),%edx
 5d2:	e8 59 fe ff ff       	call   430 <printint>
        ap++;
 5d7:	89 d8                	mov    %ebx,%eax
 5d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5dc:	31 d2                	xor    %edx,%edx
        ap++;
 5de:	83 c0 04             	add    $0x4,%eax
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	e9 4b ff ff ff       	jmp    534 <printf+0x54>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f8:	6a 01                	push   $0x1
 5fa:	eb ce                	jmp    5ca <printf+0xea>
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 600:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 603:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 606:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 608:	6a 01                	push   $0x1
        ap++;
 60a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 60d:	57                   	push   %edi
 60e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 611:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 614:	e8 80 fd ff ff       	call   399 <write>
        ap++;
 619:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 61c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61f:	31 d2                	xor    %edx,%edx
 621:	e9 0e ff ff ff       	jmp    534 <printf+0x54>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 630:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
 636:	e9 59 ff ff ff       	jmp    594 <printf+0xb4>
 63b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
        s = (char*)*ap;
 640:	8b 45 d0             	mov    -0x30(%ebp),%eax
 643:	8b 18                	mov    (%eax),%ebx
        ap++;
 645:	83 c0 04             	add    $0x4,%eax
 648:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 64b:	85 db                	test   %ebx,%ebx
 64d:	74 17                	je     666 <printf+0x186>
        while(*s != 0){
 64f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 652:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 654:	84 c0                	test   %al,%al
 656:	0f 84 d8 fe ff ff    	je     534 <printf+0x54>
 65c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65f:	89 de                	mov    %ebx,%esi
 661:	8b 5d 08             	mov    0x8(%ebp),%ebx
 664:	eb 1a                	jmp    680 <printf+0x1a0>
          s = "(null)";
 666:	bb 5c 08 00 00       	mov    $0x85c,%ebx
        while(*s != 0){
 66b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 66e:	b8 28 00 00 00       	mov    $0x28,%eax
 673:	89 de                	mov    %ebx,%esi
 675:	8b 5d 08             	mov    0x8(%ebp),%ebx
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
          s++;
 683:	83 c6 01             	add    $0x1,%esi
 686:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	57                   	push   %edi
 68c:	53                   	push   %ebx
 68d:	e8 07 fd ff ff       	call   399 <write>
        while(*s != 0){
 692:	0f b6 06             	movzbl (%esi),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x1a0>
 69c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 8e fe ff ff       	jmp    534 <printf+0x54>
 6a6:	66 90                	xchg   %ax,%ax
 6a8:	66 90                	xchg   %ax,%ax
 6aa:	66 90                	xchg   %ax,%ax
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	f3 0f 1e fb          	endbr32 
 6b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b5:	a1 b4 0b 00 00       	mov    0xbb4,%eax
{
 6ba:	89 e5                	mov    %esp,%ebp
 6bc:	57                   	push   %edi
 6bd:	56                   	push   %esi
 6be:	53                   	push   %ebx
 6bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c7:	39 c8                	cmp    %ecx,%eax
 6c9:	73 15                	jae    6e0 <free+0x30>
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
 6d0:	39 d1                	cmp    %edx,%ecx
 6d2:	72 14                	jb     6e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d4:	39 d0                	cmp    %edx,%eax
 6d6:	73 10                	jae    6e8 <free+0x38>
{
 6d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	39 c8                	cmp    %ecx,%eax
 6de:	72 f0                	jb     6d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	39 d0                	cmp    %edx,%eax
 6e2:	72 f4                	jb     6d8 <free+0x28>
 6e4:	39 d1                	cmp    %edx,%ecx
 6e6:	73 f0                	jae    6d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ee:	39 fa                	cmp    %edi,%edx
 6f0:	74 1e                	je     710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f5:	8b 50 04             	mov    0x4(%eax),%edx
 6f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6fb:	39 f1                	cmp    %esi,%ecx
 6fd:	74 28                	je     727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 701:	5b                   	pop    %ebx
  freep = p;
 702:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	75 d8                	jne    6ff <free+0x4f>
    p->s.size += bp->s.size;
 727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 72a:	a3 b4 0b 00 00       	mov    %eax,0xbb4
    p->s.size += bp->s.size;
 72f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 732:	8b 53 f8             	mov    -0x8(%ebx),%edx
 735:	89 10                	mov    %edx,(%eax)
}
 737:	5b                   	pop    %ebx
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	f3 0f 1e fb          	endbr32 
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	57                   	push   %edi
 748:	56                   	push   %esi
 749:	53                   	push   %ebx
 74a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 750:	8b 3d b4 0b 00 00    	mov    0xbb4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 756:	8d 70 07             	lea    0x7(%eax),%esi
 759:	c1 ee 03             	shr    $0x3,%esi
 75c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 75f:	85 ff                	test   %edi,%edi
 761:	0f 84 a9 00 00 00    	je     810 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 767:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 769:	8b 48 04             	mov    0x4(%eax),%ecx
 76c:	39 f1                	cmp    %esi,%ecx
 76e:	73 6d                	jae    7dd <malloc+0x9d>
 770:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 776:	bb 00 10 00 00       	mov    $0x1000,%ebx
 77b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 77e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 785:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 788:	eb 17                	jmp    7a1 <malloc+0x61>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 790:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 792:	8b 4a 04             	mov    0x4(%edx),%ecx
 795:	39 f1                	cmp    %esi,%ecx
 797:	73 4f                	jae    7e8 <malloc+0xa8>
 799:	8b 3d b4 0b 00 00    	mov    0xbb4,%edi
 79f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a1:	39 c7                	cmp    %eax,%edi
 7a3:	75 eb                	jne    790 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7a5:	83 ec 0c             	sub    $0xc,%esp
 7a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7ab:	e8 51 fc ff ff       	call   401 <sbrk>
  if(p == (char*)-1)
 7b0:	83 c4 10             	add    $0x10,%esp
 7b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b6:	74 1b                	je     7d3 <malloc+0x93>
  hp->s.size = nu;
 7b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bb:	83 ec 0c             	sub    $0xc,%esp
 7be:	83 c0 08             	add    $0x8,%eax
 7c1:	50                   	push   %eax
 7c2:	e8 e9 fe ff ff       	call   6b0 <free>
  return freep;
 7c7:	a1 b4 0b 00 00       	mov    0xbb4,%eax
      if((p = morecore(nunits)) == 0)
 7cc:	83 c4 10             	add    $0x10,%esp
 7cf:	85 c0                	test   %eax,%eax
 7d1:	75 bd                	jne    790 <malloc+0x50>
        return 0;
  }
}
 7d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7d6:	31 c0                	xor    %eax,%eax
}
 7d8:	5b                   	pop    %ebx
 7d9:	5e                   	pop    %esi
 7da:	5f                   	pop    %edi
 7db:	5d                   	pop    %ebp
 7dc:	c3                   	ret    
    if(p->s.size >= nunits){
 7dd:	89 c2                	mov    %eax,%edx
 7df:	89 f8                	mov    %edi,%eax
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7e8:	39 ce                	cmp    %ecx,%esi
 7ea:	74 54                	je     840 <malloc+0x100>
        p->s.size -= nunits;
 7ec:	29 f1                	sub    %esi,%ecx
 7ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 7f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 7f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 7f7:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7ff:	8d 42 08             	lea    0x8(%edx),%eax
}
 802:	5b                   	pop    %ebx
 803:	5e                   	pop    %esi
 804:	5f                   	pop    %edi
 805:	5d                   	pop    %ebp
 806:	c3                   	ret    
 807:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 810:	c7 05 b4 0b 00 00 b8 	movl   $0xbb8,0xbb4
 817:	0b 00 00 
    base.s.size = 0;
 81a:	bf b8 0b 00 00       	mov    $0xbb8,%edi
    base.s.ptr = freep = prevp = &base;
 81f:	c7 05 b8 0b 00 00 b8 	movl   $0xbb8,0xbb8
 826:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 829:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 82b:	c7 05 bc 0b 00 00 00 	movl   $0x0,0xbbc
 832:	00 00 00 
    if(p->s.size >= nunits){
 835:	e9 36 ff ff ff       	jmp    770 <malloc+0x30>
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 840:	8b 0a                	mov    (%edx),%ecx
 842:	89 08                	mov    %ecx,(%eax)
 844:	eb b1                	jmp    7f7 <malloc+0xb7>
