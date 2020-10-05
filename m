Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYNY5X5QKGQER2DV6LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA07283DB8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 19:48:18 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id l1sf1799839ljj.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 10:48:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601920098; cv=pass;
        d=google.com; s=arc-20160816;
        b=s4vXBZqh96Zevk1Sn/XcHtz+8EJ1evLedsIeJTxBTKgMwToyIhRpUByma7BabbA6jr
         jf+KXHYPNo3YqmTSP51Z+NZqn/rNtm7iAGp50X1c8fNRxTSwWBlZAz+RbDbbkJesBwzR
         Db8H36F5xF5Q3HtBKhXls7Z43C843a8rufsqfE3h/zCnvyyIjgKG99EwntYNpdPq3SY8
         CFtyqDbOiM1zqtHjySK7NHmOgicLksJPwinVxfM+eSRgBcZR1R0E7OJTgN98bZEt58WK
         /wbOXd6qTFSofdG5pQpQa4edkZNO36NslygDjnsNfCfdp0h4l0T5YtOPtbCArz7Lyhgw
         4GRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=//z5CrLJJyWd7bhLe3yW3qBtWVhnY26cR9KR83rj0qs=;
        b=QLgAIY3n2Paa7EwOPDBXdxb+FnYLNANkiHgsTYkomciUbxwLIRweRHZw0GZosctM3m
         iqTpEQCzZyKZpGfymbfSB5zc+k2n9fvIkaGXe+ZzYwdTMCs7biyNhevOqst/wqOrGyDP
         S1FCtIQCf2Q3aI3vwjimRzG3BCxlR80YuCEU0292RyJWsdi4OX/Cg9oDNx7gfXh2xKe9
         K30G9TejjM8O3lG9nuUoz0/bbA59I9el4RnvGn1My053czK1eKOsH2mX1ZCYSepauZTg
         tZfZEE/QJ4kWFI40LFq/ZgOa92UxD7Vnecs3eW01e+rz/odbTHCtg2vWu4QclJ75I3NM
         zeLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=//z5CrLJJyWd7bhLe3yW3qBtWVhnY26cR9KR83rj0qs=;
        b=h82UC4lp7LlKoN/0AWA0LsTBmJuVIfF+ak6ovwOmCtTmzL3WnRWni0jGsIMisGuP7z
         7raoDQh45+qS2GUmVSwu/XT7ETcejxbqg/EBOjfbClA2K6VXaUpSAVy9mahpLVuSLTox
         wij+yvCq4aD92ImWlWtqC2IWsfwmYCORabumCgvucYZ24QymkqTalGH461qgvCBmf2YZ
         5WDKxpT0h2ckFF99v0JbRgn2isdBm7IjBh5Zp8oDjxcYpVduohqfKlVbdAVPKMXY/K3u
         YzoFx9Fp88DxS/3rwZnjnQ9SCNbOLxsCl2wsGI6emi0NPg6sHoLFwT3wrcb9TYLdI4Ek
         qRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=//z5CrLJJyWd7bhLe3yW3qBtWVhnY26cR9KR83rj0qs=;
        b=pYKCuN4YZb+m1eY+0RKBw1kNTbyBWJAwVRglJG8AjKeer1v7NGgXgpVBgdygENQwvn
         bf72Vgphy0Z0ppnKT2pS1Y1mBLitiGjaXa+9nXpnPGp32lS0xuDaeC0woQRC/Zjpd5rM
         LrfeLPPav29WT7BML+D4Rv6xO1PqQjXH6p00DduoMYrgtJiPSujNccCLaut+Zxkg9P2H
         /sSf+wN84bhl/klQNneRimT70X8FPpvjUFi0IMgpYCR20y4ZuPXIvJ7B0MyegmbjMh6P
         ltM1H3GLMTuF2OSatrvtamRfeviBiU0DFf0JSBgnJwh5siVPMhpYI4YxIz8TVR9tfVk0
         KirQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530p/vl9kH1dqbmLe/pxBi5vQ79k1wDyXbeJylhzXMdYXONHdYwp
	hJ/8mYHgfa5JMvxTIgLi0os=
X-Google-Smtp-Source: ABdhPJwcN1j/XWXKHyaq4VV1hqAnq9O/bKsXoLphAkP6epbDLC14UIJT2ghjjJAla73ThLRG6raxPw==
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr296288lji.283.1601920098287;
        Mon, 05 Oct 2020 10:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c8:: with SMTP id n8ls1240749ljj.1.gmail; Mon, 05 Oct
 2020 10:48:16 -0700 (PDT)
X-Received: by 2002:a05:651c:141:: with SMTP id c1mr309275ljd.182.1601920096720;
        Mon, 05 Oct 2020 10:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601920096; cv=none;
        d=google.com; s=arc-20160816;
        b=UmVlWav2miSU+JdMM0GdRjxVRStPR8KKouHC9YybjZKZi+ZUkcMAhbHbiQMmdLkli3
         g8DOe1syIC7eGET3QuiV6DEz+ZABFxUMKsjRM+j/CX5VW0e55c7Q4FEETgUg5roKi+W2
         QuMs//5pMnTOFuA3heSJceuu5D4zFOu0J08EP/DmKFPw8Sm9IGbXxRExY+WeIgqYV8Yd
         xlFGyIGFhrAZFLpa5udBEm6o1Kjz4JYcNL8/6WLzSRS1ZWIQAdSAz1/eMqanzsyYCOw+
         emnmEvaT/C32mYS/vJWgk7MITyJ+HYfqrxctNRGolFNM5ngYAx0dz+KhrrteZChFbG3A
         ViUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+wPOXJVBnC3FRAbH6t+ZWN6ctoOhB1W02b5F7h+jNIo=;
        b=rhnjhAzPq7+Bm/+Legmky/l/xOFRksQhCCEXlhz4QezpVnPeDNyGGRIBPqJwe47pO5
         VOILAi1heN9w9dtOq4ofi1cQfw8D0m2jh2T6ldqhogLEb/bH8wYTWCoEEcAuigTgfV9B
         UW0rqiQfqVqW3qaIhoLXjm0uOiAYtWohVDZqNSNBGoeeLggiqcOOz/2Xo2oZmVLN82gL
         /Ia2eWxJQ5giuYSwWASEG1aN+dqOGM9Q43HfCi3mwFuoDk5R2+3I2joCsp9hYJJxLj04
         +wvyy/ORaInb3em4jpsxjggofdXKMFmodCEemzG17lNGQ8y/VrlO7WRqMmhZ3N40JSlz
         NRDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j75si22347lfj.5.2020.10.05.10.48.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 10:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 095HmFxD032442
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 19:48:15 +0200
Received: from [167.87.0.157] ([167.87.0.157])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 095HmEKn019899;
	Mon, 5 Oct 2020 19:48:14 +0200
Subject: Re: [jh-images][PATCH 00/19] Add Ultra96 v2, refactor/update TF-A
 integration
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
 <f13614cc-920a-e8f9-8a36-e6992b736698@oth-regensburg.de>
 <1a0cc554-a3ce-1698-4d7c-392498d73fc2@siemens.com>
 <4393040e-a217-ca5e-7b15-4803cd789b17@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8efb63c5-74fa-f0ae-2b1c-9ff9c8524661@siemens.com>
Date: Mon, 5 Oct 2020 19:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4393040e-a217-ca5e-7b15-4803cd789b17@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 05.10.20 17:39, Ralf Ramsauer wrote:
> 
> 
> On 05/10/2020 15:46, Jan Kiszka wrote:
>> On 05.10.20 14:53, Ralf Ramsauer wrote:
>>>
>>>
>>> On 05/10/2020 07:39, Jan Kiszka wrote:
>>>> The primary functional enhancement of this series is support for the
>>>> newer Ultra96 v2.
>>>>
>>>> In addition, the series refactors the Trusted Firmware A integration,
>>>> using a soon to-be-upstreamed Isar patch. The refactoring also bumps the
>>>> version of TF-A and U-Boot on affected boards, namely Ultra96, RPi4,
>>>> Pine64+, MACCHIATObin. For the last two, I'd need some test feedback as
>>>> I do not have them in reach.
>>>
>>> For the MACCHIATObin, please find the log attached. Early stage
>>> bootloaders seem to run, while u-boot gets some abt while trying to load
>>> the device tree.
>>>
>>> Test on jailhouse-images/next, 6d797f1f59d.
>>
>> Grr... Will be hard to debug remotely.
>>
>> Could you try generating a card with the old U-Boot revision?
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
>> similarity index 52%
>> rename from recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
>> rename to recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
>> index 2bab197..088188e 100644
>> --- a/recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb
>> +++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.10.bb
>> @@ -9,7 +9,12 @@
>>  # SPDX-License-Identifier: MIT
>>  #
>>  
>> -require u-boot-${PV}.inc
>> +require recipes-bsp/u-boot/u-boot-custom.inc
>> +
>> +SRC_URI += "https://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> +SRC_URI[sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
>> +
>> +S = "${WORKDIR}/u-boot-${PV}"
>>  
>>  U_BOOT_CONFIG = "mvebu_mcbin-88f8040_defconfig"
>>  U_BOOT_BIN = "u-boot.bin"
> 
> Jep, the Macchiato successfully boots with this one.
> 

Seems like U-Boot 2020.10 works fine. Will update the series accordingly.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8efb63c5-74fa-f0ae-2b1c-9ff9c8524661%40siemens.com.
