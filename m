Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMXU7ODQMGQEJ2FWJOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 121AB3D6680
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 20:08:51 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id n7-20020a05600c3b87b029024e59a633basf258158wms.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 11:08:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627322930; cv=pass;
        d=google.com; s=arc-20160816;
        b=yy3LGdnb1ET+VdCT7CdXG3teoQavUP/h34Miw7L3tLh+HUAJUGs8vRxMt8M06eO9zg
         1+P+YHFwOGIGAq2H7W+U6fsRzrlxHb3ldOhxydFHq1EFEFTRAtwiX0SjClHiu+I8+PBB
         tco6IPN6tR0VALVyzRywGOmQNSuf0WvL0BDlnWP6736lxNEKxHy8VjaqG0JahjeIA+Vg
         sD6WMWkrraslCcnHbpW3tudUBtGPrZovAhMbQnn0cYYu6SJontKT2BgjknY1YOAjjbgF
         iZnlQ5fh9c6RzLHWjtkTyqURkjeJ2LpCD0Y/7YnNfLOIa7J3MJGYYnbNh6OiFtTrfuha
         1mww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=5MJdA/MvXRDoDbO0PH7oiQ+5VYMEjddYRUNzW3R0Hqc=;
        b=fVbQzaDuFhQyyS/yDuhYnohS+jwk1mYs1yhxBQoN+DXw8DdlNWAjmLgHVKH/XyikGr
         Enu9c7P/M+MX9keJXUIfZIybsxIniVDj6kZXdlzQwe52NUzjZOR2n2GvBEoPLixr0tJ5
         vFZS+U5poCUIbf/Cw3tO7HvWanXDWUcdRqkErzpgQltroegjeDOfRH6y9CqtdbX4v4NF
         2vL583njpiLVOPDpm9mKqrffauO+tpEGz/WNnrfocPvLRPN3ifaVB94k9sqGd5DUUlEm
         K4fUqwGcFlLH6UyFGHfh8TvreQ+Cau9JYMb/7TR7kQbHOR7K8o6GWbAET2pEaygInNoB
         +zbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5MJdA/MvXRDoDbO0PH7oiQ+5VYMEjddYRUNzW3R0Hqc=;
        b=KA9nTbHiyRBTuYoinShdC36U1XuEwYHoHmbDEHTmHKxhs1NwKMHyM3PbYSFlsMWkd+
         g7N+812Uf/pgR3Szfbn7YfzYIkFF0HRspY9tspWqqaC7U/ABlZPROrxMpwVMTjColWV2
         pyWcBvqlhWy3vSHEL/kLuDcnDQyKyS9HPEh1+IXn1jBvjJAR0/flMXkRDPtHxc0DR6y/
         4EJtZatGIeCuCePyFsQbhRkJLN5KUIEmMv9/iO9wnNpmm3xdWPchd/gzEC0ptNQydBfL
         jVPcAMPddG7Mti2PVSRzJPfWe53El5UNGkTJirlHKelxy7FBeUvEy63YYHFMsRp7tWEh
         xxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5MJdA/MvXRDoDbO0PH7oiQ+5VYMEjddYRUNzW3R0Hqc=;
        b=GxcthemEmI2xM4N9rUqStsauPtaxbHbAm7l42FAkP6UDvePkC/fi2KwaS2nYGnP3qy
         Lg5Stk053F/s1BRD5X2Gpi7fWSlk5/hjDQq83K8ksVI/WgPYn8eCt/+KNtW1WcFsmfVn
         /lUbUTS1EM9I74z+8C3+rmSozjrNRp5jv8ixnsQJWTR4dah7U3yj1KvvyzIM6TNk2vBW
         5pH9FWrWu7IHFSx6rMFobMK9uydb342MMsPfUoyMQhsT265EWjAK6HP3BRqNWo5Hqdke
         IDzHL9cCwqQz17bnoUqiHoWl70W4j7U0qqVUzY50z/jcYL6pfRCk+dpflkbBdiq9cup9
         8j1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZmzJ7ACpUEKDB2Xz9qTZ2GWf+31BcBH2Yj93woBR7XZBNwsFW
	OQONde12FZLqRdq/Cfpw+lA=
X-Google-Smtp-Source: ABdhPJwsS8qe1dxdjrNj3d08v0dYu2F+nsZirir6Y1Pmhmyu1yDbP5wB/v+R1WwvMslsHf0LHtqy5w==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr20930791wru.284.1627322930806;
        Mon, 26 Jul 2021 11:08:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:48a8:: with SMTP id j40ls8673692wmp.1.gmail; Mon,
 26 Jul 2021 11:08:49 -0700 (PDT)
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr6003088wmi.24.1627322929869;
        Mon, 26 Jul 2021 11:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627322929; cv=none;
        d=google.com; s=arc-20160816;
        b=yTo92cdzZke0BK/+ARF4pZU2wdEoxMX/0ipPW6iMn1TT9gYrzzMd4b8Ci4+ywCWRJa
         LdrVOi7gWuoEytw8fP8vYaQLXObdlTi9ycwBqxgq4diizJrIz3b8zXRgT9xGmx5TDEf0
         zNqeeI+0UIXR7LSAhougOjWO7k3LfdkZLMuvtNA75XVw2CHa6YZvRV9bwPrFEKYO78YM
         GXw3u1rM1f/Y6L8S0w57+iO6Z/VZGKFjeKWcNKTm6MpVuA/MKR/uh+LwQrNFn399uKgT
         lKUb8K5sUaAIBzY/RZ7VyXZbKT1Ex47e8eJYm3ERaA4GV/FlCr2g+Vmx0s4N45rXOWIs
         vk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hPcsmgCwohyYbS10AKlFbcA7tLOKfUra64qUFZkJQRY=;
        b=zLv+Kxk150n/KSPPOx6k98aPuj00mOVwyKcumA+JuOsSaBbFnekgJZIDa0y14ld3j4
         MMxdK0wlWHrlWFwGNfLwjNj8dUJpOO4RA+bhqCNfrq3Y1f1gcQYBFfmdeFFx4N8qMFZn
         CJFl3WOaldQYJGKj4qkiQidXpxpweG3i3NXVzY90Npm/EKAu6u0NylL+DnFLb7LQwCEA
         Aa4C9GqO4kjHSiCe3EGsFjd6H9eOGPC4h8yrAQrnEhIKHPdbEaxlWivyJ8tJeYs1A2/T
         hbYyfogOvNK3FOeLa2+EWppKaEW+ZNempowncfZBWSAY71EwmVVdNAox7xifRiVNbjOm
         GUDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 189si8563wmb.2.2021.07.26.11.08.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jul 2021 11:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 16QI8nsn024417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 20:08:49 +0200
Received: from [167.87.33.191] ([167.87.33.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16QI8mVE013835;
	Mon, 26 Jul 2021 20:08:49 +0200
Subject: Re: Ivshmem-demo: root cell failed to receive interrupts
To: Huang Shihua <shihua.huang@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
 <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com>
 <6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2d2c72b6-cae0-e210-8db2-630b33180335@siemens.com>
Date: Mon, 26 Jul 2021 20:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 26.07.21 19:14, Huang Shihua wrote:
>=20
>=20
> On Wednesday, 21 July 2021 at 17:50:53 UTC+2 j.kiszka...@gmail.com wrote:
>=20
>     On 13.07.21 18:09, Huang Shihua wrote:
>     > HI,
>     >
>     > Currently, I'm trying to run the ivshmem-demo to establish
>     communication
>     > between Linux root cell and one non-root cell. Configuration files
>     are
>     > attached.
>     >
>     > Two cases were tested:
>     >
>     > 1. Let the non-root cell load the ivshmem-demo and then target at
>     > itself (target=3D1). _All interrupts can be sent and received
>     correctly_.
>     > 2. Let the root cell and the non-root cell send interrupts to each
>     > other. I.e., root cell runs=C2=A0/./tools/demos/ivshmem-demo -t 1, =
/while
>     > the non-root cell load /inmates/demos/x86/ivshmem-demo.bin -s
>     > "target=3D0" -a 0x1000 /and then run. The result turned out to be,=
=C2=A0
>     > * the non-root cell got the interrupts from the root cell,
>     > * _while the root cell did not receive any interrupt._
>     >
>     > As Jan mentioned
>     >
>     in=C2=A0https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8=
z51BOCgAJ
>     <https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCg=
AJ>,
>=20
>     > tuning the iommu index should do the trick.
>     > However, unfortunately, it did not work for me :c
>     >
>     > There are 8 iommu units on the hardware, I tuned the iommu index
>     in the
>=20
>     Wow, 8 units...
>=20
>     > root cell configuration from 0 to 7. The same behavior, no interrup=
ts
>     > were received by the root cell, remains when tuning the index from
>     0 to
>     > 6. When the iommu is set to 7, the kernel crashed immediately when
>     the
>     > demo was started on the non-root cell.=C2=A0
>     >
>     > Any idea regarding why the root cell always failed to receive
>     interrupts?
>=20
>     This may require in-detail debugging. For that, you would have to
>     instrument the hypervisor along its virtual IRQ injection path. That
>     starts in ivshmem_trigger_interrupt() (hypervisor/ivshmem.c). The
>     sending side will call it on writing the doorbell registers. Check
>     along
>     this call path if conditions to actually send the IRQ are not met.
>=20
>     If all are met, the hypervisor sends an IPI to a target cell CPU (wil=
l
>     be directly delivered to the guest) that should cause the normal IRQ
>     processing there. But usually, we do not get so far in such cases.
>=20
>     Another function of interest here is arch_ivshmem_update_msix() when
>     called for the root cell while it defines where ivshmem IRQs should g=
o
>     to. Possibly, Jailhouse decides that the programming Linux issued is
>     not
>     valid and therefore leaves the irq_cache that
>     arch_ivshmem_trigger_interrupt() uses invalid. You can also check tha=
t
>     via instrumentations (printk).=C2=A0
>=20
>=20
> Indeed, when .iommu is assigned as 0,1,..6,=C2=A0 irq_cache is invalid. I=
 suspect
> the reason is that their correpsonding VT-d interrupt remappting table
> entries
> are not for ivshmem devices, i.e., unmatched device ID.
> When .iommu is tuned to 7, irq_cache becomes valid.
>=20

OK, then we know what needs to be set. I will have to check eventually
if we can read out that information also from sysfs so that this
guessing can end.

> (BTW, as I mentioned before, the kernel crashed immediately when the
> demo was started on the non-root cell. _One missing detail here is_, on t=
he=C2=A0
> root-cell side,=C2=A0 ./tools/demos/ivshmem-demo is running/has run, i.e.=
,=C2=A0
> init_control has been set to 1. If ./tools/demos/ivshmem-demo=C2=A0has no=
t been
> run on the root cell yet, then starting the demo on the non-root cell
> will not
> kill the kernel.)

Now we need to understand the crash. The root cell kernel oopses, right?
Any logs from that?

And what do yo mean with init_control?

>=20
> To avoid the kernel crashing situation, I only ran the demo on the
> non-root cell. With .iommu being set validly, I will expect at least
> seeing the
> interrupt count increases,=C2=A0 when=C2=A0grep ivshmem /proc/interrupts.
> But nope, _still no interrupts received on the root cell_.
>=20

If there is no driver registered on the root side or not opened (by the
demo app), then the interrupt reception is disabled. We need to debug
the "hot" case.

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
jailhouse-dev/2d2c72b6-cae0-e210-8db2-630b33180335%40siemens.com.
