Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBGOC7KBQMGQEXNN65VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06C365587
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 11:38:34 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id a14-20020a2e7f0e0000b02900b9011db00csf7224903ljd.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 02:38:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618911513; cv=pass;
        d=google.com; s=arc-20160816;
        b=lk9NCmTAcXKJb5pdcucDOhhVmSUdCHhCgrcEsIzoARtPxRNW7aEGgSM685XRyHhnNy
         WZOFdYr0wJ4bTK2eWCrEPRF7qsDMPVWDuwRzCXoV0jTAPFN06DEcLz7owLt2eyFazhFM
         YFuLq4lB2rRu7og0YciuUbOp1ufVIrRY+SZeom+xgKysWBHK2KVwPvkTkOCn9bXGzSWz
         TwnrkgFaqWP6TOr9tStJNau2HkVmWI2trEcZv3o3kkZrtg2U2bdbcT5jTgAPYzFxg223
         b81dS1aI+n3VQ0DimYpQFp5KQQFxPmmMpLYRXM3pvv8ZhEzsSd5rA2duBFZ1+mZbzeST
         xavQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=c8ur2F3VHp204sKwca62psnRtOnkrph71bQXmOHleDA=;
        b=IdClUHuypcGTrxyGcOcQNNe1+pR46cTNoISLLKkr5PNLaU4ZlvACxrBIDUqDpSrjyI
         DdPTcfm5fXZLpTZlYnthKv4mXxZbcuSRmkfEVtZP9gPKYM75LvV3lo3K4NZ8eEhpe9O7
         tMh0SuUfn0BpdKd5oi6RJjJZzBw785JFszPOIsnm2nNQQPoWmy9RH73H9zoIvRbB1zMs
         pA7ggyh0Z1gj5Nyv0PguemT1Gvm6lz2YelMeYjaVKj5veucIsZJd5/9tGmyptIseAyP4
         LHHaRviQUm4UJRYsec2wKu/4fWqoCYjWSIiAzO/j649l/tZRUy9YojDRl0g4oBs/d7+Z
         vqPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Fdyq3MCG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c8ur2F3VHp204sKwca62psnRtOnkrph71bQXmOHleDA=;
        b=RDKWPVfw5fGK+fcXrcW4BGRi6AcYRKwm5ez1XJItNfb0XPXONHZAWHTpYMdHKnBHTL
         l35Me/uaHFambrLhv0Qh6Auf7KU2UHzyoGD8uBT1sDk+TyfjWo7K7OScz3OMuQU8Gg+A
         VHK08c+KG/Wht/6gDvKOB1rOV8ck/+GyIN0RjB95Jshl8XkSJPl7WD4eHjQpTHFNflfr
         Vr2TX/Lrn8Rdcc1NE/xFs0veylC2++hrBmnmXp0n01KBAAbUHEXnbbrJeXVrsQv48u7H
         sq5WCfPsr27EW3jy+7qdJ0izd6AlfJ2kIAMP6C4r3xaXy2jLOfTJ0iTykV49Kpz17T5H
         i78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c8ur2F3VHp204sKwca62psnRtOnkrph71bQXmOHleDA=;
        b=Qb0yalntCXDE72/eOutirZLSKnZVy8YgmjeRL+Z4kyDzYdboSCBR4HSsMKH8/JVJB6
         EX48rTF8YOTGVHuZktu+NCSnvw6H9PdzAcyUmNSVLtlM3FC47LngAq3xMgJO4+60mn0Z
         i7i81TRtzYEStDgw+EP7P+CpGuJQ6zLTZC/LxJKMi2bS3Uw8LNKy56GhMFVX7JXSwbub
         QSvo4qNVpSf+YicjteWT9hAm/Ng5K1qCsnhfLy0w6C3PfY0EIE59UrNx3Vl0HA6Njv6W
         ydzO4pKhtB+hgf+5Cjwhj1wszDFhhfnIDJ7zcZoSjwZqSnmK5IW1om1yHNpGB8hsCmcP
         FSNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314fNWTkO0V1Vc8GuKkRUadDyN7h9cM2yh3zY8b4dXecJ3wFjtQ
	gwWzLZu6miT0c8Y8pwJn18Y=
X-Google-Smtp-Source: ABdhPJx7kOfvPgAYZOwXgrsWmlVdXwkIpp9Cp5rvibrBJDLk5LrlUc5TE9C4NZv80Y2eNYn/lkWp0w==
X-Received: by 2002:a05:6512:104a:: with SMTP id c10mr947235lfb.459.1618911513699;
        Tue, 20 Apr 2021 02:38:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f815:: with SMTP id a21ls2278934lff.1.gmail; Tue, 20 Apr
 2021 02:38:32 -0700 (PDT)
X-Received: by 2002:a05:6512:3b0:: with SMTP id v16mr5764582lfp.132.1618911512518;
        Tue, 20 Apr 2021 02:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618911512; cv=none;
        d=google.com; s=arc-20160816;
        b=is5vfqrqfRO08Oph2DpttNp+IV8YkgIwfMAGdOcH4ywp8Nx1lKgDe8np9wkzH93cBh
         ek/CwNJditzBGu5Hj/2TfK9n9c0wawd6K0rDxb21KpOcpHC5NdICeT4YOnIDtoagj7aK
         x3kT15U1mHGiNdVn3UJ7Ws2R4Polh1ianC1Rs+6mlwdofL8LIoiwxbYtB0k3BpZOnNle
         yGsYbY1k620cPwH/uu170v9FLYjNh97G8ayVh+YO6wodWzyFelizAoMRJ2C2T3Ntgh4Q
         z5Mm6DvGM/hp5D0Rb/YN0lzs4KP3Uj/kfaZ3amb3GPEMqi3ME6zkMZfI+9UhRpq/Cgxs
         AxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Kp+BCsnibxKt83Q+SKSw/jfjUOCz9N5vhzE+h+Y6iRU=;
        b=OD3VR2mF+Qn3n+Kv0gwBOzbr9XeG5ajsffxC1QZ5expXlOq/xZ4DyovR0iGUL5Gv2L
         0ywTFTX3JWQEhhGZtLEzvjMnESCO493pJHWaa7ePIWuhHMeHug0BFkr386ZgEiBPYBFY
         oIhwqX28MCF1isG0ypSMgrvioUSObEjiiK60zvASj/fDSX2Bl+JZVWRQBzHDVRTf05f2
         NnL5yqWJyoftqElj9Fv5kkx8X9tUS9auFh7b1BK3pbWZ3qJaAs1egGiRIeDT7cOH7yvH
         OUbNfToKSOziEf/u+AmXs5LIOp1vB614KRguvl5y4P8egJrzLqegyZMpmnGmZbGalJwb
         aPKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Fdyq3MCG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id j7si1179849ljc.6.2021.04.20.02.38.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 02:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FPdsg67XGzxpP;
	Tue, 20 Apr 2021 11:38:31 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Apr
 2021 11:38:31 +0200
Subject: Re: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>, Jan Kiszka
	<jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
Date: Tue, 20 Apr 2021 11:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Fdyq3MCG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 20/04/2021 11:29, Moustafa Noufale wrote:
> Hi Mr. Kiszka,=20
> I have tried to  build an image through running "build-images.sh" with an=
d without root access:
>=20
> without root access:
>=20
> Select images to build (space-separated index list): 1
> docker: Got permission denied while trying to connect to the Docker daemo=
n socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.=
sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: perm=
ission denied.

your local user needs to be in the docker group.

> See 'docker run --help'.
>=20
> With root access:
>=20
> Select images to build (space-separated index list): 1
> Error: Running as root - may break certain recipes.
> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to ove=
rride.

Simply read the error message and follow the instructions: If you want
to run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your
environment. For good reasons: You shouldn't do that as root.

Anyway, solve the issue by adding your user to the docker group.

  Ralf

>=20
> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizatio=
n.=20
> I would really appreciate it, if you could me a hint.=20
> Thanks in advance,=20
> Moustafa Noufale
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>=20
> Gesendet: Samstag, 17. April 2021 11:45
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; jailhouse-dev@goo=
glegroups.com
> Betreff: Re: Inquiry
>=20
> Hi Moustafa,
>=20
> On 16.04.21 10:29, Moustafa Noufale wrote:
>>
>> To whom it may concern,
>> I am a Master student in Rostock University and I am studying=20
>> Jailhouse this semester as a Master project and I would like to gather=
=20
>> information about this Hypervisor, as well as I would like to ask,=20
>> whether it is possible to install it on an Ubuntu Virtual Machine? I=20
>> just need an outline, how I can learn it. I spent today reading the=20
>> code on GitHub, but I need more information and appreciate it if you can=
 help me.
>>
>=20
> A good starting point for experiments can be the images generated by [1],=
 both for KVM VMs, pure QEMU emulation target or also real boards.
> Note that emulating target inside a VM will work but using KVM (for x86) =
may not or is at least fairly slow. I would recommend a native Linux host.
>=20
> Then you will find a lot of presentations on Jailhouse on the internet as=
 well as an (aging) tutorial on how to bring it up on new hardware.
>=20
> Jan
>=20
> [1] https://github.com/siemens/jailhouse-images
> [2]
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> [2] https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf%40oth-regensburg.de.
