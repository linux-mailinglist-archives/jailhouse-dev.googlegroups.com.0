Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBMM5DUAKGQE2IUFWJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D35BC63
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 15:09:26 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id k15sf16767404eda.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 06:09:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561986565; cv=pass;
        d=google.com; s=arc-20160816;
        b=KN0kQV/jRKzlrR6kKSa7unvn1Epvn6C9bjaL/WvEPtXnJBn6Ejvyr5Eda36tD6eB5f
         GuZ+p9+jaK8vK5UYIthjr2rNvOZRiPbzbYmEFq09L9zFiFE8l+cC32Ybfx9ZYkvRPXL4
         HBUkvEUGdPF0LS3eXOGpREjem8yocvTubhvSKIeaR2BZqYfSWKwlrHKRTRjjd+Gk900p
         ldGo18HUfXLq5AYjsEWV+6FLrm4dXwUSU97lJbnDkKHAvZCF+jUK2kwAedvg/pNlc7n+
         0QcDt6aKA1/XAtRYxMDTYKbilbo+YWftnlrjq6/ki6hLU/Lf/1iIa1lH5lJklRHrUzeJ
         RMRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=n6X9Ds446tC4KzjvaJ8r3yxNSjdIgy+M51uDhpXJkQs=;
        b=HzNn6DR5CGmpfiRX8gnIMO1CNHeFSxjCa8dI8Kp2mMf6XiT0/sjRJ/R+w/rcahFyqx
         ZY+5/+dkUfgVJ2AldX1nz4vk88pLkeD3KSk0d8b+Y750TJQrlmsYrn0uWdh6Q9xRjw5f
         bfuEqRxKcyPM2yDahMmdIUnEdg/0ILgUXlVeyf97Q/8EtcjpWRMgKwrUnf6vk3GUmqfB
         FdqE8FMyhln2cHExZxqjaVj29IWewd5PZs8j+GCZNP33QV0hIVvVLFTx95BVI/7UD464
         VrKe0rI/XThdZRgqMDfQxQUBGa7U230kuWxoOy16/4X7ERSZruxBNjyCBW38BGXAn+ju
         bEww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n6X9Ds446tC4KzjvaJ8r3yxNSjdIgy+M51uDhpXJkQs=;
        b=RiPElU6OX01Q5GQEF+nZCm9r/GvZ1dV5334GItR2YdPZTlm8yGoJTSR4z7ox1QM6l0
         BXaNWB+su6sz8U9rj+Hg53NpomtH9oQt0RDp1eqzOiVxUPrP9IXprjyHlLJiVonet1kX
         Q+s0SmeRZauXO41E6J3ZOLOtmFCGuI3NmhIRB3R1QvHjmZQLmWSlj6uzL7AHjwsu1Z4H
         g3xcuGhbeKFZWZ563PvXT0OCz1IG3xAzzy28n4RIQE0AqTr8BzTeZ6gPU/fuNElU6ONU
         vWglTk2Tm2rh7r/+zC7GU3WBWjSSEKHOt5vN2Cim/t47WKoRYawvNXTzAZuIkLODnO9k
         rQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=n6X9Ds446tC4KzjvaJ8r3yxNSjdIgy+M51uDhpXJkQs=;
        b=PVj1LMUyuKS3rsTWdW4cQnJTG1IYoFHgy2rfF5lcKZZbWkHkc8f5jzgHSNn+Ws4Em/
         grmFcatjaYh2SQ357a1DYU5sQ5p9rj4qoxIEPnnbcUGUIbSpz6ep/69cRajeXXY+IDsl
         PloUwK0ExwqHWpb1QvjNEORW24V/csKpb8inXDj7JZ+rj9fx4yq8VZe54adTH/A4mTY8
         IpB2pARKCOdgOez0kHGqToyy16C49BUp7ewR6LeuB+d3lMnKEO9gCDlfBMOzw62T3s5g
         hXglon3l4BtPkjV3QPqo1N1zCDQSj6QB7HlLy5+5Q+dfAOnPe66m/AfgkBt09t/uDnG6
         HkXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVIIAYeiUN7gJsY9N8T7/1RcSvsWwBsMLO2IXWKMhXSRoR3VD1r
	4cZx6uuwtWCpYlImQ4eb94Y=
X-Google-Smtp-Source: APXvYqwej2bt/ePauiduK2i6l4lxC6R8WfMwcZc7pcAKsCA59AwK6LU6p8R5huzEWwRpmpyPTuMrBA==
X-Received: by 2002:a17:906:7c8d:: with SMTP id w13mr22676118ejo.264.1561986565730;
        Mon, 01 Jul 2019 06:09:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b61d:: with SMTP id b29ls3093540ede.8.gmail; Mon, 01 Jul
 2019 06:09:25 -0700 (PDT)
X-Received: by 2002:a50:89a6:: with SMTP id g35mr29826305edg.145.1561986565136;
        Mon, 01 Jul 2019 06:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561986565; cv=none;
        d=google.com; s=arc-20160816;
        b=N9f7uNiOF13YYZi53KrulJNAa4FfR2xFbczrruizM8R80wLT+dvcLiOs5VuZ0lHAzg
         D9HqJxKCuy/wiu9Vh7fiS0+wKCeb5DBH+DTxkAOkOT9YjffHKZ/wQ9dtOqUiqywjPJHB
         t9pJ6ZyFwTnyRJ1VD8wuk0I82f5A7ihD++kHlhgpaF+j67Fp6qaGB+TT04VpI+WKjmx8
         Vz+BRkCfrwfRPRLFvddlAXkZsthdLOVvoc/LBf5z4GZ74I+bK7hXqMskRt6lNMs3/+Kn
         +bYs5YM0AA/bGtiWK6zzf9SPEARQVOF9xCtvWySPDzWFGrXMI5y+H9xWCS578nsOefKT
         1HKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=0BgwzSxp6ptK4dAcj5EvGeCzq/c2MHYCVzLa1PrVAxk=;
        b=IaVpC80n7DR17NDgRNAvRv+352QY0ynFM6MoCArJpXL8jeyEbPX7CF6dYr6OvyxhGr
         KAuwysV3DkcPZhxn+vTQguLvVAse6G7v34f4UfVau00lhJdFnhM/8HbOLS/bZls40X38
         T42Ob9+y3vf0rPv6794fWtX+BUtjT4jxy/JnDdKt+4ry76Wrmj9ptCELjzz499FKAgHY
         JzK5v0eic6bJpessJxBMtMQLnUQgnJfbMalJ2A8tLzuOAfM28jbGyAchrufm4ViCfvuP
         Ot/UI22CDtaKp/R+4LLF1khuQsHTu7V3SlJhYXn0j5/O8kgyBm7SBwYK8osQx7UUD48w
         wFTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z20si780692edc.1.2019.07.01.06.09.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x61D9NHg020781
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 15:09:24 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x61D9Oo8003174;
	Mon, 1 Jul 2019 15:09:24 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
Date: Mon, 1 Jul 2019 15:09:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
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

On 01.07.19 14:59, Ralf Ramsauer wrote:
> Hi,
> 
> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> for the completeness sake: it's about ivshmem-net. The PCI device shows
>>> up in the root cell and can be discovered via lspci, but the driver
>>> fails while probing with
>>>
>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>
>> The register read-out failed. Maybe a mismatch between driver and
>> Jailhouse version: Which revisions are you using on both sides?
> 
> siemens/4.19-rt vs. jailhouse/next. Should match.
> 
> The bar_mask was copied over from the qemu demo. Other than that, the
> only thing that changed is the bdf. We simply chose a free one on our
> system.
> 
> The memory region behin ivshmem is high memory above 32-bit. I
> instrumented and checked the code, but that shouldn't be a problem.

This is rather related to the MMIO register access. Check if reading that 
ID/IVPos register actually triggers a VM exit. I suspect it doesn't.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81c3353e-88f9-5908-ef76-bbc8f28c7613%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
