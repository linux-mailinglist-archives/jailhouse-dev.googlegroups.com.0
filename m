Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM6MR7VAKGQEWVMKLBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D37ED71
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 09:28:52 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id b12sf46344928ede.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 00:28:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564730932; cv=pass;
        d=google.com; s=arc-20160816;
        b=c+dxCUcrYey+XGhbIUM6z9910d3on5mFi7EcvY9HAaUYShuVzgL6cLTuzsyTv5MuSD
         QRsqfZkaT8jPNbgpfKtg3fATjTVqTzhmjg5+1O3NNhv7xqnfLwdDaWhalxDxEXb8FEm9
         ToOD90z6Ew39CWSldLhF0bGi7CDyZMz0xGYpbpws8UI7gEII80ueIFSgQE6nGB0EBi3E
         yKO62BN/XTqipQULvT8vhUhf+VatSxGHiAAOS7NQdWRQV3tPrGspMZXXzrVQFS+nypiu
         6bFTi0ML5mk63Mm0rwZVzxSMiOoJunt59vB+z9YwJHtWEegSBJGEu52E/OPmyVPtfTS9
         c0jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9Hggo8VdWRxvZhkHzTIFk25UgTmQBZJvaqddIv29W64=;
        b=lGTYFWy51DS9FuGA745VmSgMg2PbubdoY6Tx4/9Ok6lVF9SQzX0R52Kwu2UdBLedmQ
         PHDxmDOeV4Bk2w0hWRoVWBa0sxngtDVn0+HjYrjzl0oEwg+/PapK6g0vvD6ROJGyr717
         ttMdCJF/TWRI3GcF+cxrA7jR4Wr4xUceFfa5FPPuhtj736yxzuFZLx9rBb5aiR4VTvKU
         JGYai+WZCU6jCO+SBAfDONdI4W57tBndxS3j3o1bzM3iSmAHlTL5k2uwoz+xJFuNz4ej
         AYz3iiepmlY7jjjeN9MiE5K6NAf+exhFxWh4ht2pglBr/ZUiYWXuegtV1g9c24UnzEi9
         a2bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Hggo8VdWRxvZhkHzTIFk25UgTmQBZJvaqddIv29W64=;
        b=DOVFC0xiRmGPLaIS51D8a6ry4ljR6UtYTsoKdPdmftfYqqZXHsOn/oHYbqFPQB6PKI
         z9+Pvt3Wxgx2JoS9dKFOoxXjLziIwfIBUVSLRWAg2Uuwr8dxXJsbp/mw5Lq7z6Xc0UeV
         GMp9pEfuUqKmccS3p33sxX2mZ5OjrB3nb6btDxed80KH7cDs3iY9k4hYswR7y2j53+fD
         zqTycHw5cuM0SUEo72gnPBnYVWuMSKmUInGH1bZSxabWx04VHS2TCHllNiXhYTunm/l4
         byyBGi//n/pvRw5RghKX3DvdD6eZUXJC3Z5w3nLdMSh+jiwq7dRmq5hWLmN94cW4P9HM
         bvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Hggo8VdWRxvZhkHzTIFk25UgTmQBZJvaqddIv29W64=;
        b=DUUJiav3K0I2Tuy4ZiytMP4J77ZFvLGzPF7/cDN24j5t2oToG6Uh+VFcO0Upr91pH+
         EPhEAs465zqXSuQjqYTvK8Zu8/yqavLCJWxSoDxkDPbvnDXP++om0k7xNXVpCTV2t7Di
         HmABpDcyu49gYe9uU8mcCpx72ry0Ddk79iiM2PGJkShkoewCOm/tLSpeZazzA3lUhXSg
         naSSHyD80f9wsbJwEmgEMz0fvjfGy8hkupczUbMbAYQ11lJpgVYt9EtetNPUl/VZ2ykj
         mUApPXuJwk02NFqhaTa/GHyCoT/Goy0F8aUlh6oyRIO9NrKQqJSje5W/9gE/92+M3E/h
         yeKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmgRZ4UyxIHZgBlDa0aznHW8ksS/p0pKCOZQwThhqp51uo7rX8
	agHlWSXtu3OTT5UyRS2xdBw=
X-Google-Smtp-Source: APXvYqyt2zbJiGSy3FYcBQjQV4of4T7plcnLeu05GG1Ed7VaVAsXJWupTvh8r3aD/KUwHd6z8gp2lA==
X-Received: by 2002:a17:906:264a:: with SMTP id i10mr103851757ejc.10.1564730932161;
        Fri, 02 Aug 2019 00:28:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f4c3:: with SMTP id v3ls18311018edm.11.gmail; Fri, 02
 Aug 2019 00:28:51 -0700 (PDT)
X-Received: by 2002:a50:9871:: with SMTP id h46mr116955521edb.69.1564730931441;
        Fri, 02 Aug 2019 00:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564730931; cv=none;
        d=google.com; s=arc-20160816;
        b=dWuLXf/a7WuZ0YXgjDjxEvLvUkM6u/dRCB1oqwCvuO3LznT5gQSV9JewTbiqaOKiNB
         J56tjw6srKRebUSrd8kOvecIbXy39snoe7TWNJM6R1lPIelZ+V5JP3zWJFK8flj6rfR1
         Yuo+FcPqTKQOiOi5EhupizsfOVu0MBQVS3/mOU1d0wIejmVYsHkQ68Ju1yb6mPYBVPmt
         M9ucdcsLywcdX4wJRvq1QzV6JyNI7N/KejEGzs7yS4OVSyhjT7z2nr6MYtAwfBxl+DfE
         vLZXt5cOXa0fxbpZoTZcyF3TICJ2Gjb7fyAolxABFtKna8xPwI9aE0/cSVgybjZvmIBd
         8mYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Zys4rY2gLIB2pl1B4xLFIF18VkQB2s48AQ7V3+QTNL0=;
        b=bg5btgOvKLB5N95fWOVpVQDPjZytihFBStdV0jU63lNdYHx+bWdUiWO0BvczF3S81m
         IDw2rk1BRekpS6GTjZzt3+QFhA7Ezk6EFBTAxT3yWuJEgrMch88gnCL68xVo3rTIu3IC
         MrO07uR4VGJfDlnhUvKn9Q8rxrjwVfcMdTBWUi5cI266fWzvuIuPYt/22JCUwJT4XKqT
         /OwGBLFfnAS1zzIXZ6wr9ypo7f/tvJaHt0jGGPfIdD0TVlz1gW3MApSNL4XKcwhyR1zm
         TReow1ZolYJBS8Q6zvJ1UGlOZkmrOHNkaTeD5zToTza6flK+xWh5tajeb7RzOJ8hkfep
         xqWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h23si950766edb.2.2019.08.02.00.28.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 00:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x727SoLW032178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2019 09:28:50 +0200
Received: from [167.87.36.50] ([167.87.36.50])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x727SnQJ030410;
	Fri, 2 Aug 2019 09:28:50 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
Date: Fri, 2 Aug 2019 09:28:49 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 02.08.19 04:34, Jo=C3=A3o Reis wrote:
> The value of arch.ramdisk_address() is=C2=A02062893056, converted to hexa=
decimal is
> 0x7AF54000, which is within the newly added RAM memory region that begins=
 at
> address 0x60000000.
>=20

OK, and what' the size that shall be transferred here? Keep in mind that th=
ere
is only 0xF9C000 (16367616) left in that region. That information is part o=
f the
'load' structure JailhouseCell.load assembles. If that size if too large, t=
he
driver will reject it. That would explain the error, not yet the reason for
jailhouse-cell-linux to make that mistake.

If you share your configs, the kernel and dtb images and the information ho=
w
large the initramfs is, I can try to reproduce that.

Jan

> quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszka escr=
eveu:
>=20
>     On 31.07.19 02:40, Jo=C3=A3o Reis wrote:
>     > Other thing i forgot was that on Ultrascale+ the RAM finishes at 2G=
B
>     > (0x80000000), so i moved the memory region to 0x60000000, with a di=
fferent
>     size
>     > to not overlap any other memory region.
>     >
>     > /* RAM */ {
>     > .phys_start =3D 0x60000000,
>     > .virt_start =3D 0x60000000,
>     > .size =3D 0x1bef0000, //must be page size aligned
>     > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
>     > JAILHOUSE_MEM_DMA,
>     > },
>     >
>     > But now it gives me the error on ramdisk_address:
>     >
>     > Traceback (most recent call last):
>     > =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", li=
ne 831, in
>     <module>
>     > =C2=A0 =C2=A0 cell.load(args.initrd.read(), arch.ramdisk_address())
>     > =C2=A0 File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cel=
l.py", line
>     44, in
>     > load
>     > =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev>, self.JAILHOUS=
E_CELL_LOAD, load)
>     > IOError: [Errno 22] Invalid argument
>     >
>=20
>     To make this a bit more systematic, I would recommend you to instrume=
nt the
>     code, dump this address e.g., and match against what you think you co=
nfigured.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c=
7cbdad1507c%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-=
c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/164159e0-478e-c5e9-fc8a-e0c0cb27da7a%40siemens.com.
