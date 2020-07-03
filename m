Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBOHI7X3QKGQEW764III@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E21213F2C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Jul 2020 20:08:56 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id f5sf32341687wrv.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Jul 2020 11:08:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593799736; cv=pass;
        d=google.com; s=arc-20160816;
        b=HgoSm0eRLMSF9KddpM7PRNCpxQ5vxeh645qguCtgMeWEpt1Kdo5fRokEFitJYjKqbt
         tqSAOq7BexpUT3F+nUvE4knlD4RBaW55FbiaS4/Ml/pvBPCXTYMK33c8x+EKTX29UwEl
         8MOmn5TjejQlTVFDuwLpbiI1GXZHpHqDqr9cZPNxjN0+1JBH6YUPULdR6gO4NEAloeIY
         /QUD5wTWFhr/pXhiEqctVwQUvDTuX83L858NtmyLT2OA6aX61puA/TFEDKZKzYyFMviC
         KXbRlluw3bQW6u0Xt38RdEJybirWQLr1KewaERLP2gV8RaBZcx40copqqMo22YSwn9Yx
         wslQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=F5LdsO2UwMCtKmkEm9XBgZBTpPnHZE2IzuZz3ar8Enc=;
        b=d30yawyA5iCvOI8SF9TF2FEndtOFau4XKJPM7DrP4kZ5yq197FXBx+kLuE14DevcL6
         o+vNJthB/mhZ0uw72EEZsJXO7V1vMLjfmW7TM0EpvXqhowuP4FL8qzHHH9V8n+NS4vLj
         M7B5B7KbNEQIKqDsZa6DG09hZDRYpydfj4RIWrM4El+dbGO3LGpC61rPxzLLZ1UG8i8y
         zWKBrl+gnoQVouLb4ZDQc9QA/DXDOl49A7Zs5N7BaZFIWCq/ebdE1LOQMV/uFzApNYgJ
         qHHhoCOhTJsADpoZ6+XT+Z4Eqd5j8Ey7BDC/RyrrndRA0ObTmmqgn7TbuWjikkjZeqai
         9Qrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMBXLKq2;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5LdsO2UwMCtKmkEm9XBgZBTpPnHZE2IzuZz3ar8Enc=;
        b=GQVnd15flH1uuzrYala0TTts5oDQ/12ajBj1+RbzEOeA9w49r13qp4TviVyl6FjcIY
         8xfmYdQLI4sTLxRUcqXMd8unw2plnVTkV3at6cxQf87WImLJLDMc586pD3NJwsFLVkuc
         VXT/4w5ZNDoIgqFsXeq7zA9K6+XULrsXv/Hqsbi/g6Ga+VFKirp8ApNU4U3KyvzpHJBh
         w8+NP7VigQoe6MvctvqXJJjcn+nR+lUs+ouOv7QB7f3C3YX+t50Okthtoo6TVfENUV2W
         6xSGRSEVsQgOM9iOGkeJvc34XYWn0ARkcLLiiZcC/iSQFjfU1le5Q3SmlZfEbNV+h1+K
         OSIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5LdsO2UwMCtKmkEm9XBgZBTpPnHZE2IzuZz3ar8Enc=;
        b=FBG4jrKbS61G+Qpgirh+LVWDlK/20JjkzkqOy5zv81HInxGK6HFt+J4qNwj2NyI3Hb
         y4lAlcgyrqKCYQR4rD+QWRSJIqqiP4hTl00ibNnXP4yT1moFWZqBwS1VviamBMZa/GMC
         zeNtZ2usAxgNUi6fBS9deUJKJ2Y9LUfu/YfSZzyL/im2JAJyPXPh2/jSKIlyY33YfyL+
         JeHduPfJPBdCMQWkLltR+IjiCiyXt7/fZDKZQUtacqsMKxUIVmoExawzzaqKggI1dRei
         cMOmNidLha67VA2yxudDRdBTnpdjES1rtEQ2x9KyTmqmwVEFlL6ooGX7nf6K3owVgIhz
         w/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F5LdsO2UwMCtKmkEm9XBgZBTpPnHZE2IzuZz3ar8Enc=;
        b=tQWqZp1Y24alKttyp2L0KCHY+jX65ry4qdgmIjPmnwSGXdppc7/On/humG+c3dcmlo
         FWGIQHPmfXTJQMxvLjZfZMqW2wGOl32u28hrH9xKNIn1771B3cxKRYDtwcBd7EyfRh1K
         Zq3g5XGKjIBYdU1Y/u4QZTutqKalGurWyROSAiTcq589VMI1lbVjCJes/G0OMHl+ttcV
         QfMuIKMYnKa9t+RX43bYlGvszIvdQiQbKtxpQ5JcYIC3OKOLkVGvL2UjZyv6g5zvXRtV
         +QsFHmOVQeHyOGRCFzF+bDZggMXPadsT2pUTib7BZBjXkvyUX39p0qrfbct/KftT9Tfa
         xyqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Nl97Az3Tzt+eeRn3zNMdARm0QnVR1DO+rMaxqhX7JdyAp3JwZ
	PlhXji7l7ooOkOTsI44UtaA=
X-Google-Smtp-Source: ABdhPJwvg+mV8w199tY32REYHru1PviMsOePlc8bsr/+e5vmCG/o7C7KxnaaUmvR3M2uewHGUL5U1Q==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr40523914wmt.154.1593799736470;
        Fri, 03 Jul 2020 11:08:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f58d:: with SMTP id f13ls2152891wro.1.gmail; Fri, 03 Jul
 2020 11:08:55 -0700 (PDT)
X-Received: by 2002:a5d:6809:: with SMTP id w9mr40526198wru.182.1593799735515;
        Fri, 03 Jul 2020 11:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593799735; cv=none;
        d=google.com; s=arc-20160816;
        b=iaYryG1fpHADHh2BeQrX5Z5gM1KD/QWryYVKmPNrVCiA34UNZINzWguib3/CWSNHVc
         TAuQobGQuJYmMIHLNsUByJTTAGD+1jL3q+VroFf7KVF9RsPYFsGEbNIesd4R1psAkqMe
         tGg4GI989nvU1ur4uubYf5jA3JLXCYLQKPBMEAeF7K+4Md1XfFK6k3TQqGczpURiTdBC
         1PZF+coPBIS5mnCM68Lk5G8BYKf2vIaF5TVO3mfpW7yWzOsVKk6wAZJWcIFYdddPhYR6
         HlRFinLPglAYO628jiFzAZVG/J+7Tzr5MRv1edcwAELCn2GSC5X9PSJy8zwtRuRlPzAN
         BoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Vb+P7yJSGkOFLadCdGcEmDOXNU/LVNssGmmK+poHn08=;
        b=xZG9PycrvndUWFQKe/I17iGwoWyTCIo4uN8W+F93RiIUiX3mFZ3fIPjML1jkgou6b9
         MCqdXcgfWn0mG88uNTCsP9ckkQMI6n5veTx3rz7wcEf5Cpu4xrkS+JMA/ZRFLHMNUdPs
         qQoYY7WTtmRt9lpkdHCiBADLK50JyaMhZWxtxnlYMhmguLVidYZNHm4E8FVpDMup7hjm
         +sJvdhgGMHgujCzAMUMz8qypo9b4jLA5bETLg4f/UNihgZfFpuykQEwIj/OAtz759P4E
         x8dQ78Xw/pA9vInKnjBYXG9RjiY8+kon100+eZGeu69xApNeVOJ4ZACA3RB12BzB9ccK
         8KPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMBXLKq2;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com. [2a00:1450:4864:20::630])
        by gmr-mx.google.com with ESMTPS id q193si91429wme.0.2020.07.03.11.08.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 11:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) client-ip=2a00:1450:4864:20::630;
Received: by mail-ej1-x630.google.com with SMTP id a1so35154617ejg.12
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Jul 2020 11:08:55 -0700 (PDT)
X-Received: by 2002:a17:906:410a:: with SMTP id j10mr21653943ejk.201.1593799735118;
 Fri, 03 Jul 2020 11:08:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3509:0:0:0:0 with HTTP; Fri, 3 Jul 2020 11:08:54
 -0700 (PDT)
In-Reply-To: <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com> <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com> <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Fri, 3 Jul 2020 20:08:54 +0200
Message-ID: <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
Subject: Re: jailhouse jitter?
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>, 
	Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, 
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, 
	Jose Martins <jose.martins@bao-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=qMBXLKq2;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Adding Jos=C3=A9 Martins in cc (direct gicv2 injection was his idea) as he
might be interested in this.

On 02/07/2020, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 02.07.20 18:45, Jan Kiszka wrote:
>> On 02.07.20 15:31, Angelo Ruocco wrote:
>>> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
>>> <jailhouse-dev@googlegroups.com> wrote:
>>>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
>>>>> BTW, regarding direct interrupt delivery on ARM: In
>>>>> https://lwn.net/Articles/820830, it is reported that Bao has "found a
>>>>> way to map interrupts directly into guests". I didn't find the time
>>>>> yet
>>>>> to check if that is actually exit-free delivery, and that as a smart
>>>>> trick or rather a problematic hack. Or if that sentence is rather a
>>>>> misunderstanding. There is also the sentence: "Interrupts [...] have
>>>>> to
>>>>> be mediated through the hypervisor, which is unfortunate since that
>>>>> increases latency."
>>>>>
>>>>
>>>> I found this interesting and tried to read more about this.
>>>> I found some commits at [1] which does the direct injection.
>>>> Here is my rough understanding:
>>>>
>>>> * He is not setting the HCR_EL.FMO bit and that way all virtual
>>>> interrupts are turned off
>>>> * There is a new handler for handling "lower_el_aarch64_fiq"
>>>> which ends up being handled by the Hypervisor
>>>> * GICD is still being emulated so guests won't be able to route
>>>> interrupts to wrong CPUs. Isolation is maintained
>>>> * For triggering interrupts from Hypervisor (SGIs, etc) he is using SM=
C
>>>> calls and has a new service implemented in the ATF [2]
>>>> * I could not understand how the lower_el_aarch64_fiq exception is
>>>> fired
>>>> so that the Hypervisor is invoked
>>>>
>>>> My guess is that most of the code change ihere s to enable interrupts
>>>> in
>>>> the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL1
>>>> directly.
>>>
>>> Yup, that's more or less it.
>>>
>>> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
>>> set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and they
>>
>> HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking? Cannot
>> find that in mine.

Ugh, it's a typo, I meant HCR_EL2.IMO, my bad.

>>> go directly to EL1/0. The virtual machines have complete access to the
>>> gicc and receive IRQs without overhead.
>>> As you have already pointed out, gicd is still emulated, so all the
>>> operation of "enable/disable/set_tarrget" are slow as usual, and still
>>> under control of the hypervisor.
>>
>> And so is inner-guest SGI (IPI) submission, I suppose. Just like on
>> Intel (so far).

Yes, everything that's gicd related is still handled by the
hypervisor. The logic though is extremely simple, so the cost becomes
almost the same as an empty hypercall.

>>>
>>> The problem is that IRQs are completely invisible to EL2, so Bao needs
>>> to use FIQs for its internal functions. And to do that the only way is
>>> to go through the secure monitor in EL3 for each operation, having
>>> custom services running in the arm trusted firmware.
>>
>> Ah, interesting pattern: FIQ becomes the NMI that enables such a trick
>> on Intel CPUs. If FIQ triggering architecturally limited to EL3, or is
>> that SoC-specific?

It's arm specific, FIQs are meant to be only used in the secure world,
so EL3 and secure EL1.

>> I'm not fully familiar with the ATF/TEE world yet, but your approach to
>> model that service as SPD seems to block other use cases, like having a
>> full TEE (OP-TEE). Wouldn't it rather make sense to model that as TEE
>> app?

Yes, it could be done as TEE app, but done like this shouldn't affect
other use-cases, that we could of think of anyway...

>>>
>>> I've even thought of trying something similar in jailhouse, using the
>>> linux driver that, running in EL1, could let jailhouse access the IRQs
>>> even without the HMO bit set, and therefore allowing direct IRQs
>>> access to inmates without the need to put a custom service in the arm
>>> trusted firmware, but I found it a bit too intricate.
>>>
>>
>> You can't use the guest to model management interrupts that are there to
>> interrupt the guest and inform the hypervisor about a high-prio event
>> (like "kill that guest").

True, and you have a lot of other problems having to rely on a guest
for hypervisor tasks.

> I started to read and think about this more - and then I suddenly found
> SDEI [1]. Isn't our problem of having a non-IRQ event already solved by
> registering on / sending some event 0? And SDEI is implemented by ATF.
>
> That would nicely overcome all the problems of the baod patch to ATF
> (integration, security, missing gicv3 support, blocking of other
> SPDs...). And even if I miss some catch in SDEI, the principle of
> synthetic events defined there is what we want for hypervisor management
> IPIs.

Oh I didn't know about SDEI, it looks promising, but in the current
state of the arm developer website I can't find any useful
information, it doesn't even seem to be mentioned in the arm
architecture reference manual.

> The only downside: On a safety critical system, you may rather want to
> get the firmware out of the picture during runtime, to reduce the safety
> scope to a real minimum. But, IIRC, GICv4 will solve direct interrupt
> injection in HW anyway.

Yeah, in the GICv4 specifications there's the ability to directly
inject the interrupts, but depending on the field it might be too long
down the road for someone to wait.


--=20
Angelo

>
> Jan
>
> [1]
> https://developer.arm.com/architectures/system-architectures/software-sta=
ndards/sdei
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CADiTV-1oJBD%2BSkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w%40mail.=
gmail.com.
