Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB4E3XUQKGQE7QDAFLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07571D8C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 19:21:11 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id u5sf21053875wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 10:21:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563902471; cv=pass;
        d=google.com; s=arc-20160816;
        b=hFqr+aoigyLxBX8L+ucDRPUhW3VE5kzKXapJsCfzGCUnmq9gpOrypjbteX0Cv+xGQL
         51w3PF8/tGlLRSa3O3PBqXRjGYCcJkKc0yiSMOxkaciVYiUmhIG5R0GlWyfNST5dl8OX
         RO23wcDFYl2pRe9F5Dh5IgNFEcDTl8GbmLz8Rq9Rq1h5FLcPl5+fHgV7Ck8LFQH38zcX
         QvdePznO4mV7sDy1LSEjNhenDnLCGODEdmMjVQ0XkJW65edn1Z40sDV//JgTTUMHpox2
         sMfHNsuC7ZfCOhXOJMGgyq8AKsme+790LTjF/+2a7RaKL8XDjHvtZnZs7DdmOO3lpqhI
         Pt5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ebf3shjUgL9cDUInmJjtRP87cLQ4Uq0C22ot1FmcjWc=;
        b=hd3jSOzuhXiw6Kae5Y69SrkiE+lJFchr0I4zk8wPTscHSFYnhQwJigre1fZLSrzgvJ
         MuC39RXwsw6p5qPQTkHjHjYvtyWnaCBPLSPWwVuUeX62PHtmiFtV9inFfnSe4NjphNRv
         fPzcMM7kluyYXLiN0gBV2LFxbuXZbCLrjQ7oRsP8JLP0PuwqDAf4xoRiMu0SEmY+f5yd
         FKkadKpr8xr70lrmDN4I4/SQa/ltV9RDZ7sI6j0m+y6ptWkeZxFVozZXEgN5ZRgfiLuZ
         Svf2ymNWsKe7D045gMS2gfIy+1g2/TX2d6zUmozs329yDCPpdksEayoSe0lmULV74mu0
         o3WA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ebf3shjUgL9cDUInmJjtRP87cLQ4Uq0C22ot1FmcjWc=;
        b=WbT4KUqut9GoacUhzBoptrSYvE2pZ9W8UvPV5NbRAXwmjfHi7zwZczxT3A6b8AuYCt
         kjJ8in6Bu+m/5WTzvnzvixtmD0w9lm9YeFX6OxrPOBJBoRQVSAc2xmqKCuDfbHIqCrRW
         WAEupp9LlS98bq6HT4Ju8+zFshUb7N8tZipXO5U8ZQiU3dfir6Go8JsgYhY5kjvT2J5I
         dqF4x5gqKzuUIFOTsp1lH29BX9YGNvB/CZbqptjwlWlZYiIFjBlRI8d6lOykO051mKmZ
         i8PvaP8IFrXnmbBLC0mNj+IkDQxS0BZskHEm76xTaTUnYdEy3LEXMy8e20ZuMjtvlc11
         /hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ebf3shjUgL9cDUInmJjtRP87cLQ4Uq0C22ot1FmcjWc=;
        b=UcQ5TOGiTzDZjGg77wa1JMC1EOTnz4AH09AvG/oRDArN/PRTSv69NPoB17Q4RU85+e
         h+XK9h2g/M7JPT7a9kcvyeCA4rmqBpExFFXho/0/8HHH0vTyQM+OBuhLYMuKbRWK4gDO
         j/o+LUtLWwqSRkm1fiOdZgk9g1UXQs6kwZnWQi8Gk4l8HnFqDrGFmVGV8A+d7TJj3ztR
         7qkhOkq76UicNyvyG/l5HInnw2B4K5x02ASe+uC2W3tP7gYaQtemQxcxljdrdbbJmWM0
         wZmgWlPywFxZq4xgvapoRVpriTW/rxv17TYSogN1cZ4co74+vhPEdLBHSTSSVkElU2P1
         BRAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV+PzyVsWwTn+AWXr7xLAKZmzU+OPuAkOHflbyDDe8LxehRGICw
	i2RtuZTF/yisL5besgL4jio=
X-Google-Smtp-Source: APXvYqygcq5Kar92OQo6XHkLILNH8L2x0x3Prf9HmVzH40+BxPTp2SV5JTRL9aFYhsyUaXJJ9XwTFQ==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr86531006wrv.228.1563902471436;
        Tue, 23 Jul 2019 10:21:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d0:: with SMTP id f16ls15629899wml.3.canary-gmail;
 Tue, 23 Jul 2019 10:21:10 -0700 (PDT)
X-Received: by 2002:a7b:c632:: with SMTP id p18mr71664844wmk.114.1563902470795;
        Tue, 23 Jul 2019 10:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563902470; cv=none;
        d=google.com; s=arc-20160816;
        b=yolXR/nZjoR6El3GxA+Em+2YrVCVfTOjJAHkMlyurUgoEAwfwCV8na7xeK10meghPt
         1Uq2ZI6vQfa1wQMMiqBEXMeFhCtXRmctgVNOiqQx7mJoOilTU4v5O5Nx5AWbDvLyHG2o
         r6Ue9rjYfCuHoqwNitK7jKatArx+v/cCjZjakg7F5hFVCEKnV471N5uWgs+G7jKpbuyi
         sQAQz2AxwYd3Im65zYkZxF6k7zGNp0i9XN9JwMiRlFG+Fx/zwDGThrehj8O+ErTMjvuJ
         rvgWFtfb0zit/gEUUhmt0d9VFZ1jzbzD/IV7Fny64QO6Vga2An9xHS9gPdA27PaHkOoM
         Xl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=eAc7aqobclj+DqR6klv4HuGCVdyHtFSZCXHSVeZzVP0=;
        b=LT23dSqdXzoX61s48W+/cD/PIwmfzlSxfnaj9YmpFGZePwQCyVvPXGCUv9pyy0JNv7
         7zJerBI02oqsckZidVPj0k6xJ6pj2ywduaZ8aOH1wzQnNxP+0EO5ASRIqXNrTpUQEcfV
         EXCiyhd7TkjtshiB7hTQI5cxJZEa5dUnB01ip0rXxXPuD4nxyXth0+/SJF3GseZ/n0gU
         8jwcrE2Fzwmf62B+UW86MU/qDIzwU5SZu0X0fKTUIb3UKIb3jCgeWRc4smASalNHtmjI
         vzdvdySIjbwdgfneuzB3bmUj8h6TiOHP/gou4TTAht5KRoGZEUbvHScnJ4cP8MuIbRzl
         oaww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y4si1033794wrp.0.2019.07.23.10.21.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 10:21:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6NHLAqu028169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 19:21:10 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NHLApY004299;
	Tue, 23 Jul 2019 19:21:10 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
 <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
 <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <00a032ec-71ae-8b66-a85d-a8f809e2f17e@siemens.com>
Date: Tue, 23 Jul 2019 19:21:10 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
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

On 23.07.19 18:38, Ralf Ramsauer wrote:
> 
> 
> On 7/23/19 5:35 PM, Jan Kiszka wrote:
>> On 23.07.19 17:19, Jan Kiszka wrote:
>>> On 23.07.19 16:50, Ralf Ramsauer wrote:
>>>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>>>> parameter like 8250.platform=disable to disable the probing for platform
>>>> uarts. Why?
>>>>
>>>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>>>> restricted ports. It does touch those ports, as it lacks ACPI platform
>>>> information and assumes 'any' platform UART is present.
>>>
>>> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
>>> propagated the information "this is Jailhouse, you may not find platform UARTs"
>>> to the driver. But that was a hack, so I didn't propose that upstream along with
>>> the other x86 changes. Plus, there are cases where we do want to use a platform
>>> uart in the non-root cell.
>>>
>>>>
>>>> I.e.:
>>>>   8250.nr_uarts=1 only touches 0x3f8
>>>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>>>
>>>> In addition to that I have a PCI device. And Linux won't probe it until
>>>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>>>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>>>
>>>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>>>> to all ports. Yikes. At least I now know that the PCI device basically
>>>> works, but still, this needs to be patched.
>>>>
>>>
>>> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
>>> card, but that machine also had no platform UARTs IIRC.
>>>
>>> If there no other way to tell Linux the number of platform UARTs, we will have
>>> to introduce one, for the sake of this use case already.
>>>
>>
>> Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the
> 
> Thanks for the pointer.
> 
>> platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
>> boot protocol to provide Linux with the information about available platform UARTs.
> 
> Hm. We do have the comm region... It will hold the config's struct
> jailhouse_console. We could use this in combination with
> serial8250_set_isa_configurator.
> 
> This won't enable all platform uarts, but with this we could
> automatically enable at least one platform uart + hypervisor debug
> output. This should be sufficient for most cases.

This is x86 only: If the well-known legacy ports are open in the config and also
the related IRQs, cell-linux could set some to-be-defined flags in the
setup_data, and the kernel could tune the platform UART settings accordingly.
"Should be simple" (TM).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00a032ec-71ae-8b66-a85d-a8f809e2f17e%40siemens.com.
