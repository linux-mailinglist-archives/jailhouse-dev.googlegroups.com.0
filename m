Return-Path: <jailhouse-dev+bncBCB7D7MXMMIOJCOG5UCRUBE4342DG@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A9659E2FCD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 13:03:02 +0200 (CEST)
Received: by mail-il1-x138.google.com with SMTP id y4sf9117265ilg.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 04:03:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571914981; cv=pass;
        d=google.com; s=arc-20160816;
        b=jcPr6b60PD9TMUUGBSEAEkV7YDiFyEujcu+iuX0BEpu1rWX9oehIjLPmJZS5xlpVVO
         LcCdM0hswCJzoDdqfFNLtfEEwhIc+NVVnYJKvZSeCdj1ZWwXpoEpO+BGTwnAxSe4cavX
         8yFlyG2tEFb1K0+9F7xRWQKPsGM/TIrbDUM6AqEBbDJHvkm+x5e3rgO9vYBUYfGKIabp
         qRH1sXQodFSUPRyG2C1zebqPNzGsd0TqXL8+u5cCGWR6AY6/iR+I9sooEdKJJ96g1Fse
         d6xLcsvQ677KgB9krORwLDKb8nt5IFFCjc5r/APZBa66lev18VaXyTv8+BYZT4srFzKa
         Y2Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=O+OYB2v2LEAXbSGTGiO3sZvcxMy2RvRr/XERFJLVs+g=;
        b=VIdBKkUE+iG1i3cekd5Bskpu7Pelj5LauT7vtvnCTgYmB/5pH8s3nMP1j100q18lVs
         fRyvTXMHZWXse26UJd/DSS6lNJ8OnEZn4bOVQpMnr1L62bSKhawM/8NdK16/+JXZC4aX
         R1vm7GrjswML28ALkev2GFimjfyW/LOk1RckoecCNrDpXPeVnoD8T5bsQAjIYIvswT37
         Lev5H7GDGgGGfiK/ZnPevqgad/JVdJZfidcTizYNLqHfNnweCKyoXl895tY0sH6p3FaJ
         +ouhqQgqMZGgalGJkkBhk49s7Pj+8x+se53vMlCFuyUDVNcKhNmA6Be9PEtwvTwd/EFm
         cOYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v9gKq8Ji;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=O+OYB2v2LEAXbSGTGiO3sZvcxMy2RvRr/XERFJLVs+g=;
        b=d898SVzTsThkY6ywmnG+QAxFUHBEWNzKDIutvDQ5vkurU8aMvUI3WpTYhlTWAv5c6Y
         PGYoZE4XRJ6XabD/8ND6ZhSR/YL/DyfLRNEphzkw4EYw51YGp5EF/Pmnr5o9BQbqadGU
         HE9RlZ7upmfm6ExxDRqBvIbR8P6dlKxtEtRV7T15I0jWTcSmG5qqv85vf4rDIHp/0pLQ
         FlnaDo71rY2QBXIHQpt404BcFwbbw6eoYF5yKQX3XhwueSfwwXjqIB+P3aJ/tWRvgghf
         XWcCgzwcVSb5R4HgycQftLtrMC/43VZi/haRkRr8SOfGJrXXmFtHr2sAgN7KstZ1yctW
         HjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O+OYB2v2LEAXbSGTGiO3sZvcxMy2RvRr/XERFJLVs+g=;
        b=ZhC0YdLnSOYPuQ+oy/vkgbdR11qLj/wmlbxkWmRRSwl6iNW9GhT61NrYp0GttC0gLD
         SZAuWPNgiHO058aYxxdiaYf3xAkW2xbhjqSwBeMoLw6Rl+MOLDxqlUXGocVIks2O1Fzu
         2J2ZoCe6Fr25kUbeDjjG/weC07zwXt3g24cKBPjjU7vEUao+x34aPBbJJskLcPQDDH+N
         exYrtwYxptlQb67mr3tXj9TglW8sACvtbVM4S/40N3XM2v+bV5oWjniX7LUetODl+/oU
         zTibfTojb2c39wip5EJHopTUyTlRatm8Ps9usao1EvWBQ5eb7NrlmOjsFLhrDUMVEv4p
         wOuQ==
X-Gm-Message-State: APjAAAV0JDDBa5WBdg2oAZLZgC2xbZKLGjwJDxDG/ZzjvDYLW30Ig8SR
	K13MXR6FWzotr2qNkHh/iOU=
X-Google-Smtp-Source: APXvYqzzAbfJy/C3QT1ExdAWTY/Mpl3K9N4KTurPTX5dqN4vU6c1sHl1s1+INFxd/xHVp2UkwAWCDA==
X-Received: by 2002:a6b:ee06:: with SMTP id i6mr8510858ioh.250.1571914981363;
        Thu, 24 Oct 2019 04:03:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:bf86:: with SMTP id p128ls907496iof.0.gmail; Thu, 24 Oct
 2019 04:03:00 -0700 (PDT)
X-Received: by 2002:a5e:d904:: with SMTP id n4mr8282776iop.186.1571914980708;
        Thu, 24 Oct 2019 04:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571914980; cv=none;
        d=google.com; s=arc-20160816;
        b=EuWEjHCYe4wcUVh6ntcTWjHt0Dwpljj7htTQsBdM/g3qHYptmPetaFA0c0tdD8oTX/
         p2E4Jovz8AYondYac3s6XQrN8N1zfYzoluHxtdj5IqH/A/XIBCT8NhuA6vla1vpJkbzw
         Avr8itzmrC1pFYfwL/uXyegPnFVO2dpwLba2nl0CyG6Pb9eh85qqP5jRP+mVWRg+egJa
         7/jviyw9T4Z12/+KCyG4kjoBFN3AkM6RgD6/Cq7i4Fv29OL3ERz5zHXBuhtub1wZHbdn
         dsa+LfaRI9ukZX6gx3e3qUQRVs/3MUtDzcmrfppJ9hyNPy0aHB8c6UvdSJ8PoOFSEOSl
         mHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DHtxG8trsg1cDg/SDy5RegbybRGqvdy1YRx6DN0xCMY=;
        b=gVc/1exGtSQt8YOCK9dIN+DUinzUkWzhPeAulATW8+2Oa2wiXNCNJCFWhKOQ+fNdfE
         rKob/iN4qFeiF+J9ngaAUHx8xut9UO8nPf0OnGgZmeqdr9m0FlKbZBm5KTbmOdaeC6+u
         /5M+eXBOFDl+UX+r2wuVCRqwZLevyOn9EKmLvFM5jx7SoTMXtwYt1IPIro24wfi7sC9J
         q8ibTdd5VSOs9g4JzYYQQnT3zU9/p2f4ibwuF/g+UPFdYirND9c2ql05MS1KCjSYcVTu
         8LeIHpX/uQJgF7QNBjl/HiKFF8L3bay+AkHPHaBnTQLUBb+N39Z2B0mijxQ4SZrEYkPg
         nLSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v9gKq8Ji;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id 75si587987ilw.3.2019.10.24.04.03.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 04:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OB30w1077099;
	Thu, 24 Oct 2019 06:03:00 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9OB30gL074776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2019 06:03:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 06:02:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 06:02:49 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OB2wDx111355;
	Thu, 24 Oct 2019 06:02:58 -0500
Subject: Re: kernel build failure
To: Jan Kiszka <jan.kiszka@web.de>, Peng Fan <peng.fan@nxp.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
 <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
 <DB7PR04MB4490DA1071D41C031DA58A75886A0@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <c1007a6f-94d8-adc8-74b7-e54f0d90c69f@web.de>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <11b1c6d3-e4c7-71e1-4d56-6733e1208372@ti.com>
Date: Thu, 24 Oct 2019 16:31:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c1007a6f-94d8-adc8-74b7-e54f0d90c69f@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=v9gKq8Ji;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 24/10/19 4:28 PM, Jan Kiszka wrote:
> On 24.10.19 12:09, Peng Fan wrote:
>>> Subject: Re: kernel build failure
>>>
>>> On 24.10.19 08:07, 'Lokesh Vutla' via Jailhouse wrote:
>>>>
>>>>
>>>> On 23/10/19 3:47 PM, Peng Fan wrote:
>>>>> Hi Jan,
>>>>>
>>>>> When MODVERSIONS and ASM_MODVERSIONS defined, your
>>> queue/jailhouse tree will have build failure for ARM64.
>>>>>
>>>>> MODPOST vmlinux.o
>>>>> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version
>>> generation failed, symbol will not be versioned.
>>>>>   MODINFO modules.builtin.modinfo
>>>>>   LD      .tmp_vmlinux1
>>>>> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation
>>>>> R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used
>>>>> when making a shared object
>>>>
>>>> allmodconfig fails as well without this hack. We are also carrying
>>>> something
>>>> similar:
>>>>
>>>> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.t
>>>> i.com%2Fcgit%2Fcgit.cgi%2Fti-linux-kernel%2Fti-linux-kernel.git%2Fcomm
>>>>
>>> it%2F%3Fh%3Dti-linux-4.19.y%26id%3D6c809904ef4483971166142a12302c
>>> 8a052
>>>>
>>> 2e23f&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Ca21a8c0c9486411f
>>> eff908d7
>>>>
>>> 5869857b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370750
>>> 825381915
>>>>
>>> 48&amp;sdata=9QXjDYuOkKHrAyoEbIF29oI9a%2BSkulsFtNFK3%2BLOy6M%3
>>> D&amp;re
>>>> served=0
>>>>
>>>
>>> Cannot reproduce quickly with gcc-7 and current queues/jailhouse. Do I
>>> need >=8?
>>
>> I am using gcc-8.2
>>
> 
> 8.3-2019.03 (arm-rel-8.36)
> 
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_MODVERSIONS=y
> CONFIG_ASM_MODVERSIONS=y

Can you try  allmodconfig? This is the trigger point where we noticed this failure.

Thanks and regards,
Lokesh

> 
> Still no "luck". Please share your complete .config.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/11b1c6d3-e4c7-71e1-4d56-6733e1208372%40ti.com.
