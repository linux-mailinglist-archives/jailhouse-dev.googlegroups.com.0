Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJFWXLTAKGQEWIHVEPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155D13E67
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 10:13:25 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 134sf1148650lfk.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 01:13:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557044005; cv=pass;
        d=google.com; s=arc-20160816;
        b=TEwPx/eRqfzZRjQRPjyu7Cb14ICzJfowXbg73tIPP08AMsbKd654Q7jPzu54HDIMgO
         PO4/Slj+yzAXgQvc/AwUkIdgGILU1GyPzaj/lW+jBxCnz1TjfGnWQRfAwywx3eWT3vo0
         fVp4e3OmAbMy41J5JbbNttxHyU3sQBPA5K9LAcEWaQmxr2GXB3WxjGnRYwcPVCJT8E17
         280duGFvN6dmwUKbaHhCLtpfYynzKZxbricDYr3ICn9/5fFw0Uqmj5+uFa9V9alYvJud
         L0SU2oSYI9XGRSZC1tnXMCrnuHoUFcCMWSaP1cF8VASf+BJkN9zoLp4JosbEl7IJpDRl
         Ceig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=xgFASNM2biTlpH0HhICPMhCP86IgxTOxJZ8XUYjIhI8=;
        b=jRAgviiBf2/qmEXSCA3Qk2h8uIGioi3DrrH60TLf0vd6iLfB82WGhB7Rd6iFkU9ZEb
         f77M8KJB/0Gz/GYdSQKLEqGnhdxHuLDoaTbiRwbDAKY5EqEDk7/+7Z03rn8Km4ijvGmz
         uiLvPk5x0rOF6L3HF8YO4l/wIqKNSsGA1jT6rBQ0dHsk62rSn+XqMhXStRn0AAE+Y5s/
         GyEDQ9eUUN+Pt4lCBp1HYhNkTksIaBq+UP3QiKnYJ6RTe2CJOf6K4l40Zlkun21RIKXE
         OaSeujGtl8JIjuI61iDq0Y0cFEFnkw69M/jMwtoaZkQnmS+3ebUYTNJr1b9MHrKvNxk3
         XskQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bTSo2pz0;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xgFASNM2biTlpH0HhICPMhCP86IgxTOxJZ8XUYjIhI8=;
        b=rEQHjfJE2XmM4eNPZ0OSjt73vFwK3z7Tu6rMg6jThahfuUocjw6smcMKyLoUzCJELb
         sZmJsW3IFZ5DWFuus1PeTd4wCVhD5JccRLynZIbTz70XHYOp+jncWWGzz+0sx8NcYeEt
         cIbi/lSs8N6kbBDethD6EYr7YtcgYivbxxCLrZvquo5No+f1rPT0fev1i4Op0A63M8z7
         vn2wZSbXBJYumxb3321rRWCB66Dvbn8m96rE51xO0YjxD3mrbXbIrC2xqZhRVxLN/2OV
         m26YOq7QeHQk/y5a6j13YyXKOt+UupaChNQpGRWDktcQEgUcnsInjcx06JnJifTzxPYK
         PSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xgFASNM2biTlpH0HhICPMhCP86IgxTOxJZ8XUYjIhI8=;
        b=Nru2x8H3YbDRbwEuXrTI5tjMiu5Ya18FXRHzfZ64DlVpjlENnxlcdT1wlFtcBoDtKu
         btY3CQIuUCjk6aWYJjZO+7CoaPzQdSoxLPPqDmHcRQ9kF5DOeGftakloaQM9dE+p+jz3
         Cu0fes9thUtshw2DY2tD2LtdrGEbVpHaCPpHc/6aJbm4oH5dpRm2DgXhw7Z8C1QYf85l
         FtoTX1sGAeaIUi/JkouLfzRa0HFfPxnTFsDXYJBGPVXGjDUhwXmo2sLfgyH4ATc945WY
         TY/sTyhti6f7Pz2lJd3UhD/7yNF3FIXoWjyBwn/06oC+UG+baylj6920di31nf/OTSB8
         ySpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyCoC+E2FGE66gQ2/Oox8lqDi7snxszHOReawmnUGdO9j/C1Lo
	eHVB0aJ6VYZZVuc7tLBfg9M=
X-Google-Smtp-Source: APXvYqyY2VI/Q3Q4J1/hhl1Uxb9IWQuXAIXBsjvPdgr6RD03SnG/yEgN9g4ZGKG8W0A8dYRtF8LLTg==
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr9663617lfl.67.1557044004936;
        Sun, 05 May 2019 01:13:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:240b:: with SMTP id k11ls649163ljk.1.gmail; Sun, 05 May
 2019 01:13:24 -0700 (PDT)
X-Received: by 2002:a2e:9350:: with SMTP id m16mr10028910ljh.38.1557044004440;
        Sun, 05 May 2019 01:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557044004; cv=none;
        d=google.com; s=arc-20160816;
        b=pAk9YYYnFOxdFiOnpZnlDgSz/q0agAES5fPiDZYXG2bh3u/qq2S2lWgXQbSG1WYCfp
         HH9yndn95aWL4QrahHI6sl4pCUnajQOMWE6EMw8svJF+HsMHRrVNrdVJliru+eHUe/+m
         rImC8LVxCLW3S9sNfD8zV0JQ1eThB6qTXETyBQJ76Qoat3y5qaIiu94WDGnufznZT2go
         8DGCoB1cLLQJvt1yW9lgsZmMO8947Z3gKdKVP85CANZn6Dwlm3Mss4epWzKgIxkqcDx3
         y4N5F67+InHgbgq+CrR1AzMLOx5BY/foCvXvFwgfSKj27nJKfjZxi8YElYwNC5YH+rVS
         phyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=4rEOvGqmrpRl+DZy1gNYFEbGITm0ooDWR/wLSCGURPw=;
        b=oucEF/sy5RIfVDWcQQGkLo5xf1SFzSsXi5eFNezsGQWOGtxmJ0qw90fBo44JkgMRPz
         BDRlbc/svbU0BHRuNv2ctMZG81EtnTqanogK7IujDLt8fTWwNJ4R+jR+Nnhex46HkTkg
         77u5C0gGG+B8XWdTTI9uVDSp8QejSFbhScX2tQMXubvrR3/zUrSlSIYXkTT9STcRTZF8
         TeFUxSm2FdwPSgMLMXoJwOy3APlt4509M5g98qSqkLQlrXbHOTeWWViUvV78f66cWZeW
         PdlcKj3cq/A+3ZYExzZAlgXlu+EEV2zBRtEjm2S4TUDTUpJBruLBXk48qCuy0aF6uBe2
         axaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bTSo2pz0;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id y23si45465lfe.4.2019.05.05.01.13.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 01:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LuuSf-1gfRL93og5-0107I5; Sun, 05
 May 2019 10:13:22 +0200
Subject: Re: Inmate accessing RAM problem
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <e881f27c-ad5f-46dc-ab06-a69d27f54ff5@googlegroups.com>
 <0023050e-61cd-5b6e-b876-a1aff77173b2@web.de>
 <96357294-3e29-4db7-9017-d3e8ccfe546c@googlegroups.com>
 <3b94fefa-7112-40eb-93a1-2590fe9bdf81@googlegroups.com>
 <b5cb0801-614c-07ee-9997-204bed183924@web.de>
 <49238e83-72e8-42f7-9eb9-d5462dd48d1f@googlegroups.com>
 <fff24fa8-4cf9-5290-e550-999be52a177b@siemens.com>
 <932629c1-7e58-4ce6-bfcb-3db823544286@googlegroups.com>
 <08104912-32c4-4010-a7d0-55ac10a4437a@googlegroups.com>
 <3714e03b-9d45-4050-9b6b-d30b478f3198@googlegroups.com>
 <07630d92-4987-aae0-de76-43dd7aa1df1d@siemens.com>
 <da87b870-8284-4bdb-a801-d451399e6c21@googlegroups.com>
 <81b5e854-449f-bceb-9cee-c777639ec24f@siemens.com>
 <d39b47ef-3805-46a2-b244-274f8075354c@googlegroups.com>
 <43d1d97f-226e-8e06-80d9-e4ee63c75dfc@siemens.com>
 <d52c2827-6022-4bad-b879-543b238deba5@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6cdcc42c-29fc-726b-fc9c-d0d4df363fb9@web.de>
Date: Sun, 5 May 2019 10:13:22 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <d52c2827-6022-4bad-b879-543b238deba5@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C3GARg4s+wqgCh3CdaveU0JHRO78ZMwYExQ6cKuV5ijc16gFRWt
 PZ1mXGeZh2iK/BwgQDFgIDTrrwuTuOdS42Y21RrDwfzMjt5fOUQrGfW6VjtxjZVmwqNTwpW
 +g+GNZhkf+R/iT3g/ky1U0UQ+/e1sryTfCCjy2w7WPqeNaqGAG1KrVJysmDYrj935jPY22p
 kqHCS21tpjasg3uTuEzVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pZCMQ/+FGko=:b/ru3RiIc8tqFSm2YVHUjZ
 whO8cgjvM9TwRwm/NkDRuuQR1t2jokNEK+zTNsc1WNexztIN05g2GSvgXH6Koof/qgf0UeWh9
 cX4/1ZfEIo8M7XtKcF+mOjao/ZR7IMV87OEP8/BYTTMEfl0lnX5UvVV2G35yPyV4WCbD1D72J
 x+2GLtMqu6GMh8Rc7SnA0iHyADTuQQL2qcXO5khGzJazv6kCrTjzBQ0B3VPTldLHt28LbcWTT
 iE2GCBqAKksCZTPY8uc7shgUw4olHDwBGIBKAmtkBauh8+E/cusfVhTiRHt7AiKs+V4/WJnvZ
 BaMNiaE43HhJFzSWrSFfdQiqJ147C1/vAu5B9dp/uwtc3JH3rZd1o3FmGKvef8vBCnBR310xt
 mJf8waazVBHQl/5m0wAHCOEyM5TDZJyRRvwb6f2qb9C/QzMvAGpA8LE2/bHw5s2xxoj8EwawR
 LqV3kz8jgmtAXmI/xt8W3AKWAnpq+RSlAg9EgZ3GwqxoRrAd+UfvYpgUhV3umLTVc1QU2LyKa
 6Ang6RESWEpd28Sb+OP4UwNYmNaiG8AyIKe7PA9EMyt/ixF98Ih7p2g/IoC8971mM6OEP+nPF
 l4161QgA95R0p7mH0ufz/ovydnsF5GB/y214xe18qwUnjPE6RSkIGscsUAdz4eCsElCwr84RH
 jZ6vr7lh+GOph8AFPWLANugJ7oTWbipCXFixCnygzMgZst1pt2+2FAUxyvvsGFG2WXx+VjkJC
 OAL6K9+DK0Tm4CHRFNXZMROUtpWkIDKujbD+2c7ghQahyd0se8aGarr8ym4MVmB7LDjffEdjW
 2ImSsuQhbKidqjBB94Ltjye5CBI96NiHBGf+AvviKnXAMHQsOHVIBt3OweN4ytcRNd/OIhNGf
 ps5Xp5ia/0orseAkLwx96d2jzSNleQSXBUZalUVmFx8tFlev4zhQ7N5HGOmUG04zIMkc8qx2J
 T4UzbvOp6mQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=bTSo2pz0;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 02.05.19 18:19, Jo=C3=A3o Reis wrote:
> quinta-feira, 25 de Abril de 2019 =C3=A0s 07:39:41 UTC+1, Jan Kiszka escr=
eveu:
>> On 25.04.19 08:21, Jo=C3=A3o Reis wrote:
>>> quinta-feira, 25 de Abril de 2019 =C3=A0s 06:24:26 UTC+1, Jan Kiszka es=
creveu:
>>>> On 25.04.19 05:11, Jo=C3=A3o Reis wrote:
>>>>> quarta-feira, 24 de Abril de 2019 =C3=A0s 06:35:24 UTC+1, Jan Kiszka =
escreveu:
>>>>>> On 24.04.19 05:10, Jo=C3=A3o Reis wrote:
>>>>>>> In few words, what i am trying to do is to access the same memory (=
not IVSHMEM) in both cells.
>>>>>>>
>>>>>>
>>>>>> JAILHOUSE_MEM_ROOTSHARED, just like for IVSHMEM regions. Otherwise, =
the creation
>>>>>> of the non-root cell will remove access to that region from the root=
 cell.
>>>>>>
>>>>>> But this is not the problem you see when adding that region to the E=
rika cell.
>>>>>> You really need to debug the guest. It is creating page tables at (u=
nknown)
>>>>>> addresses which are not backed by guest memory.
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>> --
>>>>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>>>>> Corporate Competence Center Embedded Linux
>>>>>
>>>>> Note: this error from page table translation appears when i try to is=
sue "jailhouse cell create non-root.cell", before i even load erika-inmate.=
bin, so probably there is nothing wrong with the inmate, it is just a cell =
configuration problem...
>>>>>
>>>>
>>>> I think you never mentioned that the error "migrated" from the non-roo=
t" cell to
>>>> the root one when you added that region to the non-root cell. Apparent=
ly, you
>>>> are now stealing memory from the root cell that is in use.
>>>>
>>>> So, can you please provide the complete log of your error and the comp=
lete configs?
>>>>
>>>> Jan
>>>>
>>>> --
>>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>>> Corporate Competence Center Embedded Linux
>>>
>>> Yes, my fault for not being explicit enough.
>>>
>>> So the problem is that i'm trying to access from non-root cell an addre=
ss within the memory region seen by /proc/iomem as 3fd00000-5fffffff : Syst=
em RAM, and it gives me an error:
>>
>> You cannot take non-reserved memory away from Linux and expect it to con=
tinue to
>> run, obviously. If you want to establish a shared memory region, reserve=
 that
>> from Linux, assigned it to non-root as "ROOTSHARED" (I already explained=
 that),
>> and map it under Linux as well (that's why we have ivshmem and the uio d=
river
>> for it).
>>
>> Jan
>>
>> --
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>
> Ok, i was a little bit confused, but now i get it.
> Regarding the map_range() function, if i pass the argument MAP_UNCACHED, =
does it mean that the memory that i access in the inmate within the mapping=
 range is not cached when accessed?
>

Yes, the page table attributes will be set to that accesses are by-passing =
the
caches. That's needed MMIO (device registers), and it needs to be in line w=
ith
the hypervisor configuration for that region, or you will see weird data
inconsistencies.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
