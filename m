Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBFNR5HTQKGQESFZPHFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661938A47
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 14:29:11 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id e16sf1328518pga.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 05:29:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559910549; cv=pass;
        d=google.com; s=arc-20160816;
        b=YtYfmSGp73M/Taendjv4TO4B0P1Kb5Pu30ijNk7JzXDHiZE1lMs4oFLo6EAVDdW3Nl
         n1hB5LIYuXyNb6k7p3fuj0ENXMCicuaXSeI7VDwPpmTM+GcskvfjE65Ylh0csKlbrPqf
         V62Shgkf8xG0rps1qOVdLt9nZlBfgZiFXFUpjhHqJtOxX3gAID2+R8uZyGS5B3abIeKP
         0lFyAUb595OUcXDN/tT2I1OrGjQcNJPc+PFOpWfuIMWlL4/QdnZqEkZVkVvl27MDtrcq
         iNdYbXjG/sN4Vt78K2jJVMsPojmlHyArHkgvkgy1RFQ4wxWbPRpB9GJb8n7Y3qplXNq5
         tUIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=N/uB05m2TtMEOEnb5xDgtLZH5ks/0IlBxJNMvlKUEPU=;
        b=ohssFnT4wihnFad7n7rGB8QY2i8d2vurOa0ebHrdDFTu6WHASNUK8mFH2G0RiVz7Js
         A9Jd1eUp6S2nuxCMGlvwSSd5nyZwZVyKizqFAQ85p05V/HuHhh+F65XvdxGuAblgRsjd
         TI2okjSxr0ygTh2RN+s3i0UruAkWq1iYmrLJgyr872+Qdj6ChexU0L/dPK+4L8rV1/0y
         lDm1kqgWfh7ul5bIjfc15XTAUX4iVlpO29La2pw+088R4ydaCPAuYGAIX3YsGdzL/C9q
         TPZ7pX7Ihwhf4e+ili6Pj/98pFVVXz1P/gkNCXCnafwr0s8JFJP8Xs7BxkLFSAAZggwS
         l9aQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tVoFsXua;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::c29 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N/uB05m2TtMEOEnb5xDgtLZH5ks/0IlBxJNMvlKUEPU=;
        b=GSbxtIhO81HgNEWfmHq8xrB3gc/YTjE64CWKPJuOssIh71Q4Iat8jE2sCv+bTy/c++
         zS9uSR00xwAdv7hsWSCiqr9KZEzkY/x8dx3PyxrgEEYbtQra5pYQ2tpuguKD3qPBRHbN
         pjm4b3xZTgW9+zHQ4Kjtw+hx/8ZOIXC1uU0H471ESPyzUHnFV/PztShCZGxSv6NzPPq8
         afHszZZ4JxOOqWL10BXU0cCk9Y3kn/0hFM5fIBkuDl/y/6aybh3/keZsBgLBuWIfv1+y
         bEVrf+qL+asZZ6/u5idlJ5Z1goGbvolTMTNh8Jsi5j8bfARYeoayT3uDrHU6qVaTAx5Q
         SWDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N/uB05m2TtMEOEnb5xDgtLZH5ks/0IlBxJNMvlKUEPU=;
        b=jRiAMTywNF8jxeQ4ckW8N9CX3ksBxRj03+cQFeBEMhS1ml+ZZmcRrOjzTInfI4UZxQ
         P7j5qdbSRZyP7Nl4yladfpogSGykhMQCoZ/RKtrbLpyf5kBCoFWNcJ0L118sqZqsN+Nx
         OH93Es+SiOtpjDMSLY1IQhNc9G2cpDejGVTOxUKH0E1XWcQ7ChDb+hLnabiWxduk0lwW
         t748jQ3IyE/MnlOModmGQ6yG+TJE/JweI5c4SpbYjPvTNESyYLsJXFXTA/cMdQwr2lnf
         qSOir/8WGd+IaJ1fV9ig6GTwX2HGO0zWq4jbb8TcBfVCbFGiGQWSwpVSacNEcsC23oYt
         qKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N/uB05m2TtMEOEnb5xDgtLZH5ks/0IlBxJNMvlKUEPU=;
        b=hcIMGuqn/SeuKrBl6S85xlrBpKXEftq5QGAk8CN7js2uVwchQQw1VlXKtSLMyhhDqZ
         6Ey9udMEgDJ4uiNvBaIXv3DdxOkohSECszBqaZ2qZ7Y1i6SlkxzREQPaztoJVf4EgxMq
         KmGJq+126VNRfDK8E2a4HcLdI8G6vR8zb0WVOp00drNOC3zLhNasTrlCnApUf5MsA3e+
         ti+W8Gd6nXVjAvaQCBJyu8P5LjJh6Cfy+Hv8EwOA7YwP4TXDvdp60TxT11eqHPj6yvOD
         4GKnZK1BaUJe2MUIFNGPzzIDuNvTGX+S+ozuZxTKlb4htjA3OOt0wUzIBVsjxQdMrYmF
         /vDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmQhs7fJP81Smk6NJT7zrJw0n7cvdCfw+tdEtCui8tzaA63qO8
	yu4opCvcEjMC7pMiM76GeLU=
X-Google-Smtp-Source: APXvYqzU4d8l4ARk7XWlFDxgVqyeAdaWOsbneEg3yT26r9W5kpur2rg402HHOPU4ppKCRdO917/Srg==
X-Received: by 2002:a17:90a:9289:: with SMTP id n9mr5169477pjo.35.1559910549488;
        Fri, 07 Jun 2019 05:29:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b605:: with SMTP id b5ls2193166pls.12.gmail; Fri, 07
 Jun 2019 05:29:09 -0700 (PDT)
X-Received: by 2002:a17:902:1029:: with SMTP id b38mr54277005pla.72.1559910548990;
        Fri, 07 Jun 2019 05:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559910548; cv=none;
        d=google.com; s=arc-20160816;
        b=wE23eYAfQw/1aR/gS1YhTbXJwZynzhNb81r++/VZOQmhIFx4tWr1qW34830U1Ms4rp
         3IARQi3pyo8oIp+7TRkdmEViZ95gZNl+GROdf6GgzG4HuFgCtOAbi0d8z3JWMBIdR9hw
         GC2TkkWgFx0ohT5uoermwn4nXAa6ffn296MmLtvRccYALovTZeZPfOOMenVmpRcDhD22
         g7Z5VoBaHmi8jHC2s1l2H+51GsmGv5ibymZx0qItGvFUhT2GrVBYSJO9T1dCWdnsexrR
         czwWaOXDRjVi5WwoWevMir8yOM9NRPRc5pyGd0cYMr/uuqvkBHpVCXtIIR+3dnXfNzc7
         lwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WzEIEHUqXEDtiXkBq9oyjYBsK4zXefwLEdGKTWBFCeA=;
        b=pvJ/EkuLDzJPR8yPYTZO3WYhIKiGkSjO4Q44jjc+tMsWI8RWxENsMvNxpDGWxvjUFN
         h4EYAOHRamu8Vz4bCiKwqYRtdc6xZMxUhCru7AriW87jIF5b5rgwAiOP9zqH+RNf3fK9
         qafd2expuD6kK72RyUP5WIE6Oyq9zKOsew2FPXHiIGl2eUpHDLcXmwM/bVWj1Z5B52Dw
         Goxr+G8wWiHvqKWUCdMoTYDtw1LkrPL+7wWIAloNMsvOUxeMaS8SyB1PZ2O10Cy5s9A6
         e2gcBWvxIU1kjVRT1r9Ra1OzIb5go44XoP0Q+LIW4xxM+PK33120FJ9VhVROECTLEo+g
         v7SQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tVoFsXua;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::c29 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com. [2607:f8b0:4864:20::c29])
        by gmr-mx.google.com with ESMTPS id s24si93041plr.0.2019.06.07.05.29.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::c29 as permitted sender) client-ip=2607:f8b0:4864:20::c29;
Received: by mail-yw1-xc29.google.com with SMTP id s5so633206ywd.9
        for <jailhouse-dev@googlegroups.com>; Fri, 07 Jun 2019 05:29:08 -0700 (PDT)
X-Received: by 2002:a81:67c2:: with SMTP id b185mr15315533ywc.504.1559910548028;
 Fri, 07 Jun 2019 05:29:08 -0700 (PDT)
MIME-Version: 1.0
From: Wayne <racedrive1503@gmail.com>
Date: Fri, 7 Jun 2019 08:28:57 -0400
Message-ID: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
Subject: Linux non-root node question
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="00000000000018c0cc058abafaef"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=tVoFsXua;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::c29
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000018c0cc058abafaef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am new to Linux development and Jailhouse.  I have successfully booted
the Jailhouse Hypervisor and root cell on a bare metal X86 Linux system (No
QEMU).  I am now trying to load a non-root Linux cell and I have a few
questions.  Jailhouse accepts and starts my non-root linux cell
configuration and I see it as "running" through the "jailhouse cell list"
command.  However, I don't see any serial output from the "non-root linux"
cell booting up.  I=E2=80=99m not sure what the non-root node is doing at t=
his
point.

               My root node is a 4.16 kernel configured this way:
                              1. CONFIG_JAILHOUSE_GUEST is not set
                              2. CONFIG_SERIO=3Dy
                              3. CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4

               My non-root node is a 4.16 kernel configured this way:
                              1. CONFIG_JAILHOUSE_GUEST=3Dy
                              2. CONFIG_SERIO=3Dm (can't seem to disable
completely in my config for 4.16)
                              3. CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1

In general, do the kernel config settings have to match between the root
node and non-linux or is the above fine?

The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the inmate node is
allocated ~75MB of RAM.

I have a single UART, so I have configured the root cell system config to
output to the virtual hypervisor console:

.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,

.debug_console =3D {
.type =3D JAILHOUSE_CON_TYPE_NONE,
},

and I have configured the non-root linux cell to output to the UART:

(Added serial 0x3f8 to pio bitmap for non-root linux) and started the node
with this:

./tools/jailhouse cell linux configs/x86/linux-x86.cell
/boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
(Note I also tried "console=3Djailhouse" in the command above, and that
produces the same result)

I then see the following on my hypervisor console (./tools/jailhouse
console -f):

Created cell "linux-x86-demo"
...
Cell "linux-x86-demo" can be loaded
Started cell "linux-x86-demo"

After a little while I do get a parked CPU error on the root node, looks
like its trying to do something with the UART as well:
FATAL: Invalid PIO read, port: 3fe size: 1

I would expect something to pop out on the UART from the non-root linux
node first.  Note that root node has serial 0x3f8 disabled in its pio
bitmap.

I verifed that the UART is functioning by allowing the hypervisor to print
to it and also performed an echo test over ttyS0.

I have tried several configurations of kernel.....including your current
"queues/jailhouse" branch head kernel for the non-root node, along with the
kernel config for 4.7 posted in this thread below (but I get same result as
above when I start it, no kernel output):
               "
https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$20t=
o$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAA=
J
".

Any information you can provide to me will be helpful.  I'm not sure what
might be going wrong here.

Thanks,
Wayne

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%4=
0mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000018c0cc058abafaef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am new to Linux development and Jailhouse.=
=C2=A0 I have successfully booted the Jailhouse Hypervisor and root cell on=
 a bare metal X86 Linux system (No QEMU).=C2=A0 I am now trying to load a n=
on-root Linux cell and I have a few questions.=C2=A0 Jailhouse accepts and =
starts my non-root linux cell configuration and I see it as &quot;running&q=
uot; through the &quot;jailhouse cell list&quot; command.=C2=A0 However, I =
don&#39;t see any serial output from the &quot;non-root linux&quot; cell bo=
oting up.=C2=A0 I=E2=80=99m not sure what the non-root node is doing at thi=
s point.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My r=
oot node is a 4.16 kernel configured this way:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1. CONFIG_JAILHOUSE_GUEST is not set<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2. CONFIG_SERIO=3Dy<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8=
250_RUNTIME_UARTS=3D4<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0My non-root node is a 4.16 kernel configured this way:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST=3Dy<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 2. CONFIG_SERIO=3Dm (can&#39;t seem to disable completely in =
my config for 4.16)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8250_=
RUNTIME_UARTS=3D1<br><br>In general, do the kernel config settings have to =
match between the root node and non-linux or is the above fine?<br><br>The =
vmlinux-4.1.16-Guest bzImage is approx 7MB, and the inmate node is allocate=
d ~75MB of RAM.<br><br>I have a single UART, so I have configured the root =
cell system config to output to the virtual hypervisor console:<br><br>.fla=
gs =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,<br><br>.debug_console =3D {<br>=
	.type =3D JAILHOUSE_CON_TYPE_NONE,<br>},<br><br>and I have configured the =
non-root linux cell to output to the UART:<br><br>(Added serial 0x3f8 to pi=
o bitmap for non-root linux) and started the node with this:<br><br>./tools=
/jailhouse cell linux configs/x86/linux-x86.cell /boot/vmlinux-4.1.16-Guest=
 -c &quot;console=3DttyS0,115200&quot;<br>(Note I also tried &quot;console=
=3Djailhouse&quot; in the command above, and that produces the same result)=
<br><br>I then see the following on my hypervisor console (./tools/jailhous=
e console -f):<br><br>Created cell &quot;linux-x86-demo&quot;<br>...<br>Cel=
l &quot;linux-x86-demo&quot; can be loaded<br>Started cell &quot;linux-x86-=
demo&quot;<br><br>After a little while I do get a parked CPU error on the r=
oot node, looks like its trying to do something with the UART as well: <br>=
FATAL: Invalid PIO read, port: 3fe size: 1<br><br>I would expect something =
to pop out on the UART from the non-root linux node first.=C2=A0 Note that =
root node has serial 0x3f8 disabled in its pio bitmap.<div><br></div><div>I=
 verifed that the UART is functioning by allowing the hypervisor to print t=
o it and also performed an echo test over ttyS0.<br><div><br>I have tried s=
everal configurations of kernel.....including your current &quot;queues/jai=
lhouse&quot; branch head kernel for the non-root node, along with the kerne=
l config for 4.7 posted in this thread below (but I get same result as abov=
e when I start it, no kernel output):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://groups.google.com/forum/#!sea=
rchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance=
/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ">https://groups.google.com/forum/#!=
searchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:releva=
nce/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ</a>&quot;.<br><br>Any informatio=
n you can provide to me will be helpful.=C2=A0 I&#39;m not sure what might =
be going wrong here.<br><br>Thanks,<br>Wayne<br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuV=
Z4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4Hyuj=
XzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000018c0cc058abafaef--
