Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW4R46BAMGQE4LG5TOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C9345C51
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 11:54:19 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id v5sf571437wml.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 03:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616496859; cv=pass;
        d=google.com; s=arc-20160816;
        b=tukVAQLTyg9kJ/7rhremQ93baQgni55h97LWS5YZU6SbuOST/P2iJ4VBbd1XwJ77o0
         vwaRyt8g690GF5TXp7aUk3Dnun2Q7oSCnsR+AAApIozPvmem/LqFFq61rH43Wr9rzIvU
         qS3pQ/U3K93f5Vky3Dsxj8GYzmPknKVOpvoJRs7Ll7uAgtarpSC2aAuyndB99Jpn/hkl
         xawoLVTmESv4NkFQJXlbssPMNEveIN0thE1zEWZj71N43PHgkVwogk95krLozgoV6tJ/
         6n9KTf99+hZ5cpHM0Qb8LVozaeGf3gOXamRpSL0w4AbqDtK0yq1uvVgy0CW6xHQaO0o4
         gLgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ULDevrVCQPwd0Xr2lcDblsP7zQs7DXoiKnWHwkkkZUU=;
        b=sP4nE5OX8+JUEMLKTeXAzdfy3XcQ7D2pxs6gu38ZJAAvuC6q1do3JEiA0EarRiO5o+
         WMvq3EFiA4l7NwyELrfxM/4ybvOnahFBv4nCTu1efo1VG+3amxTn8/QC4IkISSNaiiRA
         L+7lPtAZ2FcmC8SYgjNotrhOWmFzCPUnHRxvXo2cebZnd3JZ36GQya4sHfYkHOz0rns+
         5m4xJqwhX8nhmgQxzLq+WkATHK0CJxfvD2Gp1UKfd8aClsT0xMB8riU8ZbaLuIXENxVq
         pyiinpaFxfMUKm0bYPPITPfh5UvqwBaJsyg/Fxb/4eCbvALmJ/sZdlRLN2frZIz6qBcB
         dkOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ULDevrVCQPwd0Xr2lcDblsP7zQs7DXoiKnWHwkkkZUU=;
        b=kpf7PE5BtzLLpadRNntZXQIuNHu5v+SNqLFmlOAU7EtTqz1R3alJy72odrQb7UPaOj
         V3325VoEjc+4A6Xi9+rExdXcXE7m+qWoRnU4RWY1qp36do3wma0TMGlEXP4B8z5Ql17v
         zRq7QjoeKhmLeEOZsnTmtdVkonmyC3d+V2d7dUopjJ/s/ywCuiFkMT3ESV3Yag79Bave
         u8UJa2B3QTwaxcWrpwOE7w5TSC9Q6zlulWbKnE0pXVXGkB6pwK+saoo2/j/XI8RS5FLZ
         MO7uE2Fs+Xk3KUJyUCBm2oCbkkq/2lxYpCyCGCOZ7Y5QcR0EGKX0h+y/fh7bpGPyL2M/
         QlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ULDevrVCQPwd0Xr2lcDblsP7zQs7DXoiKnWHwkkkZUU=;
        b=AZG/ufBSNbWBqirHF9dtkiZASgcPMhke2B41nHZHX9nX5snahWc4aHXNVNofHTSRlr
         0MjvZJQSqY5gJ6VIZf9d+quR5M4ELpvgdSNQbFOB+ox2z8iZ1E1B5Qj/YeoeoPwtS14e
         u6HIGR11dVD3zx8Qvlc61T4/+AyL0GVkdX9yLl9//sFEc+wLHrYxpFPCnLIhTJtSkdQ1
         E+/6gpB3u3A6zzrD+7+Gsw4ffEuPj5LdSBZt5Vf0L4zUn8ev7l9jeyyqhBwOykr4q78Z
         LIH6PYtZINxKT8+HGI54lnZAqZAzzJSQI1r4A46Q19Kq1jNAAvBc//B9yVBu+jwf2Sx8
         HpTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NEmJd/vJAYeFsfzajfL4f89i16Q6xoxGSjhUGVZf6SYdRxnFW
	YPg+wxoW4nefohwI/xzRJcg=
X-Google-Smtp-Source: ABdhPJxGUafqrGJCUau74M5p5dgFNY4lWKSopkFFoyH9TFR4qGgqdRDG1a2ECm4iZ54Sf8+aEgw5zw==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr2734235wmq.123.1616496859305;
        Tue, 23 Mar 2021 03:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls2263812wrb.1.gmail; Tue,
 23 Mar 2021 03:54:18 -0700 (PDT)
X-Received: by 2002:a5d:6412:: with SMTP id z18mr3313052wru.214.1616496858333;
        Tue, 23 Mar 2021 03:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616496858; cv=none;
        d=google.com; s=arc-20160816;
        b=O5z3jXnLDhq45cxONPfD7I5Uq4uujOjeyO5mnW+Q7P5S2nR5VBI3eTO0VasJ7IbSPl
         vxOF8tjhYr0thXe+0uHes8gUHRR8mUiLBKrPBs1Igw4wQ2KU0Ach0W4uQb7CYpb2B0wH
         pHOejXOqohQ74JYAnZhhiCV3f74atVJ4lr548yPaXBSRi9xffL8WjUReBH7CDGSazoo6
         3Z8U1eVTaXUenkEi7kBiMZ8wXw8p9EgoHxB1gg8GeFx1Rn1K2yXhY5qB6hf9dIRGwo98
         PBf/Q3CxobPPjj38rPsVwlyqAw2/ert2KBx6YWEsyEhTgwBOZ+LRlabiwDKOgbox4Qa1
         WhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=e7G3oDTjOKoPlUMA3vmqSgE3i4HVA8qPU24yFNkKrho=;
        b=PdTugZ3BOpGNSTor74dfv26EARbE6ZWoDIfuO6QZQvR5zZ6oUW350zDbik9WTN1vwr
         C+mV0xyriWS/A8/cIXAWGDr6iUCU64xN6x2ibYcmAjNTOGYUDQ2AGhbO1+89PBFD46/0
         3lmdmXGQH7D7ueJJ1VmJH5/2cv3QFDhExWNsk/RsfNiIfjCnsqELdhRPHuF5P1Zen0us
         /cW6VTxdYFXvMlLcA+fRDFu7cA/qOFGs/tqvtIhqSTZ29IyYetfOtwlTU8gXTgy7kvwB
         kl3sdOwGQq/Fk/IQujEFUJjxO+08DB9kYwd18M5dG64EsB+kqbw4y/fSCfgIbVk++jj1
         uqAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p65si142818wmp.0.2021.03.23.03.54.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 03:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NAsHcC018036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 11:54:17 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NAsG4Z026790;
	Tue, 23 Mar 2021 11:54:16 +0100
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
Date: Tue, 23 Mar 2021 11:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 23.03.21 11:17, Angelo Ruocco wrote:
> Hi Jan, all,
> 
> I have seen that arm-zero-exits has been merged into next.
> 
> My understanding is that right now the only officially supported
> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
> with only a experimental patch for the xilinx zynqmp firmware to
> enable SDEI.
> 
> Regarding that patch, I have looked at it, tested it and added the
> missing non-secure-boundary check.
> 
> Are you thinking of submitting it upstream? If so, how do you want to proceed?

If you have everything ready with the patch, I would not mind if you
pushed that upstream. Just CC me.

Thanks in advance!
Jan

PS: I'm currently renovating jailhouse-images, updating kernels and
dependencies. Adding that TF-A patch and enabling the Ultra96 for it
would be simple, and would be happily do that!

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23971adf-097b-073d-b31a-9de1a333fbbf%40siemens.com.
