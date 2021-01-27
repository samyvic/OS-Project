
_bakr_proc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "mmu.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  
  char *first = sbrk(0);
   f:	83 ec 0c             	sub    $0xc,%esp
  12:	6a 00                	push   $0x0
  14:	e8 c4 02 00 00       	call   2dd <sbrk>
  19:	89 c3                	mov    %eax,%ebx

  sbrk(PGSIZE);
  1b:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  22:	e8 b6 02 00 00       	call   2dd <sbrk>

  *first = 100;
  27:	c6 03 64             	movb   $0x64,(%ebx)
  mprotect(first, 1) ;
  2a:	59                   	pop    %ecx
  2b:	58                   	pop    %eax
  2c:	6a 01                	push   $0x1
  2e:	53                   	push   %ebx
  2f:	e8 c1 02 00 00       	call   2f5 <mprotect>

  int child = fork();
  34:	e8 14 02 00 00       	call   24d <fork>

  if (child > 0)
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	7f 07                	jg     47 <main+0x47>
        *first = 5; 
        
        printf(1, "\nCan you see this message :))\n");

  }
  else if (child == 0)
  40:	74 2e                	je     70 <main+0x70>
  else
  {

  }

 exit();
  42:	e8 0e 02 00 00       	call   255 <exit>
            wait();
  47:	e8 11 02 00 00       	call   25d <wait>
       printf(1, "\nThis will be a trap\n"); 
  4c:	50                   	push   %eax
  4d:	50                   	push   %eax
  4e:	68 9c 06 00 00       	push   $0x69c
  53:	6a 01                	push   $0x1
  55:	e8 36 03 00 00       	call   390 <printf>
        *first = 5; 
  5a:	c6 03 05             	movb   $0x5,(%ebx)
        printf(1, "\nCan you see this message :))\n");
  5d:	58                   	pop    %eax
  5e:	5a                   	pop    %edx
  5f:	68 d0 06 00 00       	push   $0x6d0
  64:	6a 01                	push   $0x1
  66:	e8 25 03 00 00       	call   390 <printf>
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	eb d2                	jmp    42 <main+0x42>
      printf(1, "This value is protected = %d\n",*first); 
  70:	50                   	push   %eax
  71:	0f be 03             	movsbl (%ebx),%eax
  74:	50                   	push   %eax
  75:	68 b2 06 00 00       	push   $0x6b2
  7a:	6a 01                	push   $0x1
  7c:	e8 0f 03 00 00       	call   390 <printf>
        munprotect(first, 1) ;  
  81:	5a                   	pop    %edx
  82:	59                   	pop    %ecx
  83:	6a 01                	push   $0x1
  85:	53                   	push   %ebx
  86:	e8 72 02 00 00       	call   2fd <munprotect>
        *first = 5;
  8b:	c6 03 05             	movb   $0x5,(%ebx)
        printf(1, "This value is unprotected = %d\n",*first); 
  8e:	83 c4 0c             	add    $0xc,%esp
  91:	6a 05                	push   $0x5
  93:	68 f0 06 00 00       	push   $0x6f0
  98:	6a 01                	push   $0x1
  9a:	e8 f1 02 00 00       	call   390 <printf>
  9f:	83 c4 10             	add    $0x10,%esp
  a2:	eb 9e                	jmp    42 <main+0x42>

000000a4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ae:	31 c0                	xor    %eax,%eax
  b0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  b3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b6:	40                   	inc    %eax
  b7:	84 d2                	test   %dl,%dl
  b9:	75 f5                	jne    b0 <strcpy+0xc>
    ;
  return os;
}
  bb:	89 c8                	mov    %ecx,%eax
  bd:	5b                   	pop    %ebx
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	53                   	push   %ebx
  c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ca:	0f b6 03             	movzbl (%ebx),%eax
  cd:	0f b6 0a             	movzbl (%edx),%ecx
  d0:	84 c0                	test   %al,%al
  d2:	75 10                	jne    e4 <strcmp+0x24>
  d4:	eb 1a                	jmp    f0 <strcmp+0x30>
  d6:	66 90                	xchg   %ax,%ax
    p++, q++;
  d8:	43                   	inc    %ebx
  d9:	42                   	inc    %edx
  while(*p && *p == *q)
  da:	0f b6 03             	movzbl (%ebx),%eax
  dd:	0f b6 0a             	movzbl (%edx),%ecx
  e0:	84 c0                	test   %al,%al
  e2:	74 0c                	je     f0 <strcmp+0x30>
  e4:	38 c8                	cmp    %cl,%al
  e6:	74 f0                	je     d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  e8:	29 c8                	sub    %ecx,%eax
}
  ea:	5b                   	pop    %ebx
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 c8                	sub    %ecx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	90                   	nop

000000f8 <strlen>:

uint
strlen(const char *s)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  fe:	80 3a 00             	cmpb   $0x0,(%edx)
 101:	74 15                	je     118 <strlen+0x20>
 103:	31 c0                	xor    %eax,%eax
 105:	8d 76 00             	lea    0x0(%esi),%esi
 108:	40                   	inc    %eax
 109:	89 c1                	mov    %eax,%ecx
 10b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10f:	75 f7                	jne    108 <strlen+0x10>
    ;
  return n;
}
 111:	89 c8                	mov    %ecx,%eax
 113:	5d                   	pop    %ebp
 114:	c3                   	ret    
 115:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 118:	31 c9                	xor    %ecx,%ecx
}
 11a:	89 c8                	mov    %ecx,%eax
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    
 11e:	66 90                	xchg   %ax,%ax

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 124:	8b 7d 08             	mov    0x8(%ebp),%edi
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	fc                   	cld    
 12e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	5f                   	pop    %edi
 134:	5d                   	pop    %ebp
 135:	c3                   	ret    
 136:	66 90                	xchg   %ax,%ax

00000138 <strchr>:

char*
strchr(const char *s, char c)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	8a 4d 0c             	mov    0xc(%ebp),%cl
  for(; *s; s++)
 141:	8a 10                	mov    (%eax),%dl
 143:	84 d2                	test   %dl,%dl
 145:	75 0c                	jne    153 <strchr+0x1b>
 147:	eb 13                	jmp    15c <strchr+0x24>
 149:	8d 76 00             	lea    0x0(%esi),%esi
 14c:	40                   	inc    %eax
 14d:	8a 10                	mov    (%eax),%dl
 14f:	84 d2                	test   %dl,%dl
 151:	74 09                	je     15c <strchr+0x24>
    if(*s == c)
 153:	38 d1                	cmp    %dl,%cl
 155:	75 f5                	jne    14c <strchr+0x14>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d 76 00             	lea    0x0(%esi),%esi
  return 0;
 15c:	31 c0                	xor    %eax,%eax
}
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <gets>:

char*
gets(char *buf, int max)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 169:	8b 75 08             	mov    0x8(%ebp),%esi
 16c:	bb 01 00 00 00       	mov    $0x1,%ebx
 171:	29 f3                	sub    %esi,%ebx
    cc = read(0, &c, 1);
 173:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 176:	eb 20                	jmp    198 <gets+0x38>
    cc = read(0, &c, 1);
 178:	50                   	push   %eax
 179:	6a 01                	push   $0x1
 17b:	57                   	push   %edi
 17c:	6a 00                	push   $0x0
 17e:	e8 ea 00 00 00       	call   26d <read>
    if(cc < 1)
 183:	83 c4 10             	add    $0x10,%esp
 186:	85 c0                	test   %eax,%eax
 188:	7e 16                	jle    1a0 <gets+0x40>
      break;
    buf[i++] = c;
 18a:	8a 45 e7             	mov    -0x19(%ebp),%al
 18d:	88 06                	mov    %al,(%esi)
    if(c == '\n' || c == '\r')
 18f:	46                   	inc    %esi
 190:	3c 0a                	cmp    $0xa,%al
 192:	74 0c                	je     1a0 <gets+0x40>
 194:	3c 0d                	cmp    $0xd,%al
 196:	74 08                	je     1a0 <gets+0x40>
  for(i=0; i+1 < max; ){
 198:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 19b:	39 45 0c             	cmp    %eax,0xc(%ebp)
 19e:	7f d8                	jg     178 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 1a0:	c6 06 00             	movb   $0x0,(%esi)
  return buf;
}
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a9:	5b                   	pop    %ebx
 1aa:	5e                   	pop    %esi
 1ab:	5f                   	pop    %edi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	pushl  0x8(%ebp)
 1bd:	e8 d3 00 00 00       	call   295 <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
 1c9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1cb:	83 ec 08             	sub    $0x8,%esp
 1ce:	ff 75 0c             	pushl  0xc(%ebp)
 1d1:	50                   	push   %eax
 1d2:	e8 d6 00 00 00       	call   2ad <fstat>
 1d7:	89 c6                	mov    %eax,%esi
  close(fd);
 1d9:	89 1c 24             	mov    %ebx,(%esp)
 1dc:	e8 9c 00 00 00       	call   27d <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	89 f0                	mov    %esi,%eax
 1e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f5:	eb ed                	jmp    1e4 <stat+0x34>
 1f7:	90                   	nop

000001f8 <atoi>:

int
atoi(const char *s)
{
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	53                   	push   %ebx
 1fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1ff:	0f be 01             	movsbl (%ecx),%eax
 202:	8d 50 d0             	lea    -0x30(%eax),%edx
 205:	80 fa 09             	cmp    $0x9,%dl
  n = 0;
 208:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 20d:	77 16                	ja     225 <atoi+0x2d>
 20f:	90                   	nop
    n = n*10 + *s++ - '0';
 210:	41                   	inc    %ecx
 211:	8d 14 92             	lea    (%edx,%edx,4),%edx
 214:	01 d2                	add    %edx,%edx
 216:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
  while('0' <= *s && *s <= '9')
 21a:	0f be 01             	movsbl (%ecx),%eax
 21d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 220:	80 fb 09             	cmp    $0x9,%bl
 223:	76 eb                	jbe    210 <atoi+0x18>
  return n;
}
 225:	89 d0                	mov    %edx,%eax
 227:	5b                   	pop    %ebx
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    
 22a:	66 90                	xchg   %ax,%ax

0000022c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	57                   	push   %edi
 230:	56                   	push   %esi
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	8b 75 0c             	mov    0xc(%ebp),%esi
 237:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 23a:	85 d2                	test   %edx,%edx
 23c:	7e 0b                	jle    249 <memmove+0x1d>
 23e:	01 c2                	add    %eax,%edx
  dst = vdst;
 240:	89 c7                	mov    %eax,%edi
 242:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 244:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 245:	39 fa                	cmp    %edi,%edx
 247:	75 fb                	jne    244 <memmove+0x18>
  return vdst;
}
 249:	5e                   	pop    %esi
 24a:	5f                   	pop    %edi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    

0000024d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24d:	b8 01 00 00 00       	mov    $0x1,%eax
 252:	cd 40                	int    $0x40
 254:	c3                   	ret    

00000255 <exit>:
SYSCALL(exit)
 255:	b8 02 00 00 00       	mov    $0x2,%eax
 25a:	cd 40                	int    $0x40
 25c:	c3                   	ret    

0000025d <wait>:
SYSCALL(wait)
 25d:	b8 03 00 00 00       	mov    $0x3,%eax
 262:	cd 40                	int    $0x40
 264:	c3                   	ret    

00000265 <pipe>:
SYSCALL(pipe)
 265:	b8 04 00 00 00       	mov    $0x4,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <read>:
SYSCALL(read)
 26d:	b8 05 00 00 00       	mov    $0x5,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <write>:
SYSCALL(write)
 275:	b8 10 00 00 00       	mov    $0x10,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <close>:
SYSCALL(close)
 27d:	b8 15 00 00 00       	mov    $0x15,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <kill>:
SYSCALL(kill)
 285:	b8 06 00 00 00       	mov    $0x6,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <exec>:
SYSCALL(exec)
 28d:	b8 07 00 00 00       	mov    $0x7,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <open>:
SYSCALL(open)
 295:	b8 0f 00 00 00       	mov    $0xf,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <mknod>:
SYSCALL(mknod)
 29d:	b8 11 00 00 00       	mov    $0x11,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <unlink>:
SYSCALL(unlink)
 2a5:	b8 12 00 00 00       	mov    $0x12,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <fstat>:
SYSCALL(fstat)
 2ad:	b8 08 00 00 00       	mov    $0x8,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <link>:
SYSCALL(link)
 2b5:	b8 13 00 00 00       	mov    $0x13,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <mkdir>:
SYSCALL(mkdir)
 2bd:	b8 14 00 00 00       	mov    $0x14,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <chdir>:
SYSCALL(chdir)
 2c5:	b8 09 00 00 00       	mov    $0x9,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <dup>:
SYSCALL(dup)
 2cd:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <getpid>:
SYSCALL(getpid)
 2d5:	b8 0b 00 00 00       	mov    $0xb,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <sbrk>:
SYSCALL(sbrk)
 2dd:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <sleep>:
SYSCALL(sleep)
 2e5:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <uptime>:
SYSCALL(uptime)
 2ed:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <mprotect>:
#me
SYSCALL(mprotect)
 2f5:	b8 16 00 00 00       	mov    $0x16,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <munprotect>:
SYSCALL(munprotect)
 2fd:	b8 17 00 00 00       	mov    $0x17,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    
 305:	66 90                	xchg   %ax,%ax
 307:	90                   	nop

00000308 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	57                   	push   %edi
 30c:	56                   	push   %esi
 30d:	53                   	push   %ebx
 30e:	83 ec 3c             	sub    $0x3c,%esp
 311:	89 45 bc             	mov    %eax,-0x44(%ebp)
 314:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 317:	89 d1                	mov    %edx,%ecx
  if(sgn && xx < 0){
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	85 db                	test   %ebx,%ebx
 31e:	74 04                	je     324 <printint+0x1c>
 320:	85 d2                	test   %edx,%edx
 322:	78 68                	js     38c <printint+0x84>
  neg = 0;
 324:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 32b:	31 ff                	xor    %edi,%edi
 32d:	8d 75 d7             	lea    -0x29(%ebp),%esi
  do{
    buf[i++] = digits[x % base];
 330:	89 c8                	mov    %ecx,%eax
 332:	31 d2                	xor    %edx,%edx
 334:	f7 75 c4             	divl   -0x3c(%ebp)
 337:	89 fb                	mov    %edi,%ebx
 339:	8d 7f 01             	lea    0x1(%edi),%edi
 33c:	8a 92 18 07 00 00    	mov    0x718(%edx),%dl
 342:	88 54 1e 01          	mov    %dl,0x1(%esi,%ebx,1)
  }while((x /= base) != 0);
 346:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 349:	89 c1                	mov    %eax,%ecx
 34b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 34e:	3b 45 c0             	cmp    -0x40(%ebp),%eax
 351:	76 dd                	jbe    330 <printint+0x28>
  if(neg)
 353:	8b 4d 08             	mov    0x8(%ebp),%ecx
 356:	85 c9                	test   %ecx,%ecx
 358:	74 09                	je     363 <printint+0x5b>
    buf[i++] = '-';
 35a:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    buf[i++] = digits[x % base];
 35f:	89 fb                	mov    %edi,%ebx
    buf[i++] = '-';
 361:	b2 2d                	mov    $0x2d,%dl

  while(--i >= 0)
 363:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 367:	8b 7d bc             	mov    -0x44(%ebp),%edi
 36a:	eb 03                	jmp    36f <printint+0x67>
 36c:	8a 13                	mov    (%ebx),%dl
 36e:	4b                   	dec    %ebx
    putc(fd, buf[i]);
 36f:	88 55 d7             	mov    %dl,-0x29(%ebp)
  write(fd, &c, 1);
 372:	50                   	push   %eax
 373:	6a 01                	push   $0x1
 375:	56                   	push   %esi
 376:	57                   	push   %edi
 377:	e8 f9 fe ff ff       	call   275 <write>
  while(--i >= 0)
 37c:	83 c4 10             	add    $0x10,%esp
 37f:	39 de                	cmp    %ebx,%esi
 381:	75 e9                	jne    36c <printint+0x64>
}
 383:	8d 65 f4             	lea    -0xc(%ebp),%esp
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    
 38b:	90                   	nop
    x = -xx;
 38c:	f7 d9                	neg    %ecx
 38e:	eb 9b                	jmp    32b <printint+0x23>

00000390 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 399:	8b 75 0c             	mov    0xc(%ebp),%esi
 39c:	8a 1e                	mov    (%esi),%bl
 39e:	84 db                	test   %bl,%bl
 3a0:	0f 84 a3 00 00 00    	je     449 <printf+0xb9>
 3a6:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 3a7:	8d 45 10             	lea    0x10(%ebp),%eax
 3aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
  state = 0;
 3ad:	31 d2                	xor    %edx,%edx
  write(fd, &c, 1);
 3af:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3b2:	eb 29                	jmp    3dd <printf+0x4d>
 3b4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3b7:	83 f8 25             	cmp    $0x25,%eax
 3ba:	0f 84 94 00 00 00    	je     454 <printf+0xc4>
        state = '%';
      } else {
        putc(fd, c);
 3c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 3c3:	50                   	push   %eax
 3c4:	6a 01                	push   $0x1
 3c6:	57                   	push   %edi
 3c7:	ff 75 08             	pushl  0x8(%ebp)
 3ca:	e8 a6 fe ff ff       	call   275 <write>
        putc(fd, c);
 3cf:	83 c4 10             	add    $0x10,%esp
 3d2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  for(i = 0; fmt[i]; i++){
 3d5:	46                   	inc    %esi
 3d6:	8a 5e ff             	mov    -0x1(%esi),%bl
 3d9:	84 db                	test   %bl,%bl
 3db:	74 6c                	je     449 <printf+0xb9>
    c = fmt[i] & 0xff;
 3dd:	0f be cb             	movsbl %bl,%ecx
 3e0:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 3e3:	85 d2                	test   %edx,%edx
 3e5:	74 cd                	je     3b4 <printf+0x24>
      }
    } else if(state == '%'){
 3e7:	83 fa 25             	cmp    $0x25,%edx
 3ea:	75 e9                	jne    3d5 <printf+0x45>
      if(c == 'd'){
 3ec:	83 f8 64             	cmp    $0x64,%eax
 3ef:	0f 84 97 00 00 00    	je     48c <printf+0xfc>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3f5:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 3fb:	83 f9 70             	cmp    $0x70,%ecx
 3fe:	74 60                	je     460 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 400:	83 f8 73             	cmp    $0x73,%eax
 403:	0f 84 8f 00 00 00    	je     498 <printf+0x108>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 409:	83 f8 63             	cmp    $0x63,%eax
 40c:	0f 84 d6 00 00 00    	je     4e8 <printf+0x158>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 412:	83 f8 25             	cmp    $0x25,%eax
 415:	0f 84 c1 00 00 00    	je     4dc <printf+0x14c>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 41b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 41f:	50                   	push   %eax
 420:	6a 01                	push   $0x1
 422:	57                   	push   %edi
 423:	ff 75 08             	pushl  0x8(%ebp)
 426:	e8 4a fe ff ff       	call   275 <write>
        putc(fd, c);
 42b:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 42e:	83 c4 0c             	add    $0xc,%esp
 431:	6a 01                	push   $0x1
 433:	57                   	push   %edi
 434:	ff 75 08             	pushl  0x8(%ebp)
 437:	e8 39 fe ff ff       	call   275 <write>
        putc(fd, c);
 43c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 43f:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 441:	46                   	inc    %esi
 442:	8a 5e ff             	mov    -0x1(%esi),%bl
 445:	84 db                	test   %bl,%bl
 447:	75 94                	jne    3dd <printf+0x4d>
    }
  }
}
 449:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44c:	5b                   	pop    %ebx
 44d:	5e                   	pop    %esi
 44e:	5f                   	pop    %edi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d 76 00             	lea    0x0(%esi),%esi
        state = '%';
 454:	ba 25 00 00 00       	mov    $0x25,%edx
 459:	e9 77 ff ff ff       	jmp    3d5 <printf+0x45>
 45e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 460:	83 ec 0c             	sub    $0xc,%esp
 463:	6a 00                	push   $0x0
 465:	b9 10 00 00 00       	mov    $0x10,%ecx
 46a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 46d:	8b 13                	mov    (%ebx),%edx
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	e8 91 fe ff ff       	call   308 <printint>
        ap++;
 477:	89 d8                	mov    %ebx,%eax
 479:	83 c0 04             	add    $0x4,%eax
 47c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 47f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 482:	31 d2                	xor    %edx,%edx
        ap++;
 484:	e9 4c ff ff ff       	jmp    3d5 <printf+0x45>
 489:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 48c:	83 ec 0c             	sub    $0xc,%esp
 48f:	6a 01                	push   $0x1
 491:	b9 0a 00 00 00       	mov    $0xa,%ecx
 496:	eb d2                	jmp    46a <printf+0xda>
        s = (char*)*ap;
 498:	8b 45 d0             	mov    -0x30(%ebp),%eax
 49b:	8b 18                	mov    (%eax),%ebx
        ap++;
 49d:	83 c0 04             	add    $0x4,%eax
 4a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4a3:	85 db                	test   %ebx,%ebx
 4a5:	74 65                	je     50c <printf+0x17c>
        while(*s != 0){
 4a7:	8a 03                	mov    (%ebx),%al
 4a9:	84 c0                	test   %al,%al
 4ab:	74 70                	je     51d <printf+0x18d>
 4ad:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4b0:	89 de                	mov    %ebx,%esi
 4b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4b5:	8d 76 00             	lea    0x0(%esi),%esi
          putc(fd, *s);
 4b8:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4bb:	50                   	push   %eax
 4bc:	6a 01                	push   $0x1
 4be:	57                   	push   %edi
 4bf:	53                   	push   %ebx
 4c0:	e8 b0 fd ff ff       	call   275 <write>
          s++;
 4c5:	46                   	inc    %esi
        while(*s != 0){
 4c6:	8a 06                	mov    (%esi),%al
 4c8:	83 c4 10             	add    $0x10,%esp
 4cb:	84 c0                	test   %al,%al
 4cd:	75 e9                	jne    4b8 <printf+0x128>
 4cf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	e9 fc fe ff ff       	jmp    3d5 <printf+0x45>
 4d9:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 4dc:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4df:	52                   	push   %edx
 4e0:	e9 4c ff ff ff       	jmp    431 <printf+0xa1>
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, *ap);
 4e8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4eb:	8b 03                	mov    (%ebx),%eax
 4ed:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4f0:	51                   	push   %ecx
 4f1:	6a 01                	push   $0x1
 4f3:	57                   	push   %edi
 4f4:	ff 75 08             	pushl  0x8(%ebp)
 4f7:	e8 79 fd ff ff       	call   275 <write>
        ap++;
 4fc:	83 c3 04             	add    $0x4,%ebx
 4ff:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 502:	83 c4 10             	add    $0x10,%esp
      state = 0;
 505:	31 d2                	xor    %edx,%edx
 507:	e9 c9 fe ff ff       	jmp    3d5 <printf+0x45>
          s = "(null)";
 50c:	bb 10 07 00 00       	mov    $0x710,%ebx
        while(*s != 0){
 511:	b0 28                	mov    $0x28,%al
 513:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 516:	89 de                	mov    %ebx,%esi
 518:	8b 5d 08             	mov    0x8(%ebp),%ebx
 51b:	eb 9b                	jmp    4b8 <printf+0x128>
      state = 0;
 51d:	31 d2                	xor    %edx,%edx
 51f:	e9 b1 fe ff ff       	jmp    3d5 <printf+0x45>

00000524 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	57                   	push   %edi
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 52d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 530:	a1 b4 09 00 00       	mov    0x9b4,%eax
 535:	8b 10                	mov    (%eax),%edx
 537:	39 c8                	cmp    %ecx,%eax
 539:	73 11                	jae    54c <free+0x28>
 53b:	90                   	nop
 53c:	39 d1                	cmp    %edx,%ecx
 53e:	72 14                	jb     554 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 540:	39 d0                	cmp    %edx,%eax
 542:	73 10                	jae    554 <free+0x30>
{
 544:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 546:	8b 10                	mov    (%eax),%edx
 548:	39 c8                	cmp    %ecx,%eax
 54a:	72 f0                	jb     53c <free+0x18>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 54c:	39 d0                	cmp    %edx,%eax
 54e:	72 f4                	jb     544 <free+0x20>
 550:	39 d1                	cmp    %edx,%ecx
 552:	73 f0                	jae    544 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 554:	8b 73 fc             	mov    -0x4(%ebx),%esi
 557:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 55a:	39 fa                	cmp    %edi,%edx
 55c:	74 1a                	je     578 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 55e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 561:	8b 50 04             	mov    0x4(%eax),%edx
 564:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 567:	39 f1                	cmp    %esi,%ecx
 569:	74 24                	je     58f <free+0x6b>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 56b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 56d:	a3 b4 09 00 00       	mov    %eax,0x9b4
}
 572:	5b                   	pop    %ebx
 573:	5e                   	pop    %esi
 574:	5f                   	pop    %edi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    
 577:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 578:	03 72 04             	add    0x4(%edx),%esi
 57b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 57e:	8b 10                	mov    (%eax),%edx
 580:	8b 12                	mov    (%edx),%edx
 582:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 585:	8b 50 04             	mov    0x4(%eax),%edx
 588:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 58b:	39 f1                	cmp    %esi,%ecx
 58d:	75 dc                	jne    56b <free+0x47>
    p->s.size += bp->s.size;
 58f:	03 53 fc             	add    -0x4(%ebx),%edx
 592:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 595:	8b 53 f8             	mov    -0x8(%ebx),%edx
 598:	89 10                	mov    %edx,(%eax)
  freep = p;
 59a:	a3 b4 09 00 00       	mov    %eax,0x9b4
}
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    

000005a4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	57                   	push   %edi
 5a8:	56                   	push   %esi
 5a9:	53                   	push   %ebx
 5aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	8d 70 07             	lea    0x7(%eax),%esi
 5b3:	c1 ee 03             	shr    $0x3,%esi
 5b6:	46                   	inc    %esi
  if((prevp = freep) == 0){
 5b7:	8b 3d b4 09 00 00    	mov    0x9b4,%edi
 5bd:	85 ff                	test   %edi,%edi
 5bf:	0f 84 a3 00 00 00    	je     668 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5c5:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 5c7:	8b 48 04             	mov    0x4(%eax),%ecx
 5ca:	39 f1                	cmp    %esi,%ecx
 5cc:	73 67                	jae    635 <malloc+0x91>
 5ce:	89 f3                	mov    %esi,%ebx
 5d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 5d6:	0f 82 80 00 00 00    	jb     65c <malloc+0xb8>
  p = sbrk(nu * sizeof(Header));
 5dc:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 5e3:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 5e6:	eb 11                	jmp    5f9 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5e8:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 5ea:	8b 4a 04             	mov    0x4(%edx),%ecx
 5ed:	39 f1                	cmp    %esi,%ecx
 5ef:	73 4b                	jae    63c <malloc+0x98>
 5f1:	8b 3d b4 09 00 00    	mov    0x9b4,%edi
 5f7:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5f9:	39 c7                	cmp    %eax,%edi
 5fb:	75 eb                	jne    5e8 <malloc+0x44>
  p = sbrk(nu * sizeof(Header));
 5fd:	83 ec 0c             	sub    $0xc,%esp
 600:	ff 75 e4             	pushl  -0x1c(%ebp)
 603:	e8 d5 fc ff ff       	call   2dd <sbrk>
  if(p == (char*)-1)
 608:	83 c4 10             	add    $0x10,%esp
 60b:	83 f8 ff             	cmp    $0xffffffff,%eax
 60e:	74 1b                	je     62b <malloc+0x87>
  hp->s.size = nu;
 610:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 613:	83 ec 0c             	sub    $0xc,%esp
 616:	83 c0 08             	add    $0x8,%eax
 619:	50                   	push   %eax
 61a:	e8 05 ff ff ff       	call   524 <free>
  return freep;
 61f:	a1 b4 09 00 00       	mov    0x9b4,%eax
      if((p = morecore(nunits)) == 0)
 624:	83 c4 10             	add    $0x10,%esp
 627:	85 c0                	test   %eax,%eax
 629:	75 bd                	jne    5e8 <malloc+0x44>
        return 0;
 62b:	31 c0                	xor    %eax,%eax
  }
}
 62d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 630:	5b                   	pop    %ebx
 631:	5e                   	pop    %esi
 632:	5f                   	pop    %edi
 633:	5d                   	pop    %ebp
 634:	c3                   	ret    
    if(p->s.size >= nunits){
 635:	89 c2                	mov    %eax,%edx
 637:	89 f8                	mov    %edi,%eax
 639:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 63c:	39 ce                	cmp    %ecx,%esi
 63e:	74 54                	je     694 <malloc+0xf0>
        p->s.size -= nunits;
 640:	29 f1                	sub    %esi,%ecx
 642:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 645:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 648:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 64b:	a3 b4 09 00 00       	mov    %eax,0x9b4
      return (void*)(p + 1);
 650:	8d 42 08             	lea    0x8(%edx),%eax
}
 653:	8d 65 f4             	lea    -0xc(%ebp),%esp
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
 65b:	90                   	nop
 65c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 661:	e9 76 ff ff ff       	jmp    5dc <malloc+0x38>
 666:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 668:	c7 05 b4 09 00 00 b8 	movl   $0x9b8,0x9b4
 66f:	09 00 00 
 672:	c7 05 b8 09 00 00 b8 	movl   $0x9b8,0x9b8
 679:	09 00 00 
    base.s.size = 0;
 67c:	c7 05 bc 09 00 00 00 	movl   $0x0,0x9bc
 683:	00 00 00 
 686:	bf b8 09 00 00       	mov    $0x9b8,%edi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68b:	89 f8                	mov    %edi,%eax
 68d:	e9 3c ff ff ff       	jmp    5ce <malloc+0x2a>
 692:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 694:	8b 0a                	mov    (%edx),%ecx
 696:	89 08                	mov    %ecx,(%eax)
 698:	eb b1                	jmp    64b <malloc+0xa7>
