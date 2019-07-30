Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB4PQHVAKGQENWOKLQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333C7A9B7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 15:35:05 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id v17sf31189878ybq.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 06:35:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564493704; cv=pass;
        d=google.com; s=arc-20160816;
        b=KBSkULvHTuYMhweZ1AvT3cbHii6+Pc489FSFVULogsrerE8GVPkTM9mhHILrSM6m0W
         9PNd3LqZpiZN2nk0oV7R5NQ3jozs6wDR/lv1jVfbaXxwQr375ax9tQQu7fGcarZxC2jf
         CveYp1CIwbExapJtUF1QVHI4Ag4PdgaHlWP7F54zYlgk7p2KEMmnZ846lsXCmDDwepvP
         VpEl3b/OjyYPkFS4QBDP1ihlcp3EtghcLU99j5bPrY3EDN7BLGWfJa+9WMFhPYQYBmzY
         8j7dHNooUurU221CuWh/vYWKQ3JlYX96qePl+ApCaR271WOn/2quvofYSb5h4JIb/ZAu
         ebxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=asEmArc1jMp52usmauXpFkevlx81wQCqQnMASHZeaa4=;
        b=LHBgDzPUo0YhmFBSuyhWMPRGS91ezUDHTS/ir1InM0M6Z32IybxXVX7RwR8VvKkLYP
         X3HZOvNdbFRJx4n0NodUx2ebDUZ3Ha9/qlli3JaK+s3Z/HE+gRSWd7Vro3x/Ax9k9Uto
         aWO5kXSYh4VEVzChe4DjLLdZruHljXYyu44gneVXZDPNDE9fBxz2duAyxa4A5HN6NWks
         zvRRVSvHGnXliUBBOH5GIYoJLLvjHAbaDqaUCjBL/5SzTYJtGpDO5tSrHDl3PA0SKC2t
         s5xwK9e0y8zdrSEQ05BT+yicHTZt1dMvXeOCW71WQPVNWT/Ezb7Zu4dfCRLv1a+74/M+
         O0Uw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=asEmArc1jMp52usmauXpFkevlx81wQCqQnMASHZeaa4=;
        b=tQHZePesSOsS2dyMwyyGYS7WAHUA3P3Jq4gnTrRkW2vjbXojb/3uiRl0AggQC53pIr
         zXOTWKfq9GZEGK8D8wyYARCkpV++ifDrsQA7JTokjjv8v2QM7e7UMXkyuvPyRWLZXjDf
         3gDd0Eu7uo+CjC+aRovYFtmuO4BUZs15acgQ7yRTvWsb2parfzsEOlcx1rsHWqBBUFvf
         fFcRGXPgIetwq7dbKO1zUOUSzuDWvibf91/QMQS0MfzCyy+rJM+VLrP4WhrZikajDSpI
         RGxRl5P6ZY78wOZdyoLZUptlSp0EtC1Q4sbSzs4/Wn2ErzD6lfX7iw7DvbN0+8mHZehu
         Eo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=asEmArc1jMp52usmauXpFkevlx81wQCqQnMASHZeaa4=;
        b=UUB+gCZO5eg6jwWbjx01h1V8ssZK4Imqq9T1T+wLmMWI9GrJw+TlRIXRWASkt741lw
         hIIgx0Tnjv7klKgCqU8Fob8+98ASNsGsB91RtfJddfScXYR7Sh6Z/8FnhRl2lWKSfy7s
         mKybQRiMI7DMWblzcPu4my6DCsVifxFJ6ocr33K2iEgjkUzkEuhuu9TsY3ptJCR8a7pz
         AW+tMATznAPD4C0XRiimovAxvU5kdmSi7AdOVTlfTGtMU2Ac0EdFGAd+iiN9NiPXZ117
         JZ9CV3LAQCqluG1lAN3hA+BYEsa6f0uRvE1eVwmEEEvSP1uTQyhjAEMvbiE7Qd8HELeo
         A5kA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVIf3HghFJVC9WPFQHKwRXNB5A6EUAlni/FNs0QAm6v3xxnSSXA
	S52Dh52LBSAVLdIUkvXgaLc=
X-Google-Smtp-Source: APXvYqyWuB/E668Cd9hMT0kBVJkexd+Z1RhAy4iIVVnFUWhxy1cIxhEf8zAgpej+8s5oAoopUDSXQw==
X-Received: by 2002:a25:2355:: with SMTP id j82mr54896921ybj.125.1564493704179;
        Tue, 30 Jul 2019 06:35:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:700a:: with SMTP id l10ls10673956ybc.3.gmail; Tue, 30
 Jul 2019 06:35:03 -0700 (PDT)
X-Received: by 2002:a25:aac4:: with SMTP id t62mr74537746ybi.70.1564493703689;
        Tue, 30 Jul 2019 06:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564493703; cv=none;
        d=google.com; s=arc-20160816;
        b=0tk59GRil2RqUEm2F5dIVe6aAlAHalnP0xRU0MAwMUCM+jJHfEkdTZiG0qfoiRDMvQ
         Y3Sy/egYAVS2Jza/5MOYPYiGakS6vAW/oKkhAmebwKFyJYy1uYA0BHIYHFD1rkTROT4Z
         yE8IzuaYCemPmvVhHZCKtMry7KVsUyibCmVH0kLtWkFrpppVthIJsP6/tx2Uamd0g5ZG
         w7PS+ILvqAKbQmKedd8bUmAQbeNfLpTh3FmVavquBrHyYRHCDXPoFfcyPBpRxaa7N5rc
         vfwZmydjn2jeKpMlH8Fk9i3QCf546rAJhoIzE8qwJE06oF+Dmq51gY4DjYebCV3b0ehU
         DtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GAAHuMSsiN1k9tzJJKZBC3nYzvZThgfC4LMpWVFjXIA=;
        b=lTVuhZ5+iefJV7JMhIIyDRGYh/ubhvZgXf9I1uZBmU3k21wjFCamQTkJXVhW0WukWY
         4IkFNPfRl4nQAemE8sVE17ds3gUkT59rejEk1vmhkYTGJ5Mi9JBw9v1J/OXBOpytVtHQ
         eaaI5VYq7sjFTEKzTj1CLEVucK+Kx5MZKKvUN3TkiXRb4QlV9VqU/KXd8tlfc7KMlDai
         fxX0cF/OYxFWv28NEkQdZD0l9PLgAqEfbMfh4CYtc2DHFKEmx3ztWV/O0Cu+azGTob+Y
         Ewp+gf0bcj1JpmfH3kAv1a0Jd5T1oAtdxO7ti8/veu323UKtKxAYuEK7tAJ188D4m15j
         3Kfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b74si2692368yba.4.2019.07.30.06.35.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 06:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6UDZ1wX012491
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 15:35:01 +0200
Received: from [139.23.78.157] ([139.23.78.157])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6UDZ14D030068;
	Tue, 30 Jul 2019 15:35:01 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
Date: Tue, 30 Jul 2019 15:35:00 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 30.07.19 14:55, Jo=C3=A3o Reis wrote:
> The rest of the dump is:
>=20
> "Parking CPU 1 (Cell: "root")"

Exactly. So the problem is with the root cell, not the non-root one. Check =
what
I wrote regarding memory reservation.

Jan

>=20
> ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 13:30:47 UTC+1, Jan Kiszka =
escreveu:
>=20
>     On 30.07.19 12:32, Jo=C3=A3o Reis wrote:
>     > This problem is still related to non root cell, when i issue jailho=
use
>     cell linux.
>     >
>=20
>     Which CPU & cell is stopped according to the output?
>     Your dump is missing the line "Stopped CPU x (Cell: XXX)".
>=20
>     Jan
>=20
>     > ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan K=
iszka escreveu:
>     >
>     > =C2=A0 =C2=A0 On 30.07.19 04:18, Jo=C3=A3o Reis wrote:
>     > =C2=A0 =C2=A0 > Ok, that's it. But now, another error related to th=
at memory region
>     appears:
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > FATAL: instruction abort at 0x4fffe1d0
>     > =C2=A0 =C2=A0 > FATAL: forbidden access (exception class 0x20)
>     > =C2=A0 =C2=A0 > Cell state before exception:
>     > =C2=A0 =C2=A0 > =C2=A0pc: ffffff80080971d0=C2=A0 =C2=A0lr: ffffff80=
08768e14 spsr: 600001c5=C2=A0 =C2=A0 =C2=A0EL1
>     > =C2=A0 =C2=A0 > =C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000086
>     > =C2=A0 =C2=A0 > =C2=A0x0: ffffffc04d2b7a00=C2=A0 =C2=A0x1: ffffffc0=
4cff6000=C2=A0 =C2=A0x2: 0000000000000000
>     > =C2=A0 =C2=A0 > =C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 00000000=
00000015=C2=A0 =C2=A0x5: 00ffffffffffffff
>     > =C2=A0 =C2=A0 > =C2=A0x6: 0000000029382596=C2=A0 =C2=A0x7: 00000000=
00000f94=C2=A0 =C2=A0x8: ffffffc04ff79404
>     > =C2=A0 =C2=A0 > =C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04ff79=
3e4=C2=A0 x11: 0000000000001dd8
>     > =C2=A0 =C2=A0 > x12: 0000000000000000=C2=A0 x13: 00000000000094e5=
=C2=A0 x14: 071c71c71c71c71c
>     > =C2=A0 =C2=A0 > x15: ffffff8008e78000=C2=A0 x16: ffffff800819b1e8=
=C2=A0 x17: 0000007fa7da3718
>     > =C2=A0 =C2=A0 > x18: ffffffc04ff7a460=C2=A0 x19: ffffffc04cff6000=
=C2=A0 x20: ffffffc04cff6018
>     > =C2=A0 =C2=A0 > x21: ffffffc04d2b7a00=C2=A0 x22: 0000000000000000=
=C2=A0 x23: ffffffc04cff6000
>     > =C2=A0 =C2=A0 > x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff6000=
=C2=A0 x26: ffffff8008e82100
>     > =C2=A0 =C2=A0 > x27: 0000000000000400=C2=A0 x28: 0000000000df0018=
=C2=A0 x29: ffffff8008e73ea0
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > The error happens in an address within the memory r=
egion i want to
>     put the
>     > =C2=A0 =C2=A0 Linux
>     > =C2=A0 =C2=A0 > images (3fd00000-5fffffff : System RAM), and that i=
 declared on the
>     config
>     > =C2=A0 =C2=A0 file.
>     >
>     > =C2=A0 =C2=A0 Which cell raises this error (you cut off that inform=
ation)? If it is
>     the root
>     > =C2=A0 =C2=A0 cell, it may lack LOADABLE rights for the region. If =
it happens after
>     loading,
>     > =C2=A0 =C2=A0 you forgot to reserve that memory via "mem=3D" or dtb=
 reservations.
>     >
>     > =C2=A0 =C2=A0 Jan
>     >
>     > =C2=A0 =C2=A0 --
>     > =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     > =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
>     >
>     > --
>     > You received this message because you are subscribed to the Google =
Groups
>     > "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end an
>     email
>     > to jailho...@googlegroups.com <javascript:>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae=
32-97c445100824%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-a=
e32-97c445100824%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-a=
e32-97c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-a=
e32-97c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
>.
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-4=
15d85dc7c3b%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-=
415d85dc7c3b%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/94e3009c-aa34-e8f1-b503-d3a8b138d9a9%40siemens.com.
