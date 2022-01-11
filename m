Return-Path: <jailhouse-dev+bncBC653PXTYYERBLWE66HAMGQEMLSIPCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237248B7C0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 21:01:52 +0100 (CET)
Received: by mail-qt1-x83a.google.com with SMTP id d26-20020ac800da000000b002c43d2f6c7fsf326705qtg.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 12:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7Jtk/0S0r1Ryf8bD2OyTrQPzVQDUMXXdk/71C4oJ/1U=;
        b=J4aYH75aXNAGJGDQzUV0uMZmGG4/pTgyt6ss1dKF5bseSdfzL3bLc1t3vUQB8MgwLL
         CfCdWcfvPKWlQB4ivwz0ZL27llfBGrYgui+mX1kdQ7JUdHEJFAH1SAeyDcYthDUeTWkM
         /gyYLbNSlLMh4SnHLm/QZFS59Rry7AylF1cLxngVG+IEskn5SsZhymz4nWPw10xZyFp3
         jgVJ5VSkE1hl8c8YspmTqDB8mZeJR9fX8lqEezHWDXRf8PCHXKBGHF/geZ6n3lDTpQKf
         7pvXefggLE1LfYZFvDpEHg3P1aHa7MvilBu7cc+yVuSvp9Zue5YwIgQAVJv/lUSRWMeO
         qXiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7Jtk/0S0r1Ryf8bD2OyTrQPzVQDUMXXdk/71C4oJ/1U=;
        b=nMLil/DSY+vgLXj6M4XERupbacBEQEgVHnShu+KOow9SEKkaH8j0klWyZ+ZvBMRO19
         KAC8a7AQsOogEOHmSBcstSo58uyZEP5a+glA4omX2cGQTyDTwEgRn/UFUziWVDK0j95r
         SZchXwBkgLywbJPNLVNFK5J6VsAGJfiRfyamSXIGAnXegvWtmKdyVSvodhmQ8InNQwHy
         7/nG95+KhrMlJ7wDLbr4iR6mxuwYyMpkOeVqw171D0f2/IiFkV7hiZqBuOPDg8QPvxkG
         VAqG4CKoMrMFCa9laJEM6KvyCGZy+6fu+byaQSeYkFbwYpWqJ7m+dFaNJiaTYRA9RUC0
         93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7Jtk/0S0r1Ryf8bD2OyTrQPzVQDUMXXdk/71C4oJ/1U=;
        b=4zEuLO4qyAgVWXXvR7gq8KhG3JS7bLZGlWR3xUmIWIqwc7K0Mu0XTW5Rjnx4WTKI2N
         bvx34yYjMimLEM0JiqhN+9iBNeIe8l/81T3lTjHxO16ByDZ4ONyGtfoBv/e+N/vaKL4f
         HyZvuXpMy2FHXT/PRS+NhFxdH1ACJgnUnbDrcLjjJXUfFB72+3sGKu/Xy4bQJ71yRoFR
         ujR9jPj/X9pcHC5T1m4Z5FTio2J8K5JJyutCxHMGASZMMlaIehO539T6tIN0TsETlaPu
         ZiQ9FQNcqjDDw+MQDaV5uySMixTMUOUb012yLbwlMBEdT82v3dkyIBL4w2eJxg4iPywN
         7Zzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Zss7pidk0d5F6b+uJsVrbYRiMRIw51eyU2oFhZH9Z+e1OdIE6
	+q19z89YvOZv4PIJmLyyNxg=
X-Google-Smtp-Source: ABdhPJydu7cENO5Ctx7H5vJAQ+AqBg3EvvqI+AbKPpXtjG8Zik4dGXUH7oq+u2xZeQzjCv5ldElibQ==
X-Received: by 2002:ac8:598b:: with SMTP id e11mr5116472qte.522.1641931310948;
        Tue, 11 Jan 2022 12:01:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:158d:: with SMTP id d13ls8961522qkk.9.gmail; Tue,
 11 Jan 2022 12:01:50 -0800 (PST)
X-Received: by 2002:a05:620a:178b:: with SMTP id ay11mr4206511qkb.420.1641931310181;
        Tue, 11 Jan 2022 12:01:50 -0800 (PST)
Date: Tue, 11 Jan 2022 12:01:49 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <850100c3-90eb-4a87-82c7-9bd84a8fecd9n@googlegroups.com>
In-Reply-To: <8fc34409-ec7f-4306-9f97-3bb380f7c08dn@googlegroups.com>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
 <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
 <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
 <8fc34409-ec7f-4306-9f97-3bb380f7c08dn@googlegroups.com>
Subject: Re: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_146_2081875178.1641931309658"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_146_2081875178.1641931309658
Content-Type: multipart/alternative; 
	boundary="----=_Part_147_638708854.1641931309658"

------=_Part_147_638708854.1641931309658
Content-Type: text/plain; charset="UTF-8"

Almost everything went well, but when I started the fourth cell 
(bare-metal), I got this error, and jailhouse hangs, so I am able to
1- create two linux non-root cells and inter-cell communication works fine, 
and(including ethernet)
2- one bare-metal and linux non-root cell.(inter-cell communication works 
fine (also ethernet)
I added one region for the newly created cell in all files with taking care 
of correct flags, enlarged the state memory region and the all-cells R/W 
memory region, and here is what I edited in the root cell:

Adding virtual PCI device 00:00.0 to cell "rpi4-linux-demo-2"
Shared memory connection established, peer cells:
                         /* IVSHMEM 0001:00:00.0 (demo) */
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .domain = 1,
                        .bdf = 0 << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
                        .shmem_regions_start = 0,
                        .shmem_dev_id = 0,
                        .shmem_peers = 4,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },

And in any other cell i change only the dev_id, so I have 0,1,2,3, the 
second PCI is an VETH and is working fine for both linux cells together, 
the problem only comes if I created the baremetal cell.




On Tuesday, 11 January 2022 at 13:54:17 UTC+1 Moustafa Nofal wrote:

> Hi, 
> Everything is working smoothly now. I have now only question regarding 
> these two memory regions:
>
>                 /* MMIO 1 (permissive) */ {
>                         .phys_start = 0xfd500000,
>                         .virt_start = 0xfd500000,
>                         .size =        0x1b00000,
>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                                 JAILHOUSE_MEM_IO,
>                 },
>                 /* MMIO 2 (permissive) */{
>                         .phys_start = 0x600000000,
>                         .virt_start = 0x600000000,
>                         .size =         0x4000000,
>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                                 JAILHOUSE_MEM_IO,
>                 },  
>
>>
>>>
>>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/850100c3-90eb-4a87-82c7-9bd84a8fecd9n%40googlegroups.com.

------=_Part_147_638708854.1641931309658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Almost everything went well, but when I started the fourth cell (bare-=
metal), I got this error, and jailhouse hangs, so I am able to<br>1- create=
 two linux non-root cells and inter-cell communication works fine, and(incl=
uding ethernet)</div><div>2- one bare-metal and linux non-root cell.(inter-=
cell communication works fine (also ethernet)</div><div>I added one region =
for the newly created cell in all files with taking care of correct flags, =
enlarged the state memory region and the all-cells R/W memory region, and h=
ere is what I edited in the root cell:<br><br></div>Adding virtual PCI devi=
ce 00:00.0 to cell "rpi4-linux-demo-2"<br>Shared memory connection establis=
hed, peer cells:<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* IVSHMEM 0001:00:00.0 (demo) */<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .domain =3D 1,<br>&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .bdf =3D 0 &lt;&lt; 3,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bar_mask =3D JAILHOUSE_IVSHMEM_=
BAR_MASK_INTX,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; .shmem_regions_start =3D 0,<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_d=
ev_id =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; .shmem_peers =3D 4,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_protocol =
=3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; },<br><br>And in any other cell i change only the dev_=
id, so I have 0,1,2,3, the second PCI is an VETH and is working fine for bo=
th linux cells together, the problem only comes if I created the baremetal =
cell.<br><br><div><br><br><br></div><div class=3D"gmail_quote"><div dir=3D"=
auto" class=3D"gmail_attr">On Tuesday, 11 January 2022 at 13:54:17 UTC+1 Mo=
ustafa Nofal wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left:=
 1ex;">Hi,=C2=A0<br>Everything is working smoothly now. I have now only que=
stion regarding these two memory regions:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO 1 (permissive) */ {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
phys_start =3D 0xfd500000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0xfd500000,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =C2=A00x1b00000,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 JAILHOUSE_MEM_IO,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* MMIO 2 (permissive) */{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x600000000,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .virt_start =3D 0x600000000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x4000000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ=
 | JAILHOUSE_MEM_WRITE |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUS=
E_MEM_IO,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },=C2=
=A0=C2=A0<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br><br></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/850100c3-90eb-4a87-82c7-9bd84a8fecd9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/850100c3-90eb-4a87-82c7-9bd84a8fecd9n%40googlegroups.co=
m</a>.<br />

------=_Part_147_638708854.1641931309658--

------=_Part_146_2081875178.1641931309658--
