Return-Path: <jailhouse-dev+bncBAABBEEZ3DTQKGQENQW3FQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE833EDF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 08:15:46 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id o145sf16125479ybc.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 23:15:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559628945; cv=pass;
        d=google.com; s=arc-20160816;
        b=cXOBtVfHJVwv4D3FLJ8AYwY0ZARibr0dwmIjqpaKsN8gVFt8mKlKPCR09EU2VNfBKk
         vNy8mS66PvDL4w5limFXWnH9DfCo789PUTtbzc0KQxzrv7QQf1+b7SCQ7kO+PtMiZvoK
         bryqpufFuPkQ1gam5BxwVjbjZJN7uqyIQnGaRL5hvP/Jl5eW6sdru/TsoMTGy6x7uL1p
         l/1bkKuHhsZUjsC/0ac/HvxR/gFelhoh4LK0pRz+01aU1xwVXYh/BUKOR0v2/mFKSeWY
         wgGnRnWR10ARGc7az7chH0Wh+63VsfQI5T4X3e3BRBwx0YdsAi6UoiHGO1c87veuy9ow
         qH+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:acceptlanguage:content-language
         :accept-language:in-reply-to:references:message-id:thread-index
         :thread-topic:subject:date:cc:to:from:sender:dkim-signature;
        bh=2w04aIjCFIBXFawAC1nXIa8KFyR+w7ERtf4cuhcwMs4=;
        b=NFm9xw+alBuXjaxi+g7goUnt/cuXA/BhJaI+vc4bDrH4xjZvtTqco2vkp7IgWQ9hVn
         ho4NynUcFs8vDRszBVsHu9n1YJZ2pde7HJhLCIzACt0hIZfjH2Qz9frNoyaMSCoGiVHF
         ubWTKvJ7SAnRQqWedUrBMFxoqdMiV5Hl9X/XBynviCWWeySl+4LyNFGQQb+sTMA0aRgX
         ZbP113xlCCdeNCc25WyOjILdqvHdZLFoWME/MRlrTzN6fROkObs+kQaoDpOG4qQ5dQL8
         eZ/30/cFg+/wIk68GPcNeW9dp3YGGHEiY7N6zBfd77Nj8grN0Xk6V8s/7RzQ+Si2QYmc
         sMTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2w04aIjCFIBXFawAC1nXIa8KFyR+w7ERtf4cuhcwMs4=;
        b=TNRd14C9YXGEkdZpV08D0BysoVXZ2zWPUzQsfyS2GcbObr/0pJpuYFS33cvkfx9k0/
         /fq3iQJg3t9qah88D5h52EDjrVkkRxr5ih49WIrwl4lFpDIp08M3fzIfslmY0dFliFUd
         SJso2/kVd7avELcUC21z4MtyciOAXJl9emg8aIpdL8IOfjThSfwaO6JxBHV+jXwTiVI1
         F0mKADgcRfJ8e0iB5HadE83XTyeuhqIhRkuSVlANwuWrMAoBN24WJwBW/fLmgz5vDmLJ
         a3lI4acc7fLz6O129K7976mDhmWk1i7FxPmbt2ve/m3QJjQmx9BAHoXt55yfR7g4IUff
         Vqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2w04aIjCFIBXFawAC1nXIa8KFyR+w7ERtf4cuhcwMs4=;
        b=f399eh0OSgrCQXwiwJ07cxvCl8sKNoFZW1RE+wLZdgxks0lNcFQf2NeZJwyIb71G2g
         KHOF+tL9cFl+/jWPyBnA0E6hldmwYJm/jWRahLj6lvjsrLxN9lsI2TvDNcdXiuOt0IV/
         tzkeZkfRwGS8doxgWKPOIa7VgEW5+pwHbaBEl1xo952wbq54KSTS6noEIan19xljcHe2
         rrlBJbDlpjYzmQbQeIPZwzFg/gEyy0NX4vJFgTXVEMwDYxq0gSmSRPjqiPXnfuf3KQf4
         HgHhH5VKJxXBXaUlUSOqjtVxntNSZENcU0rlxzo2k6UlWTmIctU7RawBF3xj0VIL5x1n
         TeNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUwBxpkV4TpIH/6OY7LHQC/Mp2vw5crs4UrXAAoHGvmZH5B3GHa
	N4WgFJmgjHufmLyuPjQYRkg=
X-Google-Smtp-Source: APXvYqx6qgLH6F47JGXlE3GvA9aAe+21+INjaGTv4erGDfAn862I7O9/Me1gpgG5TAq3Lui8GWO0hw==
X-Received: by 2002:a81:3596:: with SMTP id c144mr7820099ywa.192.1559628944751;
        Mon, 03 Jun 2019 23:15:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2f4b:: with SMTP id v72ls2014490ybv.11.gmail; Mon, 03
 Jun 2019 23:15:43 -0700 (PDT)
X-Received: by 2002:a25:48c6:: with SMTP id v189mr14107433yba.243.1559628943719;
        Mon, 03 Jun 2019 23:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559628943; cv=none;
        d=google.com; s=arc-20160816;
        b=YxqzS8/hJvfu6jQiGtwGmbrbHZ9JfA7lnj1wQnR4Nn2p6KuwJrTNh69o7mTqb3vmYQ
         kD/jYzr9lxBbg83SbAbPqKSXS04Ds6m+JSBkw8pC4D3VgwnLuZW/E0zFFkdHFahX5y0H
         RHgmvmPDDlwB0Knu6VeIUg1GSCdpiNPozx4jdKUTsshTp+syHJF11HtYbKNK9Yrinus7
         8VBaPP9JKgp+35aIzCkScQ2y11CxujA/Hcap/dCwtF6VgdVbB1f61rdLaDrIT09HYQ6S
         1uH0Jm9iPM7YMwWLlEqDmPw6zzb89PrMwg5YdVcCqGRQK5hFfphjWg+NlostSD4JFuJL
         5Ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from;
        bh=PUrWHRLqGc7quPyf0iE8NmJPCZmAd5+29fqCHvmDRX8=;
        b=wp/2Tv+Ay6xKacbr/44Mr0lbl5nPr4C/+AH1HQSpAStCFbyzig9uoHD4fx1c5BeozY
         n2gjrdAJzuEUDUwXY63DyCq4E3SmUOEZIO/7kBinXnHYSN8fVciFPdAAF4TLEDaX1I1/
         ntBITofiJU2HZXN5QUst1YxPgpPiUxGhWr8aIySOP0Y5wiszeDZGnIPIH+cJ3iKxmCpM
         PILrysd4/qLknwVlxss+Fdrrth3/tZOVsgMM3kCAVL1YAthtlivHyvB5xXWDBn014qc6
         gyaZ53mKQPng4wL5DsJEWH17l1psg355VKbe/lmygd/jub/LZ3IHS0JV/D5fn0cxxntm
         NqFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.com.cn (david.siemens.com.cn. [194.138.202.53])
        by gmr-mx.google.com with ESMTPS id y184si284386ywy.5.2019.06.03.23.15.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 23:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) client-ip=194.138.202.53;
Received: from mail.siemens.com.cn (mail.siemens.com.cn [194.138.237.52])
	by david.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x546Feon029195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 14:15:40 +0800
Received: from CNPEK01906.cn001.siemens.net (cnpek01906.cn001.siemens.net [139.24.236.109])
	by mail.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x546FDnc024080
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 14:15:40 +0800
Received: from CNPEK01937.cn001.siemens.net ([169.254.1.207]) by
 CNPEK01906.cn001.siemens.net ([139.24.236.109]) with mapi; Tue, 4 Jun 2019
 14:15:00 +0800
From: "Xiong, Lei" <lei.xiong@siemens.com>
To: "Kiszka, Jan" <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Date: Tue, 4 Jun 2019 14:15:30 +0800
Subject: RE: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Topic: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Index: AdUamxPKSRp1yYM8TMeH2Mty8BV0pQAAIc1g
Message-ID: <C6C9DF0CAE5FD841919323C24BDCCA91D3A335027F@CNPEK01937.cn001.siemens.net>
References: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
 <9b0508b3-d040-4093-2b69-e3db932b0b51@siemens.com>
 <9ddd1411-e67a-f87e-58ff-280fbec53fe6@siemens.com>
 <C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6@CNPEK01937.cn001.siemens.net>
 <eaac6e64-72d4-d130-0a2c-cdde85d04194@siemens.com>
In-Reply-To: <eaac6e64-72d4-d130-0a2c-cdde85d04194@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
acceptlanguage: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: lei.xiong@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as
 permitted sender) smtp.mailfrom=lei.xiong@siemens.com;       dmarc=pass
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

Dear Jan
Thanks for your guidance
I have another question, in the " Setup on Banana Pi ARM board", it mention=
ed that " The kernel requires a small patch in order to build the Jailhouse=
 driver module", the file of " arch/arm/kernel/armksyms.c "  need to modifi=
ed.

My understanding for this is as following:
1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git
2 cd ~/linux-stable
3 git checkout v4.3.3
4 Modify the " arch/arm/kernel/armksyms.c "  manually by VIM.
5 for i in ../bananian/kernel/4.3.3/patches/*; do patch -p1 < $i; done
6 .......

Is my understanding right?

-----Original Message-----
From: Jan Kiszka [mailto:jan.kiszka@siemens.com]=20
Sent: Tuesday, June 4, 2019 2:03 PM
To: Xiong, Lei (CT RDA FOA ART-CN1)
Cc: jailhouse-dev@googlegroups.com
Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config

On 04.06.19 07:47, Xiong, Lei (CT RDA FOA ART-CN1) wrote:
> Dear Jan
>=20
> In fact, my hardware platform is banana PI M1+, I do not find "Banana Pi =
M1+" in the " images.list ".
> Is there a jailhouse-images supported for "Banana Pi M1+"?
>=20

Not explicitly. We support the classic Orange Pi Zero, but that is also A20=
-based. Maybe you can use that image on the M1+ as well, only tuning some b=
oot parameters and using different Jailhouse configs (all available ones ar=
e being installed) in the end. I don't have such board in reach to cross-ch=
eck, unfortunately.

In general, ARMv7-based setups with Jailhouse need to be considered more as=
 demonstrations than as production platforms. Those SOCs typically lack SMM=
Us that you need for full isolation, and most activities on ARM-side now go=
 into v8 designs.

Jan

>=20
> Thanks you very much~
>=20
> -----Original Message-----
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: Tuesday, June 4, 2019 1:14 PM
> To: Xiong, Lei (CT RDA FOA ART-CN1)
> Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
>=20
> On 04.06.19 07:10, Jan Kiszka wrote:
>> Hi Lei Xiong,
>>
>> On 04.06.19 02:46, Xiong, Lei wrote:
>>> Dear colleagues,
>>>
>>> In the =E2=80=9CSetup on Banana Pi ARM board=E2=80=9D part, it mentione=
d that=20
>>> =E2=80=9C*since v2015.10, you need to disable CONFIG_VIDEO in the U-Boo=
t=20
>>> config*, or U-Boot will configure the framebuffer at the end of the=20
>>> physical RAM where Jailhouse is located.=E2=80=9D
>>>
>>> My question is that how to disable CONFIG_VIDEO in the U-Boot=20
>>> config?**
>>>
>>
>> Via "make menuconfig" during the manual u-boot build - which the=20
>> description is not covering in details. If you do not want to fiddle=20
>> with that, I can warmly recommend jailhouse-images [1] and a board that =
is supported by it out of the box.
>>
>> Jan
>>
>> [1] https://github.com/siemens/jailhouse-images
>>
>=20
> ...and we can also discuss directly if you have further questions.
>=20
> That said, generic discussions via the mailing list are always very=20
> much appreciated as they strengthen the community. Thanks for taking that=
 route!
>=20
> Jan
>=20

--
Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate Competence Ce=
nter Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/C6C9DF0CAE5FD841919323C24BDCCA91D3A335027F%40CNPEK01937.cn001=
.siemens.net.
For more options, visit https://groups.google.com/d/optout.
