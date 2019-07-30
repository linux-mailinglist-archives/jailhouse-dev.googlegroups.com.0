Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5XQQDVAKGQEPM5SF7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4097A880
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 14:30:47 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id r4sf31938966wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 05:30:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564489847; cv=pass;
        d=google.com; s=arc-20160816;
        b=QgkYjxGDHRITanHgJs3aQTSkahAwP1Ugnc7nJiQ2mZ1u9AwCMz7N2p6EX6tfqYc0oV
         Z/4Te58LrioxKB5C75/vcFEGNGf6MUnAs8fOeTpA9ATi/9gDj0yOaTCRH8UH1L4e6RUX
         SYu4yG+dlbUpm3DWtBJB2/6XmBAzCMtm9V1pTG6Ztz/nL/sJX8YnHhk1tPFd8FQFCI6p
         tX13uux3Np8jg451uMqx/kU/V5RRYwPu4GCGIPiN7TuNLxcNek9Ve+KNXA5Ob6HAGJzh
         WdBtLGyccxQybFeMVnHE25QfYSQcnoRpzApgxuvmaV4s9qJ2TU5tEU/s4mgHR80eBuqW
         VTVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=kyXEDIiFjSTp1q0lqvSF6sCdgVW2PsTLNtEEbiq9BlU=;
        b=qsgs3Xa+bW6SWi+TgMpQnLMuHyZUIsNCAFaOhi3RfCWZ6MwSN6SB1CqqjjXPKHDKge
         jd5u5nGFlbJwKhisvoV5MLF2hs0luWewxAPgAMeCeMnwxpcuDutt7D8TpPNFIHhW0Ixc
         ZQnTcLH93eTjvrKEz/u3Evhxg5Bd2ayBdREwib5/T7OaOv1M8SzUYQQiMOLpEYeWlQ8u
         x/0jUObp1Pv/tOJVRC+jPnIWkHbaPM7j6LD417tqpI1n8xP0q9xzZIfnfiaka2iorwog
         41N2NS3QLMq9fBlrMO0b213e9sJ19jr9W6He8rc3qdLH/Kz5X7+O4Tl3v++3wOS53rbm
         hZZw==
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
        bh=kyXEDIiFjSTp1q0lqvSF6sCdgVW2PsTLNtEEbiq9BlU=;
        b=Rzb4d5HXtHCv+nJq/akrndxtf29yu2AYl1d7ye+Png+ujPprYLbiMJRwzXw0kn6YCI
         5ZLrQ4tUTwvatFB/XxRnxJLUwb1X2DVSdqnx02h/OrBCUIXvXqvNE/Qse+UnQCCA04TX
         xiYvjvaOXpFt1IlqP7uXBBojHQlB8iOdVkBPGHpRehLJhbTmWG6YKyAKPgZ/Bus63G7x
         BYMFya+YKnTPG0ectreOBd97zXJIJyUn7Et9ia5m37P6N7p+i5zvpmNgIwokHNpfD0nG
         55OIRvsjZwBwfx1X/TgKm9DG1O5/RkVpJGfmSd3Hsims1ZLBVm0v58bsbQ0WTlEbTtkz
         C/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kyXEDIiFjSTp1q0lqvSF6sCdgVW2PsTLNtEEbiq9BlU=;
        b=TqXdMfL8vdMZGRKVK3piOyzPSfItUMCKDQf2w1UvwWqjp8+h1CC9u/o81WTVBMLpxQ
         sNuuzL1I4rh8cteWg+B2ZQu9gbwmnRZd8kx24j47ZSpym8LAHHjmzOy4f4li+pSMk3Af
         x9wtQ7i7dwTrX4UbcnW6bprS4hR8Fi/HITGhIAxVDps6cwEQRJNtd8wabE2CB+AidS86
         iTFqlYJJGUEP5b6wg5VwqE2qdGQ5E4bpEK+aYdmB8tARofBPPRPG15uJTc7wCuVEeibD
         x8yHvtTwjoNtxljJpA45c/gzXQRX/qwvGmRrCM3zYiHmyMr/lkCTOLH1ZzE1yLbxW57C
         bw9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVOfY/BEHMCCTA6XyfL9XwBcVY5pYTjJg6yIr6Sr3UlVHIPrKZn
	63FTBzAayp9g9LpEmnIAzd4=
X-Google-Smtp-Source: APXvYqxGVZofBJ/i3OLXzKQBnUdUYLJT/+y6/wdU7l1Hn2eJsf7Fg985xe8UELzn5GdmMqTs6T8DjQ==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr132570593wrn.75.1564489846967;
        Tue, 30 Jul 2019 05:30:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d11:: with SMTP id t17ls22590370wmt.0.gmail; Tue, 30
 Jul 2019 05:30:46 -0700 (PDT)
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr106699727wme.146.1564489846140;
        Tue, 30 Jul 2019 05:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564489846; cv=none;
        d=google.com; s=arc-20160816;
        b=DsP9NEFlO5FPlEEuD8U/m+FST2yzY6p5B8wkchn10aKoygx1MpDV4FidDEvxGmeX0p
         c06ChEXXTd+NM/l2YfEqfLI+JmlT0XXxdxbRAVmF4A2lYH7tFJE6fIruFXaBzc6PMaFP
         LdPhwfEgC2sgFDft7zcMWAdaHvy0a0aNcAfnnNegCJi3Aa1Dxzcvk95ksUIpBfqOJzqq
         +Tnmq3h15VOScu4a/egYHlXAyI1JZuTTOaNVbd4w4hf8DIOdwQyA/GbIaLF4bNMplxhZ
         K3pIRXkOf+tDynwQ2HbaEO3xy84/nUcx6Slj9u54RqZM+mIAzBG/LbMFJIeatHKYhq75
         6fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GWm99kEgKGC4IYuOLHGoSlhoG2/a2j9EipHOMESmqLY=;
        b=K3COaFTAdH7NkrQnCHRZ/RdBY0nK1B3Ee6VAh/qF9ZUYTF2PwpXikUpeW32O88d1ge
         V46DTvfY4brc1RH3u4QdD63qf+20LfoVgS5eILNyayXOd3qKGM2T88WIH7Osjq/H27co
         PEpmQKZYhf9NeCQWOuE0VingAh8Inp1iEcE9rHfJyzNledHN1AaftbxG81m6narVj8UU
         /Div0dAW33ivPDXtcAmdmbqHfhfwjX/gBJ3iTA7A9jQChWrOXQFgAMHKsptwyLCRALRn
         raGwrzxRxFzkIfkXRTxlTtq3eBiZJeIaPOR/Ay8U9pEmxlc+zZXNDSMeQ/hdaWUCXjZV
         eZWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p4si1900432wme.2.2019.07.30.05.30.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 05:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6UCUioE012857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 14:30:45 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6UCUimI016082;
	Tue, 30 Jul 2019 14:30:44 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
Date: Tue, 30 Jul 2019 14:30:44 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
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

On 30.07.19 12:32, Jo=C3=A3o Reis wrote:
> This problem is still related to non root cell, when i issue jailhouse ce=
ll linux.
>=20

Which CPU & cell is stopped according to the output?
Your dump is missing the line "Stopped CPU x (Cell: XXX)".

Jan

> ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan Kiszka =
escreveu:
>=20
>     On 30.07.19 04:18, Jo=C3=A3o Reis wrote:
>     > Ok, that's it. But now, another error related to that memory region=
 appears:
>     >
>     > FATAL: instruction abort at 0x4fffe1d0
>     > FATAL: forbidden access (exception class 0x20)
>     > Cell state before exception:
>     > =C2=A0pc: ffffff80080971d0=C2=A0 =C2=A0lr: ffffff8008768e14 spsr: 6=
00001c5=C2=A0 =C2=A0 =C2=A0EL1
>     > =C2=A0sp: ffffff8008e73ea0=C2=A0 esr: 20 1 0000086
>     > =C2=A0x0: ffffffc04d2b7a00=C2=A0 =C2=A0x1: ffffffc04cff6000=C2=A0 =
=C2=A0x2: 0000000000000000
>     > =C2=A0x3: ffffff8008768de0=C2=A0 =C2=A0x4: 0000000000000015=C2=A0 =
=C2=A0x5: 00ffffffffffffff
>     > =C2=A0x6: 0000000029382596=C2=A0 =C2=A0x7: 0000000000000f94=C2=A0 =
=C2=A0x8: ffffffc04ff79404
>     > =C2=A0x9: 00000000000007df=C2=A0 x10: ffffffc04ff793e4=C2=A0 x11: 0=
000000000001dd8
>     > x12: 0000000000000000=C2=A0 x13: 00000000000094e5=C2=A0 x14: 071c71=
c71c71c71c
>     > x15: ffffff8008e78000=C2=A0 x16: ffffff800819b1e8=C2=A0 x17: 000000=
7fa7da3718
>     > x18: ffffffc04ff7a460=C2=A0 x19: ffffffc04cff6000=C2=A0 x20: ffffff=
c04cff6018
>     > x21: ffffffc04d2b7a00=C2=A0 x22: 0000000000000000=C2=A0 x23: ffffff=
c04cff6000
>     > x24: 00000009ed76160a=C2=A0 x25: ffffffc04cff6000=C2=A0 x26: ffffff=
8008e82100
>     > x27: 0000000000000400=C2=A0 x28: 0000000000df0018=C2=A0 x29: ffffff=
8008e73ea0
>     >
>     > The error happens in an address within the memory region i want to =
put the
>     Linux
>     > images (3fd00000-5fffffff : System RAM), and that i declared on the=
 config
>     file.
>=20
>     Which cell raises this error (you cut off that information)? If it is=
 the root
>     cell, it may lack LOADABLE rights for the region. If it happens after=
 loading,
>     you forgot to reserve that memory via "mem=3D" or dtb reservations.
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
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-=
97c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2f6c0983-78e1-73e0-183c-3983dd757ee8%40siemens.com.
