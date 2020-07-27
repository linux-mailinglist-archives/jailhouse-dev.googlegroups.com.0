Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMS7L4AKGQE2ATCPCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3622E71B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 09:58:33 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id x190sf4124963lff.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 00:58:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595836713; cv=pass;
        d=google.com; s=arc-20160816;
        b=X98R/dE/oSnf4RjnzcII/ZX+nodZ/0LJOUOEIWRGh8BTDUDF68JpMSznvab+BxFwaK
         cTT3nybYrFqIjxpNx4UMmN79Ec97mbwv3nXTAu02gvQAdlMXb3Xk8joHZ7Kw0t9KP4EQ
         Yg8Rp5I47A2Z2BnTt+7J99Om8lxBCYJQiwx3L/UBR563JUg3O7ia04POmBZ0JUQuaWp1
         bONDJiTC0NgwHfxv7iwSDRxecgHfIR/Dhy9ilA22LMv/juyMvGsXdpZGlbAKvQnPhGzT
         gHQfvQJpqdzmwUdCIA8g7GQY76QdNAIynZYsN6ucNAcldt0w31VPLzn3YfC+CNljiPmY
         44MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DL3fVK5QSaNDVXTPiFkp4yq33yO4aYw5IdK6gZOzHn8=;
        b=ITrMCWQPPyiX54rDjIPWli36D5qCdkZQfIkm1QKjekqJ1JhOuSQf3UBkMjsaqt/w3f
         kYWr2km0U5Af25bSjpxdcQI/azvAis2g9W8hod3uQS2z+jiBof071BMZLueRxjky3XQx
         FrwchnJZNdfasygeui0ZBmF0j2anVUN0T/Fx/Vwpu5av0davrZ65eacBSpMFhzp6EOEw
         G4qROM1YhTTrQ3QkOc51AUcA3KuxRUh8wnH6iBonZIPVxyflDVIFrw9WrWUKM3Fm5K4q
         4R5oR36FUmQowN7R6bcAarfkrsPUapcuIvxEd7oJX4lxYkRSoVFdNvx0e6vJa0ix2d68
         VP3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DL3fVK5QSaNDVXTPiFkp4yq33yO4aYw5IdK6gZOzHn8=;
        b=PfsqXTsQxYg8fgMyg2S+DbW5HA0NtJTUOWbtrempxJh7ottDLxZXwHcK+wqGCtcMOO
         Ak1hpHwe+HRu6vDKqRWkfLwmHjKnBGOn+QJqa3gKwpM3WcUerGFwD9KVgeCZCH1eiw9J
         WwQRCpfn9El7liYlo6j0AKt/5prDjcuoGDZ+N9gy3V1gWmtdAsWuJja9yQTZzL1Cr+hL
         31Ou/Jffb9nj/Nhaqj4UM3xPBUY6gp569cMrTxHmQ93tMz0iMvY9jMMtbaw8u+NGwFwG
         k83VdgxE+xhV7a7Gi3SdcQPsWzuWG2Uo/pao37gYdc4Y+Q859iq4zmwH24r8Y8tMApsS
         M+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DL3fVK5QSaNDVXTPiFkp4yq33yO4aYw5IdK6gZOzHn8=;
        b=mlsKhmCExRUSCp6DviDgjxJkaur7wwcLz9VefiblQq4TGzMmLdlZepwofUwz7apKtG
         j4Yb8BXIsorE6NoOjdXz6UeOgt58D9p7Kl4l8Zby2F4Zf7GElZUoq32b3B2d9Y/y+U+Z
         GamWqAxm2+6nLIlSiEAPkwhhHjeuv/lIlCCHgbRlJPmPIC+XujYGGVXO8G0eah2CTKM9
         MpjpFZnP2Dazkly9k5PwYezjqbFY4NV4gh0gayxJ27i1kojbNd6HTs59cR7pkoPNaQRs
         n5j4CCbTYEF74Szfc+6G16XoOoX+leAe0PGWdZdu7N123eUmCsL1R0z0lUThGLk1xMlj
         Cu7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Cor8eHq8/J7vUNR8zKK4bunoJd1gvH7+GZW4eOR+Ry5boLliK
	vw30ucaJHKgCEZwk2mMsR5w=
X-Google-Smtp-Source: ABdhPJw4wywSWoHbtvX5cJZYHv7wfmrX4x8JXjvYUtU66TOU9zZlljsUYu5zbPDsKlC/yv8pTrbNDw==
X-Received: by 2002:a2e:9555:: with SMTP id t21mr9917471ljh.194.1595836713400;
        Mon, 27 Jul 2020 00:58:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8592:: with SMTP id b18ls2713559lji.0.gmail; Mon, 27 Jul
 2020 00:58:32 -0700 (PDT)
X-Received: by 2002:a2e:97da:: with SMTP id m26mr5187913ljj.9.1595836712563;
        Mon, 27 Jul 2020 00:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595836712; cv=none;
        d=google.com; s=arc-20160816;
        b=b290KLhKAL/LVl5C+VIpEZHDtsly2hnS2WHlKYgCd/zL2Rn3g3mdLwZQ03qb8xplgb
         l+ECd0WxnU5U3miHMS5H49hMIxuSncGOr1swiBOkC5UM/ytW6m2eHZcyCMkG+Iw+AccD
         Dm7QSKfbKkHVoK6OwZ6ab2semyk3G0X8a01B4ooacElmPpH1rWk9sL94XVjBVW30Tqp/
         Uf8jrX7raR2XVVBn8JSA+ioh6TJues5xh+2jH7EyM7l3NiaUs4iF6/aB+OXEwJm/oOS8
         BTvE4ZuCswz3b6OyWugroNeT5ojpAe1vhn3kV5m/74n0SfPFgKjjOmQIOa/ZZcmXQTQS
         U5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GxzduxDMNAr1bT8iliDH7Y4vBkzz0bGx9byXOteDJB4=;
        b=b5g+aDz+56VmfuXMDdcox1PQ4F4IxBS9NjufEdkvsySJqcF/TMzN8SOYt3yIeWDZhB
         LioXG8mx+e6Sqnw8kywsVm243S1W8qMHsYlg6GBZrJ/7Y3tZVqTZoV1R5m8614WjqZXN
         PiBjrvixonESveyQe4/YPh0UvePHB+iBOqyujUPHiDik26iMlyELTiOClnApxuMU9KTV
         iHBg82gl1iuhiLln/zl0GO0+T6kWaYozLtOH/gk2CtFog+SUJoNTuLVljPIfBpZq8lCQ
         NsCLhvRh1cqfPV8R8RhQtiMzCJQSwaHr2pcLK3Em6QF9skA3ftGHLO1AYZ/toDb92o6w
         EkgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 69si346405lfa.3.2020.07.27.00.58.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 00:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06R7wQ9e013584
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jul 2020 09:58:26 +0200
Received: from [167.87.246.21] ([167.87.246.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06R7wOc7024018;
	Mon, 27 Jul 2020 09:58:25 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jose Martins <jose.martins@bao-project.org>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
 <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
Date: Mon, 27 Jul 2020 09:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 27.07.20 08:56, Peng Fan wrote:
>> Subject: Re: jailhouse jitter?
>>
>> On 27.07.20 08:25, Peng Fan wrote:
>>> Hi Jan
>>
>> ...
>>
>>>
>>> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
>>>
>>> Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the gic-demo
>>> jitter is 124ns~246ns.
>>>
>>> Indeed no more vmexits.
>>>
>>> But the max jitter, some times SDEI bigger only when program start up,
>> mostly because of CACHE WARM UP I think.
>>
>> That is one source. If you add a warm-up period, they can be mitigated,
>> though.
>>
>> The other source might be last-level cache sharing. If there are cache-miss
>> counters, maybe you can check if those increase along the peaks.
> 
> Yes. When I add stress-ng in root cell, the jitter became larger sometimes.
> 

I've seen the same on the ultra96. My cache theory should be validated, 
though, because I would have assumed that all of the gic demo fits into 
a core-local cache.

> 
>>
>>>
>>> Will you move SDEI support to jailhouse mainline?
>>
>> Once the to-dos are addressed. Any contributions?
> 
> I'll read more into your patches and check the to-dos you listed in the jailhouse
> commit log to see what I could help there.
> 

Item one (SDEI probing) is almost resolved.

>>
>> BTW, did you have to patch ATF for your experiment? Will you upstream that
>> patch?
> 
> Yes. I'll upstream that. Quite simple, I only enabled one SDEI private event.
> 

Perfect.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad%40siemens.com.
