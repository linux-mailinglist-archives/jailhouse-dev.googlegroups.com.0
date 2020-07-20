Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB65A3D4AKGQEA372VFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF52271C2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:45:32 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id s12sf253575wmc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 14:45:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595281532; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y5aFdme80dRia0lVSMq5NNufbSwuyCkTUodnc6WLuO73RkPP2vEUlwGlvp+FijEBmn
         nT07dhuAGDBGRbfvlTZjwlka43P9JKIiig6tV03T3sRHnL/pD7K2DQ22GqLJ/yLO1vNu
         oEmwgkDnyLm7KSYnrFMVmeeVh3YMTOESZyDHDhFmWTpSLG72sE1Yn4uHiP+8MV6EvIi+
         3mph/2OHsxs+LNFC+9rM+nCGpqPEyBWbFYMyPYkq7ijschwE/xyBbjLujomkLE2q0C6D
         0JEIFgsmMrBJBX7qbqmjNaOYjaSMP+nIJ9R2xUtVFQsJjPIXJt1JoqKZuRc/6hjV2pV+
         Vftg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Mt9XkpssfmAES6t2xe/cQF3EdyKvWZe8i6CdsBRVU7U=;
        b=o/M2ZK1lbf4YKbnflx7gfdSs9T6EUnDiyleFgEq7rdHL66Ky82XmeM9bIZzjNcVTWD
         dNfiweDKE2nlt9NbXZCn4mWUJ1vPCHGQHhFDcs427nttYoy6it219f3ZMimxME53N0bH
         PGr3iltSUssxp/Epcu0O/LlP4S4uhWYlKtF3dH/nk9zGb8vklLBUVRq/FsSXtz61cLuB
         C8sxgGPc2wb6PiWMm0eHgKKba8y0lLDiE/5GLCDi+fVyovia/hvPLZq68XSRVAqWsm3a
         ygVOP/+Gv4+R13ytpkRpDUxL1Yt+QRQCieng7BE56TDUqr9YhrPQxYtk+biuuRNng1d0
         eelg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mt9XkpssfmAES6t2xe/cQF3EdyKvWZe8i6CdsBRVU7U=;
        b=P2abfGOeLBSV1CyexgA2tEXjkUpbaajDcQQAOQ7BLeXv+GVHG47CH9QSBL6Q8fCggc
         OT+Ck3rWQBhvDefUI5s/tDKPOSLMeX8r4hoBrYFgRJDVKiSS3Bw5UXhyI/ojjTyC9Hmi
         U/Og7Rz+3MHI7uv9ZayNpZXXoeskjdW4N0l/hBbtpKa1ShSA6hUtKwz+bulVLlhYHSI8
         XbGS8TFBy32jubmrVm9b4pHHh1Rx+AooAqvmYReXuDs73FgFjnLGpVrwkqBOvGYxrA8e
         vcarIkTM8ihMdt5I82mrwus7CW13JhaLFvDQgbGNg5dEC5nMWTMqYvIX+StUHLiiwiPp
         5iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mt9XkpssfmAES6t2xe/cQF3EdyKvWZe8i6CdsBRVU7U=;
        b=atMi19oyaOCdaoU78cL6Tk+ArdxWVNlRbp1GdmEKqzI6hWdhCFhJg/seOYGl/16thW
         rFZjT9zVUBhR2Gp+HpDiS1MmWFZEJK8GOMA9+iHxI2cnFswOfZKPzTvlOH9vWGdJap5C
         Tf9OUULDhv+gR5zlNDXEOv8TgtUOrMwBTcCvqxrV+9Ds7XEvSlPPLRPP9WmqdxXCv2SD
         hgHV8rWYAMbft7+W/TkPtBkvPy111kz31nHrXJAFQcrXQLfA6/fKB7RQ7/TUtR5PsiPF
         n6Ihz2u0b4tIRqH/f59G56mm3bo6jGuqu1o03AzpVoRv8woklv0+wc5S64tFIs9hqpfa
         Yvyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hZ6lAo4nGJtj21xuqvdT2tm38GLIpC4IVuv0SQvWv45NQvuCn
	pQ+fN++/fTtCIKJA1FDFqYA=
X-Google-Smtp-Source: ABdhPJwvLAwGs09w1WOMJb+d1KY1qx/w3HkxYRtt9D1f5p0ZV9kyeyHjYpvHAd1LRSDfE0iMMzS7/g==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr24700753wru.142.1595281532128;
        Mon, 20 Jul 2020 14:45:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7311:: with SMTP id d17ls157534wmb.0.canary-gmail; Mon,
 20 Jul 2020 14:45:31 -0700 (PDT)
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr1154512wmb.185.1595281531397;
        Mon, 20 Jul 2020 14:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595281531; cv=none;
        d=google.com; s=arc-20160816;
        b=KTl5WdSrN+czMM5qopRmULWNZNyFxqWfZo3+489ZL8rDxkwncR1hVYNloN18uJ1kCE
         3wK2ORByQlvVczEvi6BnwcBpFibuZtXfM/498UejuLiUqsdKhgXJXhP4oIA1EcWiwo7I
         PqaQ37OZ5Xzc3BLzi3Otv3uPk8h6L7gMulzNE2HlT9GBbVA/7jSLptSf+g4ESeYl16pg
         R2RJeqAKtpyC8RsGhrbkFC1xIQXsJvJl4gsZz5fKSWE7jRVSzcQvhZVcUd1TbwJ71qBY
         h15pDZdKJgG4S2Uk+MKBtVceYDkyOyHfnsfEPkTjkbBR1AdwBkLi9vuWGiiamteskI04
         UeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=hSFXKY+08/MpIMwqpFLwmBTY5hab7PlLEu+Sc2h+B9U=;
        b=nfqON+ty3jrCaZR35PnwX95rV37h2f3qx15ET5QUeiZqIB3s6UYB2rEg+gevXnHZwm
         Cmr69eYvcAevxCiWioOGpUcAW0BaEgphzzWAvcNxscYdCLeGY7hMyrp6gjnq54WGgZID
         yEsbHOZN4tMxwPmv1pFvtJjmgM0mjEDoty+0zTLvsEJsxuGTyvb43U+UDWI+iNNKB4Px
         oRzaV2K/4w+6FhzPLGDZnLSsQhRn/6rpFuhcuRmJ7bv4Q/DphskRoLxmMuIB2a4tYv2m
         /bZ8dZn0yPh/DYY7sV/iffaDPz+UXR8MPGbKEfmTjjGaasLDrD4eDFk5M7UFCI+VVEAq
         2Piw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y12si259923wrt.1.2020.07.20.14.45.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 14:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06KLjJM1011180
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jul 2020 23:45:19 +0200
Received: from [167.87.88.27] ([167.87.88.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06KLjIhF009278;
	Mon, 20 Jul 2020 23:45:18 +0200
Subject: Re: jailhouse jitter?
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>,
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
Date: Mon, 20 Jul 2020 23:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 03.07.20 20:08, Angelo Ruocco wrote:
> Adding Jos=C3=A9 Martins in cc (direct gicv2 injection was his idea) as h=
e
> might be interested in this.
>=20
> On 02/07/2020, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 02.07.20 18:45, Jan Kiszka wrote:
>>> On 02.07.20 15:31, Angelo Ruocco wrote:
>>>> On 02/07/2020, 'Nikhil Devshatwar' via Jailhouse
>>>> <jailhouse-dev@googlegroups.com> wrote:
>>>>> On 02/07/20 5:14 pm, Jan Kiszka wrote:
>>>>>> BTW, regarding direct interrupt delivery on ARM: In
>>>>>> https://lwn.net/Articles/820830, it is reported that Bao has "found =
a
>>>>>> way to map interrupts directly into guests". I didn't find the time
>>>>>> yet
>>>>>> to check if that is actually exit-free delivery, and that as a smart
>>>>>> trick or rather a problematic hack. Or if that sentence is rather a
>>>>>> misunderstanding. There is also the sentence: "Interrupts [...] have
>>>>>> to
>>>>>> be mediated through the hypervisor, which is unfortunate since that
>>>>>> increases latency."
>>>>>>
>>>>>
>>>>> I found this interesting and tried to read more about this.
>>>>> I found some commits at [1] which does the direct injection.
>>>>> Here is my rough understanding:
>>>>>
>>>>> * He is not setting the HCR_EL.FMO bit and that way all virtual
>>>>> interrupts are turned off
>>>>> * There is a new handler for handling "lower_el_aarch64_fiq"
>>>>> which ends up being handled by the Hypervisor
>>>>> * GICD is still being emulated so guests won't be able to route
>>>>> interrupts to wrong CPUs. Isolation is maintained
>>>>> * For triggering interrupts from Hypervisor (SGIs, etc) he is using S=
MC
>>>>> calls and has a new service implemented in the ATF [2]
>>>>> * I could not understand how the lower_el_aarch64_fiq exception is
>>>>> fired
>>>>> so that the Hypervisor is invoked
>>>>>
>>>>> My guess is that most of the code change ihere s to enable interrupts
>>>>> in
>>>>> the Hypervisor. Resetting HCR_EL2.FMO would send the interrupts at EL=
1
>>>>> directly.
>>>>
>>>> Yup, that's more or less it.
>>>>
>>>> Just one clarifications, Bao *does* set the HCR_EL2.FMO, it doesn't
>>>> set the HCR_EL2.HMO. The HMO bit lets the interrupts through, and they
>>>
>>> HCR_EL2.HMO? On which revision of the ARMv8 spec are we looking? Cannot
>>> find that in mine.
>=20
> Ugh, it's a typo, I meant HCR_EL2.IMO, my bad.
>=20
>>>> go directly to EL1/0. The virtual machines have complete access to the
>>>> gicc and receive IRQs without overhead.
>>>> As you have already pointed out, gicd is still emulated, so all the
>>>> operation of "enable/disable/set_tarrget" are slow as usual, and still
>>>> under control of the hypervisor.
>>>
>>> And so is inner-guest SGI (IPI) submission, I suppose. Just like on
>>> Intel (so far).
>=20
> Yes, everything that's gicd related is still handled by the
> hypervisor. The logic though is extremely simple, so the cost becomes
> almost the same as an empty hypercall.
>=20
>>>>
>>>> The problem is that IRQs are completely invisible to EL2, so Bao needs
>>>> to use FIQs for its internal functions. And to do that the only way is
>>>> to go through the secure monitor in EL3 for each operation, having
>>>> custom services running in the arm trusted firmware.
>>>
>>> Ah, interesting pattern: FIQ becomes the NMI that enables such a trick
>>> on Intel CPUs. If FIQ triggering architecturally limited to EL3, or is
>>> that SoC-specific?
>=20
> It's arm specific, FIQs are meant to be only used in the secure world,
> so EL3 and secure EL1.
>=20
>>> I'm not fully familiar with the ATF/TEE world yet, but your approach to
>>> model that service as SPD seems to block other use cases, like having a
>>> full TEE (OP-TEE). Wouldn't it rather make sense to model that as TEE
>>> app?
>=20
> Yes, it could be done as TEE app, but done like this shouldn't affect
> other use-cases, that we could of think of anyway...
>=20
>>>>
>>>> I've even thought of trying something similar in jailhouse, using the
>>>> linux driver that, running in EL1, could let jailhouse access the IRQs
>>>> even without the HMO bit set, and therefore allowing direct IRQs
>>>> access to inmates without the need to put a custom service in the arm
>>>> trusted firmware, but I found it a bit too intricate.
>>>>
>>>
>>> You can't use the guest to model management interrupts that are there t=
o
>>> interrupt the guest and inform the hypervisor about a high-prio event
>>> (like "kill that guest").
>=20
> True, and you have a lot of other problems having to rely on a guest
> for hypervisor tasks.
>=20
>> I started to read and think about this more - and then I suddenly found
>> SDEI [1]. Isn't our problem of having a non-IRQ event already solved by
>> registering on / sending some event 0? And SDEI is implemented by ATF.
>>
>> That would nicely overcome all the problems of the baod patch to ATF
>> (integration, security, missing gicv3 support, blocking of other
>> SPDs...). And even if I miss some catch in SDEI, the principle of
>> synthetic events defined there is what we want for hypervisor management
>> IPIs.
>=20
> Oh I didn't know about SDEI, it looks promising, but in the current
> state of the arm developer website I can't find any useful
> information, it doesn't even seem to be mentioned in the arm
> architecture reference manual.
>=20
>> The only downside: On a safety critical system, you may rather want to
>> get the firmware out of the picture during runtime, to reduce the safety
>> scope to a real minimum. But, IIRC, GICv4 will solve direct interrupt
>> injection in HW anyway.
>=20
> Yeah, in the GICv4 specifications there's the ability to directly
> inject the interrupts, but depending on the field it might be too long
> down the road for someone to wait.
>=20
>=20

Forgot to share:

- https://github.com/siemens/jailhouse/commits/wip/arm64-zero-exits
-=20
http://git.kiszka.org/?p=3Darm-trusted-firmware.git;a=3Dshortlog;h=3Drefs/h=
eads/queue

All a bit hacky still but apparently no longer exploding. And without=20
runtime exists of the gic-demo.

SDEI turned out to be more effort than expected because it is enabled=20
only in very few ATF targets so far. The queue above adds it to QEMU=20
(arm64) and ZynqMP (tested on Ultra96). TI-K3, RPi4, ESPRESSO/=20
MACCHIATObin should be similarly extensible, and all that also in=20
upstream - at least as configurable feature of those platforms.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b96f90ad-23bc-db73-9603-f9eb640804d0%40siemens.com.
