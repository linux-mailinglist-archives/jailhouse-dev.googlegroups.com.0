Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBCWN4GYAMGQEPRNM3EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19F8A21CC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:39:08 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dcc58cddb50sf539241276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712875147; x=1713479947; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8L3PcvggC/R5B7+C6iq6wKyZkcIBMSnop5DFTgbh0Ck=;
        b=BFTmW3rm//LnvL5MRmsAP7PXBuHXsrrcROP6xV4ctsc5nzPsDlRb1mZes6rJCgdFlg
         YnhhaIOiatMmAqka9a03iPzkHMxY9CGALCnBpcoZR0N3yW/1xu5r+jXvmgk5EzjroJRU
         5KKLVoZsAqD1YsAA6grkFcS+/U8wfOSYJeP+SpPEU9WKq1RYdBdt1Aweo67iC+bHUPol
         r6Zx/9exOaLP2LCa+Xv1wOINJmomU6+5KuAOZ5zQYauNS76xMT/i/zjkIiZmkNUAjbm6
         f//sev/XLsc+7WW2Fh0XkkveS1LJg7EUXBZLU5q6LU5xV9GkGCICSDJ6WGQyO5NaHKFF
         zapg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712875147; x=1713479947; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L3PcvggC/R5B7+C6iq6wKyZkcIBMSnop5DFTgbh0Ck=;
        b=IbRMncT101Po1+crzunDpksM5eea6LdFGOxPAI+1TuTsnO9/uSTv/hy3K+3+CVChFT
         XB7CUnXs0v2PlJE4568KYauTdoXwOu6TKSCW537k4BlGv6qJylexUxyIZnRMmm4grlGA
         2aWlQX0Bcmfnf6batlMfFWq3yil4710O1TmwwTkCSqYSlyPRvtlbKDwANT7Ln44EmPzH
         Kn5lEfCg3kUy9exg//VhyCOVuyThAD3Ied6wqrEigbHjysatggXcousTyYoTKJUssnYH
         PZXf7jecE2pXK7dFTz6RJOCJFC2nn2psXBIjN12gfDhegc6jrMFbGDeIWZB9f/2vTV6N
         wACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875147; x=1713479947;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8L3PcvggC/R5B7+C6iq6wKyZkcIBMSnop5DFTgbh0Ck=;
        b=VVavJOLJJF/VPUdMNPfjC1wl96pfbZKtmAfiF3Zg8el0TsSOg6zFnrp4QqvYAmDHXE
         ovl7QtB1M6Vtvt8R3KYAauRP0YIYVmoZjijJEb1PFWFFPb6MP1cTTY+bavCXHceW7iKK
         VyThnjElgQ+QZxpkSe6GLaCU9XCNpQzm25Zy6sWQK3PWpkS5MmTc1eIwJftxStjeEPh/
         nyENbyb4f6Rzm0hpBbxdqzddmGNUe3DjwazI6iOIywRkKulcdcAhmoZJF6mKpy7ysVsZ
         WOHVsq27zj/zFcuuiBLw/H1gIy0kMXcWH4tZk051asl39fnYSwxazuMAEE6nMHiC6bQU
         vFHg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUFq7065IKrGaNDXWo6RlXhOIaRhROTqX0hq59zuhWGN8tMFDhvk8BYsNXencE8WouUN0pOhIk+i288ovJNOSVl+1wXe9PX37I4svc=
X-Gm-Message-State: AOJu0YyHp8IE4LtCaSS8mu74AoimVD1jbwAxEsCBbhzYunxqZZlqlxRL
	2WY42rOTeN+d+Ys+SAFyYhnQ4DqFvFu5FV3Cjd8uRRS/7xrpizfR
X-Google-Smtp-Source: AGHT+IGPKVXHYLBM33upgLLAZqlrkOdzrdniRqDwRNY/2F9TwxZ1wt1DKVAQL9us61+RqNQNZ5ToAg==
X-Received: by 2002:a25:ef52:0:b0:dc2:2d75:5fde with SMTP id w18-20020a25ef52000000b00dc22d755fdemr1037351ybm.29.1712875146951;
        Thu, 11 Apr 2024 15:39:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d696:0:b0:dcb:b370:7d12 with SMTP id n144-20020a25d696000000b00dcbb3707d12ls482923ybg.1.-pod-prod-00-us;
 Thu, 11 Apr 2024 15:39:04 -0700 (PDT)
X-Received: by 2002:a05:6902:1889:b0:dc2:2e5c:a21d with SMTP id cj9-20020a056902188900b00dc22e5ca21dmr349650ybb.6.1712875144351;
        Thu, 11 Apr 2024 15:39:04 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:39:03 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <938803bd-a8ab-452f-9027-29954f57e53an@googlegroups.com>
In-Reply-To: <ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n@googlegroups.com>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
 <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
 <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
 <8fc34409-ec7f-4306-9f97-3bb380f7c08dn@googlegroups.com>
 <850100c3-90eb-4a87-82c7-9bd84a8fecd9n@googlegroups.com>
 <ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n@googlegroups.com>
Subject: Re: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_165512_1770155613.1712875143412"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_165512_1770155613.1712875143412
Content-Type: multipart/alternative; 
	boundary="----=_Part_165513_1415615952.1712875143412"

------=_Part_165513_1415615952.1712875143412
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Monday, October 30, 2023 at 1:23:36=E2=80=AFPM UTC+1 Bharathiraja Nallat=
hambi=20
wrote:

> Hi  Moustafa Nofal,
>    I am trying to run two Linux inmate on Raspberry Pi 4, Can you please=
=20
> help me with the root cell configuration, and two Linux inmate cell=20
> configuration ?
>
> Thanks and Regards,
> Bharathiraja Nallathambi
>
> On Wednesday, 12 January 2022 at 01:31:49 UTC+5:30 Moustafa Nofal wrote:
>
>> Almost everything went well, but when I started the fourth cell=20
>> (bare-metal), I got this error, and jailhouse hangs, so I am able to
>> 1- create two linux non-root cells and inter-cell communication works=20
>> fine, and(including ethernet)
>> 2- one bare-metal and linux non-root cell.(inter-cell communication work=
s=20
>> fine (also ethernet)
>> I added one region for the newly created cell in all files with taking=
=20
>> care of correct flags, enlarged the state memory region and the all-cell=
s=20
>> R/W memory region, and here is what I edited in the root cell:
>>
>> Adding virtual PCI device 00:00.0 to cell "rpi4-linux-demo-2"
>> Shared memory connection established, peer cells:
>>                          /* IVSHMEM 0001:00:00.0 (demo) */
>>                         .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>>                         .domain =3D 1,
>>                         .bdf =3D 0 << 3,
>>                         .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>                         .shmem_regions_start =3D 0,
>>                         .shmem_dev_id =3D 0,
>>                         .shmem_peers =3D 4,
>>                         .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFI=
NED,
>>                 },
>>
>> And in any other cell i change only the dev_id, so I have 0,1,2,3, the=
=20
>> second PCI is an VETH and is working fine for both linux cells together,=
=20
>> the problem only comes if I created the baremetal cell.
>>
>>
>>
>>
>> On Tuesday, 11 January 2022 at 13:54:17 UTC+1 Moustafa Nofal wrote:
>>
>>> Hi,=20
>>> Everything is working smoothly now. I have now only question regarding=
=20
>>> these two memory regions:
>>>
>>>                 /* MMIO 1 (permissive) */ {
>>>                         .phys_start =3D 0xfd500000,
>>>                         .virt_start =3D 0xfd500000,
>>>                         .size =3D        0x1b00000,
>>>                         .flags =3D JAILHOUSE_MEM_READ |=20
>>> JAILHOUSE_MEM_WRITE |
>>>                                 JAILHOUSE_MEM_IO,
>>>                 },
>>>                 /* MMIO 2 (permissive) */{
>>>                         .phys_start =3D 0x600000000,
>>>                         .virt_start =3D 0x600000000,
>>>                         .size =3D         0x4000000,
>>>                         .flags =3D JAILHOUSE_MEM_READ |=20
>>> JAILHOUSE_MEM_WRITE |
>>>                                 JAILHOUSE_MEM_IO,
>>>                 }, =20
>>>
>>>>
>>>>>
>>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/938803bd-a8ab-452f-9027-29954f57e53an%40googlegroups.com.

------=_Part_165513_1415615952.1712875143412
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Monday, October 30, 2023 at 1:23:36=E2=80=AFPM UTC+1 Bharathiraja Nallatha=
mbi wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0=
 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi=
=C2=A0=C2=A0<span style=3D"color:rgb(32,33,36);font-family:Roboto,Arial,san=
s-serif;letter-spacing:0.25px">Moustafa Nofal,</span><div><font color=3D"#2=
02124" face=3D"Roboto, Arial, sans-serif"><span style=3D"letter-spacing:0.2=
5px">=C2=A0 =C2=A0I am trying to run two Linux inmate on=C2=A0</span></font=
>Raspberry Pi 4, Can you please help me with the root cell configuration, a=
nd two Linux inmate cell configuration ?</div><div><br></div><div>Thanks an=
d Regards,</div><div>Bharathiraja Nallathambi<br><br></div><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, 12 January =
2022 at 01:31:49 UTC+5:30 Moustafa Nofal wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>Almost everything went well, but when I sta=
rted the fourth cell (bare-metal), I got this error, and jailhouse hangs, s=
o I am able to<br>1- create two linux non-root cells and inter-cell communi=
cation works fine, and(including ethernet)</div><div>2- one bare-metal and =
linux non-root cell.(inter-cell communication works fine (also ethernet)</d=
iv><div>I added one region for the newly created cell in all files with tak=
ing care of correct flags, enlarged the state memory region and the all-cel=
ls R/W memory region, and here is what I edited in the root cell:<br><br></=
div>Adding virtual PCI device 00:00.0 to cell &quot;rpi4-linux-demo-2&quot;=
<br>Shared memory connection established, peer cells:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 IVSHMEM 0001:00:00.0 (demo) */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D JAILHOUSE_PCI_TYPE_=
IVSHMEM,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 .domain =3D 1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bdf =3D 0 &lt;&lt; 3,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shme=
m_regions_start =3D 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_dev_id =3D 0,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shme=
m_peers =3D 4,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEF=
INED,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br><br>=
And in any other cell i change only the dev_id, so I have 0,1,2,3, the seco=
nd PCI is an VETH and is working fine for both linux cells together, the pr=
oblem only comes if I created the baremetal cell.<br><br><div><br><br><br><=
/div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On T=
uesday, 11 January 2022 at 13:54:17 UTC+1 Moustafa Nofal wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi,=C2=A0<br>Everything is workin=
g smoothly now. I have now only question regarding these two memory regions=
:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO 1 =
(permissive) */ {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0xfd500000,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
virt_start =3D 0xfd500000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x1b00000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_IO,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO 2 (permissive) */{<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .phys_start =3D 0x600000000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x60000000=
0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4000000,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_IO,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },=C2=A0=C2=A0<br><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br><br></blockquote></div></blockquo=
te></div></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/938803bd-a8ab-452f-9027-29954f57e53an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/938803bd-a8ab-452f-9027-29954f57e53an%40googlegroups.co=
m</a>.<br />

------=_Part_165513_1415615952.1712875143412--

------=_Part_165512_1770155613.1712875143412--
