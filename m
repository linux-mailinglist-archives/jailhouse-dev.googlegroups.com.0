Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHEZT7VAKGQEFKC6LJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71381251
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 08:28:44 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id z20sf50928829edr.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 23:28:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564986524; cv=pass;
        d=google.com; s=arc-20160816;
        b=VC/My/mlSodYg7qFvJK924D8KNAEO9ppkZzMz6D1KaarIj9aPUnFPAsL9TBWvEw05O
         /pib65dEkzHWQVT3+9x/m5ZD24HTnI1Gwo/nHWBFZoh/zzbMCHEpdGoZcJm0I9dpIJ+D
         9wR/zuSLbNz4zOxIm8QCQNft7IF0eA2Iia3wJreOrb+JGW0m+6vvCVC5UA6Q9P560Gfs
         FydfQUU8A/K+z79z/tFGRK3uy5LL1U1+N03DL09WGaw5LwKffy4CN0rlLFgiHBLDxCP8
         6etAAcJuiLt8SLYY5M/ZbJLqT/mGw7g34Wufk159Cm0tCBkEN5NYCzLH8vi1yfOgfiTc
         6TJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LfOxjSMjEv/Iq2XXBIVRi3Ir08VHBH7I/DhLe9Me2cs=;
        b=LKqGUarzCNHANSWLL1aJEaZIvJNzhURnRS7oyWE9wtff3w0gAvg4peKKCeIFT/YiJf
         kLZzUMGPSyeQHt0Bi4EZXSXjX8oULaObdQirbLGOl21m0eGnubNBSq9SqnqHNa9ZjVBT
         uf8JGWtZnTOs+xv6ZfwLOkf9RbU2zpNBz/Hj+ew5RUysOILaZVt38nb9jrXnENY647Gg
         BDhMBTnqRWMni8kzL+r0tH7Hd5MtDyX43l3SKOW2Tmz5K7t0D5RnWm+SVJw5rqOcLOXA
         qZzgClgDuxbMj37yl+hmMh1WPgM7mfdCqFga8qNaq8Qq2eVlWUFCRvpqYru8OvTOR6b6
         +TTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LfOxjSMjEv/Iq2XXBIVRi3Ir08VHBH7I/DhLe9Me2cs=;
        b=F9N17fziEdI8hNchVPiDezS+Y7raotR+1fWI56O+Rozr8goZkTQCqWfk9gpomBodjO
         XJLZgn/68hwiCxCZep8Z6ZUkeSLr4aqpsBL6Zk2BqC5jcI/Ux7nXfRGB3ZYEssT8NA4O
         nsrX7yv42hA1rJ8gbWCphjbimiWy11YMvmZssrnkQuPKr8kgKsbrxoUWPI+5JPw+bWdS
         NQ5REDMVS7pU1UeYKSfZ+HD0VjxQnNjiGDpbjkXWPfINYvHrLB8LK/ViaFzK+0e0DjrN
         aJu0skkRtyw1nu2OiLCJdj43+wfYy9jWgf+XOtcZY6B+0V6Vz26dUURLS3jqwSOMLd1f
         /dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LfOxjSMjEv/Iq2XXBIVRi3Ir08VHBH7I/DhLe9Me2cs=;
        b=JMbNr5ygLHQ47hsGZ3CygriY3NJWi/J1guSL4l7HsVYu5S/bcLFmfTQIkBVM42YCxW
         8QHqbZmjltVoD4pUMHMg3ZJBporvm0qdE9bINRZF3yZErSxb8NvhdGNIU6XddlY5t3oe
         n51BHERc8wti1MRnBW/MC7nXyyrjluuaUYheK52VRfweYXFV4RTTFXEyIOUiNQEgBoJ2
         maQumWfbDUAinfyPjY+cSychCQq4c0u9UGTMEQNDYiQTtbp3YPD2Z4jecHNuTtPyBhvp
         wB7p9kwalPKP3wbYN/MNjuSE7E2aXRJjJFm9rCg9/rn5blnrpU4A16eZGPE6mcGLhbBE
         yg6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFNbLJZ20xtMRepmmVi9nEpDtxV+AMQKe5ExdbuYcMeAAGdaXI
	Cyoc/zTM1Qta2O/lODzODJg=
X-Google-Smtp-Source: APXvYqxuqs5cdedmZb4brWTfHTrDz9qkYVjAC5A3HYBgkGbQSjBYkiGJcE455pS2K7gdCrc3feKbXw==
X-Received: by 2002:a50:eb92:: with SMTP id y18mr130768673edr.245.1564986524632;
        Sun, 04 Aug 2019 23:28:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:978a:: with SMTP id e10ls20774857edb.6.gmail; Sun, 04
 Aug 2019 23:28:44 -0700 (PDT)
X-Received: by 2002:a50:f70c:: with SMTP id g12mr133376283edn.139.1564986524087;
        Sun, 04 Aug 2019 23:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564986524; cv=none;
        d=google.com; s=arc-20160816;
        b=TwXMINp6vKm1qryUjBJp59/ZQJlpHZQsglf5OBEKv2HYgxVtCXYNGDmyob1EDdIgDF
         H9/NJUVogNhRxAg3GpIC1YoQbtS6XGLxJ0foDaxBOsEtI7RgYgtwATg65BOTTQmp5Wgn
         7d3K6jWyeszrjCBY3HLah9+Y2JOltLkCJU0foZC6MJ1g16wcJlfP0bsJwxZSw0vBeQkD
         jzeTQxGurDdxSe8RSEIh/9fQ/y8H63wk7PxAsMCeuGZmkfSXuF/0EaLy0BgOVpXjunJX
         zgPHwgeXr8otEKWqTCvaGFOTowzjswRT1MX6oLZnbP47QEseo9bD196MavpbdbiB6jja
         QS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=kWuUX1K6lPNiB3nD3/UsUFWJZ1ZbMGfZ8+Ppm6i+Trg=;
        b=rY6igrw6M3Xey8JSAD/bQKglRus6eNmPxqQNWTeqZsJvgF7YcO94ryneIwJ0A8occp
         b15OvsvP+GaR3OAZ6gQHuL4nIUzBctKcMzBGWLeoBK/Xc5TbtmDQF6H810vXDJZN8cEz
         0siSJRGnsCWZ4bPXEPBaKB7yfQwtRr4XEXVZpzoOAM4N1gwFkWz5aYMahleSGIeyFZ/X
         60GuoVCVzXxLSPx6BXpN1EeCvEFAlLYDYKhegv+m2J1QUuU6d/vIxJIHYINHtMgdxMfZ
         K4N4gTwpH8iNuqdOsSLFQjAwaLGxHYE9DVayb7d1vp5CMFEmknry8hgsKUCMbs9MFsnd
         5zHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a41si4823232edc.5.2019.08.04.23.28.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 23:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x756ShBx024197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 08:28:43 +0200
Received: from [167.87.3.96] ([167.87.3.96])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x756SgLQ030894;
	Mon, 5 Aug 2019 08:28:42 +0200
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
 <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
Date: Mon, 5 Aug 2019 08:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 02.08.19 21:01, dianaramos007@gmail.com wrote:
> Hi Jan,
>=20
> Concerning your inputs I still have some questions that I would like to c=
larify
> with you.
>=20
>     Both your cells, root and non-root, access the ICC at 0x1c20000 here.=
 I don't
>     recall the nature of this resource anymore, maybe it can be split at =
register
>     boundaries. If so, define smaller sub-page regions in the root cell a=
nd had the
>     subset of them out for exclusive use by the non-root cell.
>=20
>=20
>     Currently, you revoke access to the region at 0x1c20000 from the root=
 cell when
>     creating the non-root cell.
>=20
>=20
> The configuration files for both gic-demo and bananapi (from wip/ivshmem2
> jailhouse's branch and queues/jailhouse-ivshmem2) are similar to the ones=
 I was
> experimenting with in kernel 4.13.0 (from master jailhouse's branch). How=
ever,
> now I'm getting all the unhandled traps (i.e., Unhandled data read at
> 0x1c20060(4)). Could you please explain me how gic-demo was working befor=
e with
> that kernel and not now (with queues/jailhouse-ivshmem2 from
> http://git.kiszka.org/linux.git/), when for instance the address for CCU =
was the
> same in both cells? For instance, in the configuration files of both cell=
s, CCU

The branch on kiszka.org is based on kernel 5.2. That may contain new or
different drivers that are now touching resources they didn't back then in
4.13-times.

> was set like this:
>=20
> /* CCU */ {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x01c20000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D =
0x01c20000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x400,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>=20
> Moreover, I followed your advice and tried to split the address 0x1c20000=
 at
> register boundaries. However, I might be doing something wrong as I'm sti=
ll
> getting unhandled traps. Could you please provide me with an example for =
this
> particular problem.

Basically, you have to replicate that CCU block above a few times, adjust s=
ize
and start addresses, e.g.

{
	.phys_start =3D 0x01c200c0,
	.virt_start =3D 0x01c200c0,
	.size =3D 0x10,
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
		JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},

in order to define a region from 0x01c200c0..0x01c200cf, permitting 32-bit
accesses. Such a region could then be assigned to a non-root cell as a whol=
e
(breaking up sub-page regions on assignment is not possible, in contrast to
page-aligned regions).

> BTW, is it possible to use addresses that are not listed in
> /proc/iomem for entries in config files for cells, i.e., that are not ass=
igned
> to memory mapped devices?

Of course, though you should know why you are assigning a resource. The SoC
manual may explain the semantics of those registers in order to decide.

Alternatively, you can do the following to avoid accesses:

 - "#define CONFIG_CRASH_CELL_ON_PANIC 1" in include/jailhouse/config.h
 - let the cell trigger the crash -> Linux should now dump a backtrace
   that should point to a driver issuing this
 - in the future, remove/unbind the driver from the resource prior to
   assigning it to a different cell

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7e6377fc-e8af-c947-8218-a435a065a597%40siemens.com.
