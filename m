Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRXXT6FQMGQEES77NFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id C784742D652
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 11:43:34 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id l22-20020aa7c316000000b003dbbced0731sf4708879edq.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 02:43:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634204614; cv=pass;
        d=google.com; s=arc-20160816;
        b=Llk8sPZF2M+XOFcUGekYALbuJE12ICLPY63Jb8lTmLqkQ7pDF/CrRaKPqZj6McBifs
         c/haLnC3zBU8LNQtQTF3AMda07gphUCLVhexdeyhgaWjbn8lKyX6dSadRYbnQI8ZqK35
         b/PQvZOZopWCNvtloFJ50xtEjZk6SnkJj7lEF8tzEqrXMY8CKGksh67SoWpN7iyMV0Dm
         WFJQILvEm/g0raNjTFgSgEve8Dmw4PeJXG3IyPvJCkL0wlRFZzQhO/lfOLpLGNcXQvkE
         +7A5Kf5zK/ItZILzB6vb+djhUzS+2Sxq1kNGEebzJWbzMW8L1mi5OOb31I+4P4c4pUvc
         5fww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=h+zzYPali5BV0fNdkKRoCMH2KsqP6ecdyG48dD/5H5k=;
        b=wZ5Q3WEV5phhaSgki73nps5G0f4K7RKs+9QWkJs21rZ1KkTFa6WUCQ3kvRxVJ9ZqWD
         m5U8jczUrORuo4a2SJXY7fkcV9+jJMmXxHXg09lzIFsWj7j3h2ExT6j90Jh6O/ho1mWg
         nDwbXfXv1zJuESPoeFJ4LatAkxAx2IvI1TeJGKkdj5mwIAFVjHfYrTt9mEGSk01n/gmO
         EtBpeDkCdKeIh/Ut1FVluRamvmtk4nblRuyOrzlYzPrgF/Ti8I+frz4bo8w/lnSdz6dh
         c/GwcA9vm7yB0GovbFjTAK8FjNjTyEZ2pfkYtjEs9cOlFvWxRdWC9JdZUIkOlKa3FSK7
         Xz4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h+zzYPali5BV0fNdkKRoCMH2KsqP6ecdyG48dD/5H5k=;
        b=cAYz6RVAEXjO9Ebi5sNSDUk8FNnJK+T7hCmuW0fcwrjzxXGpAABXRiIz4VlwnMk2I9
         WjC8dggY1Pu3TWH/5k4teea0skic5iu5QqiVjYDHTwDYzzoPGRQNoQS7K355x3uwMkuy
         YR4xA8o4eKwHqbLdBo2ISQT1bnRQuzON8Kl+qOlfB70GyxK+DC7UsUTNPgHunRSLVBo9
         rTTlm5ndE1HNI3v5xmAbEWMEEmGbYPV3VCCGHB2CNPMtxVQPdqqDdn97fOgm5qBuXGgr
         1KGMd5nyfwyst5pOBBU+O1p1F3f/DsE57XXImPec76sYDIhuXz+nCQsoyWFhyGMHucrx
         IYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h+zzYPali5BV0fNdkKRoCMH2KsqP6ecdyG48dD/5H5k=;
        b=yTyPU5j5CLkfO0R18kKa0P57E+AG1d0rsRX1avjKstXEfazLtyK+dB6Yr9+eCn1Sf8
         TvAa+SRk7WUM0dzWbc1gAKt44Z15YpsI0JmyWhcwZUFVlG6sDrF8e2IN1ecWLYyLHSs0
         OGdq4CS50KfP36EI3ydFR15srIgtGTyKnRHiPadWNW3mPi5Ud3JrJKioiAD5jdC8BeO1
         6qJIfk+5/C+m7ZFEsCVcnus57s/yiEZF+VUJpr11W0RCyI2bsSlEVi0NjQFSrvGSWHzH
         xHWaKyILxTcrrR7BiZJLoJPWeYmYcrcwW7J0mZDaztJZhW/zZ4ryj5lkEbrgBC1d+k7H
         HN9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530a6gsX/24itXCWkl5b9VYdizW8pEBcl5yIqLDG+krHNQVrPhur
	+cEsDNJmTBAwr9hQmPMyczo=
X-Google-Smtp-Source: ABdhPJxh0rZflhmzaxNfewz87BFQFyZVgwA82n2j31bunYZzUHQZbLxjVHkQgrREjSlBg3701wqzZA==
X-Received: by 2002:a05:6402:4304:: with SMTP id m4mr7374019edc.326.1634204614504;
        Thu, 14 Oct 2021 02:43:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:18c:: with SMTP id r12ls4731759edv.3.gmail; Thu, 14
 Oct 2021 02:43:33 -0700 (PDT)
X-Received: by 2002:a05:6402:42c8:: with SMTP id i8mr7421940edc.349.1634204613484;
        Thu, 14 Oct 2021 02:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634204613; cv=none;
        d=google.com; s=arc-20160816;
        b=YoEw0TNhPO3MADfBpLfRCqCjdv0OxyDiS4eadqTXXEEutfIxl+c0eT72pFjdcEuF8Y
         qLZi6XQD0D6GeZqrG+Sgoqv2emYcriHJ6J8GzZ/l1UPEkKXQRPI9qPY0QKuVgWHXRPhN
         huVfWijbOTefglu86chjMUANF9643G+WfJEuwSif1VJyb+/3CKFNOi8sKNf2CgO0lWrL
         StSIkooUsSY8/XWsJDmftrl10BjBlUmT7J7anALTWNiHGTOF5b33idOquI1YMF/YGjNP
         CUi4Ptx/VjbNhkn6E0r+XNwNi9mMI6g8H8vzwTMsH5qHpzQMcec6nvzghIHVreE9xy2j
         cMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1cR30mvTx/ediHMFGoPysJ8a5em06PsEkOdQvmD5DZc=;
        b=UHfesrJYma5eqafVRLjSjtVH1u6N9Hx2gcUFkntb+8WK1jFF97jxN4Pck4is6PU7XP
         6L6FOiw6NZfQN49aFEIehnz+d7pFt8LYHaxFwKy9CvOt2Ka1P1P1BO/2t++k2yD86j0n
         kiR+1tYNuNxotFReNX8dsjsmxYJZ4G7iWZg/HkbpDj/vc7hhzBRzndkUM8EbgYQNI/7i
         PzLmqt1gl0aIawgVWk5B3ipZaP8q+ML14HPphuHMrMqGzDqN/eXC6KTFy5JE3yu15MAl
         X0LfxuVwP0BSroXwNRE3lfJ7BaCkDnHWI/MC3JFzntx8ux9Q3mDc2XuAs6wSvaGk99M6
         VslQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r21si150027edq.2.2021.10.14.02.43.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 19E9hWCR028758
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 11:43:33 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19E9hW3R003963;
	Thu, 14 Oct 2021 11:43:32 +0200
Subject: Re: ivshmem-net on zynqmp with hardware based PCIe controller
To: Andreas Messerschmid <andreas.messerschmid@linutronix.de>,
        jailhouse-dev@googlegroups.com
References: <001fe6b2-286e-26b3-c820-6b184cc5c76c@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <45a5e58c-83d9-9461-3b2d-08eda7eefa24@siemens.com>
Date: Thu, 14 Oct 2021 11:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <001fe6b2-286e-26b3-c820-6b184cc5c76c@linutronix.de>
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

On 06.10.21 11:32, Andreas Messerschmid wrote:
> Hi all,
> 
> did anyone already implement an ivshmem-net link between two Linux cells
> using the ZynqMP PCIe hardware instead of a virtual PCI interface? What
> about MSI/MSI-X in this case?
> 
> Any hints/success stories on this?
> 

I've looked into that topics for a couple of ARM boards, again and
again, but so far only the (historic) AMD Seattle was fulfilling all
conditions to allow PCI device partitioning more or less easily (but
that thing had no IOMMU IIRC, this this was incomplete). On other HW,
you have a combination of these issues (or even the full list):

 - missing differentiation of PCI devices on the SMMU in front of the
   host controller
 - missing way to inject ivshmem interrupts at the point where the OS
   would expect them from a real device
 - complex PCI host controller, deviating from the generic one,
   requiring extra logic to intercept config space accesses or even more
 - things I forgot

Therefore, it is generally easier to add a virtual PCI host controller,
even if the SOC already has a real one.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/45a5e58c-83d9-9461-3b2d-08eda7eefa24%40siemens.com.
