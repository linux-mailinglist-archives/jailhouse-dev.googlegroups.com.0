Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKHHQTVAKGQE7KQNCFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE017B995
	for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jul 2019 08:22:32 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id i6sf33057853wre.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 23:22:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564554152; cv=pass;
        d=google.com; s=arc-20160816;
        b=oI0fKamFuwh734nGvas+NPtxlFvyK/LMzDu971hZ7PgdOrYwcaIk+st4Cg2T43aCdh
         RhwwaAHSfW4BD9R3CvkrRNl6hUJ+85K9q5ieM/qvgBSwtP+20fJhRGTl/UIv76LUUI/b
         qrPM6YGq3ZzmG/p0t4Cf5+j9GUpTP+LeovC/mpRBBuWK70NyGwj6g1yYqCq1Q+Ieq6Mz
         /o201j7b9pcQaX6bu1snIQ5q3yzADv1LizeMraQljql+fhBPjxvZ2IWonLHKXUyfhXT2
         7eHWyjX8/Lz81lwOYEUAapzO1OYF1oi8VrjPedwEQv+KYDcu8Y33OhWuKiPSHRk7KUx3
         EkFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=GC+9HVxlYC94wHoDI4UfmkTJpsauxLOP+eXmDknD0NU=;
        b=yGL1EZZj5u4InyrG7/t9KIRAXtXzrBYUejgFWF92YHF5Dkb4Oq5WTd9dqDt3HT8G48
         gMclwWD1FC9ZmU24Fr6HHMrt/qwrhzncGSl5SvBb9uTI45LRms7mDt92g6m6mYs3mY+r
         DpNB3HX5lQMBPM5J/FmS8r24Yb4OlbZVyZhF3TIL8KZPYviv+NMgO6Ucswn/xshF3/LZ
         L7AVe9BbT4OrHEW3zrqVPQ4ezsNk6u8SNJrFzUOpbw1Ut5Pq1JoFs7qhdQercX/HLZQz
         j80QGmkTH2Hb8QTIWr4GuXQMTcT2890WrxyOaZ2K00gCYk5qqkeyfjOogfwcuqOfnLNQ
         JWww==
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
        bh=GC+9HVxlYC94wHoDI4UfmkTJpsauxLOP+eXmDknD0NU=;
        b=cQrzzTIIUBG1FDaoo8xORflZqitDZpAiK7MBmWHPlG+sTwb7ouiGVjr/zFcJ1w3wny
         41maE7XD2SOUbn3+9c6mNle9AFiZoXf54PQYxQrrS0xVJ3fe+xCaokLbEziKYxzeSdFc
         lUWoFcJ4VRqiyviaxMbSIqr65jQZ1D9qR40yP0izOYjxBa/54OFU0qYHBMTBGB1JCBH/
         qNX3zDbwD4z0aRyG8x5fQ9gCDIxXiVWE+5t9GKOT6I/qwx4SSsqlLswLSwcqHMfk/2qt
         Q8CltqgzlRmtNQCl7DDBuzQ3AEBqLafMQXn1SkYWcQ64BEPyGHT8+G3dh3+5yIfPE4+y
         OHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GC+9HVxlYC94wHoDI4UfmkTJpsauxLOP+eXmDknD0NU=;
        b=YdhFg5W+kq64jzjbbiZhICV2haTVvJ+JtFdUVB6Z/L/+MMeEEwfcO8zP8ypzQzG646
         qikgfvd0k56V/tFLf3x+T4F5WAhX5f3b7Pvs5bb8zrQC4aqZSotQZ7Ul2p1awyu5TIzq
         kKss55uqIFsc/s8av1fWqCcn11ruBZ7jjVZSZa+TVxQUr4+/boiWA/B1ehu4kOXn5Enc
         lRK5ZoTue+kqXBYqDMZOUldlID2/s3SAF/Nr+Yhw5PKNYF9n1Zx8Psfc3LhNQoggcfZR
         mbtS7937p+1DSnvXaej++tNJvN9H5wLqbADz9xfA393NKGsRoYl7jngB2Ye9jjGGZy7z
         uRSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVR8tOnYm/aFNz3E7BmIZsDDwi1IiyzD3mJe8hdJCLXuJNf6WtM
	EdYZCfBPj8P0C3M2wybNwEQ=
X-Google-Smtp-Source: APXvYqyM83LPqwWTRNN2AowHGdZhVOrKpu6L5P/DAE/DNqDSsezw57FNy738p0gXGG6S960+7vxbIQ==
X-Received: by 2002:a1c:3142:: with SMTP id x63mr11865870wmx.169.1564554152627;
        Tue, 30 Jul 2019 23:22:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls20105106wri.14.gmail; Tue, 30
 Jul 2019 23:22:32 -0700 (PDT)
X-Received: by 2002:adf:e883:: with SMTP id d3mr45506043wrm.330.1564554152054;
        Tue, 30 Jul 2019 23:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564554152; cv=none;
        d=google.com; s=arc-20160816;
        b=ekq6YVvr8Wp+B6fzFCuhiPC0682vdT9VH0CklARgXX1DlBvS0bWNiQhRLxWgBw4gHW
         65MBE1kX30B5TCZEHEgU3c4T+YYKzYdo0jK22ZHeh2RKFIAoJbnnmISUjWJKTBDHlmHq
         t7nHMmQnvOjYn+24dHhCkGsKXL2FxT+kjIeSgFBcCyK2ETK7mR4tyXxHtIQ4hrOd16nn
         8ESlKlK38iGxj0gHBbe/0UOMUAemPt+18m7nBRq27uWrujSvtoSQrPDxcLQax8BA+XYJ
         VyymaLZWPAHslQXXfiGb4ZORlzQxI2qRuKGNC5qiBsqNIEQnZH81sARbpWhnT9f03rK2
         qipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=t5qdvp66iZZJiATV/wFlQ2jsVbGIxTGyIjzmJA1nmsA=;
        b=gCX2R9oc4kvY1REJAY2Yt7myEOfV7OuKR3bY3myCnoB8koNwuXgkFSKIO9xhQEvCxe
         x7nxAsBUHdlunyXqGXMPHTGSZLfXTWLbhOYG2jwnnPGkD8j//d21oLY3SG6HW9mtB320
         kJLewdNW+bM2EHsCa30rvzWB5mmK0hAwplYlGkk3eTNKxcj3QGt/indXG27ArEjLuft+
         vI8IqRHVz5iNXTYsti92HVHoCoxfhyKIWoBbTc1Fse74RO7dqCaV8PgM3Wks4HdNSPPx
         YdQo1tDZIcPiAsQ1sVhF5MdWINmboq+lrzFNZ63K3tnOvzmtKs+c696udPMuXXjAIK0x
         aH/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e12si98683wma.2.2019.07.30.23.22.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 23:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6V6MVpv003109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2019 08:22:31 +0200
Received: from [167.87.3.59] ([167.87.3.59])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6V6MUPW016618;
	Wed, 31 Jul 2019 08:22:31 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
Date: Wed, 31 Jul 2019 08:22:30 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
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

On 31.07.19 02:40, Jo=C3=A3o Reis wrote:
> Other thing i forgot was that on Ultrascale+ the RAM finishes at 2GB
> (0x80000000), so i moved the memory region to 0x60000000, with a differen=
t size
> to not overlap any other memory region.
>=20
> /* RAM */ {
> .phys_start =3D 0x60000000,
> .virt_start =3D 0x60000000,
> .size =3D 0x1bef0000, //must be page size aligned
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
> JAILHOUSE_MEM_DMA,
> },
>=20
> But now it gives me the error on ramdisk_address:
>=20
> Traceback (most recent call last):
> =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 831=
, in <module>
> =C2=A0 =C2=A0 cell.load(args.initrd.read(), arch.ramdisk_address())
> =C2=A0 File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=
 line 44, in
> load
> =C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
> IOError: [Errno 22] Invalid argument
>=20

To make this a bit more systematic, I would recommend you to instrument the
code, dump this address e.g., and match against what you think you configur=
ed.

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
jailhouse-dev/5fe86ed7-e82f-3fef-6eef-a888e4ef6be7%40siemens.com.
