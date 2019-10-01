Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4XDZXWAKGQE5MFETIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 38089C3925
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Oct 2019 17:34:11 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id n18sf6162741wro.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Oct 2019 08:34:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569944051; cv=pass;
        d=google.com; s=arc-20160816;
        b=ts3dCY1iaLSyxMabZI/efi52FNHmla+HXtCTgV+KBv4ZtbUxdiIavC3/+XTkcRvl0Y
         NCig04Y3embwamD+67fA28f21onzXgKVEH+xp3YCZYRgMZqbUhqDQZ38ZQ/6O7go302N
         nCq6eMvGvnjIrN1NdEV5diEac4loNNkHIYcepsmPQw6Y0zcRnROrkz7ADXgwLdr6Kw91
         3ReULnzZEoifR+BYIu2iG+xjVa7+AWEfapnC6cKx77ZaYGcZpdDIC4mZCZ5KhI9dGN51
         exRQzycJjbO708Ta8lgJCu4/NNfPKEVCWQjBPgdMEYGCBgozhZ/pOns7VjHkIvgfD1yP
         603g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=IGBl54EjuR/3bXD/rTTJpFLoPiNvnUQkxq/K/CZIyfw=;
        b=BFcvBK5y6/a19P0NS9MoB5vwwVFqCDH7MVQLacKOuFQhCUv0/jMaDTBiSwaI21Rmxj
         DQ91k8IXqjR9dTnaEofYTBb8PlqWlCpK+LlGHb5XRKdTy3Snj1CkLNhkAcAM/wbxROj4
         3fwMTULxrSXiNzCkaZsx2qXi5J2DYQEW0vhlmfFZs7ns8tmksR9BDjWiyoS3VIeEP5dr
         FskWrtpjfP+m2DkzKOdXts8e5713yS3sczHl6OKVZuXpRMxXhbnYAyA1CYmtvhyTww3y
         ExxPrIaXrvAyVCv/Excr27aQu641zuCIN3vUqJKumgWA5Hbx2ezIw7R4sUv5ZA0UxrOl
         gNiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IGBl54EjuR/3bXD/rTTJpFLoPiNvnUQkxq/K/CZIyfw=;
        b=lFwPhqtTOdaRxPIH7z2ETlQCJejquTcFw99m7fD2R4wlbqNVtWri//pW2/1TdPTg03
         cVPwCJotRpu4MUuUEaWk9i6AX7Y99Dl+yk7aenYBn49ASI2bNG4a5MxCqiV8x+4akZlB
         Edz4bAwmIRURm4Y2lHnq7RJHd7JOl+wRyjFt1TbhiBslrXhu8HI+HI1tadX4r2odzMSn
         3MStVVHQFRbzn55L/I/gSx8v5c5QrYkRMG3kkDcsEEXXXinzwnhToYEa6vwFZCpfQfdz
         zfABH6P/pEJRLNKleak5iKU5dxkHsI+uGvyMBowQY+NdhJtOmKnwZAB31Ok/rqzB+2FW
         rCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IGBl54EjuR/3bXD/rTTJpFLoPiNvnUQkxq/K/CZIyfw=;
        b=UlJHtZkP8B0ddDBBQ2OmGCFNTn/IiI93KG65xrhkmclwBD0BuuUCqwXvJFXzmnF1F3
         UrQFVH7gBo8KMMcrbBZHyprCxEwnv/hK0jlm1yrUHRAFGAyXxzjkLnJv5QP7xA8f1Yzi
         CcbHQ3NVdHtC+vlRSUwM/WCv7zVJBMsKg1F91ryiHlCgVL+2tzYP/Hl8DyVenCv/Z2GJ
         iv4HO7zqQHjHH4mKdvfYRRq1UF1CvhGW5mo4Y8xrQ+D4/oC+l65bpsMF+ela+6eEsEDl
         hyhdK9WoC6y1XTXlKr49K/Z+lunQtOYatJ41PRvzp0Oha68Rh7KV0yAa2ULOcHq9XkSI
         bkwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWNgTdF/vbMAO2NHatstzgkbKfxPsxAefFVCTQ8NRgUYVxBfe5Z
	YjDtAhLSu2dP0a80MjOYwyw=
X-Google-Smtp-Source: APXvYqyFtolCUDoL+EUY1BP3ecNm1LqhCaGdSvFH6j4z0CGFI3ff8aJ5u7j9hpgmMEDIgpz7DED1dQ==
X-Received: by 2002:adf:e909:: with SMTP id f9mr2967378wrm.129.1569944050887;
        Tue, 01 Oct 2019 08:34:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1a96:: with SMTP id a144ls1376694wma.3.gmail; Tue, 01
 Oct 2019 08:34:10 -0700 (PDT)
X-Received: by 2002:a1c:cbcc:: with SMTP id b195mr4599761wmg.80.1569944050261;
        Tue, 01 Oct 2019 08:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569944050; cv=none;
        d=google.com; s=arc-20160816;
        b=wCVwc6Q2By2F06k1NDXKibK6FINYGBCMwdoauUwGH+ccQy0iEwfayaooSKHF2ia0J9
         e7jx9tFofKwkKkqP+JBTbZIR5ASu4m+kIGMV1DW5IZCrWVPl8bUkIVVrsPpm3xnlRfwJ
         xFQ+SAbbQUQonK+Er7Vr2q1W1qznd2BBomWVkCtgjkQP+drgvc/tusJRG3kw2hBZaIeQ
         hgwpbJfbZRO5udvy1rwEFQdqThWk53V1mE5r4AQ6s4fQ2WIY05ObCho1xMLnzRdgqL8M
         s9s16eLZ4jcTSc4FGgzTq2DO/na+uBGQQVRo36rCq/rbJdxNt41PvGgnatXZ73vOp705
         UytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=p/peWcyqd5/TVz+IktyCcO50655THvHij80jaH61ZsE=;
        b=XbhkJMV8xZmTRxjjTIpHZo2w/GOln4ZgzCpOAWiiqfFv6csEaCF94FWivoChEUnqgi
         +i/wHjUdrLEiVqRChw2KASUO+F10i7py2+buTuMmgrPVICPndmaWg7OSh2b3WGATAJfq
         F2kB26OquYgeWz81iigt5IAW496nRasb0mhI7ADQ3XtsVHnfM2TZ2iAUnaeaVBUo1w8W
         82AfT2CM1vfpxnHiHCTz6k53R2a1byVJvf2JYgzBOmiKT1vAaPKyBVrgW7CfyFIokmIO
         mkCz62qvOqPIrrckzB2v7q0NyTUG1tQU7dsfHX4BlkP34JBpwZiFtxs5zikS+GTpIJHZ
         DoDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q185si259414wme.1.2019.10.01.08.34.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x91FY9iV002413
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2019 17:34:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x91FY9ih013729;
	Tue, 1 Oct 2019 17:34:09 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
 <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
Date: Tue, 1 Oct 2019 17:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 01.10.19 17:23, Ralf Ramsauer wrote:
> Hi Jan,
> 
> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>> On 30.09.19 21:25, Andrej Utz wrote:
>>> Hi Jan,
>>>
>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>> This patch series eases configuration of port I/O devices for x86
>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>> previous
>>>>> behavior, most entries are disabled (commented out). Only whitelisted
>>>>> device ports are allowed. This includes the peripheral PCI port space.
>>>>
>>>> Did you also try what explodes when enforcing the generated list? I
>>>> mean, if there is no mess like with hidden memory regions, things
>>>> just Just Work (TM).
>>>
>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>
>> We probably need a mixture: white-listing know-harmless thing that are
>> requested in the legacy range, combined with permitting the PCI
>> device-related regions.
> 
> Ack. With a little luck we can rely on entries in /proc/ioports, at
> least for PCI ports above 0xd00.
> 
> I just compared lspci vs. ioports on some machines: Looks like ioports
> contains everything that can be found in PCI config space. But ioports
> contains even more.
> 
> What are those pnp entries good for? E.g.:
>    f800-f87f : pnp 00:01
>    f880-f8ff : pnp 00:01
>    [...]
> 
> Are these reserved areas for PCI devices?

pnp, ACPI, some further platform resources.

> 
> And on my laptop, I can also find ACPI stuff above 0xd00:
> 
> 0d00-ffff : PCI Bus 0000:00
>    1640-164f : pnp 00:01
>    1800-187f : pnp 00:01
>      1800-1803 : ACPI PM1a_EVT_BLK
>      1804-1805 : ACPI PM1a_CNT_BLK
>      1808-180b : ACPI PM_TMR
>      1820-182f : ACPI GPE0_BLK
>      1850-1850 : ACPI PM2_CNT_BLK
> 
> How should we deal with that?

PM_TMR is passed through anyway, at least to non-root cells. The rest is more 
dangerous, potentially. But a "works by default" setting may have to include them.

> 
> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn't
> VGA be listed in ioports if present? At least for qemu that's the case.
> If we can rely on that, then we wouldn't even have to whitelist VGA. [1]

Yes. VGA, if it shall be with the root cell (common case), should be listed.

> 
> Besides that, we could enrich PIO ranges with a comment that links them
> to their corresponding BDF, just like we do for memory regions.

Ack.

> 
> In any case, platform specific stuff will remain static.
> 

Yes, and we may see more failure there when we start to restrict the access.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8%40siemens.com.
