Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEE4GDQMGQEIDDJXXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 687573D12D3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:50:53 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id a5-20020a2e7f050000b0290192ede80275sf1357914ljd.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:50:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626882653; cv=pass;
        d=google.com; s=arc-20160816;
        b=QepSYsybMmciDVpbQLHapTtzUO8CxMBeKoml0lk+UgY7LSAehanzbi2DN7dtdk5gFs
         CZlVDC3UyGjjuhZVXmC9y0dtoWg5DrmYHCI8SQxNjVb23zTqRTHTyuayibjFpJi+ueY2
         XhWdWF+Dk9rr1A8hnBQztWSRL61Fo+OLpsNLH5XCNH1EmNvB3OIWYigcxBifcA/MAxSn
         dMn+p3mQhVoOamKfQUOfwUS1b7rug50x0KG4fCrnqZHtKCrm29Lvsvv+33ve6C9yt/Ss
         /TP9+90KEMsY8XgQRjTG6sFhBPLKl30pWDvmwA2663rTGyixye2lS+AIm3IgU2cgg1zI
         6QKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=OZBXUS3JYA8A6Sy4dnWNU5Vfk/RBoU2daYgZ3e3kkeQ=;
        b=qOD6CpWmEra/EnGhljFHqZay59rzGsPfuzCU1Qs/XY2LyvvL+IrQbnWIhBoLOz/5QW
         kuJT4MfdOAmnY9c0sYLR4NYgQnnrUxCJI5Zkfta5JyfXqsib/tyAmkCVNtul/9tJAoPR
         vcWwXH8ZdvIQRT30/wdHw5Drx+tFmfUGlWDVXc8J9yUlGgv02JmABnbzkqe61n/iFaUX
         w9ANclO2p0fjI86phX/Vnlqmnl5wjnoFjcXTWLyZWpN4eMr9HInn9T4EjsC9R3FK8uiT
         ClN8d3HL4Md0KlCEotuhRTNMIgST9O5QiJg+mSaCUK0HEbwr4jtbk9hqRWEcD/SiOu2h
         hFOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OZBXUS3JYA8A6Sy4dnWNU5Vfk/RBoU2daYgZ3e3kkeQ=;
        b=cjCBHXjUNpDUM5BZAms30IezIUjxXXRZLAffHCnQkvNvaTyGES1pGeSsgy2Opopa3B
         dCsKIzvpdYMotKltpRIYBvuvbci1tXFWvJn174y14dygYb9vF3l6QR6s3vY7MlSAtwel
         q1H+3srCCPww1BDTkHH4JmivtOxHDLX7ydxCaZl9B0dbSv+pHj5xpedYZNjnr91+Ihpn
         bTAJcvxfbpxERLCvxHev1B63Fe/eCMuCzIInRSGBSoil9dLsCiP6VzCjQLBe8J1/eN9i
         OvwuJTuaIIRTIZxbgYGcOtuyR3CUgwF1+15wklut8i2Jtj5rm9XupnnaW4Na0OJbNpCM
         zTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OZBXUS3JYA8A6Sy4dnWNU5Vfk/RBoU2daYgZ3e3kkeQ=;
        b=h/kxJ4E3Ju3lmXRWs2WKy8XRtpC03oYbrdgdr2tSXtWWmghb6MGflkEiRpRsjg8lV+
         JTBjB6aH54qL9cbM1v1M/IqDq55/+2BannFlQzCv4OWag0MuauAU0dYAGjl2bNXPfuHS
         uVnqraLPqd1+J2PMgneerhvHgohmnvlhJK0t7PexPoCZwLatEte2ZS0t+TfLDSlEwoRS
         jJiunUesYVW4vcDF/U3465wiZtmwHxn2b3QwhvsT+6gWqORuCl1Lz67rNHVUZQeYbNlT
         d6bhf34hJ4BxOkz+7Kt6agsFRBxIDv6Gmp3jQZym9Ie2kpS4JcWFEPzyp1NH2OR3OMRN
         OSyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bV/Z8pPdCig4l2kcrjtJWq8bsZ9kXoe3PTi8zCN16ceo0QVCZ
	+b3/+GB1+0wB5EXTq4SN7/A=
X-Google-Smtp-Source: ABdhPJxh5wHMYchgXXAs6VsXgo+vO/iByqNbrHdyywzIzqvCPvjdvK3DJtGlRczwtZHx+vI8Ixqxog==
X-Received: by 2002:a05:651c:211d:: with SMTP id a29mr1301440ljq.78.1626882652906;
        Wed, 21 Jul 2021 08:50:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls1314782lfi.2.gmail; Wed, 21 Jul
 2021 08:50:51 -0700 (PDT)
X-Received: by 2002:a05:6512:3c9f:: with SMTP id h31mr26674773lfv.662.1626882651766;
        Wed, 21 Jul 2021 08:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626882651; cv=none;
        d=google.com; s=arc-20160816;
        b=fXp9KdkciWx9lfz1zRDj8ECUWEL1RhPf/dsl2Tyj4LWv11a2YIRcTbBCWA2jZPHAIx
         2L/qZ30AYfSa2W2MjiBmtgc1Lbxapsbg89oU7J+PtRV3Erw09ytFtNR0td2WjH4wzyga
         ltSeIq8ke4ImxVntTNW/K262vm/U+ggHGhnCG6fwpCsDVQP/zVw0reKF9exFRVQmPb+E
         0aeXm0EYJcocMwtSdjdtfKv+hD6Z6VKno42aSVwi4Rmk8xkBXvUwhF8gzdBwlsccr9dU
         rqprrkH2Ym7Egm68MNUgMO99qNLkFREQA0/MEYQ5ieowh5Y9yzyfweQrocVRMs7XKWWZ
         jzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GYifaVywGIZ1SiCB4orDzjBu/wRtHco/TltLEmROmWE=;
        b=bptNJ72OlOXGibdMO8+3ppfL2kWcY+Aos+q/boYSprhJrFVRaVSCIylrzEMbUymV09
         lX4+MXvZilFb0FOkgguhJeJbg4yaUu4FBSFGf1upQJ4wiN7LFWaUWd5FE/C7iB7uJtbT
         MfI/1OLpxS9I6Dpdd8tAgIaPSvQd8VHAX8ClApEb/1Syxv9wXfnTnW5f8LHZI6BzZViZ
         sgU9m0SUTdHuSo0s2frbxN0Uw3g5pXZsUqv34XR+/3J/UDydjhSf/eExu0/qtzhxWQXh
         lKnHksd+o1+2cBoqaOxHdQ/lwLRQPC/KwWXD+A+fSc9r2S0MfDmXwe+G7aq0vyepssxg
         x9+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d6si770263lfk.4.2021.07.21.08.50.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LFooJt007260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:50:50 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFoolb028193;
	Wed, 21 Jul 2021 17:50:50 +0200
Subject: Re: Ivshmem-demo: root cell failed to receive interrupts
To: Huang Shihua <shihua.huang@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com>
Date: Wed, 21 Jul 2021 17:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 13.07.21 18:09, Huang Shihua wrote:
> HI,
>=20
> Currently, I'm trying to run the ivshmem-demo to establish communication
> between Linux root cell and one non-root cell. Configuration files are
> attached.
>=20
> Two cases were tested:
>=20
>  1. Let the non-root cell load the ivshmem-demo and then target at
>     itself (target=3D1). _All interrupts can be sent and received correct=
ly_.
>  2. Let the root cell and the non-root cell send interrupts to each
>     other. I.e., root cell runs=C2=A0/./tools/demos/ivshmem-demo -t 1, /w=
hile
>     the non-root cell load /inmates/demos/x86/ivshmem-demo.bin -s
>     "target=3D0" -a 0x1000 /and then run. The result turned out to be,=C2=
=A0
>       * the non-root cell got the interrupts from the root cell,
>       * _while the root cell did not receive any interrupt._
>=20
> As Jan mentioned
> in=C2=A0https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51B=
OCgAJ,
> tuning the iommu index should do the trick.
> However, unfortunately, it did not work for me :c
>=20
> There are 8 iommu units on the hardware, I tuned the iommu index in the

Wow, 8 units...

> root cell configuration from 0 to 7. The same behavior, no interrupts
> were received by the root cell, remains when tuning the index from 0 to
> 6. When the iommu is set to 7, the kernel crashed immediately when the
> demo was started on the non-root cell.=C2=A0
>=20
> Any idea regarding why the root cell always failed to receive interrupts?

This may require in-detail debugging. For that, you would have to
instrument the hypervisor along its virtual IRQ injection path. That
starts in ivshmem_trigger_interrupt() (hypervisor/ivshmem.c). The
sending side will call it on writing the doorbell registers. Check along
this call path if conditions to actually send the IRQ are not met.

If all are met, the hypervisor sends an IPI to a target cell CPU (will
be directly delivered to the guest) that should cause the normal IRQ
processing there. But usually, we do not get so far in such cases.

Another function of interest here is arch_ivshmem_update_msix() when
called for the root cell while it defines where ivshmem IRQs should go
to. Possibly, Jailhouse decides that the programming Linux issued is not
valid and therefore leaves the irq_cache that
arch_ivshmem_trigger_interrupt() uses invalid. You can also check that
via instrumentations (printk).

We likely need better tooling (tracing) for these hairy cases...

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3372d9be-7223-0713-50bd-8db705d4f0e5%40siemens.com.
