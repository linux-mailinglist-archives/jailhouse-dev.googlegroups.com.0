Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBHS5SGAMGQEQOTIIAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B73458956
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Nov 2021 07:30:29 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id g38-20020a0565123ba600b004036147023bsf11388995lfv.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Nov 2021 22:30:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637562629; cv=pass;
        d=google.com; s=arc-20160816;
        b=cp33dxpDu+QIFBR9uaLCFoq0iolYwlfFLn/m090LWnegzjFv8prc6fL1DkY+cATap/
         N3Cqwld5ONifRT+NILc9cWDfw+LAxq8Ae1CA6cBRNN+4t1/0D8qkdR4NVbOAPS9jamwG
         xTnn97/FokRIimwbN7ffGPfc+daoPUT6nSWND8XzjpWSdexFByKvGRNMIG8EnuTTWtvC
         vdOKt5cVlaeuN+T1xGfPcimd2jmd195/iIItcMwonCBQDB0NEi08PRVWLg2iKhW+MSDp
         lfeFEOcN6WdIQNu+un3Co+ZH7cCsOG5UuIG9ObGFk65KWpKoR5YcYpUxXhH4ozmvQI3F
         EaTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=M4ySQRAbkZr2KgBKP/hZjpcTysqdrNnIT/ttHLEVBCI=;
        b=cGB++46QCmqhIRB4jvbYklFNtNxg0bF0Im8ZWWRt0i51aaJYwg+9o4mKNIKwSpv4pZ
         qAbbLSM8f0f0dBFiWLV2UeA7pJpzqZVomXErXXRzc5JOsbhaeBu/SpRv6H86fUGXQVCq
         1BDqZZXO8wVIH58fYEFYeowYTgfKtyF8JybzXqLCCKVTLOGupvCAzdNw8xVHvHruiVKi
         xWFeWi3QiW38WN8WhAnNfwmc03DY/Ea40ZC3MxnliRbIaGlzf7cR8gpcmMjTQZ/bwf0b
         kFDjZOUPswUFmeyc5mE8OdEiJoN5M252i7bS5UUrdr8p3ktO91k4+UmGyNu9kJSTOrQs
         diOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M4ySQRAbkZr2KgBKP/hZjpcTysqdrNnIT/ttHLEVBCI=;
        b=abxvK3JskJQWsKPwhNbxIusMwdpE3B5oB9Ng5zSEd62odR7X6kE1sBfY2bGkETE5he
         qjHRSvU2L8VpzoZIf0HSc6o8UkNiad1+sf3dcOj8dfHBTFnabe4DasoEYJ6VUdOeAyMC
         v4sTHapdgGDQYLvxO75siSWCv8nQS7ZpEr+/SgUAoQzcvUIG/CrXaiBuMzD4b5BWgk1L
         xE1XDkS5GbdAGNKe4Ihk5bvfFzqitwRLCKkbjf4CRFSiFEqYhQdkuUR4qtXuyLUptfoF
         u9rYNlV+IMj+8blHoLk6iUsEtvo6qKBQV1fSQa1vhC9xnXA+hCT2Qqv7o7IJVot5jzek
         hkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M4ySQRAbkZr2KgBKP/hZjpcTysqdrNnIT/ttHLEVBCI=;
        b=LBSu7aH7ARMRaCEH6S2qEUk+8EB/2BWkjrha77+zG99TEBGn/DNhPqhd8Ssyyrb/RK
         mXiFocZ7vsvyn+N5Y45x9kL8mgsCDF19Q1MxiCiSPHMj2mjborcxTMo9dbJOU4KYh8E7
         oWfTXFpYZzvJz2ZR2ZyqJrEAkzNSlAQhBwvU7Rg0cQiBgKhhDCWY/OlR8S6qlVKKULKh
         zQYj50NAvRrRDMAqJFA2z2yKeV0qWc2jzy04M7Ji7i7am+nPsTHcho2nhwXb0bW/SGT3
         anzziB2M81N6Zq27DKBUGGlbjl5cBTdFOYnJQ99ySMCeKhL9SsacC6Cqc5Y7DKYrpxr0
         3Dnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53185WaUe7weLZOSk2OTWXZQxgXM7kTetPrF9pK0AUNot8Q2Ns3/
	K4Nz1LlTO5pAQDuatQy0gTg=
X-Google-Smtp-Source: ABdhPJwvFvNkgSkesfwY5EQlf1uZWQ6MyPU21QamqvBpLx9PqYAC5CSOsJCoRYWbzYuE/oOTWd3uLA==
X-Received: by 2002:a05:6512:3403:: with SMTP id i3mr56990233lfr.413.1637562629098;
        Sun, 21 Nov 2021 22:30:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a4c2:: with SMTP id p2ls753724ljm.4.gmail; Sun, 21 Nov
 2021 22:30:27 -0800 (PST)
X-Received: by 2002:a2e:8099:: with SMTP id i25mr51805631ljg.528.1637562627872;
        Sun, 21 Nov 2021 22:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637562627; cv=none;
        d=google.com; s=arc-20160816;
        b=aUCXXY69fLjSE/ej5bDMgLD8KKwX+wGwyj18KRMBE4nQRJtnm5SiIBNAxHCTc7Jr5t
         bfvKYskmxoMv/tHLeGTkJ4yvDw+3X45jxVxVS4IvKbRnOPWREU+RpDB8gL8Pc1zguNwi
         TUKk4CrTO8goCekbvgm6646LYzI3T+M8WWy3miO/BjP6Wz73IIahLgfH3h94m0jk7SKA
         wQnJFEdDr5cHMP6Eoq96PZ1bZLluqYqKRFscv01o+6bfmeRSkhZ+SvwRmAZFgz6dgU1R
         1VV8vhNl1BgfL0j4iDkYUxPhiys/M0SNiMzn4KBZdQdwQjzhywBNIBNEH2rcN78QK5CC
         +mWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=yNDxdxblveIFrSX8aD1wXzF1w9TaTn5NsDrYE8yDGg0=;
        b=t1MxZQgzN6JJkAJCADWML5PZZelW03f8/xrSsV6ZVEJxGO4uKobd2aCLk3lODg7LoM
         XlI6iiFlxEFTrWHEtX1vwN3Nw6J8nUwHpb3bwH4bqwSVI2Xtj7Sf/vQFTCd98jvaxlyo
         KSTioPr4687Le521z0PVYe7jwhQ76NvuChTtCxeH1kYyk5IIZRqKyN7NK5jQxYyZYZrQ
         NSyQGRyy90eV8azz+RSrHIBaKDo0+ilSMybMsYWfXzpgUAd/ksrPprTY6Oa21aiK3w0b
         twj4GfhmOzNxmnWTAydRzoP8j901FtltXPDKpZEh2hahVHMYwpfOHWJcwzPBhTKAX3yp
         0eHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z1si523770lfu.5.2021.11.21.22.30.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Nov 2021 22:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AM6UQJw011319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Nov 2021 07:30:26 +0100
Received: from [167.87.32.217] ([167.87.32.217])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AM6UPCo007217;
	Mon, 22 Nov 2021 07:30:25 +0100
Subject: Re: [jh-images][PATCH 4/4] Add kas menu support
To: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1637430993.git.jan.kiszka@web.de>
 <0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka@web.de>
 <bb08169b-1e0b-44d4-8c45-69c0f349e15dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5e925a14-d8aa-f150-d8af-4bfa59eb1c7a@siemens.com>
Date: Mon, 22 Nov 2021 07:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bb08169b-1e0b-44d4-8c45-69c0f349e15dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 22.11.21 00:56, luigi.d...@gmail.com wrote:
> Dear Jan,
>=20
> I've tried to build RaspPI4 with next branch.
>=20
> This is the log error for
> ./build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs=
/debootstrap/debootstrap.log:
>=20
> Resolving deb.debian.org (deb.debian.org)... 146.75.62.132,
> 2a04:4e42:7f::644
> Connecting to deb.debian.org (deb.debian.org)|146.75.62.132|:80...
> connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 87944 (86K) [application/x-debian-package]
> Saving to:
> =E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r=
0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=
=E2=80=99
>=20
> =C2=A0 =C2=A0 =C2=A00K .......... .......... .......... .......... ......=
.... 58% 7.94M 0s
> =C2=A0 =C2=A0 50K .......... .......... .......... .....=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100%
> 2.54M=3D0.02s
>=20
> 2021-11-21 23:51:22 (4.21 MB/s) -
> =E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r=
0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=
=E2=80=99
> saved [87944/87944]
>=20
> *chroot: failed to run command =E2=80=98/bin/true=E2=80=99: No such file =
or directory*
>=20

Looks like as if the build started as non-Isar build. Could you provide
the full log of the console? You can reproduce this by simply calling
"./kas-container -d build" which will rebuild the previously selection
menu options, now with debug output.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5e925a14-d8aa-f150-d8af-4bfa59eb1c7a%40siemens.com.
