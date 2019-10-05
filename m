Return-Path: <jailhouse-dev+bncBCDJXM4674ERBONK4PWAKGQES5CEMJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53BCCBBB
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Oct 2019 19:39:07 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id h204sf5283518oib.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 05 Oct 2019 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rQm0ztOBuFxj5oERPEoitOGJKlN70XW6v1A1fW7exg4=;
        b=H+IaZNSGvCdENzzsRGGGGPAeanl38srrapk4ySwvosBUlkn0ztyhCcyCTs074cnEg2
         xnThEOzC1PZvt+GIwk+/ZIvLD1TJ/Ml0iRk0IAmgHJDKqkp74apQQZX72UOUrngS0BUQ
         8yZoQDtc1pbTMzjbJt1NL6Zvnd5saOTHIcRyDlS3kaxCn9MIod1hSvfdDCygXG6YzKF6
         3FBiyF3/OWM7kD/iKTsMcFtPLJwkD+3YTJd1ZG4Uv4F8i86CdDPNgbmjjoH9wxA8xBTF
         349O0VBaueZ8XKGnR+tL7WO44pAzqBVC1RZ6x3yzx2ofSb63ccljUDxTBMr0IJ7DuDAV
         yREg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rQm0ztOBuFxj5oERPEoitOGJKlN70XW6v1A1fW7exg4=;
        b=QuM6mTV9lCM2LSdODsIWW4D8Mho/lAlpsPv5j1gTqldJuatH7nL6+mLsdrtCFkdleG
         VqDjd5RcQsbVrvFPTw3JqCdYfSnsQ1HGf1APwOAu8z8FWd+t+G7a7TSOZeRLASqhqPIz
         dS5owMEl4Yoy0ZWYRW0sq7wtR9PNrlgwghV66mMa7VZYnSEXYUeBFfTdCWSb/cylOA3m
         +4H1A8RQ4XH8NLDlgXvhrCnGav/fFzGb7uTA9h1h6sX8vZqluQRWVnKf8QUkzUQKTnqQ
         Gtl8LawE+q20JeufrNjKB+qVS9aCL0JBjXpNmv7AKltZR0HUR45H+kBrrn7qjdBJ20xv
         VfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rQm0ztOBuFxj5oERPEoitOGJKlN70XW6v1A1fW7exg4=;
        b=pgoULT1pRzbGf/7t2PRnRtnDldyDknhysIjKwgTMAPIFzThfttQplFLn2gLMEf/+x4
         ZWP6xr1xLEI/vPgJxmHflq+vTicPxye2mjizSA6bz/qlZt4mZJI50UfZTWT3hLiYxgZJ
         Ltv7jnklw/+62NhGRZ4o/ddWjMrjwZaNaRJKz+jIAxWciOLafNAK2NOO6ovIVH9dj1SY
         xejgYOsLJGX/E1eOCmFB8cuDwT4EphTaIEaWYn6SeyG8d5o1vtJCRkgq68592mV/32lY
         Kk2NfhHWhwWZrZh9h9L1wvvvbZX03NGMGqyZYqGEFn2fT+GJSdfTEYYYFgdxy9Kf0XnY
         XV2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWM9RJIiLvZUDEc39xcwadGrzRnVwnNdbGjP14LmerCVZYFHRqu
	GNmJNXC8d/0ZaYjI8iwBuwo=
X-Google-Smtp-Source: APXvYqyjvSHrxJhTvrnCwNYBXeq74GAf/EBZOZWjrKO9V5J1TUHi77w0ymClSKXyUl3/ZPzsTNkKUQ==
X-Received: by 2002:a05:6830:160b:: with SMTP id g11mr14277934otr.136.1570297145926;
        Sat, 05 Oct 2019 10:39:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1441:: with SMTP id w1ls2247204otp.7.gmail; Sat, 05
 Oct 2019 10:39:05 -0700 (PDT)
X-Received: by 2002:a05:6830:158d:: with SMTP id i13mr15173288otr.67.1570297145029;
        Sat, 05 Oct 2019 10:39:05 -0700 (PDT)
Date: Sat, 5 Oct 2019 10:39:04 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d5af7c51-1896-48a5-bfda-131aeb719b87@googlegroups.com>
In-Reply-To: <15e0ae4a-827f-b115-876d-9a80dc07d174@web.de>
References: <1a535df2-e53a-461a-8f2d-ad62b4600a28@googlegroups.com>
 <15e0ae4a-827f-b115-876d-9a80dc07d174@web.de>
Subject: Re: Increase Inmate Memory to > 1 MB
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1184_418209677.1570297144573"
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

------=_Part_1184_418209677.1570297144573
Content-Type: multipart/alternative; 
	boundary="----=_Part_1185_2439122.1570297144573"

------=_Part_1185_2439122.1570297144573
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you! That did the trick.

-Michael

On Saturday, October 5, 2019 at 1:41:02 AM UTC-6, Jan Kiszka wrote:
>
> On 05.10.19 02:08, michael...@gmail.com <javascript:> wrote:=20
> > Hello,=20
> >=20
> >=20
> > I want to increase how much memory my inmate can use to 10 MB.=20
> >=20
> >=20
> > Here=E2=80=99s the relevant memory regions of the root config:=20
> >=20
> >=20
> > /* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */=20
> >=20
> > {=20
> >=20
> > .phys_start =3D 0x3a600000,=20
> >=20
> > .virt_start =3D 0x3a600000,=20
> >=20
> > // MGH: Leave a 1 MB region for IVSHMEM (4c -> 4b)=20
> >=20
> > .size =3D 0x4b00000, // 75 MB=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,=20
> >=20
> > },=20
> >=20
> > /* MGH Added: IVSHMEM shared memory region (index 61)*/=20
> >=20
> > {=20
> >=20
> > .phys_start =3D 0x3f100000,=20
> >=20
> > .virt_start =3D 0x3f100000,=20
> >=20
> > .size =3D 0x100000, // 1 MB=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,=20
> >=20
> > },=20
> >=20
> >=20
> >=20
> > And the inmate=E2=80=99s memory regions:=20
> >=20
> >=20
> > struct jailhouse_memory mem_regions[4];=20
> >=20
> > ...=20
> >=20
> > .mem_regions =3D {=20
> >=20
> > /* RAM */=20
> >=20
> > {=20
> >=20
> > .phys_start =3D 0x3a600000,=20
> >=20
> > .virt_start =3D 0,=20
> >=20
> > // 1 MB of RAM for the inmate's program=20
> >=20
> > .size =3D 0x00100000,=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> >=20
> > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,=20
> >=20
> > },=20
> >=20
> > /* communication region */=20
> >=20
> > {=20
> >=20
> > .virt_start =3D 0x00100000,=20
> >=20
> > .size =3D 0x00001000,=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ |JAILHOUSE_MEM_COMM_REGION |=20
> JAILHOUSE_MEM_WRITE,=20
> >=20
> > },=20
> >=20
> > /* MGH: IVSHMEM shared memory region */=20
> >=20
> > {=20
> >=20
> > .phys_start =3D 0x3f100000,=20
> >=20
> > .virt_start =3D 0x3f100000,=20
> >=20
> > // Create 1 MB of shared memory=20
> >=20
> > .size =3D 0x00100000,=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> >=20
> > JAILHOUSE_MEM_ROOTSHARED,=20
> >=20
> > },=20
> >=20
> >=20
> > /* MGH: RAM - Heap */=20
> >=20
> > {=20
> >=20
> > /* Create an additional "heap" area of 10 MB to allow=20
> >=20
> > * the program more memory to work with. */=20
> >=20
> > .phys_start =3D 0x3a700000,=20
> >=20
> > .virt_start =3D 0x00200000,=20
> >=20
> > .size =3D 0x00a00000,=20
> >=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> >=20
> > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,=20
> >=20
> > },=20
> >=20
> > },=20
> >=20
> >=20
> > And the IVSHMEM PCI device:=20
> >=20
> >=20
> >=20
> > .pci_devices =3D {=20
> >=20
> > {=20
> >=20
> > .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,=20
> >=20
> > .domain =3D 0x0000,=20
> >=20
> > .bdf =3D 0x0f << 3,=20
> >=20
> > .bar_mask =3D {=20
> >=20
> > 0xffffff00, 0xffffffff, 0x00000000,=20
> >=20
> > 0x00000000, 0xffffffe0, 0xffffffff,=20
> >=20
> > },=20
> >=20
> > .num_msix_vectors =3D 1,=20
> >=20
> > .shmem_region =3D 2,=20
> >=20
> > },=20
> >=20
> > },=20
> >=20
> >=20
> > I=E2=80=99m then trying to use this new =E2=80=9Cheap=E2=80=9D region i=
n my inmate=E2=80=99s code:=20
> >=20
> >=20
> >     #define MGH_HEAP_BASE0x00200000=20
> >=20
> >=20
> >     void inmate_main(void)=20
> >=20
> >     {=20
> >=20
> >     char *buffer =3D (char *)MGH_HEAP_BASE;=20
> >=20
> >     printk("MGH DEBUG: buffer: %p\n", buffer);=20
> >=20
> >     buffer[0] =3D 'M';=20
> >=20
> >     printk("MGH DEBUG: %c\n", buffer[0]);=20
> >=20
> >     }=20
> >=20
> >=20
> > And I get this fault:=20
> >=20
> >=20
> >     Started cell "bazooka-inmate"=20
> >=20
> >     MGH DEBUG: buffer: 0x0000000000200000=20
> >=20
> >     FATAL: Unhandled VM-Exit, reason 2=20
> >=20
> >     qualification 0=20
> >=20
> >     vectoring info: 0 interrupt info: 0=20
> >=20
> >     RIP: 0x0000000000001113 RSP: 0x0000000000007fe0 FLAGS: 10006=20
> >=20
> >     RAX: 0x0000000000007f13 RBX: 0x0000000000001cab RCX:=20
> 0x0000000000000000=20
> >=20
> >     RDX: 0x00000000000003f8 RSI: 0x0000000000000000 RDI:=20
> 0x000000000000000d=20
> >=20
> >     CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1=20
> >=20
> >     CR0: 0x0000000080010031 CR3: 0x0000000000003000 CR4:=20
> 0x0000000000042220=20
> >=20
> >     EFER: 0x0000000000000500=20
> >=20
> >     Parking CPU 2 (Cell: "bazooka-inmate")=20
> >=20
> >=20
> > So there is a triple fault here, and it=E2=80=99s just the `buffer[0] =
=3D 'M';`=20
> line (from=20
> > objdump):=20
> >=20
> >=20
> >          buffer[0] =3D 'M';=20
> >=20
> >     1113:       c6 04 25 00 00 20 00    movb $0x4d,0x200000=20
> >=20
> >=20
> > So clearly I have configured the memory incorrectly. Either Jailhouse i=
s=20
> denying=20
> > the memory access, or there is just no memory page sitting behind=20
> address=20
> > 0x00200000. But I can=E2=80=99t see what I=E2=80=99m doing wrong. Any i=
deas on how I can=20
> further=20
> > debug this? I=E2=80=99m on v0.11 (with some custom modifications).=20
> >=20
>
> On x86, the inmate lib only maps the first 2M into the guest's page table=
.=20
> Use=20
> map_range to map more.=20
>
> Jan=20
>
> PS: If you call excp_reporting_init() early during inmate init, you shoul=
d=20
> get=20
> more proper errors than "triple fault".=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d5af7c51-1896-48a5-bfda-131aeb719b87%40googlegroups.com.

------=_Part_1185_2439122.1570297144573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you! That did the trick.<div><br></div><div>-Michael=
<br><div><br>On Saturday, October 5, 2019 at 1:41:02 AM UTC-6, Jan Kiszka w=
rote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8e=
x;border-left: 1px #ccc solid;padding-left: 1ex;">On 05.10.19 02:08, <a hre=
f=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"Hfw6G4HkBQAJ" =
rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return tr=
ue;" onclick=3D"this.href=3D&#39;javascript:&#39;;return true;">michael...@=
gmail.com</a> wrote:
<br>&gt; Hello,
<br>&gt;
<br>&gt;
<br>&gt; I want to increase how much memory my inmate can use to 10 MB.
<br>&gt;
<br>&gt;
<br>&gt; Here=E2=80=99s the relevant memory regions of the root config:
<br>&gt;
<br>&gt;
<br>&gt; /* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .phys_start =3D 0x3a600000,
<br>&gt;
<br>&gt; .virt_start =3D 0x3a600000,
<br>&gt;
<br>&gt; // MGH: Leave a 1 MB region for IVSHMEM (4c -&gt; 4b)
<br>&gt;
<br>&gt; .size =3D 0x4b00000, // 75 MB
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; /* MGH Added: IVSHMEM shared memory region (index 61)*/
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .phys_start =3D 0x3f100000,
<br>&gt;
<br>&gt; .virt_start =3D 0x3f100000,
<br>&gt;
<br>&gt; .size =3D 0x100000, // 1 MB
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt;
<br>&gt;
<br>&gt; And the inmate=E2=80=99s memory regions:
<br>&gt;
<br>&gt;
<br>&gt; struct jailhouse_memory mem_regions[4];
<br>&gt;
<br>&gt; ...
<br>&gt;
<br>&gt; .mem_regions =3D {
<br>&gt;
<br>&gt; /* RAM */
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .phys_start =3D 0x3a600000,
<br>&gt;
<br>&gt; .virt_start =3D 0,
<br>&gt;
<br>&gt; // 1 MB of RAM for the inmate&#39;s program
<br>&gt;
<br>&gt; .size =3D 0x00100000,
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;
<br>&gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; /* communication region */
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .virt_start =3D 0x00100000,
<br>&gt;
<br>&gt; .size =3D 0x00001000,
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ |JAILHOUSE_MEM_COMM_REGION | JAILHOU=
SE_MEM_WRITE,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; /* MGH: IVSHMEM shared memory region */
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .phys_start =3D 0x3f100000,
<br>&gt;
<br>&gt; .virt_start =3D 0x3f100000,
<br>&gt;
<br>&gt; // Create 1 MB of shared memory
<br>&gt;
<br>&gt; .size =3D 0x00100000,
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;
<br>&gt; JAILHOUSE_MEM_ROOTSHARED,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt;
<br>&gt; /* MGH: RAM - Heap */
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; /* Create an additional &quot;heap&quot; area of 10 MB to allow
<br>&gt;
<br>&gt; * the program more memory to work with. */
<br>&gt;
<br>&gt; .phys_start =3D 0x3a700000,
<br>&gt;
<br>&gt; .virt_start =3D 0x00200000,
<br>&gt;
<br>&gt; .size =3D 0x00a00000,
<br>&gt;
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;
<br>&gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt;
<br>&gt; And the IVSHMEM PCI device:
<br>&gt;
<br>&gt;
<br>&gt;
<br>&gt; .pci_devices =3D {
<br>&gt;
<br>&gt; {
<br>&gt;
<br>&gt; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt;
<br>&gt; .domain =3D 0x0000,
<br>&gt;
<br>&gt; .bdf =3D 0x0f &lt;&lt; 3,
<br>&gt;
<br>&gt; .bar_mask =3D {
<br>&gt;
<br>&gt; 0xffffff00, 0xffffffff, 0x00000000,
<br>&gt;
<br>&gt; 0x00000000, 0xffffffe0, 0xffffffff,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; .num_msix_vectors =3D 1,
<br>&gt;
<br>&gt; .shmem_region =3D 2,
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt; },
<br>&gt;
<br>&gt;
<br>&gt; I=E2=80=99m then trying to use this new =E2=80=9Cheap=E2=80=9D reg=
ion in my inmate=E2=80=99s code:
<br>&gt;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 #define MGH_HEAP_BASE0x00200000
<br>&gt;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 void inmate_main(void)
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 {
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 char *buffer =3D (char *)MGH_HEAP_BASE;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 printk(&quot;MGH DEBUG: buffer: %p\n&quot;, buffer);
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 buffer[0] =3D &#39;M&#39;;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 printk(&quot;MGH DEBUG: %c\n&quot;, buffer[0]);
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 }
<br>&gt;
<br>&gt;
<br>&gt; And I get this fault:
<br>&gt;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 Started cell &quot;bazooka-inmate&quot;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 MGH DEBUG: buffer: 0x0000000000200000
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 FATAL: Unhandled VM-Exit, reason 2
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 qualification 0
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 vectoring info: 0 interrupt info: 0
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 RIP: 0x0000000000001113 RSP: 0x0000000000007fe0 FLAG=
S: 10006
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 RAX: 0x0000000000007f13 RBX: 0x0000000000001cab RCX:=
 0x0000000000000000
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 RDX: 0x00000000000003f8 RSI: 0x0000000000000000 RDI:=
 0x000000000000000d
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.=
LMA 1
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 CR0: 0x0000000080010031 CR3: 0x0000000000003000 CR4:=
 0x0000000000042220
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 EFER: 0x0000000000000500
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 Parking CPU 2 (Cell: &quot;bazooka-inmate&quot;)
<br>&gt;
<br>&gt;
<br>&gt; So there is a triple fault here, and it=E2=80=99s just the `buffer=
[0] =3D &#39;M&#39;;` line (from
<br>&gt; objdump):
<br>&gt;
<br>&gt;
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buffer[0] =
=3D &#39;M&#39;;
<br>&gt;
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A01113: =C2=A0 =C2=A0 =C2=A0 c6 04 25 00 00 =
20 00=C2=A0 =C2=A0 movb $0x4d,0x200000
<br>&gt;
<br>&gt;
<br>&gt; So clearly I have configured the memory incorrectly. Either Jailho=
use is denying
<br>&gt; the memory access, or there is just no memory page sitting behind =
address
<br>&gt; 0x00200000. But I can=E2=80=99t see what I=E2=80=99m doing wrong. =
Any ideas on how I can further
<br>&gt; debug this? I=E2=80=99m on v0.11 (with some custom modifications).
<br>&gt;
<br>
<br>On x86, the inmate lib only maps the first 2M into the guest&#39;s page=
 table. Use
<br>map_range to map more.
<br>
<br>Jan
<br>
<br>PS: If you call excp_reporting_init() early during inmate init, you sho=
uld get
<br>more proper errors than &quot;triple fault&quot;.
<br></blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d5af7c51-1896-48a5-bfda-131aeb719b87%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/d5af7c51-1896-48a5-bfda-131aeb719b87%40googlegroups.com<=
/a>.<br />

------=_Part_1185_2439122.1570297144573--

------=_Part_1184_418209677.1570297144573--
