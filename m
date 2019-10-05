Return-Path: <jailhouse-dev+bncBCDJXM4674ERBAV637WAKGQEVHLIJFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 391ADCC6D4
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Oct 2019 02:08:36 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id 19sf4069240oii.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pFMQ5IbG+bvd+RDDFTObsY4gJyNiTMSOha7/2sgZ5O0=;
        b=U6Cyu/WEUctBE2FB4pZSIGPrXZ5z2UaRRHWuOA5Om6y2X9EmRSr+ia3SKasBtlArEr
         jARybktJei34+G0lEhDC0HdT7FRcIklvISIVwT5mMre6d/Zpjf6U356zSz53p+LhyD9v
         k+0Z3XgXCAPwqPC+NX+wBRwBic5J/PiAUcriX/FH8eTWnAVE1FJlXtOP/BGPRNB6smBa
         lkRp0sOe9f7L+c39QtRgxDNXHnsuhAkAyx3em/gdT4a2sJ2+Z9jBAVEkAYvmC2901izG
         fcbmk6Isjs0KwvsIwyDxQQ5Pd4xmdkfh1Kzef9THqmgxSKJsK28BiPr1J2f3dftXBdeB
         /uqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pFMQ5IbG+bvd+RDDFTObsY4gJyNiTMSOha7/2sgZ5O0=;
        b=Ju16qTEjBNMvAKZV0pzbGP6oUpq71jviz0ez8/qWO8/mwBFmWQcj+rUE1ZhYFtEbWu
         o6e1V2luJtnujnp1YDy8CdNPFLMdd+hvxl7Z1qalmSMB6yH40IjU6vtENo2RxqW7d7sF
         Um9zuF6BH/f/epjNweyjVjlVOIn+QVWhL6sESbqbY2W5rjkmlJF8ufz6ZlzQHrCt1VWf
         N1HXrS/0J5LLMaUd3ZN6JjFMUX3dPqe9oZq7+xyBhD9Xaa0kh//w5OVJHKP+Jp+hg9yh
         X9CjqlyLenCsB+r1EpaIHV2l97G9WHFM7kvpz7vqPNwGtSBcvLI0zJCe66JL0aGE6A60
         yxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pFMQ5IbG+bvd+RDDFTObsY4gJyNiTMSOha7/2sgZ5O0=;
        b=t8QYF1knh7JDxKEEv4Ud6+xJZEzPc8wWo13S65olPEOZiLB5V8c6QitM2hVQlTwTSw
         uhxYjYyXkM7gqXthYyG2OzmOBM04qtkMJqrIGf7b7upLqz6ebNEiHXiZDHSYP2cjdqQO
         0XdLbw/g0roStVmzyvlDoTJrzszGQmGMsXg4M/fEvZFd1ON901teU4UZ+tolJJ1kPCXE
         X1W/ymcqWt5CVaIe3kthnfmmggaQrCI8X9LFP8SEbbnmTGQ+W1Q73Ic3xXxVywhVfLSq
         79NxjbWzsU130HnMy6NDgAh9lGBwpWz6qaT52rTZBEjY1PRJgXed+RQgX+HTJ875ltjy
         NSQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWWWoOJNzW/VzUz0WLbFArILHy3dKukSV7b87zeIhwLuU9aU/6+
	MeVN8yxtQfvRH2vWLC7FQ4w=
X-Google-Smtp-Source: APXvYqzMlcgNuwBo4KnLpuLhgXgKBpPvzZxTi7dodcdirARRg3qLmFgQfqFv59Fye4p0+iiHqEoN9Q==
X-Received: by 2002:a05:6830:1d6e:: with SMTP id l14mr12656603oti.3.1570234114532;
        Fri, 04 Oct 2019 17:08:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3ad6:: with SMTP id h205ls2100844oia.15.gmail; Fri, 04
 Oct 2019 17:08:33 -0700 (PDT)
X-Received: by 2002:aca:c550:: with SMTP id v77mr8688192oif.93.1570234113455;
        Fri, 04 Oct 2019 17:08:33 -0700 (PDT)
Date: Fri, 4 Oct 2019 17:08:32 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1a535df2-e53a-461a-8f2d-ad62b4600a28@googlegroups.com>
Subject: Increase Inmate Memory to > 1 MB
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_694_1352825031.1570234112712"
X-Original-Sender: Michael.G.Hinton@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_694_1352825031.1570234112712
Content-Type: multipart/alternative; 
	boundary="----=_Part_695_1382468799.1570234112716"

------=_Part_695_1382468799.1570234112716
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hello,

I want to increase how much memory my inmate can use to 10 MB.

Here=E2=80=99s the relevant memory regions of the root config:

/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */

{

.phys_start =3D 0x3a600000,

.virt_start =3D 0x3a600000,

// MGH: Leave a 1 MB region for IVSHMEM (4c -> 4b)

.size =3D 0x4b00000, // 75 MB

.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,

},

/* MGH Added: IVSHMEM shared memory region (index 61)*/

{

.phys_start =3D 0x3f100000,

.virt_start =3D 0x3f100000,

.size =3D 0x100000, // 1 MB

.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,

},


And the inmate=E2=80=99s memory regions:

struct jailhouse_memory mem_regions[4];

...

.mem_regions =3D {

/* RAM */

{

.phys_start =3D 0x3a600000,

.virt_start =3D 0,

// 1 MB of RAM for the inmate's program

.size =3D 0x00100000,

.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,

},

/* communication region */

{

.virt_start =3D 0x00100000,

.size =3D 0x00001000,

.flags =3D JAILHOUSE_MEM_READ |JAILHOUSE_MEM_COMM_REGION |=20
JAILHOUSE_MEM_WRITE,

},

/* MGH: IVSHMEM shared memory region */

{

.phys_start =3D 0x3f100000,

.virt_start =3D 0x3f100000,

// Create 1 MB of shared memory

.size =3D 0x00100000,

.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_ROOTSHARED,

},

/* MGH: RAM - Heap */

{

/* Create an additional "heap" area of 10 MB to allow

* the program more memory to work with. */

.phys_start =3D 0x3a700000,

.virt_start =3D 0x00200000,

.size =3D 0x00a00000,

.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,

},

},

And the IVSHMEM PCI device:


.pci_devices =3D {

{

.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,

.domain =3D 0x0000,

.bdf =3D 0x0f << 3,

.bar_mask =3D {

0xffffff00, 0xffffffff, 0x00000000,

0x00000000, 0xffffffe0, 0xffffffff,

},

.num_msix_vectors =3D 1,

.shmem_region =3D 2,

},

},

I=E2=80=99m then trying to use this new =E2=80=9Cheap=E2=80=9D region in my=
 inmate=E2=80=99s code:


#define MGH_HEAP_BASE 0x00200000

void inmate_main(void)

{

char *buffer =3D (char *)MGH_HEAP_BASE;

printk("MGH DEBUG: buffer: %p\n", buffer);
buffer[0] =3D 'M';

printk("MGH DEBUG: %c\n", buffer[0]);

}


And I get this fault:

Started cell "bazooka-inmate"

MGH DEBUG: buffer: 0x0000000000200000

FATAL: Unhandled VM-Exit, reason 2

qualification 0

vectoring info: 0 interrupt info: 0

RIP: 0x0000000000001113 RSP: 0x0000000000007fe0 FLAGS: 10006

RAX: 0x0000000000007f13 RBX: 0x0000000000001cab RCX: 0x0000000000000000

RDX: 0x00000000000003f8 RSI: 0x0000000000000000 RDI: 0x000000000000000d

CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1

CR0: 0x0000000080010031 CR3: 0x0000000000003000 CR4: 0x0000000000042220

EFER: 0x0000000000000500

Parking CPU 2 (Cell: "bazooka-inmate")


So there is a triple fault here, and it=E2=80=99s just the `buffer[0] =3D '=
M';` line=20
(from objdump):

        buffer[0] =3D 'M';

   1113:       c6 04 25 00 00 20 00    movb $0x4d,0x200000

So clearly I have configured the memory incorrectly. Either Jailhouse is=20
denying the memory access, or there is just no memory page sitting behind=
=20
address 0x00200000. But I can=E2=80=99t see what I=E2=80=99m doing wrong. A=
ny ideas on how=20
I can further debug this? I=E2=80=99m on v0.11 (with some custom modificati=
ons).

Thanks,

Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1a535df2-e53a-461a-8f2d-ad62b4600a28%40googlegroups.com.

------=_Part_695_1382468799.1570234112716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"docs-internal-guid-c5b9378f-7fff-a568-721b-c86=
33b61aada"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">Hello,</span></p><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font=
-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;">I want to increase how much mem=
ory my inmate can use to 10 MB.</span></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;">Here=E2=80=99s the rele=
vant memory regions of the root config:</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">/* MemRegion: 3a600000-3f1fffff : J=
AILHOUSE Inmate Memory */</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fami=
ly: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-col=
or: transparent; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple=
-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-si=
ze: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0,=
 0); background-color: transparent; font-variant-numeric: normal; font-vari=
ant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><=
span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><sp=
an style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospac=
e; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric=
: normal; font-variant-east-asian: normal; vertical-align: baseline; white-=
space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;"=
>	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto M=
ono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">.phys_start =3D 0x3a600000,</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mono=
space; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:p=
re;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robo=
to Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparen=
t; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-=
align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font=
-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgroun=
d-color: transparent; font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"=
Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fo=
nt-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(=
0, 0, 0); background-color: transparent; font-variant-numeric: normal; font=
-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wra=
p;">.virt_start =3D 0x3a600000,</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">// MGH: Leave a 1 MB region=
 for IVSHMEM (4c -&gt; 4b)</span></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"A=
pple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fon=
t-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0=
, 0, 0); background-color: transparent; font-variant-numeric: normal; font-=
variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap=
;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span=
><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mono=
space; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:p=
re;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robo=
to Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparen=
t; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-=
align: baseline; white-space: pre-wrap;">.size =3D 0x4b00000, // 75 MB</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;=
, monospace; color: rgb(0, 0, 0); background-color: transparent; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; vertical-align: baseli=
ne; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quo=
t;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tran=
sparent; font-variant-numeric: normal; font-variant-east-asian: normal; ver=
tical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt=
; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); bac=
kground-color: transparent; font-variant-numeric: normal; font-variant-east=
-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;">.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monosp=
ace; color: rgb(0, 0, 0); background-color: transparent; font-variant-numer=
ic: normal; font-variant-east-asian: normal; vertical-align: baseline; whit=
e-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre=
;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto=
 Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent;=
 font-variant-numeric: normal; font-variant-east-asian: normal; vertical-al=
ign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=
=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;">},</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospac=
e; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric=
: normal; font-variant-east-asian: normal; vertical-align: baseline; white-=
space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;"=
>	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto M=
ono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; vertical-alig=
n: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=
=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;">/* MGH Added: IVS=
HMEM shared memory region (index 61)*/</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span =
style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); b=
ackground-color: transparent; font-variant-numeric: normal; font-variant-ea=
st-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span sty=
le=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; col=
or: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norm=
al; font-variant-east-asian: normal; vertical-align: baseline; white-space:=
 pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</sp=
an></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&qu=
ot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &=
quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: t=
ransparent; font-variant-numeric: normal; font-variant-east-asian: normal; =
vertical-align: baseline; white-space: pre-wrap;">.phys_start =3D 0x3f10000=
0,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mon=
o&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; vertical-align:=
 baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"=
white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-famil=
y: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-colo=
r: transparent; font-variant-numeric: normal; font-variant-east-asian: norm=
al; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-=
tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-siz=
e: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, =
0); background-color: transparent; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><spa=
n style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">.virt_start =3D 0x3f100000,</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;">.size =3D 0x1000=
00, // 1 MB</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;R=
oboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" =
style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; f=
ont-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgr=
ound-color: transparent; font-variant-numeric: normal; font-variant-east-as=
ian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto=
 Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent;=
 font-variant-numeric: normal; font-variant-east-asian: normal; vertical-al=
ign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=
=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
">},</span></p><br><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito=
, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">And the inmate=E2=80=99s memory regions:</span=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">struct jailhouse_memory mem_regions[4];</=
span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&qu=
ot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &=
quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: t=
ransparent; font-variant-numeric: normal; font-variant-east-asian: normal; =
vertical-align: baseline; white-space: pre-wrap;">...</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</spa=
n></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quo=
t;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-var=
iant-numeric: normal; font-variant-east-asian: normal; vertical-align: base=
line; white-space: pre-wrap;">.mem_regions =3D {</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rg=
b(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; vertical-align: baseline; white-space: pre-w=
rap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></s=
pan><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, m=
onospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;R=
oboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;">/* RAM */</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</spa=
n></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quo=
t;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-var=
iant-numeric: normal; font-variant-east-asian: normal; vertical-align: base=
line; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white=
-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &q=
uot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tr=
ansparent; font-variant-numeric: normal; font-variant-east-asian: normal; v=
ertical-align: baseline; white-space: pre-wrap;">{</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11p=
t; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;">.phys_st=
art =3D 0x3a600000,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family:=
 &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-ta=
b-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span =
style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">.virt_start =3D 0,</span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11p=
t; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;">// 1 MB =
of RAM for the inmate&#39;s program</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); b=
ackground-color: transparent; font-variant-numeric: normal; font-variant-ea=
st-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span sty=
le=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; col=
or: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norm=
al; font-variant-east-asian: normal; vertical-align: baseline; white-space:=
 pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</sp=
an></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&qu=
ot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &=
quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: t=
ransparent; font-variant-numeric: normal; font-variant-east-asian: normal; =
vertical-align: baseline; white-space: pre-wrap;">.size =3D 0x00100000,</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11p=
t; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span styl=
e=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;">.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mono=
space; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:p=
re;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robo=
to Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparen=
t; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-=
align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font=
-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgroun=
d-color: transparent; font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"=
Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fo=
nt-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(=
0, 0, 0); background-color: transparent; font-variant-numeric: normal; font=
-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wra=
p;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></spa=
n><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mon=
ospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nu=
meric: normal; font-variant-east-asian: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;=
, monospace; color: rgb(0, 0, 0); background-color: transparent; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; vertical-align: baseli=
ne; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quo=
t;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tran=
sparent; font-variant-numeric: normal; font-variant-east-asian: normal; ver=
tical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt=
; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); bac=
kground-color: transparent; font-variant-numeric: normal; font-variant-east=
-asian: normal; vertical-align: baseline; white-space: pre-wrap;">},</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, =
monospace; color: rgb(0, 0, 0); background-color: transparent; font-variant=
-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline=
; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;=
Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transp=
arent; font-variant-numeric: normal; font-variant-east-asian: normal; verti=
cal-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;">/* communic=
ation region */</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11p=
t; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span styl=
e=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;=
Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transp=
arent; font-variant-numeric: normal; font-variant-east-asian: normal; verti=
cal-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">.virt_start =3D 0x00100000,</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace;=
 color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: =
normal; font-variant-east-asian: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	=
</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mon=
o&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; vertical-align:=
 baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"=
white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-famil=
y: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-colo=
r: transparent; font-variant-numeric: normal; font-variant-east-asian: norm=
al; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-=
tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-siz=
e: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, =
0); background-color: transparent; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">.s=
ize =3D 0x00001000,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family:=
 &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-ta=
b-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span =
style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">.flags =3D JAILHOUSE_MEM_READ |JAILHOUSE_=
MEM_COMM_REGION | </span><span style=3D"font-size: 11pt; font-family: &quot=
;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: trans=
parent; font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;">JAILHOUSE_MEM_WRITE,</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mo=
nospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-n=
umeric: normal; font-variant-east-asian: normal; vertical-align: baseline; =
white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space=
:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Ro=
boto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpar=
ent; font-variant-numeric: normal; font-variant-east-asian: normal; vertica=
l-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; fo=
nt-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;">},</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mono=
space; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:p=
re;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robo=
to Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparen=
t; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-=
align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font=
-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgroun=
d-color: transparent; font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;">/* MGH: IVSHMEM=
 shared memory region */</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fa=
mily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-c=
olor: transparent; font-variant-numeric: normal; font-variant-east-asian: n=
ormal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"App=
le-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-=
size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, =
0, 0); background-color: transparent; font-variant-numeric: normal; font-va=
riant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"=
><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><=
span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monosp=
ace; color: rgb(0, 0, 0); background-color: transparent; font-variant-numer=
ic: normal; font-variant-east-asian: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-famil=
y: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-colo=
r: transparent; font-variant-numeric: normal; font-variant-east-asian: norm=
al; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-=
tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-siz=
e: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, =
0); background-color: transparent; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><spa=
n style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">=
	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mo=
no&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; fo=
nt-variant-numeric: normal; font-variant-east-asian: normal; vertical-align=
: baseline; white-space: pre-wrap;">.phys_start =3D 0x3f100000,</span></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"A=
pple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fon=
t-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0=
, 0, 0); background-color: transparent; font-variant-numeric: normal; font-=
variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap=
;">.virt_start =3D 0x3f100000,</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgr=
ound-color: transparent; font-variant-numeric: normal; font-variant-east-as=
ian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">// Create 1 MB of shared me=
mory</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto M=
ono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; vertical-alig=
n: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=
=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">.size =3D 0x00100000,</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;">.flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0);=
 background-color: transparent; font-variant-numeric: normal; font-variant-=
east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span=
 class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span s=
tyle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; c=
olor: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: no=
rmal; font-variant-east-asian: normal; vertical-align: baseline; white-spac=
e: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</=
span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&=
quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-=
variant-numeric: normal; font-variant-east-asian: normal; vertical-align: b=
aseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family:=
 &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-ta=
b-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">JAIL=
HOUSE_MEM_ROOTSHARED,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-famil=
y: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-colo=
r: transparent; font-variant-numeric: normal; font-variant-east-asian: norm=
al; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-=
tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-siz=
e: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, =
0); background-color: transparent; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><spa=
n style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">=
	</span></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Robo=
to Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparen=
t; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-=
align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font=
-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgroun=
d-color: transparent; font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"=
Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fo=
nt-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(=
0, 0, 0); background-color: transparent; font-variant-numeric: normal; font=
-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wra=
p;">},</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Ro=
boto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpar=
ent; font-variant-numeric: normal; font-variant-east-asian: normal; vertica=
l-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; fo=
nt-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;">/* MGH: RAM - Heap */</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgr=
ound-color: transparent; font-variant-numeric: normal; font-variant-east-as=
ian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">/* Create an additional &qu=
ot;heap&quot; area of 10 MB to allow</span></p><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); =
background-color: transparent; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span =
class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span st=
yle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; co=
lor: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; vertical-align: baseline; white-space=
: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</s=
pan></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&q=
uot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; vertical-align: ba=
seline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: =
&quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: =
transparent; font-variant-numeric: normal; font-variant-east-asian: normal;=
 vertical-align: baseline; white-space: pre-wrap;"> * the program more memo=
ry to work with. */</span></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family:=
 &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-ta=
b-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span =
style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">.phys_start =3D 0x3a700000,</span></p><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospa=
ce; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeri=
c: normal; font-variant-east-asian: normal; vertical-align: baseline; white=
-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;=
">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto =
Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; =
font-variant-numeric: normal; font-variant-east-asian: normal; vertical-ali=
gn: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=
=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-f=
amily: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-=
color: transparent; font-variant-numeric: normal; font-variant-east-asian: =
normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
">.virt_start =3D 0x00200000,</span></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fo=
nt-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">.size =3D 0x00a00000,</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;,=
 monospace; color: rgb(0, 0, 0); background-color: transparent; font-varian=
t-numeric: normal; font-variant-east-asian: normal; vertical-align: baselin=
e; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot=
;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: trans=
parent; font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span=
" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt;=
 font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;">.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</span></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"A=
pple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fon=
t-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0=
, 0, 0); background-color: transparent; font-variant-numeric: normal; font-=
variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap=
;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span=
><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mono=
space; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;,=
 monospace; color: rgb(0, 0, 0); background-color: transparent; font-varian=
t-numeric: normal; font-variant-east-asian: normal; vertical-align: baselin=
e; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot=
;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: trans=
parent; font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span=
" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt;=
 font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;">},</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, m=
onospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;R=
oboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;">},</span></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; fo=
nt-variant-numeric: normal; font-variant-east-asian: normal; vertical-align=
: baseline; white-space: pre-wrap;"><font face=3D"arial, sans-serif">And th=
e IVSHMEM PCI device:</font></span></p><br><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); =
background-color: transparent; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span =
class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span st=
yle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; co=
lor: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; vertical-align: baseline; white-space=
: pre-wrap;">.pci_devices =3D {</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">{</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgr=
ound-color: transparent; font-variant-numeric: normal; font-variant-east-as=
ian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">.type =3D JAILHOUSE_PCI_TYP=
E_IVSHMEM,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Ro=
boto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpar=
ent; font-variant-numeric: normal; font-variant-east-asian: normal; vertica=
l-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; fo=
nt-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">.domain =3D 0x0000,</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rg=
b(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; vertical-align: baseline; white-space: pre-w=
rap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></s=
pan><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, m=
onospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;R=
oboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" =
style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; f=
ont-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backgr=
ound-color: transparent; font-variant-numeric: normal; font-variant-east-as=
ian: normal; vertical-align: baseline; white-space: pre-wrap;">.bdf =3D 0x0=
f &lt;&lt; 3,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot=
;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: trans=
parent; font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span=
" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt;=
 font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">.bar_mask =3D {</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0,=
 0, 0); background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monos=
pace; color: rgb(0, 0, 0); background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-=
family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background=
-color: transparent; font-variant-numeric: normal; font-variant-east-asian:=
 normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"A=
pple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fon=
t-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0=
, 0, 0); background-color: transparent; font-variant-numeric: normal; font-=
variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap=
;">0xffffff00, 0xffffffff, 0x00000000,</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0)=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span =
style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	<=
/span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono=
&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family=
: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color=
: transparent; font-variant-numeric: normal; font-variant-east-asian: norma=
l; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-t=
ab-span" style=3D"white-space:pre;">	</span></span><span style=3D"font-size=
: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0=
); background-color: transparent; font-variant-numeric: normal; font-varian=
t-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">0x0=
0000000, 0xffffffe0, 0xffffffff,</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt;=
 font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">},</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11p=
t; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;">.num_msi=
x_vectors =3D 1,</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &q=
uot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tr=
ansparent; font-variant-numeric: normal; font-variant-east-asian: normal; v=
ertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11=
pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); b=
ackground-color: transparent; font-variant-numeric: normal; font-variant-ea=
st-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span sty=
le=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; col=
or: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norm=
al; font-variant-east-asian: normal; vertical-align: baseline; white-space:=
 pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</sp=
an></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&qu=
ot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;">.shmem_region =3D 2,</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-=
space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: &qu=
ot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">},</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color=
: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span=
></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot=
;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">},</span></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;">I=E2=80=99m then trying=
 to use this new =E2=80=9Cheap=E2=80=9D region in my inmate=E2=80=99s code:=
</span></p><blockquote style=3D"margin: 0 0 0 40px; border: none; padding: =
0px;"><span id=3D"docs-internal-guid-c5b9378f-7fff-a568-721b-c8633b61aada">=
<br></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Roboto=
 Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent;=
 font-variant-numeric: normal; font-variant-east-asian: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">#define MGH_HEAP_BASE</span><span st=
yle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; co=
lor: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; vertical-align: baseline; white-space=
: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</s=
pan></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&q=
uot;, monospace; color: rgb(0, 0, 0); background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; vertical-align: ba=
seline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre;">	</span></span><span style=3D"font-size: 11pt; font-family: =
&quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: =
transparent; font-variant-numeric: normal; font-variant-east-asian: normal;=
 vertical-align: baseline; white-space: pre-wrap;">0x00200000</span></p></s=
pan><span><br></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &q=
uot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: tr=
ansparent; font-variant-numeric: normal; font-variant-east-asian: normal; v=
ertical-align: baseline; white-space: pre-wrap;">void inmate_main(void)</sp=
an></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Rob=
oto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpare=
nt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical=
-align: baseline; white-space: pre-wrap;">{</span></p></span><span><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace;=
 color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: =
normal; font-variant-east-asian: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	=
</span></span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mon=
o&quot;, monospace; color: rgb(0, 0, 0); background-color: transparent; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; vertical-align:=
 baseline; white-space: pre-wrap;">char *buffer =3D (char *)MGH_HEAP_BASE;<=
/span></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;=
Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transp=
arent; font-variant-numeric: normal; font-variant-east-asian: normal; verti=
cal-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre;">	</span></span><span style=3D"font-size: 11pt; =
font-family: &quot;Roboto Mono&quot;, monospace; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;">printk(&quo=
t;MGH DEBUG: buffer: %p\n&quot;, buffer);</span></p></span><span class=3D"A=
pple-tab-span" style=3D"color: rgb(0, 0, 0); font-family: &quot;Roboto Mono=
&quot;, monospace; font-size: 14.6667px; white-space: pre;">	</span><span s=
tyle=3D"background-color: transparent; color: rgb(0, 0, 0); font-family: &q=
uot;Roboto Mono&quot;, monospace; font-size: 11pt; white-space: pre-wrap; t=
ext-indent: 36pt;">buffer[0] =3D &#39;M&#39;;</span><span><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"f=
ont-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; color: rgb=
(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fon=
t-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wr=
ap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></sp=
an><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mo=
nospace; color: rgb(0, 0, 0); background-color: transparent; font-variant-n=
umeric: normal; font-variant-east-asian: normal; vertical-align: baseline; =
white-space: pre-wrap;">printk(&quot;MGH DEBUG: %c\n&quot;, buffer[0]);</sp=
an></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Rob=
oto Mono&quot;, monospace; color: rgb(0, 0, 0); background-color: transpare=
nt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical=
-align: baseline; white-space: pre-wrap;">}</span></p></span></blockquote><=
/span><span><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-=
serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">And I get this fault:</span></p><br></span><blockquot=
e style=3D"margin: 0 0 0 40px; border: none; padding: 0px;"><span><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span st=
yle=3D"font-size: 11pt; font-family: &quot;Courier New&quot;; color: rgb(0,=
 0, 0); font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;">Started cell &quot;bazooka-in=
mate&quot;</span></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fam=
ily: &quot;Courier New&quot;; color: rgb(0, 0, 0); background-color: transp=
arent; font-variant-numeric: normal; font-variant-east-asian: normal; verti=
cal-align: baseline; white-space: pre-wrap;">MGH DEBUG: buffer: 0x000000000=
0200000</span></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family=
: &quot;Courier New&quot;; color: rgb(0, 0, 0); background-color: transpare=
nt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical=
-align: baseline; white-space: pre-wrap;">FATAL: Unhandled VM-Exit, reason =
2</span></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quo=
t;Courier New&quot;; color: rgb(0, 0, 0); background-color: transparent; fo=
nt-variant-numeric: normal; font-variant-east-asian: normal; vertical-align=
: baseline; white-space: pre-wrap;">qualification 0</span></p></span><span>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; font-family: &quot;Courier New&quot;; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;">vectoring info: 0 interrupt info: 0</span></p></span><span><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: &quot;Courier New&quot;; color: rg=
b(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; vertical-align: baseline; white-space: pre-w=
rap;">RIP: 0x0000000000001113 RSP: 0x0000000000007fe0 FLAGS: 10006</span></=
p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Courier =
New&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant=
-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline=
; white-space: pre-wrap;">RAX: 0x0000000000007f13 RBX: 0x0000000000001cab R=
CX: 0x0000000000000000</span></p></span><span><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: &quot;Courier New&quot;; color: rgb(0, 0, 0); background-c=
olor: transparent; font-variant-numeric: normal; font-variant-east-asian: n=
ormal; vertical-align: baseline; white-space: pre-wrap;">RDX: 0x00000000000=
003f8 RSI: 0x0000000000000000 RDI: 0x000000000000000d</span></p></span><spa=
n><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; font-family: &quot;Courier New&quot;; co=
lor: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; vertical-align: baseline; white-space=
: pre-wrap;">CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1</spa=
n></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Cour=
ier New&quot;; color: rgb(0, 0, 0); background-color: transparent; font-var=
iant-numeric: normal; font-variant-east-asian: normal; vertical-align: base=
line; white-space: pre-wrap;">CR0: 0x0000000080010031 CR3: 0x00000000000030=
00 CR4: 0x0000000000042220</span></p></span><span><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 11pt; font-family: &quot;Courier New&quot;; color: rgb(0, 0, 0); backgrou=
nd-color: transparent; font-variant-numeric: normal; font-variant-east-asia=
n: normal; vertical-align: baseline; white-space: pre-wrap;">EFER: 0x000000=
0000000500</span></p></span><span><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fam=
ily: &quot;Courier New&quot;; color: rgb(0, 0, 0); background-color: transp=
arent; font-variant-numeric: normal; font-variant-east-asian: normal; verti=
cal-align: baseline; white-space: pre-wrap;">Parking CPU 2 (Cell: &quot;baz=
ooka-inmate&quot;)</span></p></span></blockquote><span><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-family: arial, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;">So there is=
 a triple fault here, and it=E2=80=99s just the `</span><span style=3D"font=
-size: 11pt; color: rgb(0, 0, 0); font-variant-numeric: normal; font-varian=
t-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><fo=
nt face=3D"courier new, monospace">buffer[0] =3D &#39;M&#39;;</font><font f=
ace=3D"arial, sans-serif">` line (from </font><font face=3D"courier new, mo=
nospace">objdump</font><font face=3D"arial, sans-serif">):</font></span></p=
><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; font-family: &quot;Courier New&quot;;=
 color: rgb(0, 0, 0); font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buffer[0] =3D &#39;M&#39;;</span></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: &quot;Courier New&quot;; color: rg=
b(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; vertical-align: baseline; white-space: pre-w=
rap;">=C2=A0=C2=A0=C2=A01113: =C2=A0 =C2=A0 =C2=A0 c6 04 25 00 00 20 00=C2=
=A0 =C2=A0 movb   $0x4d,0x200000</span></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color=
: transparent; font-variant-numeric: normal; font-variant-east-asian: norma=
l; vertical-align: baseline; white-space: pre-wrap;">So clearly I have conf=
igured the memory incorrectly. Either Jailhouse is denying the memory acces=
s, or there is just no memory page sitting behind address </span><span styl=
e=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; colo=
r: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: norma=
l; font-variant-east-asian: normal; vertical-align: baseline; white-space: =
pre-wrap;">0x00200000</span><span style=3D"font-size: 11pt; font-family: Nu=
nito, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-=
variant-numeric: normal; font-variant-east-asian: normal; vertical-align: b=
aseline; white-space: pre-wrap;">. But I can=E2=80=99t see what I=E2=80=99m=
 doing wrong. </span><span style=3D"background-color: transparent; color: r=
gb(0, 0, 0); font-family: Nunito, sans-serif; font-size: 11pt; white-space:=
 pre-wrap;">Any ideas on how I can further debug this? I=E2=80=99m on v0.11=
 (with some custom modifications).</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-col=
or: transparent; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">Thanks,</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(=
0, 0, 0); background-color: transparent; font-variant-numeric: normal; font=
-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wra=
p;">Michael</span></p><div><span style=3D"font-size: 11pt; font-family: Nun=
ito, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; vertical-align: ba=
seline; white-space: pre-wrap;"><br></span></div></span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1a535df2-e53a-461a-8f2d-ad62b4600a28%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/1a535df2-e53a-461a-8f2d-ad62b4600a28%40googlegroups.com<=
/a>.<br />

------=_Part_695_1382468799.1570234112716--

------=_Part_694_1352825031.1570234112712--
