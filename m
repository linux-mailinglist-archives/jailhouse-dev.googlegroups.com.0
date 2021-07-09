Return-Path: <jailhouse-dev+bncBDK5DKO5RYERBOUIUCDQMGQELKZVZRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A13C2079
	for <lists+jailhouse-dev@lfdr.de>; Fri,  9 Jul 2021 10:09:31 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id d8-20020ac866880000b0290251ed4135d5sf5284739qtp.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 09 Jul 2021 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JwXKUZWu2EPxc+F0y0MiXrdXUJbqMsIYJEWjIifRqBI=;
        b=psWkr73hXotJhbi4Hagl6WXGGebNrCqVcSWnZ3qAASL5kPzOCM5OAIOCfE8VP3rsku
         X9U2VNPKHYmrU27TgEEUxqDoY9gsIbSWep5kn1FBfFN6qyyGJWV5298fbm9bHw1/+tCr
         L6ZVAwvwMe6FGFyuVCY3Q3X6Lq/erdNRYexP97/3hlOYsnYNIvgB/o4DYsN4GaXzaSf6
         BAn+U2CC3s/lg1YPpgficviLDnbtBNFAViv0D/kPLlhDlebJqWnbhyDIgi9maa1/iuw4
         J5JGD1HvAeHRAbBlTgkQW2tRBpQKyRm6d98FPQHHZlLjXFGq7hwnPjPXTWen8P2TjBCI
         5FYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JwXKUZWu2EPxc+F0y0MiXrdXUJbqMsIYJEWjIifRqBI=;
        b=D49MSOQ0xc/ZnD6rdXk7HxpAskGxBQpqHnohXl9ZhJuDpWf7GZZoyK4CYUTC6Vfi8y
         n7mJaYvmq7+CmgwoJ0+CkmxCgH0Jj9i7/QnL6Q5ShhbHEtzI4I1MouJIr6NicoiJWSv8
         wVxOV1y1j+kJvzCqTobl3LYvaU0hG3SKV3i1QxAMUA8c3Ca/OVP0L736BchUt682VGOu
         AoTiulw8vlV2CqMSm4RtbvtbHp2arO4S0Lp1uOHSLiSp1H4CSHtiR6q17H/tYg7EEXLm
         RrU8A+e4Bvyf8sHTPx4RJTPMiT9NbwWOyVLIUZL5UKEPf3A9ONY928sFcO+zNheSqw2A
         U+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JwXKUZWu2EPxc+F0y0MiXrdXUJbqMsIYJEWjIifRqBI=;
        b=LKb5DYWz1EaI1OcJRa1N9uJVHxVINtN0qkW1Hgfrf21wZKSUe5/EC+XDJcaAvG6uJN
         Jx3ZmddUip1e8u5jEKQZaJh4/GNNI6ORwmppPjtUySnu4el6ib1EVBHcvb43P7tB6HNI
         Sk9QlKWR44HmUV5n+rZTLWQ54XzjWhqRpd+oE9xEwni26PAn46XbafcGOY8GZQJkHqB6
         0DgWN21e9JYvG2DutO9aRYXCNzAymfOq89qmMp9yStKEmSs83QAvk9ms7nT5+5JMhpiZ
         v+WZNfCQMZjID4l6fqDw5UiqHrYIgtFB/MYrXrJYw2LRo+AuSNn1OD9+J1fzjgYFNmp8
         4Tow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bqh/p0XhW7ZR705AVx/hbd9DLe/EjnIlU8ZvElYAoBW5NLJgJ
	FDxBTFMUXIITG9UvReezOgA=
X-Google-Smtp-Source: ABdhPJxh2UaIEqFWBCoqvUDNRC5MGpK7P7+9v/T8/DDwCEi6V4p1JHUIrms1WPOOzFrLQo0PjkFO2g==
X-Received: by 2002:a05:620a:749:: with SMTP id i9mr36625738qki.307.1625818170261;
        Fri, 09 Jul 2021 01:09:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:20cb:: with SMTP id f11ls3134268qka.3.gmail; Fri,
 09 Jul 2021 01:09:29 -0700 (PDT)
X-Received: by 2002:a37:8306:: with SMTP id f6mr37064422qkd.82.1625818169486;
        Fri, 09 Jul 2021 01:09:29 -0700 (PDT)
Date: Fri, 9 Jul 2021 01:09:28 -0700 (PDT)
From: yohenn perrot <yohenn.perrot@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n@googlegroups.com>
Subject: MSIX Enabling Error on TX2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_190_570841535.1625818168968"
X-Original-Sender: yohenn.perrot@gmail.com
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

------=_Part_190_570841535.1625818168968
Content-Type: multipart/alternative; 
	boundary="----=_Part_191_698914159.1625818168968"

------=_Part_191_698914159.1625818168968
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm working with Jailhouse for linux version 4.4 on Nvidia TX2. I have 
currently 5 cells that communicate with each other. 
In order to communicate with linux root, I implemented 5 vPCI devices in 
the linux-root. After some researches I found that a cell cannot have more 
than 4 IRQs, so I'm trying to implement msi-x.

Currently, I have *ENOSPC *error during the *msix enabling  function*. 

With *sudo lspci -v* command , I can see that a memory space is allocated 
for the MSI-X.

*00:04.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared memory*
* Subsystem: Red Hat, Inc. Inter-VM shared memory*
* Flags: fast devsel*
* Memory at 40104000 (64-bit, non-prefetchable) [size=4K]*
* Memory at 40105000 (64-bit, non-prefetchable) [size=256]*
* Capabilities: [50] MSI-X: Enable- Count=1 Masked-*
* Kernel driver in use: uio_ivshmem*

I set up the linux root cell like this :

* .type = JAILHOUSE_PCI_TYPE_IVSHMEM,*
*                        .bdf = 0x4 << 3,*
*                        .bar_mask = {*
* 0xfffff000,   *
* 0xffffffff,  *
* 0x00000000, *
*                                0x00000000,*
* 0xffffff00, *
* 0xffffffff, *
*                        },*

*                        .num_msix_vectors = 1, *
*                        .shmem_region = 68, *
* .iommu = 1,*
*                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,*
* .domain = 0x0,*
*                },*
*Do you have any suggestions on the problem encountered ?*
*It seems that  MSI-X are different for virtual devices is that right ?*

*Thanks,*
Yohenn

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n%40googlegroups.com.

------=_Part_191_698914159.1625818168968
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>I'm working with Jailhouse for linux version 4.4 on Nvidia TX2. I h=
ave currently 5 cells that communicate with each other.&nbsp;</div><div>In =
order to communicate with linux root, I implemented 5 vPCI devices in the l=
inux-root. After some researches I found that a cell cannot have more than =
4 IRQs, so I'm trying to implement msi-x.</div><div><br></div><div>Currentl=
y, I have <b>ENOSPC </b>error during the <b>msix enabling&nbsp; function</b=
>.&nbsp;</div><div><br></div><div>With <b>sudo lspci -v</b> command , I can=
 see that a memory space is allocated for the MSI-X.</div><div><br></div><d=
iv><div><i>00:04.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared m=
emory</i></div><div><i><span style=3D"white-space:pre">	</span>Subsystem: R=
ed Hat, Inc. Inter-VM shared memory</i></div><div><i><span style=3D"white-s=
pace:pre">	</span>Flags: fast devsel</i></div><div><i><span style=3D"white-=
space:pre">	</span>Memory at 40104000 (64-bit, non-prefetchable) [size=3D4K=
]</i></div><div><i><span style=3D"white-space:pre">	</span>Memory at 401050=
00 (64-bit, non-prefetchable) [size=3D256]</i></div><div><i><span style=3D"=
white-space:pre">	</span>Capabilities: [50] MSI-X: Enable- Count=3D1 Masked=
-</i></div><div><i><span style=3D"white-space:pre">	</span>Kernel driver in=
 use: uio_ivshmem</i></div></div><div><br></div><div>I set up the linux roo=
t cell like this :</div><div><br></div><div><div><i>&nbsp;.type =3D JAILHOU=
SE_PCI_TYPE_IVSHMEM,</i></div><div><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bdf =3D 0x4 &lt;&lt; 3,</i>=
</div><div><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; .bar_mask =3D {</i></div><div><i><span style=3D"whit=
e-space:pre">				</span>0xfffff000,&nbsp; &nbsp;</i></div><div><i><span sty=
le=3D"white-space:pre">				</span>0xffffffff,&nbsp;&nbsp;</i></div><div><i>=
<span style=3D"white-space:pre">				</span>0x00000000,&nbsp;</i></div><div>=
<i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x00000000,</i></div><div><i><span =
style=3D"white-space:pre">				</span>0xffffff00,&nbsp;</i></div><div><i><sp=
an style=3D"white-space:pre">				</span>0xffffffff,&nbsp;</i></div><div><i>=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; },</i></div><div><i><br></i></div><div><i>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_msix_vecto=
rs =3D 1,&nbsp;</i></div><div><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_region =3D 68,&nbsp;</i></=
div><div><i><span style=3D"white-space:pre">			</span>.iommu =3D 1,</i></di=
v><div><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,</i>=
</div><div><i><span style=3D"white-space:pre">			</span>.domain =3D 0x0,</i=
></div><div><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },</=
i></div></div><div><i>Do you have any suggestions on the problem encountere=
d ?</i></div><div><i>It seems that&nbsp; MSI-X are different for virtual de=
vices is that right ?</i></div><div><i><br></i></div><div><i>Thanks,</i></d=
iv><div>Yohenn</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n%40googlegroups.co=
m</a>.<br />

------=_Part_191_698914159.1625818168968--

------=_Part_190_570841535.1625818168968--
