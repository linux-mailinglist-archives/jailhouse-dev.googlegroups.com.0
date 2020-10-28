Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQOF476AKGQESZ2YDXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D129D277
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:29:38 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id a10sf306254ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:29:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603920578; cv=pass;
        d=google.com; s=arc-20160816;
        b=miaUUeNnFK9zNYYlIdH3B5BtrnemZpPDevxCWa97HfEs+umEqf1gcf7j7Dn5YVgMNe
         HNc8iHErfgHkIhufodnABC05XVQJ0aviNJmvLwrtOTiIu/uVOLHZErLfpKRTqTb6fkr5
         EELufw/llqozdvqwLVYZ0gtaWgf66ByNtZqCTeZJclYBM4lJCkFnl1QEJ9R4LtFwpaMo
         GS/YDvGrVplIIwwGCbC3kU65It3FP0YEMTeut2T6tBSPCajo0pnm1oRD7xoBpiqQlOm8
         NFKbAdM8bMChlDVkO3BbHtVnctna94DJbx5sGacit4rB6I/Wag8BeAmAWMhoqBvLzORE
         pReQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:cc
         :references:to:subject:sender:dkim-signature;
        bh=+rpgviR2Zn7jYmu9VN06d5jQ6LPuCUJAVEwlF3hjKro=;
        b=TJTGNNmuO868AsI6kiujiO6d/SmtJcaZ62sXKNGWi+gWvIz0XH3RYMMJUtDvV8ZNg2
         87l3IcZ1elPRUE9V6CpccyrDoFXIgNgD5Igpndhi0cbKOiZRwFC2unQfRynyXbGnEy4K
         i13FyJPedhiMl4jQY2vGvwA1K3W2z4zdlAUdVDmVceCjLKXvxJRdXq6VvzabPIv/uTEQ
         jYMLTeNZQKU0tn+uHYF95fFEcZxlEl1aIl3cDx9saE5xyy710p/tZSW2L0vzvsCaPpvt
         F1dqYDfyZvPSev5b+p3uc8kPgUzwKJN3lelXkP3c5PxvGDS0QSGWIxErztuO54o1JiGy
         q0sQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CW6GUWM5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+rpgviR2Zn7jYmu9VN06d5jQ6LPuCUJAVEwlF3hjKro=;
        b=DOxpS8kTcmaEKV510ThiZFAjXPWsZJFg4W1VOr1kaQR+Gugrk+HypNKfxlWuDhvw5K
         Pmuiq7KbpSayA9wHhGcbB1DsKT6FeZGh52ZWa9oufDRu/xAtvKh6a+g0HMjhViflVPh3
         Ut4r2Z2C4TtYJ7if4+uk2GJRmOB4XUmN7S1OGjCmlkeLd0p5sNuLvGx92Dw1ZNZ6pgL/
         XPl2FA30dJfmSxQlqTZsx1GcypQhFDp6iu0PlBZGoIPGDDKgTafEbD6oqCWu3Ia+Rg2D
         aS4O/nB2XS8Esy6Bk2l480thYSB+vrq1IXHxibXZjgXZvK4F270ytyQN6yyq/BAk09Y4
         jw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+rpgviR2Zn7jYmu9VN06d5jQ6LPuCUJAVEwlF3hjKro=;
        b=puiu0BCnNQARh4xc+5VXAgrTTvfVq6SJDJUP8rRgnL0FPw1efqhhD5bZaEVTCGkgOS
         3wnzFencL0bEmeBfDQ6+xIgX8RF2ITwgRz3tu7Z7MgHDiqY2fU63kQtKXkGM+ET4Yopb
         ibThc72qjfoIKXHZJmbGInXxXc1Xd5/ppueDfs5wc7n5QsFQ5UR0befgLsRbRB5pQvCw
         Kve0GrZ17wAlllwyCWww/YNep8O8PXYuD15pczpQrdv+D8GFOA2udtb9DLCwj/NENecL
         X1CNE1+hFlYyhjxF2R1ktDTL6nE5VBbZ8aJ+uQY1yOUcJGMB2ne6Pgg4ox/h8xkakher
         ZYZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531J5SYJUV1Ej+Sc0o0rrgKFIOLKL/AZUyBmEN4YXjl/Vf3RcEEt
	6yqHdS9fUVu6P3o1HAqqOmQ=
X-Google-Smtp-Source: ABdhPJw8yJ3VGv0P7oWYFsEKTNPrMWRBHXIyX7vMHRCMrGXq5Ig+1/6U+h+N4579AuAz2XtF1t+N7Q==
X-Received: by 2002:a2e:8ecc:: with SMTP id e12mr498842ljl.98.1603920578388;
        Wed, 28 Oct 2020 14:29:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls295579lfr.2.gmail; Wed, 28 Oct
 2020 14:29:37 -0700 (PDT)
X-Received: by 2002:a19:cc8c:: with SMTP id c134mr392362lfg.207.1603920577160;
        Wed, 28 Oct 2020 14:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603920577; cv=none;
        d=google.com; s=arc-20160816;
        b=qJOq+PmJ1MG0yzLU4LZo9bWaas3If1iBFvaLqo1iIdSQAw1960BgbG3MZeaHITCIaO
         b4MTeqzdVw2ZEtawnAF2Eu/8UEjzjaOdE7r+sRk7Tzim1Uu5LJgFaqujwKs69acWhDnI
         Jax4k4Bd3eAWY4ySf4qp2zYuBFrZW32L07mdj/2S9UTy7FNndAkBNARTfmjpYtRnj3KD
         gBsL6b/CwRmSQB53FsT7piYpqXmEjrBR77gmRilmwVWit0cLL5QhCQXpyK++o95UL0D0
         THFtpIA5OyAPb3N1Faxsi2qZdgEh/23x5A9EYJGtKlcmjsK5Ln6efxc8p/suSidKRQc5
         XOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:cc:references:to:subject
         :dkim-signature;
        bh=jK0bdQjH3sTYdFfYsV3QeKvGyvBwNFO4NFYwGqWn7dc=;
        b=kOBITWXQHkIUVEWWjMfqJOkuKi/2ez6pouQA2OkGDnBI0SF67AKqyriUjlDGKUjNd1
         C3GUxnZIuso9sHFma2MloYs1sMYyRqaL0vtP9WFnNGdmqiCCf2wXUoU4LfNjqaQ6dtC7
         OcsC4ypu5nfDbvmyyyoYLHuyvJNcI7lme9S+K6fXpXdL20M9sUyiCKiVxtiqT0Wwvj5+
         TfdA++7oKtDwVTRedrp4UiLv1EX1sRZ8rhezjRrtjsytnn8z36fpZH7dPW7gHPb2lWs5
         59WSBKxrVdaCDnGDSu3QVptA4MV8ioCImfDmxLeUoWcaVvRU0/IpHeJFnPjBUiPF5R0A
         kTlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CW6GUWM5;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id i17si19306ljn.4.2020.10.28.14.29.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1tS3WnjzyW7;
	Wed, 28 Oct 2020 22:29:36 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -3.794
X-Spam-Level: 
X-Spam-Status: No, score=-3.794 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.921] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 462IuCZvx-Z0; Wed, 28 Oct 2020 22:29:36 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1tR50rmzyW5;
	Wed, 28 Oct 2020 22:29:35 +0100 (CET)
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Alice Guo <alice.guo@nxp.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
 <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
Cc: Renato Mancuso <rmancuso@bu.edu>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de>
Date: Wed, 28 Oct 2020 22:29:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=CW6GUWM5;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi,

On 28/10/2020 21:14, Jan Kiszka wrote:
> On 27.10.20 10:22, Jan Kiszka wrote:
>> On 27.10.20 02:25, Peng Fan wrote:
>>> Jan,
>>>
>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>>
>>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>>> Changes in v2:
>>>>>  - map 52-bit parange to 48
>>>>>
>>>>> That wasn't the plan when I started, but the more I dug into the
>>>>> details and started to understand the hardware, the more issues I
>>>>> found and the more dead code fragments from the Linux usage became
>>>> visible.
>>>>>
>>>>> Highlights of the outcome:
>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>>    to understand that...)
>>>>>  - Fix programming of CBn_TCR and TTBR
>>>>>  - Fix TLB flush on cell exit
>>>>>  - Fix bogus handling of Extended StreamID support
>>>>>  - Do not pass-through unknown streams
>>>>>  - Disable SMMU on shutdown
>>>>>  - Reassign StreamIDs to the root cell
>>>>>  - 225 insertions(+), 666 deletions(-)
>>>>>
>>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>>> so far. I'm fairly optimistic that things are not broken there as
>>>>> well, but if they are, bisecting should be rather simple with this
>>>>> series. So please test and review.
>>>>>
>>>>
>>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>>
>>> I gave a test, sometimes I met SDHC ADMA error when
>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>>
>>> I suspect when during jailhouse enable phase, there might be
>>> ongoing sdhc transactions not finished, not sure.
>>>
>>> I have not find time to look into details.
>>>
>>> Anyway, you could check in to master I think, we could address
>>> the issue later when I have time.
>>>
>>
>> Hmm, I would still like to understand this first... Do you have the
>> chance to bisect this effect to a commit? Otherwise, I guess I finally
>> need to get my board running.
>>
> 
> It's running now (quite some effort due to the incomplete upstream state
> - e.g. upstream u-boot runs but cannot boot all downstream kernels...),
> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
> often hangs, though, at least restarting does all the time. And that
> even with next. Seems we still do not properly turn off/on something here.
> 
> Interestingly, this issue was not present on the zynqmp.

On a different version of the SMMUv2 developed @ Boston University (Renato in
CC), re-using the same root page table as the cell created problems due to
different attributes (uncached) needed by some devices.

> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 41c0ffb4..60743bc0 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct arm_smmu_device *smmu,
>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL & ~TCR_RES0);
>  
>         /* TTBR0 */
> +       /* Here */
>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
>                      paging_hvirt2phys(cell->arch.mm.root_table) & TTBR_MASK);

The issue in the BU version was solved by allocating a new page for this.

I wanted to check this effect for the version on next, but didn't find the time
to do it so far :/

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c0cec16-dc86-b316-ef84-af51a15c80aa%40tum.de.
