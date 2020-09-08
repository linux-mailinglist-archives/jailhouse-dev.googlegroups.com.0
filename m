Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGEV335AKGQEU67ZV2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D731C261220
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 15:43:53 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id h17sf1986425lfc.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 06:43:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599572633; cv=pass;
        d=google.com; s=arc-20160816;
        b=n7y//2c0Ix7GmziKIQ5WPN5n4uR1OEH8NKkVS7W7zoL3Vj/pUDJASwIdHiT0P1XS4m
         6CSYq/QGZaGtq8y0AzJnRbX0TMIdvhX3t11BvQ/TQ8VhKpbMy/bmn4bQpNnnahddVbR8
         MCEPxs3Xc0cOTfYKpBH+/NuOdwq/b9rwS5KBXTfAa4YNTBjDzpyV2v2DrhxijlOlPJuh
         nDwttoOkm72VQXUVGt0MyGQvSTG+87FEIcrFoef13t5qFF567jeEH7iaiIxYPz3Mn5Z2
         rvk16hKh5o76oYWkwxBfJyvT2fmrfgsZSi7l6agIn9q8W1dLxLOTO02MC6gwXfvFg100
         Pokg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=iyyAKmH7maonO7GNwJenrGsaWWPvEdZvew4E4hGIotg=;
        b=j2/0KMmC0EDtKHQZSmPYGjmiIfWkdNaDsRIHPkDbAbL500Kwy1i/BYkoeL9oY4IlSd
         4bhzdJsmxEdWc4EuN+V9SG+os+02S3kNk2/2s1fA9z3kvUiJXugPEak+/k17gNNZeDzf
         gRdpEOlTwz1kktmcZsKPQsvrR6qIl3wwUDWBAOyYwdkYP30pP+4JCqhWZd38fQhUD0+l
         9tO3QyvDPO4HTOYQNCRSiPJ87mQTrR5Mpey/gGu5mX203GgmINfo9xNS3frjgeI4exYt
         Rj80PvpSwFJu/VjLCmz8j9nsLZaNuEVH84KcAHMTgZrkUsio9G4u5jYWPrs0t2495Rnl
         cMiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iyyAKmH7maonO7GNwJenrGsaWWPvEdZvew4E4hGIotg=;
        b=iq0XlBYxFa1vSoC65kVH/Y0RfSnIyfTGC5Id9LBEl+BD8210TOBGymwSeqQg5Y+EM6
         j637FonW6WC1C7Qmky7EC4NJx2PYqMCWjPplFkgTu/WVul4i+l7nuL+AoVP5ScRMPpoj
         92ALVrxuubN9Z3gWUyJtLHRNNQnq9DyxuMeX35McrbTJprZ+OUPiYAlbPkrwL+KN+6KZ
         WwVB+hL0y2sp7YRC+U+PmEWVDGk3MSGy6x8dqbVq78L3GLExn/wHm6f1j+P1WcagWteS
         Y4mXFav8ko1gWNLWbusnPQJaZO5HU8aHQbUio0GzGiirSU4DfPJe0vUzRAWp8vfMvSTW
         aI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iyyAKmH7maonO7GNwJenrGsaWWPvEdZvew4E4hGIotg=;
        b=BP/mCiOeT/Md74m6ajK05771d5D68YvhfYvADl2+ogBMNbDi22rzciZ0lDE4K5TgIo
         Gn4UGndy4Dy7jpWl18IebjClnc0tZqMR9aOS8X3S9gYPjI3ddsHPW+AoQCc0fvCyjEoL
         c7HQ3urNODfF/XvQDGHl0WhWXEW8hl3xe0s0+O94gD0mLlw6njnqgv0hlkTDjvRGXLLE
         Zr5t9i+PxA2rDujgrseG3hJRbeoKphLlKzIwE72zDviRdHSUHf7eKjGWDOzVR4b8wFe+
         cz5FfbEOGZ6WTcot8h2xqQ93KSiC38Gv5OJNbYTV5nBmHl6syU1SrQSkeT8+IMilWPrf
         j5vA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532V44vyqM0VM50IxmDp4KR6yLX1bfh1vNgcP7AgezavGQiotnK6
	LXU16MYK7E5GkzGro2Z4r7A=
X-Google-Smtp-Source: ABdhPJzjmRruQ2bG2R4s6XlPgXtOzsk/J5Wn6v2iNWnyNxPdQCRsyhZ1FLEokOEy2zA24nmG9P7qVA==
X-Received: by 2002:a19:c801:: with SMTP id y1mr11859739lff.217.1599572633365;
        Tue, 08 Sep 2020 06:43:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls3869163ljh.11.gmail; Tue, 08 Sep
 2020 06:43:52 -0700 (PDT)
X-Received: by 2002:a05:651c:134a:: with SMTP id j10mr11093830ljb.337.1599572632255;
        Tue, 08 Sep 2020 06:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599572632; cv=none;
        d=google.com; s=arc-20160816;
        b=u8zMbXu1wew4Iy9dQiAxVGrrKDbdV9F1LX7qEwUbS85D1GrfQLONg8vnIOjGcad6j6
         tbIFdJC4yAbBEbNYtrRDj9lKWWNAI00oDf0+Aogj05TRsqpGn+AAUtvu6Qw/zfIgvKt4
         OBb54C8pMzwwTA94br0G7ikX1RFfKy7PepH0xstwv/LlQyq4Mofhnak8RnhylStofCfY
         pJPl4XghHb2ebfqxUaYAcPKD8UGYJ8L6WbizTIro20Bd1wzk5hC5GlvqBh+NcKzLDVFT
         VAw69u6oUxDxxkxy5m9Wl23OpW2gyHwORMLdz/i69EGciRVRi/LmF6jcc/Dw6tfBUTNR
         mxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Z5khAxkDvhrJVmGxm5/3NjvWdGxhHJTEvWrHmyfZU3I=;
        b=tAe0AMw90TCH4JHWKobZ4MKJShT+ZP76Q/ZiHwHdbzuR/KVLgr2Xp5d13SfDmEr5DZ
         WlMtCzGX8a3VYeR7MqLc+VDIf0Uf7RwHsI5Lg3Nm1uXt4rqdsJLC/Lj+cJmvlnFG6bTj
         gh0DwjUs1M4y7hi6YPaXLyVIpM/1OgAUkKaq/zlH0LhNrd5av1hxc7RHyJUEIPPPDg4L
         P7B+dm/2zlg1+vAaVZKqi3LAhwFp9SwXugxw2ylmgZNWhMRBZTmWnZ0KhX7ke1dec+pX
         1Vi+umGe+k3pV6s7OC6F6MKYJOKOlTNvjrCPkBkgYROKTaR6odNdjt1K06wdFOhNqZgT
         FnoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f12si696933lfs.1.2020.09.08.06.43.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 088DhoOk026605
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 15:43:50 +0200
Received: from [167.87.132.19] ([167.87.132.19])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 088DhmlQ025660;
	Tue, 8 Sep 2020 15:43:49 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
Date: Tue, 8 Sep 2020 15:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
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

On 08.09.20 14:40, Jan-Marc Stranz wrote:
> What do I really need in the kernel configuration and kernel command 
> line for IOMMU support?
> 
> If I set
> CONFIG_IOMMU_SUPPORT=y
> in the kernel configuration then the system starts.
> 
> If I set
> CONFIG_IOMMU_SUPPORT=y
> and
> CONFIG_INTEL_IOMMU=y
> in the kernel configuration the system does not start!
> 

This is not a Jailhouse issue. If you found a kernel configuration that 
does not boot your board, report to the kernel provider (I assume 
upstream), possibly also board/BIOS vendor. Include the boot log.

And also make sure to cross-check with a standard distribution kernel as 
well (all major distros have INTEL_IOMMU on). You are on x86, booting a 
standard distro should be no problem.

> Setting
> CONFIG_INTEL_IOMMU
> also sets
> CONFIG_IOMMU_IOVA=y
> CONFIG_IOMMU_API=y
> CONFIG_DMAR_TABLE=y
> CONFIG_INTEL_IOMMU_FLOPPY_WA=y
> automatically.
> 
> For the kernel command line there are two options:
> iommu=off|noforce|force|...
> and
> intel_iommu=on|off|...
> 
> What do I really need for the hypervisor "jailhouse"?
> 

For Jailhouse, both turning off the IOMMU support in the root kernel 
completely and leaving only interrupt remapping on but dmar 
(intel_iommu=) off will work. The latter gives better performance, though.

So, if you are using a standard kernel (or the config provided by 
jailhouse-images), you just need to flip to intel_iommu=off for starting 
Jailhouse. Leave it on for creating the config only, as I wrote before.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0cf2959-7653-4fda-93b5-5abfdd188414%40siemens.com.
