Return-Path: <jailhouse-dev+bncBDKLL2HKV4DRBSOA72UQMGQENJDTDVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x37.google.com (mail-oa1-x37.google.com [IPv6:2001:4860:4864:20::37])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6157DB9D5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Oct 2023 13:23:39 +0100 (CET)
Received: by mail-oa1-x37.google.com with SMTP id 586e51a60fabf-1dd886536f2sf5565260fac.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Oct 2023 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1698668618; x=1699273418; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3unkqkeFbaoo9g1pe5iFNoVnaFE/WVcBMqtz9sOjnck=;
        b=Wyah5jM5izyD7+NGS63pChF+L5roETNTymRPSCmtY6pHbEWf0AGo5DS+6xr3iDKTgJ
         Z6rndFH/vCxUkXrWvkj5dSEQrvl8xTXkAVptSFFt+3wGFu9v6T4lJzHzXlFSmcLM4Nve
         12Z5B+VMYdwRqwcCc3N1Jp152KpKYBknuriTwOWsyjjFslCPLh5Tj8H4R1k0HM/urkYo
         Muqt21Vw9GCIYx/lEEEB+BH+4gmN7M0fxEHmH53nGXuUViav28/cqQaJJ1opqQWCNGF6
         Lm6iDBGigmosduj1VtMuz6p1uIg8FxCIbaN2Ef8yrQE0I3kKmw3BwjtTzsqdXJ5U4Ax3
         Yq2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698668618; x=1699273418; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3unkqkeFbaoo9g1pe5iFNoVnaFE/WVcBMqtz9sOjnck=;
        b=mpvZpmor1ReJMdpGkRKf/0F0K5UrAcijwIYs2yIllYZES3gJnI/HAUjgeTvwo15EEx
         mq/jLXrJfl1CLIiFgrxLpF+gNoY6CTAXn4Ul5F6NTUYmXdAl+ZGPesFihgvnxUTY7cj+
         98eyiTAX95QlPqIlhK30w9jeu0hjO1CqshSJbIwZSv9kG4KafDT6PMT7hB3U98QQIlZN
         DBlQ+aaAX6EiOd3TJSuiimTOYy8VZhUM4MmF4re+t0hsA6gY8pI9Bzv6bRKnfqFwmfuC
         yfX3NSxvI+7jnJMpq56j1Mn3xqAqkjDYdbxyUFbCGWT2nTaGILND1NAUAeGlUtBee+JT
         3DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698668618; x=1699273418;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3unkqkeFbaoo9g1pe5iFNoVnaFE/WVcBMqtz9sOjnck=;
        b=T0g9EHnUJCxaiSnDo9EhTgah6ZYTQQbGyPcDRHnWchCW+WaThdPWMlHaRo6A22niOu
         20hZZL2DQUflfrLUpwzoD6frO11axAPG4W1VfvOfwTinFvHXxqnUerfn4k75zKnWzaqf
         npT6x7AaO6hFzpRIov69pqgiG0XbOzi4FCqsYTgqR1GStxtopi5v3+aHqFktPtd1pSgY
         Q+NQ8qmpAQvziAIG6PIigNjClD8RMW5GMBGljcAaM9vKR7Mj+H1cbRx1+H47YerYC+e8
         ulZmnXn/nVIzzarreO66JWCao92VF/K3PkTqwXnQkkkQzGqQp8EZEN3kYzEDUMRqKDY3
         8JQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwTe9uC/Zjn4Yp8YeYdwahLeDdIgLUV2olSNTNX3m6JvyiWDZVj
	yC9mMzBLqrVO4R6AsuSPmBE=
X-Google-Smtp-Source: AGHT+IGDZzsdawBqynaiDxPQnWbbzHwrg+GBEHZx1D5Y39GylFIJ3A3X5m6a0Rqg+PKiQSLqi1d38Q==
X-Received: by 2002:a05:6870:54:b0:1ef:c894:41d1 with SMTP id 20-20020a056870005400b001efc89441d1mr4205099oaz.6.1698668618030;
        Mon, 30 Oct 2023 05:23:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:9f0f:b0:1ea:d76a:4f28 with SMTP id
 xl15-20020a0568709f0f00b001ead76a4f28ls4874096oab.1.-pod-prod-04-us; Mon, 30
 Oct 2023 05:23:37 -0700 (PDT)
X-Received: by 2002:a05:6870:15d2:b0:1ef:c715:f52 with SMTP id k18-20020a05687015d200b001efc7150f52mr1999903oad.6.1698668616972;
        Mon, 30 Oct 2023 05:23:36 -0700 (PDT)
Date: Mon, 30 Oct 2023 05:23:35 -0700 (PDT)
From: Bharathiraja Nallathambi <barathiraja@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n@googlegroups.com>
In-Reply-To: <850100c3-90eb-4a87-82c7-9bd84a8fecd9n@googlegroups.com>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
 <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
 <84ebb12e-49ba-49ed-9719-063064e3c8e6n@googlegroups.com>
 <8fc34409-ec7f-4306-9f97-3bb380f7c08dn@googlegroups.com>
 <850100c3-90eb-4a87-82c7-9bd84a8fecd9n@googlegroups.com>
Subject: Re: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_71182_1707400721.1698668615966"
X-Original-Sender: barathiraja@gmail.com
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

------=_Part_71182_1707400721.1698668615966
Content-Type: multipart/alternative; 
	boundary="----=_Part_71183_2005499685.1698668615966"

------=_Part_71183_2005499685.1698668615966
Content-Type: text/plain; charset="UTF-8"

Hi  Moustafa Nofal,
   I am trying to run two Linux inmate on Raspberry Pi 4, Can you please 
help me with the root cell configuration, and two Linux inmate cell 
configuration ?

Thanks and Regards,
Bharathiraja Nallathambi

On Wednesday, 12 January 2022 at 01:31:49 UTC+5:30 Moustafa Nofal wrote:

> Almost everything went well, but when I started the fourth cell 
> (bare-metal), I got this error, and jailhouse hangs, so I am able to
> 1- create two linux non-root cells and inter-cell communication works 
> fine, and(including ethernet)
> 2- one bare-metal and linux non-root cell.(inter-cell communication works 
> fine (also ethernet)
> I added one region for the newly created cell in all files with taking 
> care of correct flags, enlarged the state memory region and the all-cells 
> R/W memory region, and here is what I edited in the root cell:
>
> Adding virtual PCI device 00:00.0 to cell "rpi4-linux-demo-2"
> Shared memory connection established, peer cells:
>                          /* IVSHMEM 0001:00:00.0 (demo) */
>                         .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>                         .domain = 1,
>                         .bdf = 0 << 3,
>                         .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>                         .shmem_regions_start = 0,
>                         .shmem_dev_id = 0,
>                         .shmem_peers = 4,
>                         .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>                 },
>
> And in any other cell i change only the dev_id, so I have 0,1,2,3, the 
> second PCI is an VETH and is working fine for both linux cells together, 
> the problem only comes if I created the baremetal cell.
>
>
>
>
> On Tuesday, 11 January 2022 at 13:54:17 UTC+1 Moustafa Nofal wrote:
>
>> Hi, 
>> Everything is working smoothly now. I have now only question regarding 
>> these two memory regions:
>>
>>                 /* MMIO 1 (permissive) */ {
>>                         .phys_start = 0xfd500000,
>>                         .virt_start = 0xfd500000,
>>                         .size =        0x1b00000,
>>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 
>> |
>>                                 JAILHOUSE_MEM_IO,
>>                 },
>>                 /* MMIO 2 (permissive) */{
>>                         .phys_start = 0x600000000,
>>                         .virt_start = 0x600000000,
>>                         .size =         0x4000000,
>>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 
>> |
>>                                 JAILHOUSE_MEM_IO,
>>                 },  
>>
>>>
>>>>
>>>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n%40googlegroups.com.

------=_Part_71183_2005499685.1698668615966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0=C2=A0<span style=3D"color: rgb(32, 33, 36); font-family: Roboto, A=
rial, sans-serif; letter-spacing: 0.25px; text-wrap: nowrap;">Moustafa Nofa=
l,</span><div><font color=3D"#202124" face=3D"Roboto, Arial, sans-serif"><s=
pan style=3D"letter-spacing: 0.25px; text-wrap: nowrap;">=C2=A0 =C2=A0I am =
trying to run two Linux inmate on=C2=A0</span></font>Raspberry Pi 4, Can yo=
u please help me with the root cell configuration, and two Linux inmate cel=
l configuration ?</div><div><br /></div><div>Thanks and Regards,</div><div>=
Bharathiraja Nallathambi<br /><br /></div><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">On Wednesday, 12 January 2022 at 01:31:49 =
UTC+5:30 Moustafa Nofal wrote:<br/></div><blockquote class=3D"gmail_quote" =
style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pa=
dding-left: 1ex;"><div>Almost everything went well, but when I started the =
fourth cell (bare-metal), I got this error, and jailhouse hangs, so I am ab=
le to<br>1- create two linux non-root cells and inter-cell communication wo=
rks fine, and(including ethernet)</div><div>2- one bare-metal and linux non=
-root cell.(inter-cell communication works fine (also ethernet)</div><div>I=
 added one region for the newly created cell in all files with taking care =
of correct flags, enlarged the state memory region and the all-cells R/W me=
mory region, and here is what I edited in the root cell:<br><br></div>Addin=
g virtual PCI device 00:00.0 to cell &quot;rpi4-linux-demo-2&quot;<br>Share=
d memory connection established, peer cells:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* IVSHMEM 0=
001:00:00.0 (demo) */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .domain =3D 1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bdf =3D 0 &lt;&lt; 3,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_regions_=
start =3D 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_dev_id =3D 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_peers =
=3D 4,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br><br>And in =
any other cell i change only the dev_id, so I have 0,1,2,3, the second PCI =
is an VETH and is working fine for both linux cells together, the problem o=
nly comes if I created the baremetal cell.<br><br><div><br><br><br></div><d=
iv class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday,=
 11 January 2022 at 13:54:17 UTC+1 Moustafa Nofal wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi,=C2=A0<br>Everything is working smoot=
hly now. I have now only question regarding these two memory regions:<br><b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO 1 (permis=
sive) */ {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0xfd500000,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_st=
art =3D 0xfd500000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =C2=A00x1b00=
000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_IO,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MMIO 2 (permissive) */{<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys=
_start =3D 0x600000000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x600000000,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4000000,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 JAILHOUSE_MEM_IO,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },=C2=A0=C2=A0<br><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb=
(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br><br></blockquote></div></blockquote></div><=
/blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ce8a9fdf-1316-41d3-be24-d3ab2dbabb95n%40googlegroups.co=
m</a>.<br />

------=_Part_71183_2005499685.1698668615966--

------=_Part_71182_1707400721.1698668615966--
