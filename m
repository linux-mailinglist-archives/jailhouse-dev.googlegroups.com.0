Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD5DYH2QKGQEJX4C2MY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB31C42CF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 19:32:00 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id c7sf5969688lfp.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 10:32:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588613519; cv=pass;
        d=google.com; s=arc-20160816;
        b=yUDLzfKfud7s5AMWA2yWkZ67fDojVoWRvdscTM/k83HJMzoAIU2inHX/VlHz7M0klS
         d5iRWQ/B9/2qvETKAohRuiGzpgRPTCFDZi0G48zCXaz8EwG/9Dv9dA9754vkjf68tymn
         6s+yHayjiCRBIRwbr35pFu+ewAAcNUObQBnmyJXxxAcSKtFbYUHfgSjaBx8xYwkUoz87
         09F5COrqWOXbZFkVFD0AlV9GFSPC3EZqS1bRexl9p53tD1JSknUEmYxgHYF7TQDtvO/l
         jlRe6aKBwiAoXMI1V3FyrDANGm+y9Qh2UsG9SW3Ge6yuQD09qFMrr6ZrcNzu037+tmXp
         LVhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=KdFcHJbYIQ1Swh3dgHIfQlpXD/iOd6eMzjWZG4mIk3w=;
        b=eDVWRbdCUm56x9QlThONgMMg6gWCOdGofgirQNWc4xDOVcLqoM8d5qVoTMfeXF05XI
         lUwJwHkqUgZC3h6nttw7C8xiqs8YwZa9vqwdcqpd3EDWDkK3JVkiki3ztm+xxLK1OBFi
         +SDz3z1Y496iDplUQUp5AjsCdhnF2RBJ50Sv9wYzr0D/PXFPYnNGI4UtpiY+sCKCofUm
         vqa9t7z0Ldotbblr0TiXrL17FqGKMTTtxntSV/nsfWmLKX4Q9zSrjL1eFICJA9fStxX8
         of/oKCmiq2/VD/hAo9zhiBLAlA9Hb0E96gF6O8ciRBNhiCJuY5lDUG+wMx8odyun9XFA
         0Dow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=brWZcPX3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KdFcHJbYIQ1Swh3dgHIfQlpXD/iOd6eMzjWZG4mIk3w=;
        b=SUgsQBeVRk0dxgnDRPrqJxhvd4/NQ36C0jHCpj9GzsEDfGDnPmZchYn4rgHsceTKFt
         omw7ZsYCTecw61T4yxSzvkJPdk0benq8vTtyd9gqSaAUwFvv2RV8PP3+MrJ8SU+YCv/T
         nHQFGc27YjG0p05LOoklxOToWreXTd1gt6m2bJsZRctMlDj0LiFWervS8ncewp/B3qyZ
         41b4qt84EOvXUYvgGMkQfLA6E8fLQO3R6wdjMCyOcl9TibXe7qIpsZBouhr6V4suIJDa
         BpcHwTcLi94KVGbBOizEdFxEDl+VxiwOlmso/7FUoZPwDW6rTb/KCIeyws+f6sZdydxC
         RNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KdFcHJbYIQ1Swh3dgHIfQlpXD/iOd6eMzjWZG4mIk3w=;
        b=LUp4E96yWlBrIALDhbniItXbYqSHEno20jcfdBB1Fk9A0IAhJoL9VrqWED5aCaIGRH
         iQ5fyp97AjqG3D+MgNKoBP534NKJWVBHwB2eAWLcWjVc9ulw+MmHHrkeS+tTOPxwipif
         ROmz9IgXJMSN5Vaejw93FozSuy6EJnEez35ad4RxPBbvpGQiL+BhS33Cna8cBlv/OIFC
         IpKlMG2SpKdxIdnxp1SmU43rlSH14iUFvB7PkrZpu+4vLPyY6xvlU+7gOgaxX8ddJdMh
         IDDfHkrWYmm0uCMU1Uly/e6Sbm4kM5zDbpkKAmz9tSDFiLzcsFXftxBIwT4YxINyff54
         NRrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pub9fmStG/6XJZ1S9o1B19vD85IkUTehebW7Hva8U1Rn2lh/LS5O
	IITISZgOnRaPNjr/kpP7lCI=
X-Google-Smtp-Source: APiQypKAqenLyy6WX+eZ6fjR7ZBOEUDyufK0dpzFbYRX9YBoK801aMB+Ooc9TmWL1KujcuqWvMuhdA==
X-Received: by 2002:a2e:593:: with SMTP id 141mr10350929ljf.271.1588613519646;
        Mon, 04 May 2020 10:31:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:288:: with SMTP id b8ls2908194ljo.8.gmail; Mon, 04
 May 2020 10:31:58 -0700 (PDT)
X-Received: by 2002:a2e:8807:: with SMTP id x7mr11109834ljh.173.1588613518850;
        Mon, 04 May 2020 10:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588613518; cv=none;
        d=google.com; s=arc-20160816;
        b=Aba0k7j+3+ZIt+M/PvgeVD0T2c2fBslOqlSF9SHwgDOyAUdHwbEjIwflwQCYjzR7vJ
         ScHaHBAvwdjV73eQ24TUgnrBRotYjQOZEkUrBYnS8gkT9GToeOBVONdltINFgvz+5CTC
         Scm76u3EEq59W2RwKzg3nnOGTgGId+ewXyEbQTRMzdXHn3eP4b/NTbv73Q60zHxqfYsF
         U3ZdoQU4PEucubBIqs18I4H5xAVdVnPjyqUBY4pXIO6ca7p3KN6vxj9FVYyViw70Ius9
         s7d6DT51iZ0W+83VIfCUR4/AJtM9sAvTB2S1CtRP+SoHsPMkwBI22ru8yhxUQxUcyd3y
         hUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vdLKr6xAO9Miuw2oB5uL7YwwFhUElzVNNOq4vKJsvPU=;
        b=DQKPkFMdjOIX8fFR8Hiipze/4AU2KHbrM/PERTBSkXRlJ4aurjIeWU+pCB+sbu3SWi
         Tr32lHC8FTvHF7KLvMdbmlnWZTHeYwLXiC+pKqkDgt2nubXSeDCxIWDipjpZwwR5RYiV
         zE1LYNFv3v1BbGudS1WzxhVoRKzZ0GDp9IGotfiXDpuA4jCpMwqP01/Y1qYVz6gla3z9
         hdxpZZYLWiL31jmvolA25JWWPnaWtx9MjzyIkk7IsjuEMJHkYlrGccSZ7RNnqjO7/rnF
         Iq1RWu1/H/IahOQD/1/DU2w9U1r4Sv19gP4otrNDXDk9vtq+b9lAGs3n8L35YoPKWmVh
         losA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=brWZcPX3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id f25si483844lfc.3.2020.05.04.10.31.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 10:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ls95v-1j9VEQ3sbv-013xGr; Mon, 04
 May 2020 19:31:58 +0200
Subject: Re: ivhsmem_uio driver update
To: Nikhil Devshatwar <nikhil.nd@ti.com>, henning.schild@siemens.com
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
 <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
 <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
 <d0581908-3ee2-ad16-6ac1-c0741ab0c6b4@ti.com>
 <a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de>
 <3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1b204e60-9f9c-0f85-5779-482f8c64ab75@web.de>
Date: Mon, 4 May 2020 19:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:nE2/cHn2WFuragnIEabBIzW/tQjhHjnvcJo02KnGxjacvZsHSxb
 GuwYYgYEQSsvYRGPtZfJnYYuBCdRlz7aBaoEm6JXjuu8prDHPiOHXRPI7D0hy5gyAWiPxIO
 WDFwzZLJftvETAdD0KNtzcVbSHSHrs2y2aoCVItE4dxDaT80eYB1ff+BGuDcfElzqUsmHAZ
 B3MI3YWq/j+KPjkyjPziQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lPvHMLQFedk=:C5UTQLUKrrK+WlhD+YqBsz
 TSZUcpp00fGJwc/wIjjLVIfuGpNeG1uBK/Ccv5LqnjRniUckWJtZF3+fG8tzhoaBZgBP2nVbM
 4Ugxk+GTvOT3KqBBGj07047tt85tIHoX2XP5OyQDzyPjZa2C/rLWy7TdjmlvDVpD48rVWAXJu
 onZCf+z+AdrQgD2WZ4GaPTT5T9KZzfr6bVwYHpVSGYePdn6+DCg58WpHLdgyODkJLaj5HCf1r
 mA2Q6mISDe8upSXHtETdhALQXChPh5kez20iPCCQZs9pbn0tRDfettNnJb4LjF55H0WF4Ta3n
 WmcO+btSvY9Lt0rZ+vXmPz9Hwkc0n6sXt00fuon8oz6hueF7CNVzL3lITeNKD2q9HXejTsB9P
 q/nW6VMYbWsd7WRqCIwCh/yH0GMaBvxQ3I+FhpkqjiGA6pqN+qwfxLlm5xg7UZZTgBiuhc3/O
 dK8JaqoI0VgxUWFvLlAUl99y9mGavCDcmFCw7mwUFWNYhB2Ml17ttozoBfPCks6BnuNQe9uSM
 w0lIjSa+5jWZ44l+1YsChFaVeOJlOZsgvauqWpcuDPab781C+2jje9jp3CU3+V3cCCtIqKNtc
 ennUpQaNkwTNMl0baDVP6Vqu3YV0y1yomNEXS1EunJbxcgPFYlh4jc8slLGeddecp4inIT9i6
 J7jynzyzOsgvg3ujAFT7poZQtk3ZgMFRFOMPSGco0Tel9QOXatOLFXzCcNZBWNHu5enHxg64h
 4RvJAB1I02ubqVaHWAixOT/2Npy9xT96qll9pXtP061oPvsSmnvrA43aTbwrGlRVmK8aVaw+w
 tqIH+DfP+osGcunLj4zRBLQ21ZtRoOQ5PC5StpDWv6HIb5AB+cU+pqLeb9U1nTP6HhZDDQtHD
 d1i4GMCD+0afY4Z/CPn4cM5OqEhXxb339a2SZslDIcCxHo1sNH6lobrLdCEmtsEjbXM1TgRMg
 mFjhI7oCZa/HiWku30eT93ndCdNh+HiPCz9eu+uZ+m7LpitmyjAWHya+IsLO8Ao3f2IiA0YgR
 j8BqzckkKoGBVb1OPgEK9L7+FOTBdpKGRYfhJiJAY/sF8d0kpr8yhnFNztYap17ofB0di1zLt
 fZEBO5HAi1y1XfKdx8DDGrId/emf1nWQ7dmDW73TbtvV3sLHRaqFOP9RJja3NiS5Q2ZANaiTk
 t5/WuXRPxQiF9Tu5q7vTy5BSbiKuSqsssos8P2zcgLpwTxx+0GTUWMM1aTFlT5Xfm3TuE2gTw
 eklWnmIqNWxiwUjYV
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=brWZcPX3;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 04.05.20 19:20, Nikhil Devshatwar wrote:
>
>
> On 30/04/20 8:13 pm, Jan Kiszka wrote:
>> On 30.04.20 15:32, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>
>>>
>>> On 30/04/20 7:01 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>>
>>>>
>>>> On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>>>
>>>>>
>>>>> On 09/03/20 4:39 pm, Jan Kiszka wrote:
>>>>>> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>>>>>>> Hi Henning,
>>>>>>>
>>>>>>> As part of the TI SDK, we were integrating the ivhsmem_uio as
>>>>>>> external module
>>>>>>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>>>>>>
>>>>>>> Since the ivshmem changes in the Jailhouse, that driver no more
>>>>>>> works (because of the vendor ID change)
>>>>>>> Do you plan to host the updated version of the driver in this repo?
>>>>>>>
>>>>>>> I know that the driver is already part of the siemens repo but it
>>>>>>> is much simpler to integrate an external module in yocto.
>>>>>>
>>>>>> Actually, that new driver is a complete rewrite, not just an ID
>>>>>> update. It allows to securely pass access to unprivileged users and
>>>>>> provides all features of the new ivshmem interface.
>>>>
>>>> With this driver, I can get the uio device registered but when I run
>>>> the uio_send and uio_read apps,
>>> Using the uio_send and uio_read apps from
>>> https://github.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM
>>>
>>>
>>
>> Yeah, Henning already suggested to shut that repo down as people are
>> still finding it...
>>
> Hi Jan,
>
>> Please follow the *updated* description in
>> Documentation/inter-cell-communication.md regarding demos.
>>
>
> I am now running the tools/ivshmem-demo.c application.
> I am getting failure to mmap the registers region because the default
> sizes for most of the ivshmem regions are multiple of 4096
> When runnning a 64 bit kernel, mapping a 4k memory chunk in userspace
> fails with EINVAL error [1]
> How can this be fixed?

Are you using a kernel configuration with PAGE_SIZE > 4K? Not
recommended, for a number of reasons.

BTW, you can test that this works in principle via jailhouse-images,
qemu-arm64 target. Eventually, there will be a TI target as well ;).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b204e60-9f9c-0f85-5779-482f8c64ab75%40web.de.
