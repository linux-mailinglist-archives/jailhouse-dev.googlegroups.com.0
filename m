Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ5A3DTQKGQEQDJPHQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF833F01
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 08:31:31 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id i2sf9598698wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 23:31:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559629891; cv=pass;
        d=google.com; s=arc-20160816;
        b=qzYvh1VEsqveWimgjlENHSLixnU1dm1TrUA9TED+xJ/Op59nZGITlPgcvb8sp8CwZ5
         RzkGGeuQlpacHzETECqa5sq8If/16mvo43CTfhqH20FlpK5xJ6uZvbe2u+kXY+hZJPkZ
         8EJBENGdVf7Wz7S5+Udvc5/7KpMnXgoPMqF96mEMWQVg2xib8gH2+v+9e8kA18E0Q7Ge
         lXK3UYKKArPWUEmyYPFInkYY4jkVndskOCOPvTiUxytAqFUddFs9aEm2F+8nm81LL08t
         xJtVwIgkdUU6EqlcBb3envxoAyHVlx5hWd2+gWG+S078wxWIon1RgqdjmyyvhmnygXqN
         n2Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=HGAsSnn5qrEjQA7RqoW0A6rjLo51oZdvIvUW7BT5J+I=;
        b=ptMaNIusS3zNWTkjAqMPZrQ2B0/gJ6HtKJxS3NjjaIY4BPUAoJ1RdDgjJ+rtpr++O7
         FCbAJFnv/V4VGfQiyZlCf4Ow5K+kVNzpDHNsJZqd80uavWW8noA1PL/8B7ppfnfhVe2q
         OoTiHCHZCW1xxNl6HQfBnK7jxvSgXoorswGTsZ2ExmBllOG3/LD5DrpOZbEIczxFQfw0
         FoAzHM9ljjiPmuK+RlPQcp23UV+bquQAHFRQF2ObMiBsLdUKgC0J0iPUs4rFZ9Q8KAu3
         B+ZB8G9RHfS5Ojw1U1Y4O1Jpb/TYnVY43wvfhb4G03PzTg3e6EiykYguShMxliEZCMEV
         k8hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGAsSnn5qrEjQA7RqoW0A6rjLo51oZdvIvUW7BT5J+I=;
        b=NA74/BWcgbO33mqIrH6EXH8h5dd1qpI/tQ5zPX53+glzG3y2NoAMjNO+SQ2pyu5K9M
         35JPeBiNfuXctZS4EPN2K5pBTNbxBdUN5zwaVUFazviKG6j2v0OuoGV/HNRvf3CzyF2u
         qHM/87yxWJY5p3lYdi9hF/yUBbK1xBbcNjm+kqY78WC3b502OAS3xXggWw5zviMSJqHy
         sTiYICtc4i8GkAvsVu/jp12GkyYWpGZS4jDd8WWpS1syAu1ZhyTRVZjxQOBfy6Jwpmz7
         TxDxPJ/Qlfqooxh5Ed6aNPsKlIvaiORU7AljKgi1N+RJ4S2Ib3VQxQD0lh0tB9dfbSry
         gH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGAsSnn5qrEjQA7RqoW0A6rjLo51oZdvIvUW7BT5J+I=;
        b=tO9m9+VyHVQKXaMZaxirVrhjJxB+PIo2peuOQ+izIhGyrwuZHsAe6BGtDXbh4t7Ih8
         Me/IcsMhiAtYCByadaVnOtgKuy7frCh7j8FfsT8pdi8yO5DRpxysnBG/px9UkwfW0NYZ
         rSgM5oWYt5QxznKS8DpRCWeiQBLUVpOu8hg8R2XT6J55DuYYssrF2xIwDkzdTb/4jEPQ
         phLMQn8WUr7rc0GI6hadFVG/ihsUhmd6w+DZfRVx2HlgevpcDgAA7QLtx7E+eMkfHF3h
         K4IvELg1NwIehq6xKWkn9xvBFKLddgHgA5ja42cGHiSitSFNDNQXdR4gkL/xdfO2Lmgh
         NJiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7gA/AaKzca/T967t9Ru8tPrzkHcqJYUz1T33coqC4Jn1KDBs2
	JQoTOqkN7ZKMdkdnOK0EGkE=
X-Google-Smtp-Source: APXvYqxKooaSzhKgdgt7GM6meIOnpgxKscEpOfhtjsLaygWBRnsKDpvFrz5xljKx75hV4f76rY8KZw==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr1169395wrn.160.1559629891475;
        Mon, 03 Jun 2019 23:31:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:99d5:: with SMTP id b204ls531495wme.5.gmail; Mon, 03 Jun
 2019 23:31:30 -0700 (PDT)
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr9930464wmg.164.1559629890774;
        Mon, 03 Jun 2019 23:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559629890; cv=none;
        d=google.com; s=arc-20160816;
        b=PmmLywf8VBQDYmiZDGaCZkonYUGBTBYZVySs+XiTByXrsuEIhRoJtva1OYHq/Q7qUr
         wmKv/Po5M1m49Zolle2Zt13Efh3nG18TRMLmd6iFIvXrob3xw/S5s5ljVBt7VitN0hVf
         dXX/MRPqUH8nhcVJwRbzCNtYnpFqJ5KNW56tfi8a3NW7cMRevTrbv6zQTvVhMtph0aFl
         Pve6M633XjknGwPmmS6O1ZghJLagpFVJQdfMLbBfNnklgm1a137L9PbVevjkEYKZTYNd
         VNJcIsGhzO9VYxU5wlXy5xIDV3MhhTM3iO1hek5cNMxSQGnQ7p9MbGqJNripNyrJiQ8U
         tcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DloMu7QNI+k/AHL+YSW+gBHYXmSHwt5p52/vTf/sPtw=;
        b=aLY2wshriKJhPjKDp/bsdWp7JVQ1RNJf0nJAq6p+aFOb1UKFZCJDVg1IthQvpOGHgv
         YSHu6QIr6quJEcNkmIPjgm7mM2WedBbEa7+t3vdYeAIrKTi4vObK6M/FSbMpj6oP/phu
         4jEKsCHrIvJMKcUHl5K2pvBiv5EZ5YPHHQk9imTDp4QRsiRaZmn7i70noP8giCRfABzE
         YxMbgAHkNqnlVOqhx9XdQGrpM8n/5AnQxXFahn/NyJ00bpWbRYdcnmarZmUImtNOTkn6
         7dzmXm5F5vxRySSATnae83m+7Q2Wf2KLPazcWWxyaZ9GkTcpymfJbyqFsGyEwBJB6ahk
         46TA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j1si100137wme.3.2019.06.03.23.31.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 23:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x546VUkI004903
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 08:31:30 +0200
Received: from [167.87.7.197] ([167.87.7.197])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x546VTnv004501;
	Tue, 4 Jun 2019 08:31:30 +0200
Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
To: "Xiong, Lei (CT RDA FOA ART-CN1)" <lei.xiong@siemens.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
 <9b0508b3-d040-4093-2b69-e3db932b0b51@siemens.com>
 <9ddd1411-e67a-f87e-58ff-280fbec53fe6@siemens.com>
 <C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6@CNPEK01937.cn001.siemens.net>
 <eaac6e64-72d4-d130-0a2c-cdde85d04194@siemens.com>
 <C6C9DF0CAE5FD841919323C24BDCCA91D3A335027F@CNPEK01937.cn001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <35395bce-89e9-634d-f3dd-70ca35c7a304@siemens.com>
Date: Tue, 4 Jun 2019 08:31:29 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <C6C9DF0CAE5FD841919323C24BDCCA91D3A335027F@CNPEK01937.cn001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 04.06.19 08:15, Xiong, Lei (CT RDA FOA ART-CN1) wrote:
> Dear Jan
> Thanks for your guidance
> I have another question, in the " Setup on Banana Pi ARM board", it menti=
oned that " The kernel requires a small patch in order to build the Jailhou=
se driver module", the file of " arch/arm/kernel/armksyms.c "  need to modi=
fied.
>=20
> My understanding for this is as following:
> 1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git
> 2 cd ~/linux-stable
> 3 git checkout v4.3.3
> 4 Modify the " arch/arm/kernel/armksyms.c "  manually by VIM.
> 5 for i in ../bananian/kernel/4.3.3/patches/*; do patch -p1 < $i; done
> 6 .......
>=20
> Is my understanding right?

That description is unfortunately rather old. Meanwhile, we have maintained=
=20
LTS-based kernel tree with all needed patches included, see=20
https://github.com/siemens/linux/commits/jailhouse-enabling/4.19[-rt]. A ne=
wer=20
kernel on such an old board also means that it will "just work" because boa=
rd=20
support is properly integrated into upstream by now.

Jan

>=20
> -----Original Message-----
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: Tuesday, June 4, 2019 2:03 PM
> To: Xiong, Lei (CT RDA FOA ART-CN1)
> Cc: jailhouse-dev@googlegroups.com
> Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
>=20
> On 04.06.19 07:47, Xiong, Lei (CT RDA FOA ART-CN1) wrote:
>> Dear Jan
>>
>> In fact, my hardware platform is banana PI M1+, I do not find "Banana Pi=
 M1+" in the " images.list ".
>> Is there a jailhouse-images supported for "Banana Pi M1+"?
>>
>=20
> Not explicitly. We support the classic Orange Pi Zero, but that is also A=
20-based. Maybe you can use that image on the M1+ as well, only tuning some=
 boot parameters and using different Jailhouse configs (all available ones =
are being installed) in the end. I don't have such board in reach to cross-=
check, unfortunately.
>=20
> In general, ARMv7-based setups with Jailhouse need to be considered more =
as demonstrations than as production platforms. Those SOCs typically lack S=
MMUs that you need for full isolation, and most activities on ARM-side now =
go into v8 designs.
>=20
> Jan
>=20
>>
>> Thanks you very much~
>>
>> -----Original Message-----
>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>> Sent: Tuesday, June 4, 2019 1:14 PM
>> To: Xiong, Lei (CT RDA FOA ART-CN1)
>> Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
>>
>> On 04.06.19 07:10, Jan Kiszka wrote:
>>> Hi Lei Xiong,
>>>
>>> On 04.06.19 02:46, Xiong, Lei wrote:
>>>> Dear colleagues,
>>>>
>>>> In the =E2=80=9CSetup on Banana Pi ARM board=E2=80=9D part, it mention=
ed that
>>>> =E2=80=9C*since v2015.10, you need to disable CONFIG_VIDEO in the U-Bo=
ot
>>>> config*, or U-Boot will configure the framebuffer at the end of the
>>>> physical RAM where Jailhouse is located.=E2=80=9D
>>>>
>>>> My question is that how to disable CONFIG_VIDEO in the U-Boot
>>>> config?**
>>>>
>>>
>>> Via "make menuconfig" during the manual u-boot build - which the
>>> description is not covering in details. If you do not want to fiddle
>>> with that, I can warmly recommend jailhouse-images [1] and a board that=
 is supported by it out of the box.
>>>
>>> Jan
>>>
>>> [1] https://github.com/siemens/jailhouse-images
>>>
>>
>> ...and we can also discuss directly if you have further questions.
>>
>> That said, generic discussions via the mailing list are always very
>> much appreciated as they strengthen the community. Thanks for taking tha=
t route!
>>
>> Jan
>>
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence =
Center Embedded Linux
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/35395bce-89e9-634d-f3dd-70ca35c7a304%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
