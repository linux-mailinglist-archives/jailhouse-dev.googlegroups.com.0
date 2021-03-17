Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCNKY6BAMGQE4OBX3IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id B653E33EE11
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 11:08:09 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id n17sf3671175wmi.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 03:08:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1615975689; cv=pass;
        d=google.com; s=arc-20160816;
        b=YBkGhNuSqdmFtjyMHaUb9/QzLZPUfApQMpuhlioCvBKq+ZHL+X9tRmFyPALCHWpCiN
         pSnvIH/9WOOkCEB1CEMlr2VONljKVvpcZU2XN/H85Je4iy9uiPLIpehGTss3tnd/p535
         5YZGWgcBQSciaUifw3cGkdYviauqZUtNmMTQTLX7m86qIfTTwaQWCZ3i9N9A6LTP786Y
         y6FwRs9xV4zQA/xKttg1Q3Cw/VtqOYkEXjC6mTglak7VcPoWIWwhYo2HaBGxgYV/3ilW
         fAd5mHycWPq1vIuTVwJRscttPC4z5iL/fCAT0hPmuE2ajkZRLmI9rS/NSWbPsDegLM0O
         kMZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Gt3uetD5zn4JZRFIsnhUo7UaM1H8vShtAU1zeG41SkI=;
        b=tSWYqSTR1VFuaxAUidCuPjVvYeQgomTOiehEg2RsT20UFkd3OjXNecOGooK373u3Mi
         L1165ozV1SDLfzbMfHlp+VQAFLsGjOq2iWa/fwc0xvfeoHzdjssOoSAB0iEJKzp7ikP5
         KKLh7D7cwst/MNpS9ZKfBvXb/C0Imi/3RXaVI/CsQh5TjXGJ1NKoNalrNydyiHQACRiF
         nDqF5gxKm/qMltmFLYftIF3XU9e3oq3HEY/qFKOrlnYz0ds5cMtprOl0z/xV3R/zpM+E
         197H1DUcltHVK7SSMuO7UJT07AvdGyb91CzWn/FIjkAcFdsp63SKKP5D36orJMawwMxP
         9bLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Gt3uetD5zn4JZRFIsnhUo7UaM1H8vShtAU1zeG41SkI=;
        b=sKb3TDPQA1D2GqTas9jYoDfrGsFDtfqwD72aj1X+g0LU7haKLxS2fN+U71wYQWLOA6
         U+0fQuFNTWP+SsNjNUHzEJZSNsYmrY4tRsyt2Q+SztP51JX5HlChI2SRm9O86TgqMZrn
         t5z/W3YEjZChjJfl3teGc+wPe65BIpO7Qxj8EpMMq4hoa2ro+7iescg0kIfnEVwu+XvO
         HM2fbgJ209ngBGUAsz7/Rsr6OF3Gw2fdvmX/zUs0piMKC9nv4mK7pesrLf1eECGmep3E
         HWKujlzqVGkinCDnQkekGlQ+FNAPmYXPc3x2hArTo+pCTdbVkeI9owgDpM2XM7Fxvwzc
         ds1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Gt3uetD5zn4JZRFIsnhUo7UaM1H8vShtAU1zeG41SkI=;
        b=e+oBphZBiwzlL6cdzgObMHgQyRGusYK//QVPapXTjHvTIN39UHLb/lUs3z+fOeROIo
         1iddDa0XltX5/sYONkOvCt7Z2Cp9NmtMYADaznN3I/1ki7bo2uXYsE+TWz2btwlGN+es
         sLWoZ5PfvjCgK4eCy6vB8CMjqJCYmarbvizIu4X9IJJKApabu00p61wgOSKmmVS89A/9
         qsuMi0Ua7brc5cSKg8woRrgpHapWrz8MZM8DIFLhBoMPJCV+oYWZg+ngY1Ka2zKCloYB
         E+zLPw8rSw3ibgHmCv/0YtxEJH8vh1juty7qUbiySlDqdfQ7rlrF9a5C164YcEG1yKpY
         hMDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yNJAINMdM/kvwY5h1yeuiKE1TBJK9iSj4pYrnWqi6f9nfSIsH
	He1H93glsuxaVdXRW4RKd6M=
X-Google-Smtp-Source: ABdhPJwEVtc3IgXqrNVJmweoH7BNCSDwGIUFpfdFjxtaR0TMOuE0plL64LKh3my5+tlw97Fx0/1ZDQ==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr2908803wma.37.1615975689295;
        Wed, 17 Mar 2021 03:08:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls4092054wrb.1.gmail; Wed,
 17 Mar 2021 03:08:08 -0700 (PDT)
X-Received: by 2002:a05:6000:23c:: with SMTP id l28mr3651386wrz.251.1615975688227;
        Wed, 17 Mar 2021 03:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615975688; cv=none;
        d=google.com; s=arc-20160816;
        b=Xwb8PsvFhKkNlTZOIVg0ZMYcI6HMnFmzD17CPN/mVO4BiSD/RufkyEOC43W2yEbLco
         M/fBAFCMKPLLLfXEGAlWQ8FOSCbrsk3JvbtQwN0zE3Eqf2J9K4edk9O6HkJ4ODJViZfT
         PIcV44EQ5QPsJ/L1GbecS2aZ/FhHKRiu5To8Q6fI6ybaVqhjvxv4Lrm3JUmtncA0lzvq
         0FqG92WqZAL+XxiysrxoKYt6lan0x5U/btkfDj2d6pwkj8CibMU2S5IHs3J50u/xlMna
         fLibWpZT0E/txNtayU6pkG9xBOCCmp7xHCGpmCNYFOAG8odfgSqIBc/EGhmQGibmzkII
         22HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vjjqljwtM852cm6raEw8mQthsaQPBXcKW1NNlQIFI/A=;
        b=XPiTy2BzXa5svXH/B0QjovUXh2qPQPiEJ6CkaUyv8RyhI3kop1L2KsQK5db50EH5Kp
         eVt2WjJuALSshyQjzt+bceSSGhy69DSMvhvgHC6rMRyoxY5Jb/Q6av24O4iiEK4mQFNt
         6Pwn1CXWTQfP3579NthQko0zNVDa7mRO1rlMKxF8izyiYpgSdHgkVGPulxGixofZ5p9+
         iBFjmKYjSIQRwIZKnT5qGtSpsSnvFi59VDIIkblCUAR+0J5cxEy1ROoOs9BKL/sroOJ5
         J0RUCM5vBtLxMngECFbc7DyUWNcCiJDA2gM7Pg25ctedQWZ3bj7uTcX6J6MpaVfk1jHu
         5RIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y12si785601wrs.0.2021.03.17.03.08.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 03:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12HA876E015124
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Mar 2021 11:08:07 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12H9w7cJ006576;
	Wed, 17 Mar 2021 10:58:07 +0100
Subject: Re: where can I get configuration document ?
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
 <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
 <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <AS8PR02MB6663D7B254E27AAD507D3C34B66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <2e6c7ee4-43e4-925f-831a-934687f9a0a3@siemens.com>
 <AS8PR02MB6663125573772C331CDFCA6AB66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <061f06dd-1b28-0752-db5e-2e891dc3c012@siemens.com>
Date: Wed, 17 Mar 2021 10:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663125573772C331CDFCA6AB66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 17.03.21 10:47, Bram Hooimeijer wrote:
>> On 17.03.21 09:24, Bram Hooimeijer wrote:
>>>>> On 15.03.21 07:47, Smith li wrote:
>>>>>> In
>>>>>> https://git
>>>>>> h
>>>>>>
>>>>
>> ub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2F
>>>> config
>>>>>> u
>>>>>> ration-
>>>> format.md&amp;data=04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3
>>>>>> 4
>>>>>>
>>>>
>> 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7
>>>> C637
>>>>>> 5
>>>>>>
>>>>
>> 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
>>>> CJQIjoiV2
>>>>>> l
>>>>>>
>>>>
>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=wldQEArIJ%2
>>>> FcFxG
>>>>>> w
>>>>>> 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;reserved=0
>>>>>> It only shows "To be written..." .
>>>>>>
>>>>>> I found how to write  right .c configuration is very important .
>>>>>> For example , I want  add a new inmate,   a new inmate to run linux,  I
>>>>>> don't know how to set the value in the document.
>>>>>>
>>>>>> The result is I can't   easily run a new  inmate.
>>>>>> I think it's not good.
>>>>>>
>>>>>> Will  the document be written ?
>>>>>> or
>>>>>> Where  can  I found some  good tips  about  how to write a  right
>>>>>> .c configuration?
>>>>>> Thanks very much!
>>>>
>>>>> Eventually, this document needs to be written, at least to describe
>>>>> the
>>>> binary format (which is expected to stay). The way we generate it
>>>>> right now via C may change, though.
>>>>
>>>>> For the time being, have a look at existing configurations, in the
>>>>> main tree
>>>> as well as in jailhouse-images (depending on your target) and >also
>>>> study the tutorial I gave a long time ago [1][2]. Some aspects have
>>>> changed since then but not essential concepts.
>>>>
>>>>> When details are unclear, ask questions here.
>>>>
>>>>> Jan.
>>>>
>>>>> [1]
>>>> https://even
>>>> ts.linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-
>>>> Jailhouse-
>>>>
>> Tutorial.pdf&amp;%7Cf659d6914e00464a59b708d8e91ac167%7C612607c95af
>> 7
>>>>
>> 4e7f8976faf1ae77be60%7C0%7C0%7C637515648567686059%7CUnknown%7C
>>>>
>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>>>>
>> CJXVCI6Mn0%3D%7C3000&amp;sdata=fbtmKSRCItgbPj3rg6cFP2de64%2BFtY
>>>> ZR3oH5DPQKJJs%3D&amp;reserved=0
>>>>> [2]
>>>>> https://you
>>>> tu
>>>>> .be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-
>>>> pLrL6pRFP6SOywVJWdEHlmQE51q&amp;data=
>>>>> 04%7C01%%7Cf659d6914e00464
>>>>>
>> a59b708d8e91ac167%7C612607c95af74e7f8976faf1ae77be60%7C0%7C0%7C
>>>> 63751564
>>>>>
>> 8567686059%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
>>>> IjoiV2luMzIi
>>>>>
>> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=USe2ZeUgtpxLon
>>>> lBl2yHA7e
>>>>> 8KwnnwM0ehIlLNtYzm50%3D&amp;reserved=0
>>>>
>>>> Hi Jan,
>>>>
>>>> First link is down. Can you check it?
>>> If I am guessing correctly, it is now found at
>>>
>> https://even
>>> ts.static.linuxfound.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-
>>> Jailhouse-
>> Tutorial.pdf&amp;data=04%7C01%7Cbram.hooimeijer%40prodrive-t
>>>
>> echnologies.com%7C76aeb95b2c5049eefc0c08d8e925368b%7C612607c95af74
>> e7f8
>>>
>> 976faf1ae77be60%7C0%7C0%7C637515693785714904%7CUnknown%7CTWFp
>> bGZsb3d8e
>>>
>> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
>> %7C30
>>>
>> 00&amp;sdata=qHTB1oyHRu0dySKkKVHhG4zjVcsE29rDe5ausXx7arQ%3D&a
>> mp;reserv
>>> ed=0
>>>
>>
>> Yep, or
>> https://elinux.org/index.php?title=Special:Upload&wpDestFile=Bootstrapping_the_Partitioning_Hypervisor_Jailhouse.pdf
>> Jan
> 
> FYI, I am getting a "Login required" here, and cannot access the file.
> 

Oops, I didn't upload, or that presentation was part of the data set
that once got lost on elinux.org.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/061f06dd-1b28-0752-db5e-2e891dc3c012%40siemens.com.
