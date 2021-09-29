Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMF2GFAMGQEVHU4KLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680741C2DB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 12:40:58 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id b139-20020a1c8091000000b002fb33c467c8sf1009692wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 03:40:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632912057; cv=pass;
        d=google.com; s=arc-20160816;
        b=BG7MrLAM4rr97O85ucE2EwWSoBwj9fRFt960JR8Hod5Alj/cQP6h2G3q+/fbZOJh/f
         qz2VtoSKpEu2QyNaTpFruY6614dbNXD5WWc9YYoKutUTvNkvgSmdHuxl43c2iO0SSpnl
         N3BocE+BOKpeKw8BH4PK0GjCT4LjtXM04aD+MMPl4W/uJg4xGgMqPcUmam8T5iATJs+G
         bQCVewP35wZHBvvM535HUwylZb9PLbX7/t83hqJd6pTSzFQZTxgpaKMqwIxHV6Q0yf1g
         U1wZ+ePc2aaL4R3LJ/UgYsG3Oo1Wm5dUS/BoCWD8ttW7/WUWNLK2VoRjzhX+qCS9JTUQ
         Ahyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+leIHiqjAQ5KWMJIJa5tBL6RE+hQdXSl59is89lqYFM=;
        b=Ze3c2NCUK6ieVBGdI0HMl/49qmqZza0tP1begDXhTQp1uh4f/+kU5bRV86lhrfnNfo
         YMbupsbWFIyTPndTGifnNJgIKNb4/C1c38qqLEPkWu5gSkO0BIIJ4mNX7iVh21Lq+sUw
         Ors4B8ZqzgpN0QwYzG58oTvuttSawa2qF26pym43mcBjtKT7Akq2vlIM11s+n/vIru57
         BRZLjbq8SZaQjk+EfE2+QOSmOIspUgZckwwQxiZyOHEOVNvOmx6q8mPo+YV1EkD2o7Lm
         kxFCyZI6fOL/RiKpyWsiPHKfp3PBevBxaKdVni3qzE6MA+BIk6gz/EpIg/mFW+64wwfc
         8Y6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=T6f6b3MP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+leIHiqjAQ5KWMJIJa5tBL6RE+hQdXSl59is89lqYFM=;
        b=tvAouy0qI9KVsJzXBW9+35EkVpqBvSEmx+L14b7AtXBMy/Hq9OYMG3ZtqgSqLUD4qa
         O2CpnQGwuX+AqTBYmbFIEdvZSqw7SiSAV3kkMSxA118a4BZXXswvrjSVXj/oq8HWA18L
         HH3S/uHjD7x9cxfH3/qeiSXYrg1NdvoyknSCwxOAKbxKeIkhPdU7Vp+OCzCN+JSeg7ZI
         TMm5bMa0tfnM5SoWxETM843ccuCLwpBIA9zydotpmhGMD9UQ7lcKznIMHzhgHRbYYANK
         7Th9a6aXZtdukJcOlfeK+aiURz78IyoXW6BQMSqaadnY+kChKWwcttTxbeuu7iFok8s1
         iMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+leIHiqjAQ5KWMJIJa5tBL6RE+hQdXSl59is89lqYFM=;
        b=ffDrPKhjkbW7Dukc9dyw9IT6LkAzIrHSrgZCs5aqLbzZTS7yd4cS4ldzwbY8hTvi0D
         yY9Usgm2YmK37D5BmwnvNiW2FOAnlKCnHTCTVfcO6DtnZUIiBKW2avBpC+5c+RZumAwl
         lC7nMSuJ4ivHwHEiA/tOP/0uk1VpkwBwhPrXbzNkPD2J19IYHaPBfPgzx84AM+DQX/pO
         Juzct6D+IESGun/Nj24me5KMGdq/N/VKcgZBnkrbYFnaXJINqLomTWpokINHJa932caH
         T/h/VRyr1SklA4gColRsb3t9napAe+rl8GZ0zUBBNZJxQn//H4CmIWhb4mbwH5ePkG2N
         l9kQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531B7Dc3qLJAYS5hsN/cZi2AOComU/buYXJOagRCk5pW3Airb1DR
	Ikeyk3g9ozYrDOu2/EKR5F0=
X-Google-Smtp-Source: ABdhPJxWYJ+PxTnUVPDec2819L+l/QPhPcf21S2H0colV3eFSdIlfgTF38smF9EOIEgyFEJzpBvAkw==
X-Received: by 2002:a05:600c:489a:: with SMTP id j26mr9555302wmp.111.1632912057756;
        Wed, 29 Sep 2021 03:40:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bc51:: with SMTP id a17ls2458627wrh.3.gmail; Wed, 29 Sep
 2021 03:40:56 -0700 (PDT)
X-Received: by 2002:adf:f782:: with SMTP id q2mr5840653wrp.203.1632912056793;
        Wed, 29 Sep 2021 03:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632912056; cv=none;
        d=google.com; s=arc-20160816;
        b=QRL6SoXsdJB3MEeIjtb3jstcxE7ZiM220oZ3zV1+uvcCc6KoFeE84Pd1RJ4ru4Hd3X
         qayo6MQahsrAbRkvwNSANPumkeoGUsrDuAkr7lfv9NCrs/Ivjsq3d+2Ct2oqtb9x/4Pq
         Fxy2ugiUyKXOl8a2XwXgcw332QgREsKDjT6zGyaiI01HJfu5qutiDKnfzN1QBflX+oi1
         E5DMrFS6jZB1YChZwIS6uWDo+WWL6FW3ytHU9jfEdlwqRhEROsnia1USzPu4DMhKQEk+
         Hz4G41SxLV8eaHzYb5vPN/04oZjHvc6ilfYwfgClxUtFr8cJmOlx8/z3MLbbYUno0oEg
         Iq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=7pD1M6wFi8sto/vRGyQvc4mwHNNI5zK5jy/Y/h/T1gs=;
        b=b6apJVJzf4OKEPO/uMwGaTlzMGxPcoaH5Jvgq9QzI+5Htrgk9eM6rR61L6qQIdwCb4
         LdztGnY0QzXzkOQFfWDhJUrJ2Vmz8Zfamjfwngncy8LhXIpFBoc/ef4aAjoMddpt+gCz
         LiNoiMbEysIx+W/1zdjWbz43vx14PTNs4oNgYGAxeZRHrdsQZCPqQqLeSuZDALSOndk1
         Wj+MpYQLt7LMt2smn7z+110G6SR46rx49xpk82yaGY3/Osao3iCqjiOhLJ9pXUn81K6E
         tH6Cw+cVs7df7Wsmk4a4O6vX8gbQAT1XKr9Yhl7C+GPDo+XFNQSDOafgxDNQPR7hTm3C
         5Pyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=T6f6b3MP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id o205si529581wme.0.2021.09.29.03.40.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 03:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LmLK6-1n5Pje1Sfi-00ZwAT; Wed, 29
 Sep 2021 12:40:56 +0200
Subject: Re: cell create gets stuck on zynqmp
To: Martin Kaistra <martin.kaistra@linutronix.de>,
 jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
 <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
 <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
 <167c22e4-d59e-1560-c9d5-58dd3d3c1433@web.de>
 <31bc8f60-9f99-79c5-77ae-59482f7bd92a@linutronix.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f987bee6-cb32-efd1-9baa-541185f20479@web.de>
Date: Wed, 29 Sep 2021 12:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <31bc8f60-9f99-79c5-77ae-59482f7bd92a@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t5LtgZJIL7LNsKVSVDl6oJvTMuhxmpjWb1xUBCwrbUfeW9VnPJJ
 2AxB6OagDunAqDQrTzeIyb5I7/YIpdAWiXl3zN6UVDWCDLFssW6NZQEWmqN7yQTAsca/1Eu
 tQBIez96ejsLufC08WfNi2sNffx1Kiu6Y4i1ANTBgX2prPmjf7i6yvshavw4bGOdgqjXpM5
 417vlyNVwgCn0Q46tvOLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3fXNq+VN+B0=:4jLUyX2PxVrs+2mWZ//ic6
 OWFQ4yJPiC8cnhBK1YwDdDjHB39p0ecnnQgUjb6ivRWfzmVleC6nOlp4cZ5kVzqwIXrt7MWm0
 KRG5catfbP3vdVKvtUibNJ3FvBuOTPKjg7WQ1m7iiOCbn6Ac5uTH/e3rxyn7DJMQfncvFDpbS
 q344CF8amJpYmeH6nonqOzj3RWOy/Tj76+rtnGa18lP1XYP6MlTqjJgEvpUcTaWl4NBWxKCrF
 5ot1VKrT1I3PjTDt6ApgVjnTdVCs4eTVxY3pnhOypPFeL7mmf+e+y3p71tHghgk6IqlYuQUsQ
 U//2TlkWoPpdLW+fAFBtfERZkCJnGFt2PVR1SRG6/vJnMmiFvDAidadz6CQEHe5YjKKggHKLx
 mf/k/Imgk/1HUglYJ8rOcmpD4IOO317EGuLJo63bq0kTgECtqvPjPsVIxId/iwtqA6cC8mq5l
 f/msYgc3HBKYTfepbIRPVyx+y12TKLJGipV2Fhiecd2LqFIYkUMzmNHebVyQvEznCWwJ1LrYi
 070zFBJqYuxKaqjG327PvC5id8hSgUEasrZbz65Y0mWzzMBHTNtYU8VZB6Bsq/LAc3eOcyQeU
 2KE26U4AEe85ntaf4fRKvNOEZE2DCBOBjnMsj3bFJMVTFYU8g6uCZ4Uzy6iRQHp3wvrg116jj
 DBD9O/Z+o13k3JJAdSQFDNYus5u9Dz6dEi+wLGs0fuwHWxflz4pnPAgtQdfuc3Dyy+wf5m4jy
 auZuj3/pl+fCC8IE3yhY926782HE5cYUKY3fXOZmcvPfUlCy0VtIhSfvtiaNJ3A87bEqmreW+
 sQqqCASNOU79WLuahACyTnZAJ7hRL2r0wouyVxl4I3LBEgTIFj/rda8Nnzh8JjIvTaXMarwjX
 vr+NdLQWsMxGjxxE6K6+5nNamIJCiuU2o/4w53nrkUrPydbV6t8zlDJtmXuwCvEt4RVWYaBCz
 CJL0MpjSKzvvQYDtmK3S5eZ3tTcFb7Mhqx9vCPAa4M2nMqCqrDxaIguFl3ZCEC2zhrpWwNXqo
 clIA6xAycgcuNAFn+4Vm159tAoGtSTLBuO5oOyMuKCoBWUvqH5ch/hDvY79GRs02qak7p6lF2
 C7zCP1fKALd5thvO3Q8qxB3wevqLss6W08ClXKanMa7SxBIUwNeh1H6uRuLCx2D1TNTZ0DxRw
 Vn4IJH6yBopUubVgpgSElNQ3Y5
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=T6f6b3MP;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 29.09.21 11:48, Martin Kaistra wrote:
> Am 29.09.21 um 11:12 schrieb Jan Kiszka:
>> On 29.09.21 09:50, Martin Kaistra wrote:
>>> Am 28.09.21 um 11:28 schrieb Jan Kiszka:
>>>> On 27.09.21 10:30, Martin Kaistra wrote:
>>>>> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>>>>>
>>>>>> If suspend_cpu() does not progress, the target CPU is not reacting
>>>>>> properly on the request to leave the guest and service the Jailhouse
>>>>>> commands. Could be that you interrupts are not handles properly. Run
>>>>>> "jailhouse config check" on your setup, maybe you are passing the
>>>>>> interrupt controller through.
>>>>>>
>>>>>> Or are you using SDEI-based management interrupts? Would require a
>>>>>> special TF-A version, so likely does not happen "by chance".
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>> "jailhouse config check" finds no problems with the root cell and
>>>>> inmate
>>>>> configs.
>>>>> Also, SDEI is not active. gicv2_send_sgi() is being used.
>>>>>
>>>>
>>>> Then it would be good to continue debugging, now trying to understand
>>>> what the target CPU is doing.
>>>>
>>>> The CPU that requests the suspend sets suspend_cpu in the target data
>>>> structure, then sends an IPI to that CPU and wait for the other side t=
o
>>>> confirm this via setting cpu_suspended. Check if the target CPU
>>>> received
>>>> the IPI, left the guest mode or what else it does by instrumenting the
>>>> related code paths (check_events on arm64).
>>>>
>>>> Jan
>>>>
>>>
>>> The times, when there is no freeze, I can see after cpu0 calls
>>> arch_send_event() -> gicv2_send_sgi() from suspend_cpu(), on cpu1 there
>>> is irqchip_handle_irq() -> arch_handle_sgi() -> check_events().
>>>
>>> However in the not working case, after going into suspend_cpu() on cpu0=
,
>>> there seem to be no interrupts landing on cpu1, I get no debug prints
>>> from irqchip_handle_irq or check_events.
>>
>> But there also arch_send_event() called in the broken case?
>>
>> And in both cases cpu1 is inside the guest when the suspension request
>> is started?
>
> Yes, arch_send_event() is also called in the broken case. These are the
> logs with my added annotations:
>
> broken case:
>
>
>
> ....
>
> Activating hypervisor
>
> psci_dispatch: 0xc4000001
>
> [=C2=A0=C2=A0 18.583357] The Jailhouse is opening.
>
> gicv2_send_sgi: cpu 0
>
> irqchip_handle_irq (sgi, cpu 1)
>
> gicv2_send_sgi: cpu 0
>
> gicv2_send_sgi: cpu 1
>
> gicv2_send_sgi: cpu 0
>
> irqchip_handle_irq (sgi, cpu 1)
>
> irqchip_handle_irq (sgi, cpu 0)
>
> irqchip_handle_irq (sgi, cpu 1)
>
> gicv2_send_sgi: cpu 0
>
> irqchip_handle_irq (sgi, cpu 1)
>
> ....
>
> [=C2=A0=C2=A0 18.681300] CPU1: shutdown
>
> psci_dispatch: 0x84000002
>
> psci_dispatch: 0xc4000004
>
> [=C2=A0=C2=A0 18.688683] psci: CPU1 killed (polled 4 ms)
>
> [=C2=A0=C2=A0 18.693551] All CPUs removed!
>
> cell_suspend: Running on cpu #0
>
> About to suspend cpu #1
>
> suspend_cpu()
>
> arch_send_event
>
> gicv2_send_sgi: cpu 0
>
> suspend_cpu() loop
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> working case:
>
>
>
> ....
>
> Activating hypervisor
>
> gicv2_send_sgi: cpu 1
>
> irqchip_handle_irq (sgi, cpu 0)
>
> gicv2_send_sgi: cpu 1
>
> irqchip_handle_irq (sgi, cpu 0)
>
> [=C2=A0=C2=A0 17.908806] The Jailhouse is opening.
>
> gicv2_send_sgi: cpu 1
>
> gicv2_send_sgi: cpu 0
>
> irqchip_handle_irq (sgi, cpu 1)
>
> irqchip_handle_irq (sgi, cpu 0)
>
> gicv2_send_sgi: cpu 1
>
> gicv2_send_sgi: cpu 0
>
> irqchip_handle_irq (sgi, cpu 1)
>
> irqchip_handle_irq (sgi, cpu 0)
>
> ....
>
> psci_dispatch: 0x84000002
>
> [=C2=A0=C2=A0 18.008498] CPU1: shutdown
>
> psci_dispatch: 0xc4000004
>
> [=C2=A0=C2=A0 18.014133] psci: CPU1 killed (polled 4 ms)
>
> [=C2=A0=C2=A0 18.019385] All CPUs removed!
>
> cell_suspend: Running on cpu #0
>
> About to suspend cpu #1
>
> suspend_cpu()
>
> arch_send_event
>
> gicv2_send_sgi: cpu 0

I assume, "cpu 0" means the sending CPU, not the target. Let's also dump
the value that gicv2_send_sgi writes to GICD_SGIR, to check if it's the
same in both cases.

Furthermore, it would be good to instrument vm-entry/exit to identify if
the CPU 1 is in guest or host mode.

Jan

>
> suspend_cpu() loop
>
> irqchip_handle_irq (sgi, cpu 1)
>
> check_events: running on cpu #1
>
> Created cell "inmate-demo"
>
> Page pool usage after cell creation: mem 62/992, remap 37/131072
>
> [=C2=A0=C2=A0 18.055831] Created Jailhouse cell "inmate-demo"
>
>>
>>>
>>> Maybe there is a HW problem? But why does it seem to work sometimes..
>>>
>>
>> I would call for a HW problem only after truly excluding all software
>> issues.
>>
>> Jan
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f987bee6-cb32-efd1-9baa-541185f20479%40web.de.
