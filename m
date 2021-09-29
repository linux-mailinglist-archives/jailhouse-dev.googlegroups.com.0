Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBB77M2CFAMGQESGK6WAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100741C1FA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 11:48:48 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id 2-20020a508e02000000b003d871759f5dsf1812302edw.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 02:48:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632908927; cv=pass;
        d=google.com; s=arc-20160816;
        b=VRz87Wm8PBzQcX+IqxCUpNUtqWUMVH857ZmXkIQrC9I8SPBNcLPHZpqG5Q9oj85cEa
         Cfa57C+GvvsxvSxohBmL+coLJzwS8ohHO7FfAO+NR4PmHeg+Edq+ZPCnRVOietWRLYne
         Jh0k6t3B4KX6glbZ9kKBnpZhLwI2x/6tViUcLH5l/2BtK/6Kq9NUokF+P4sds0sMkJCM
         /5uV4EG8w5tiS0hBpXtxduWuQcJ5y2OA3hX4Ah1hqshAH0Opm2/DwDlv0xSw0SdWgCWi
         i96zM7S4+mUxlThiY4p9yajKuiBVaDxmKDIjXOjrtKY5gkteKDNQTEIRl2Jw2cVoTIMr
         mEDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:date:message-id:from:references:to:subject:sender
         :dkim-signature;
        bh=WdPhYM8IvWStl8dPQ+f1sok89ki7wCXOjMB2O24MmiU=;
        b=eJRxK4/0XGikUPlymw4hQKgKkqd9ZpGtW8LiGHnBnDPj5v2aF9zp5ra295FjcBFDFZ
         Akz0ZWAUAl8hEK4Ry3EhLpKOvZxX1QRhe7PZw8uvHiB+H6jbcBz61BQ2hLx8N4l8GanG
         igtvvfhMi0PtXPQwwIUlmLU6xosIiSDTR4+wAD/kl8uhQ2zRZ3aWyFRDQBi6PdIyZiZ2
         CCfy9DHv4XddN/962v0mmLIw973cLcFDGvl4YoIkIzNFLSHgKfHKIKDxiXBrpjb6D8iv
         rJWHrklBpHhc47sV0nU6d5nF6mQr7mC4/EpaLK2ACLA5E722SZ+efCBNdoQw1y6t5DS5
         5BwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=yDVZQiL7;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WdPhYM8IvWStl8dPQ+f1sok89ki7wCXOjMB2O24MmiU=;
        b=Nzpg46rFzkRgWznH82G6DytwN5+mL0L7W/jLqhNB5w0Obh8FCdK/znqTNPzovv7yGA
         2hTLSfmO13Y/z6zkbYc2Jl1BrF6Fb97T0SNsvptDJ1iJDELg8y8LDlihLYgRMYNQk6t3
         RVntjG8OrXli1DOVLpkBCb2KiPR/8fhiqRra99qW1yNe33GsYRTg0LAl8hNQCVNprHur
         qlb/z0zokarZYmzlg8f4A2mmPm4CBYm+nqMG3TJNLzc9AoRxwezmWqSh+omEXV1e2PPv
         mpO1VSkgYunaIHYwcNb4KlW7DhKQBz9RdrNbeNpFu5wzR1HPfTNekiNGVQd6/pieXlsm
         rajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WdPhYM8IvWStl8dPQ+f1sok89ki7wCXOjMB2O24MmiU=;
        b=Y/LIqBVhmIY0qgEbo9zn5c3LRuWSeT5tRr8jA5fzDUOzLa+B8DUkOTAGgxCnMLXlMJ
         Hlr3X4EizE0yKPdmh7415/t7kZYft6pE2CYTXNSRREn7FPVEuiO/UHQsSi5rWoa2Qt82
         XQblNe4YhxeUok7t2aLMAgzgwnbTGpIL3d9vKJlRkaamPBD4AU9+CTnSKamPqkbqLbH2
         iBn6WfXTCKVv2QMEPJpK4ob4e4v/JH4cHr2STWYx51uufk37MVoh0RKuwnb97JSr5Pug
         GJWuoufw5yW0+dMWbguvYPaGH2tviksaqN7bpSN73/fecj7D3bNJ/Bi1ErcmWProTBGk
         q12A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531fK2l5n/hdoCE/z5jYTrHkgcTO+m4hG6ETNyOq0zo6Uok9bzXu
	vqpERngcuXLrj75GidNNClM=
X-Google-Smtp-Source: ABdhPJysTkgsCCkpI+UG4/shAznfFy1etW47iKAaQbLXVm/M8v1n+rUUYF0MHm8a9QQWyyyBRjxa+Q==
X-Received: by 2002:a50:d8c2:: with SMTP id y2mr13549399edj.360.1632908927721;
        Wed, 29 Sep 2021 02:48:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:9863:: with SMTP id ko3ls749913ejc.0.gmail; Wed, 29
 Sep 2021 02:48:46 -0700 (PDT)
X-Received: by 2002:a17:906:80d:: with SMTP id e13mr6764408ejd.492.1632908926801;
        Wed, 29 Sep 2021 02:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632908926; cv=none;
        d=google.com; s=arc-20160816;
        b=fgIxPZ1pH/PRWYI/jzXQ25x3/P8gxVv0u7yb4KAJqj0CPDiWsnkQTmrfphdYW3Gaau
         1uQTvLF4QgdgmNT7luQAStQ2Q19AiNFPbgI5RchQoANWfNfk84/+bx1tEu98YB54ZtSf
         h5IpHWmfyB06K6Ylw95lbmmNOmBEHcJrr/8sC5J6mTJRyEXNmqER/oJ9WMKgmli5BYaL
         Wll3cnsY+sWAcm3+waAdbtJ3I02fIBj/+r/+nySVOAaieZqbyxFUeu4SByNmqWDUY3B4
         ngPP2a9htGAnIH4AIujj2TXyfqMORqFK2xOTdrfOc3eCbrTpFMa8C7DMCNLbS4tg0uA1
         tkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:to:dkim-signature:dkim-signature
         :subject;
        bh=SjnR3tQeKtG1oDP5bAsp7Is9pxacCS5dOoJZy49lP0M=;
        b=JZQS3gBTg+VQDolDfH6mHRMc8nZSS0BBY5D5gPAQ+QFsup4t2Vj8spsGDvJAM3NKRh
         ebhLkFqgs6mpR481xFWUsABRP9wQSGcExVqeU1zIChgE8Rhh4HZylqJdFkVsQR0yPHxB
         GwkzYB8GG2uPTrGo1T2T8TmKDNyoBxnfNG0TGqvIkSTLZYadP4Hm+Y0yLz0wI+5oOqJZ
         q8eIp8rYZ8RudWhX26C5A18kQ/2nseaHSmiaTJDSAv+6cE1C0XIVBs1mFBAC33Lw6gUj
         pXISx1RsRWEcfotsbFOyWWfDCVanXSPhahcpPt7S13rwepVcfuox1MyDKWtRhhJnDmVK
         Xx+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=yDVZQiL7;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id l8si108647eds.0.2021.09.29.02.48.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 02:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Subject: Re: cell create gets stuck on zynqmp
To: Jan Kiszka <jan.kiszka@web.de>, jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
 <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
 <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
 <167c22e4-d59e-1560-c9d5-58dd3d3c1433@web.de>
From: Martin Kaistra <martin.kaistra@linutronix.de>
Message-ID: <31bc8f60-9f99-79c5-77ae-59482f7bd92a@linutronix.de>
Date: Wed, 29 Sep 2021 11:48:46 +0200
MIME-Version: 1.0
In-Reply-To: <167c22e4-d59e-1560-c9d5-58dd3d3c1433@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-DE
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=yDVZQiL7;       dkim=neutral
 (no key) header.i=@linutronix.de;       spf=pass (google.com: domain of
 martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted
 sender) smtp.mailfrom=martin.kaistra@linutronix.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Am 29.09.21 um 11:12 schrieb Jan Kiszka:
> On 29.09.21 09:50, Martin Kaistra wrote:
>> Am 28.09.21 um 11:28 schrieb Jan Kiszka:
>>> On 27.09.21 10:30, Martin Kaistra wrote:
>>>> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>>>>
>>>>> If suspend_cpu() does not progress, the target CPU is not reacting
>>>>> properly on the request to leave the guest and service the Jailhouse
>>>>> commands. Could be that you interrupts are not handles properly. Run
>>>>> "jailhouse config check" on your setup, maybe you are passing the
>>>>> interrupt controller through.
>>>>>
>>>>> Or are you using SDEI-based management interrupts? Would require a
>>>>> special TF-A version, so likely does not happen "by chance".
>>>>>
>>>>> Jan
>>>>>
>>>>
>>>> Hi Jan,
>>>>
>>>> "jailhouse config check" finds no problems with the root cell and inmate
>>>> configs.
>>>> Also, SDEI is not active. gicv2_send_sgi() is being used.
>>>>
>>>
>>> Then it would be good to continue debugging, now trying to understand
>>> what the target CPU is doing.
>>>
>>> The CPU that requests the suspend sets suspend_cpu in the target data
>>> structure, then sends an IPI to that CPU and wait for the other side to
>>> confirm this via setting cpu_suspended. Check if the target CPU received
>>> the IPI, left the guest mode or what else it does by instrumenting the
>>> related code paths (check_events on arm64).
>>>
>>> Jan
>>>
>>
>> The times, when there is no freeze, I can see after cpu0 calls
>> arch_send_event() -> gicv2_send_sgi() from suspend_cpu(), on cpu1 there
>> is irqchip_handle_irq() -> arch_handle_sgi() -> check_events().
>>
>> However in the not working case, after going into suspend_cpu() on cpu0,
>> there seem to be no interrupts landing on cpu1, I get no debug prints
>> from irqchip_handle_irq or check_events.
> 
> But there also arch_send_event() called in the broken case?
> 
> And in both cases cpu1 is inside the guest when the suspension request
> is started?

Yes, arch_send_event() is also called in the broken case. These are the 
logs with my added annotations:

broken case:



....

Activating hypervisor

psci_dispatch: 0xc4000001

[   18.583357] The Jailhouse is opening.

gicv2_send_sgi: cpu 0

irqchip_handle_irq (sgi, cpu 1)

gicv2_send_sgi: cpu 0

gicv2_send_sgi: cpu 1

gicv2_send_sgi: cpu 0

irqchip_handle_irq (sgi, cpu 1)

irqchip_handle_irq (sgi, cpu 0)

irqchip_handle_irq (sgi, cpu 1)

gicv2_send_sgi: cpu 0

irqchip_handle_irq (sgi, cpu 1)

....

[   18.681300] CPU1: shutdown

psci_dispatch: 0x84000002

psci_dispatch: 0xc4000004

[   18.688683] psci: CPU1 killed (polled 4 ms)

[   18.693551] All CPUs removed!

cell_suspend: Running on cpu #0

About to suspend cpu #1

suspend_cpu()

arch_send_event

gicv2_send_sgi: cpu 0

suspend_cpu() loop



=========================================================

working case:



....

Activating hypervisor

gicv2_send_sgi: cpu 1

irqchip_handle_irq (sgi, cpu 0)

gicv2_send_sgi: cpu 1

irqchip_handle_irq (sgi, cpu 0)

[   17.908806] The Jailhouse is opening.

gicv2_send_sgi: cpu 1

gicv2_send_sgi: cpu 0

irqchip_handle_irq (sgi, cpu 1)

irqchip_handle_irq (sgi, cpu 0)

gicv2_send_sgi: cpu 1

gicv2_send_sgi: cpu 0

irqchip_handle_irq (sgi, cpu 1)

irqchip_handle_irq (sgi, cpu 0)

....

psci_dispatch: 0x84000002

[   18.008498] CPU1: shutdown

psci_dispatch: 0xc4000004

[   18.014133] psci: CPU1 killed (polled 4 ms)

[   18.019385] All CPUs removed!

cell_suspend: Running on cpu #0

About to suspend cpu #1

suspend_cpu()

arch_send_event

gicv2_send_sgi: cpu 0

suspend_cpu() loop

irqchip_handle_irq (sgi, cpu 1)

check_events: running on cpu #1

Created cell "inmate-demo"

Page pool usage after cell creation: mem 62/992, remap 37/131072

[   18.055831] Created Jailhouse cell "inmate-demo"

> 
>>
>> Maybe there is a HW problem? But why does it seem to work sometimes..
>>
> 
> I would call for a HW problem only after truly excluding all software
> issues.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/31bc8f60-9f99-79c5-77ae-59482f7bd92a%40linutronix.de.
