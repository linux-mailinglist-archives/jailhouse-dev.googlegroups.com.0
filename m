Return-Path: <jailhouse-dev+bncBC7MJ2PM5UERBCM5UHVAKGQECXFVUZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B282093
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 17:43:07 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id q16sf46355869otn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MXAOOMaDNGsT1KZVvwk8B0dpZf3x/4zn6aJUoIB+sDw=;
        b=JalZRMtHhbVKc34D/yJhb9O1Yg49ZVqn3+gGv1phScVNz2eRRszpvJu5p7Op11+0Xz
         y5vLpvtTXcVZ+fRhsOhBOLXi9d5ZvTNLyTrbmEbvzinPes+PQKaOfHN3vNPweQ5PO+u3
         ocWggap+nL495LElc6WEFu3XfngG6s4SB4P+4FlmCszy1aMG50SVtGcVbDUm7E5MlN8P
         2n7wEnZpRJwjUuK49ntYqCqo91wXiwCtyFoNDmsDxIPyB53XaAgVynBVtsltxM3IB4ew
         aNKVkS/5w5m84QW4hj4J/JNeN+fL1k0UFiHRfV8RKAYY3eSsC9eFdKQvIbiAGyeNmmDg
         obEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MXAOOMaDNGsT1KZVvwk8B0dpZf3x/4zn6aJUoIB+sDw=;
        b=mDUAMPRWet9872ckjHzRP7Gpml1DU0XNFbdbP+nKIDlUh3R0xiV1y3MCp1Ur1D62Qu
         ZPFP8iYKK+2e58ZQyUDGphxaKLjuqGJQ3xBdJx4kU1ZJ/fmXIiKGnITqa39XX/yTgD8U
         77RIfKcPL2bgSrYSF2TyfncKsRaChJKX9P+CMVjIQyPS0sxwgB4G9oNJJOVlbSakQi3a
         XG+sYRfYOoFeHE8wOLd08Hz6TWtX28SUE1z7H2ndvHM0R/BMhMcjgrLWavwhibB3Bns0
         i8losbeiSmInN5+8WdDPUFkcyZlgpfo+goVJi5A9X1k7nh8hFcru1I7REONdrcMUFhWd
         0Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MXAOOMaDNGsT1KZVvwk8B0dpZf3x/4zn6aJUoIB+sDw=;
        b=LY0GBwlhMK/8itj6DDO9qUohzdvsSiFeHXD23Rbl4gpvW+nPnKx8SwDXJa7cADB1aQ
         wzp/edAjErwLxs5KHvdVPYG/9SEZ+AzchdpZbWADM7ThuIMFKWwj5wlx8cES88+iAh4B
         u27r/wKGrbvgL2J15ysUA1PNKJTWCR3V+AvenLB31A8pdM8Vo9DjOxFhCAl35Rp+Wgcx
         FzPTi2MKls0TVniKmwPMF/vsFv7EHZTn9cx6ZAtDJl4M0mpWukdvYC90sy7oN84cbCD+
         KMQtod/RHjGCPwOp3zKJp4Ooqak7Yz+pLJWAilmQJz/WxGY25NOp9fY2Lcn4VvkCwpj6
         3QHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJHnqFacoYU5eedFGpRDptwbFDzXkvajqCNkbZoDfKw4oQ4m7X
	t7Dp6f77DZF5NAMlWk6bUGo=
X-Google-Smtp-Source: APXvYqxzkR/EuOVgOwgpM0C8LWpvZnOAfiPPa+qTHlgG8VY3WbSXhGGwbH/TeaQBharpfpsJgqArmg==
X-Received: by 2002:a9d:6754:: with SMTP id w20mr110137976otm.41.1565019785994;
        Mon, 05 Aug 2019 08:43:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6d09:: with SMTP id o9ls458044otp.7.gmail; Mon, 05 Aug
 2019 08:43:05 -0700 (PDT)
X-Received: by 2002:a9d:61d8:: with SMTP id h24mr52232191otk.53.1565019785394;
        Mon, 05 Aug 2019 08:43:05 -0700 (PDT)
Date: Mon, 5 Aug 2019 08:43:04 -0700 (PDT)
From: dianaramos007@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0a03b7bf-fcce-4de2-9a06-bb495cf47bb7@googlegroups.com>
In-Reply-To: <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
 <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
 <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
Subject: Re: Problem with IVSHMEM on Bananapi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1658_108058932.1565019784770"
X-Original-Sender: dianaramos007@gmail.com
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

------=_Part_1658_108058932.1565019784770
Content-Type: multipart/alternative; 
	boundary="----=_Part_1659_1814056573.1565019784770"

------=_Part_1659_1814056573.1565019784770
Content-Type: text/plain; charset="UTF-8"

 
>
> Basically, you have to replicate that CCU block above a few times, adjust 
> size 
> and start addresses, e.g. 
>
> { 
>         .phys_start = 0x01c200c0, 
>         .virt_start = 0x01c200c0, 
>         .size = 0x10, 
>         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
>                 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32, 
> }, 
>
> in order to define a region from 0x01c200c0..0x01c200cf, permitting 32-bit 
> accesses. Such a region could then be assigned to a non-root cell as a 
> whole 
> (breaking up sub-page regions on assignment is not possible, in contrast 
> to 
> page-aligned regions). 
>
>
Thank you for your response. That seemed to solve the unhandled traps that 
I was having. Now I'm having the following when I load the 
bananapi-gic-demo cell:

Cell "bananapi-gic-demo" can be loaded
Unhandled data write at 0x7bfe0000(1)
FATAL: unhandled trap (exception class 0x24)
pc=0xc06c770c cpsr=0x20000013 hsr=0x9000004f
r0=0xe0184000 r1=0x00023080 r2=0x00002134 r3=0xea00000d
r4=0xea000005 r5=0xea000005 r6=0xea000005 r7=0xea000005
r8=0xea000005 r9=0xe0184000 r10=0x00023038 r11=0x00000001
r12=0xea00001a r13=0xddf0be4c r14=0xea000005
Parking CPU 0 (Cell: "Banana-Pi")

This unhandled trap seems to be related to RAM. 

The configuration on bananapi's file is the following:

/* RAM */ {
            .phys_start = 0x40000000,
            .virt_start = 0x40000000,
            .size = 0x3bf00000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },

And for bananapi-gic-demo:

/* RAM */ {
            .phys_start = 0x7bfe0000,
            .virt_start = 0,
            .size = 0x00010000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        },

By checking the /proc/iomem file, I can see that there's a region for the 
System RAM from 40000000 to 7a3fffff, as well for kernel 4.13.0 that I was 
experimenting before. I have two questions:

   1. The configuration defined for the RAM on bananapi's file exceeds the 
   range defined in the iomem file. Although the gic-demo worked with kernel 
   4.13.0 (with the same region on /proc/iomem), can this be the reason why 
   I'm having these traps?
   2. I've tried to replicate the block and adjust the sizes and start 
   addresses, like you suggested above,but I kept having unhandled traps 
   related to the gic-demo's phys_start address. How can I solve this?
   

 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a03b7bf-fcce-4de2-9a06-bb495cf47bb7%40googlegroups.com.

------=_Part_1659_1814056573.1565019784770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8=
ex;border-left: 1px #ccc solid;padding-left: 1ex;">Basically, you have to r=
eplicate that CCU block above a few times, adjust size
<br>and start addresses, e.g.
<br>
<br>{
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x01c20=
0c0,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x01c20=
0c0,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x10,
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_<wbr>IO | JAILHOUSE_MEM_IO_32,
<br>},
<br>
<br>in order to define a region from 0x01c200c0..0x01c200cf, permitting 32-=
bit
<br>accesses. Such a region could then be assigned to a non-root cell as a =
whole
<br>(breaking up sub-page regions on assignment is not possible, in contras=
t to
<br>page-aligned regions).
<br>
<br></blockquote><div><br></div><div>Thank you for your response. That seem=
ed to solve the unhandled traps that I was having. Now I&#39;m having the f=
ollowing when I load the bananapi-gic-demo cell:</div><div><br></div><div>C=
ell &quot;bananapi-gic-demo&quot; can be loaded<br>Unhandled data write at =
0x7bfe0000(1)<br>FATAL: unhandled trap (exception class 0x24)<br>pc=3D0xc06=
c770c cpsr=3D0x20000013 hsr=3D0x9000004f<br>r0=3D0xe0184000 r1=3D0x00023080=
 r2=3D0x00002134 r3=3D0xea00000d<br>r4=3D0xea000005 r5=3D0xea000005 r6=3D0x=
ea000005 r7=3D0xea000005<br>r8=3D0xea000005 r9=3D0xe0184000 r10=3D0x0002303=
8 r11=3D0x00000001<br>r12=3D0xea00001a r13=3D0xddf0be4c r14=3D0xea000005<br=
>Parking CPU 0 (Cell: &quot;Banana-Pi&quot;)</div><div><br></div><div>This =
unhandled trap seems to be related to RAM. <br><div><br></div><div>The conf=
iguration on bananapi&#39;s file is the following:<br></div><div><br></div>=
<div>/* RAM */ {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 .phys_start =3D 0x40000000,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x40000000,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x3bf00000,<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAIL=
HOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 },</div><div><br></div><div>And for bananapi-gic-demo:</div><d=
iv><br></div><div>/* RAM */ {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 .phys_start =3D 0x7bfe0000,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0,<br>=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x00010000,<br>=C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | J=
AILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<b=
r>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },</div><div><br></div><div>By chec=
king the /proc/iomem file, I can see that there&#39;s a region for the Syst=
em RAM from 40000000 to 7a3fffff, as well for kernel 4.13.0 that I was expe=
rimenting before. I have two questions:</div><div><ol><li>The configuration=
 defined for the RAM on  bananapi&#39;s file exceeds the range defined in t=
he iomem file. Although the gic-demo worked with kernel 4.13.0 (with the sa=
me region on /proc/iomem), can this be the reason why I&#39;m having these =
traps?<br></li><li>I&#39;ve tried to replicate the block and adjust the siz=
es and start addresses, like you suggested above,but I kept having unhandle=
d traps related to the gic-demo&#39;s phys_start address. How can I solve t=
his?<br></li></ol></div><div><br></div>=C2=A0</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0a03b7bf-fcce-4de2-9a06-bb495cf47bb7%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0a03b7bf-fcce-4de2-9a06-bb495cf47bb7%40googlegroups.com<=
/a>.<br />

------=_Part_1659_1814056573.1565019784770--

------=_Part_1658_108058932.1565019784770--
