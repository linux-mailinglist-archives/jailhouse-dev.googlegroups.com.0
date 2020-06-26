Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBEV233QKGQEPRWXV5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C920ABE3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jun 2020 07:41:25 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id g6sf4112256wmk.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jun 2020 22:41:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593150085; cv=pass;
        d=google.com; s=arc-20160816;
        b=jFT6Opq2tX3UStGs0/G/sffwolvVzHKqB9qs0txTFPTNIYewAhO+STtNTlT2L36Vi/
         yK2zIH94OzRtQFXmH29Pr+4iB3T3vXg7RZanZzH3ub4DNm+Pz77CWlaKVWjxOXDt1yjV
         VfGPpOc/8ZXqaLI4XMj4RIdVfSErwdZewULmOntLTtYYQbdA8UyEBKBDZ4FYNKiy+oYv
         WVf/lmJCDSKf1kPmDrCrqK5/2RZGtGUUMkun26cpFHQ30aNzDTJjIq4TjD4EoAWe3KrM
         a8KTWby5uAX1QuA/8ss5GwRQ8LGEinpUjNRehGnSaGnsI/4ik7sguLQMoYioXaoWVg00
         Xt/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=xVQRwrGEEmmg49Y4mR1m0pXSCfXcVlV0kAiHw3eiWwI=;
        b=vmuPXkLiOZRZI3KaEkzwK7fvH7jshqXM0CpLSZyyy7IiIGQlZeh79929Kh4pt2CElT
         bdT1DpitjZmBsi2pWPF4QjcK04aBOTvl9HDWb+EjsCjKqQJZ4egKHQgMgS/Ns8mVHRxr
         Ig04iJ1mBGDGK9ZVQg6zyO0OsfSLZArkuImLkG+bck/ltK+nLBPdkEAAlSDHxPHdBJ7c
         msda5p2xLalfcnHQ8wS6fsnS9idpGKdm08VLYzqASWM7eyKqd1Zr6Uf2NykZPk8D33Z7
         8cwo1xW4ycFmYvb3GIJDd+UX+6Yx4NCWbhecv3ewtSFOXHtlo2Tekm7Xo7m1U8JbEXJq
         +3rQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xVQRwrGEEmmg49Y4mR1m0pXSCfXcVlV0kAiHw3eiWwI=;
        b=ps257kWOEKTRY7zAp+x2EoFZ581pbkvcSREkOm4iN89oXvNJp5IIalzdg3Uh0/DVqE
         r8MyDx7JTRR7o+WYbayk3WPaY4eXZAm0Dzvvyd0QQp5wD8l9h7BgSCOOKE7pjDtCxIxo
         lKbPQ0w6+2F+76Olj/YkIphB+9wUrqaZVxVCyC2d2APzu0t5QSaxotL3a8bUJK9qylCV
         n8lXK6z4U7CD8ztGn0m9YD3jA1z1hDvLMAFGtpuwU/IN9DwDr8Hf3sr4qvHldy2deYdH
         HXkPB/dMwll+V+t4tJ6jBAhB/kJ7SH92ejDvqFPlaZ06WJ7/MeI9w8nQz4Xqv3mI/vcc
         Lf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xVQRwrGEEmmg49Y4mR1m0pXSCfXcVlV0kAiHw3eiWwI=;
        b=bHfKFG9nweVU8WtndLL3WydBx31FNfndHHe1ctr3AaDKIKOiTcmoBzWQdM5MagSo/I
         d6Yd7RTGfjppJuGlSLjsEHt+eFyGlSGGlRQxrfqkTNUDKE93jlffuL4KEORxW18vYpwl
         2NU7o5etHOSwLDE7YNMZc+lAfdjuQXb4r0bVz0UBUuDNgGolqFk8ESz2psJye4KG4JJt
         PK9XsRp8VBgmQXvsqM5SrQ3fs6obzhbVOfNTJbMP+Agd9pJyA96N5JJXk+2j2v/Qc19k
         Iaex9xizQ9X949w8FTYFc5q9dVRVuN7G9Z/5V+E05xhEgzN37CPa6uT6I75xmR4q9b29
         dtyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dIw56oAyQa5l3YyHSatzaZ3LUFoDNf12o/4gXRkuXS7YdslKs
	BTO3Pj4BbHzBiv34aqSw+uM=
X-Google-Smtp-Source: ABdhPJwAvZnhJfCaayzA+BMUCc2ZIpe3sFHvSg8iqahssSvYVtPDolZCxQlipMKrODitstPAvuOkzg==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr1918916wru.301.1593150085091;
        Thu, 25 Jun 2020 22:41:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9687:: with SMTP id y129ls3784218wmd.2.canary-gmail;
 Thu, 25 Jun 2020 22:41:24 -0700 (PDT)
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr1573001wmg.131.1593150084366;
        Thu, 25 Jun 2020 22:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593150084; cv=none;
        d=google.com; s=arc-20160816;
        b=Zfj5P49w30Jj8E/LlsjOTZdMbxCRlkCiI5Ut/HoV3Ml9AS8Zn2DGzU45GTVp+ANyM8
         iRvF9KpRJQyI8A2mDaPhofjVMoQ5vquTD4wAjWXZ+O/JKRO0coc3aI6ttphEHfeX6z2h
         hWQAfzzbNUD92nS5HMhlHNwXIwOprzBxDG9/YrePDj4WDHqcJ0S4IFoAKpWvm93I+tXt
         DN7WxX4Kkld5ZeFWrSJmn7OCokOxUqrbgl36N5zPd+iEZ3apIoog2R4UmM2wmhm70QOF
         0cIQ0OYutljdyac3KhTzygdF2Xwjy4xDlF+Vv5jE41w7c8pQRIJe9UHTlnrrjRXraf9r
         itow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BQsqd0mMJLvUTImYw6sBiPbW88OVviBfg7JOLpPZpck=;
        b=tntmcFYAHAz6+u96wEizH4/DDZ4FwmiT6KRm7mcLwjEFNMEX6L9ZL1CAC77pkHw80P
         oLu3f/loZq4mzF1I0GW382bsuaj6I0AhpJ5Yv65AVVOPNheVKChFb0wMUmCoWYkHO/Hn
         NRhsg8pguzjrpUpYqU0ZUMO6tUFEY3SDPL++2ZIrxr3iC1xA1pU0y2o/LkJokmOWcv98
         EQPQgy4Q1Xs++WrfnHukMDaMXcyXUsLSRV2TSLVvUi6vLiJbMEHaWRMiU2DCEyXRNil5
         7MWrv0UgUoi7oB6kUXDtoIQTp7JQ+URToMC3htiR/U5ggkrBPOl36a/9jFVAmxD5NlOn
         qL8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u17si1316512wrq.1.2020.06.25.22.41.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 22:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 05Q5fN2t002898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2020 07:41:23 +0200
Received: from [167.87.241.222] ([167.87.241.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05Q5fMbI031107;
	Fri, 26 Jun 2020 07:41:22 +0200
Subject: Re: jailhouse-config-create: creates many overlapping memory regions
To: Henning Schild <henning.schild@siemens.com>
Cc: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <785d19a7-5a7c-4157-9e45-f4ead7c37a08n@googlegroups.com>
 <e01e34d6-3be0-57f6-fd07-ad540aa5c4e0@siemens.com>
 <20200625215735.12848c5d@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a684b2d3-c612-8602-2dae-0d2082091f9a@siemens.com>
Date: Fri, 26 Jun 2020 07:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625215735.12848c5d@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 25.06.20 21:57, Henning Schild wrote:
> Am Fri, 19 Jun 2020 13:22:12 +0200
> schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> 
>> On 19.06.20 13:08, contact....@gmail.com wrote:
>>> This issue may be in the works / known -- just to add another
>>> example.
>>>
>>> On the this x86 box (Edge Up-Squared, similar device class like the
>>> existing nuc6cay), jailhouse-config-create finds ~100 memory
>>> regions, of which many overlap and most probably are irrelevant to
>>> actual use. jailhouse-config-check coughs them up again.
>>
>> Yes, the sysconfig parser has a problem with sub-page memory regions.
>> Unfortunately, this usually requires manual cleanup (generally a
>> consolidation of most sub-page resources).	
> 
> Is there anything that can be done about this or does the source of the
> information simply not contain enough detail to fix this?
> 
> /proc/iomem ? Maybe in its different versions with different kernels?
> 

I do not recall details right now, just that a solution was not obvious.

Maybe we can have a look at the concrete configs from Thorsten's Up-Squared?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a684b2d3-c612-8602-2dae-0d2082091f9a%40siemens.com.
