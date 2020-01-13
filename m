Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB44H6HYAKGQEYRML6OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237A138EE1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:18:28 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id v5sf5877710edq.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:18:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578910708; cv=pass;
        d=google.com; s=arc-20160816;
        b=xsL/8mzN5Dr7PMzihFTL2OYBlSE6fgEKTtKQ0WRh9ubJr20BN7G4vAJVI+BLo7rsj/
         VB18KDoy78cjRE9cbwa+sWyUNL1O/N5aQTWoZd1Bw3JIVTahNdTCZQUcMtWiyclrFJYt
         7Xf9t6lMz3oCUyKnHUkQyoFbaGR8v+cDxULeTJMTd7ISfdGD3YArJZ3JKRrN6l5NoYbR
         l6jGF4NlAACsUFLj7HEG1hNbsZcL9E/v2tXoSsU8gNxVZQUpeTOydadfFzG4FanfI4le
         BuVRhwa5AtewZOLMQkgt64Hty4sZeeb3kX5tQLkaYr/vjD13P0Y419YtpH302uOJXP+v
         yJYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=2pjRHHVwM8ouxw+Bzph71EprYlvMwipALYiBdROuaZI=;
        b=xnc8ekz+3BeeddKEwTj18A0G1f+c3qiyzJLM0NmNJw7uI59dyuVhbGpRNYHfQ8l8si
         5jsEMU29M4G8TZ0T6gw4dwb+o/gB8xlNZvHOpPFCugUDK39Tn/jQq2Dt21o64PFfcVrQ
         lTEYHFOTx24U1gT9XQPqHc/axor5rRM6FzcFkTARGrh/7l2hs+zLPDl6KSu55T/cq7CI
         O0F513KzqvdHEyjQi0nSzn1UU0RJQZlwmvTI81L24Hb7n8T+Lv0IJC4hsQ9bwFbjIWM+
         HH9VDFUZlHndsIPvJRe4dbRmGvm58DCzbpbeN4avJ5MBFl40KC/nMfOW2Eq6QhGCj8OB
         xjeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2pjRHHVwM8ouxw+Bzph71EprYlvMwipALYiBdROuaZI=;
        b=oTQtnNJUkBdKknp7iHOD8rBWE0yMkn3DgoeP8VQDZ1jzLfBiBb41NU0IVEzbDPizrT
         H665BBsmJY1drIEdC3+XSAnudyEFkWF9QQyw1jrA83s0OWV3nyO0SzrH/ZpRGkWXus64
         /cTDzrF0mOxGuAEpUEWHvb0UdaiRNqMlfRbTbJ70e3eyyfbida7uM7eK0y1u1o+Sd1Vl
         Dr3lsHwnmUGUeF/QUk9XRZHodPRfPWCf0aOJuHxalwqhKXPIsAwqMF60m1FmM4/GFyHg
         gzGENt4LUKdsjTICHRjwGz6F+j/0ejSRYxvC8VQ6B/5RPaSm29w1ewgO3JOcsfu3EiCh
         jBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2pjRHHVwM8ouxw+Bzph71EprYlvMwipALYiBdROuaZI=;
        b=EtRrP0yW5Dj4JtdyNOu/alaYvXMAOh+QSOQZKOrtgumupgJOBzCWQY8AFr6mtaUGEY
         k+oATlhAUHrBmRprsZqACC2/6XN/kXls3DQOxr9usJpZ1q+MwdGLjk+LnPZMZmoYrPdg
         vw/jYT1OxR41CeQPddawp+e0i1OyQZTFx8EmXQQIKREeqcScGDBjd5MhbdevLg0bIycL
         F4J/wHGbDt0vdClPLjdlRb/UewM0L1jDPWjT5/bS5nj2+NTZ74w4LSh24dvFAT/V6rrB
         ZWgb2J4ZyxR/RJyYlDZHArMOAGf8oymhNcOfPRG1fYcoW1EMgvmDi2VN8dhjkQvGx2Pw
         o1Ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWxSoKW9iBWe3hxysH4cpDoyC7ZzCb6JgNaaLoBsjk795RDplUi
	1p+nGb2X2eT3XtMxykF7DAY=
X-Google-Smtp-Source: APXvYqxDxkWJBf1NAGfALVAIj8i2Eygliv6C6m0Cmve8dKNsCA/2ViRNmatnjQRQUwC+GnPYDGbutQ==
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr15825691ejm.305.1578910707865;
        Mon, 13 Jan 2020 02:18:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:bfe7:: with SMTP id vr7ls3245248ejb.1.gmail; Mon, 13
 Jan 2020 02:18:27 -0800 (PST)
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr16239094ejm.200.1578910707161;
        Mon, 13 Jan 2020 02:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578910707; cv=none;
        d=google.com; s=arc-20160816;
        b=iabAozCH4r5vRfSDelX6CE8w1YTQq1groxsxeL95I4lZwsI/mlTv6zC15fsPagL//Z
         Iw6+aj/EZMXqvD47LrZyk5rDjRGu5hgEfKb1R71qIekXCGSknQF3bqz8TdFJgBlcHymg
         /aTfqqiibcqeVq9nUE+NqTKRmO8kIrFzjmlMXmnxjUM4y981vVs15GhQqe29ctqmqWvc
         9wUApaEW4NvO80rIzsVgwZCcrUGUmdh+xlcFlXLVk2Had881hRqdP95WTgnrd87DIA4I
         OAv4T7vm3H447h0L0ROBOt7SXLG7iFVtaslhaEGxIsmWmFImoyOsadKB2KiUBT5bErz9
         /aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=LuPLHUuALJp4N+1rneFvwqXrGVyUmOkQL5dbwdhmQkc=;
        b=g1zsQo3zeMbxae1FYTu8uj4pLsSiyK801y+P111ruktLc49Kg/aV9ZdUIf4dQxNeVp
         q2RplpwlwXQe6X8p9DBJgIxtjQkLAeH3uVnly7O5a2Q/YmvruKua/XgTaltFo5pVe2Ba
         Rwjxb+U/AN18PHDlK8ku7mDHnzUK26Sb4nMW8TxaFeep78LRo8Y+EiqOCrIyrYe+kv8I
         PsArOK+dplCFIBvEnTrdJ/DxwRbwzk77vwi66sxT1lAbA54DCfCifqwHYvTZTlMl6VkK
         LRqAB37cMsOlajUvUXs1XOpuZ5xPRTx3UxpzH18dHLwJJGh+tdbNmhWgtFwhNfs+Qqn6
         Kwcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x18si466197eds.2.2020.01.13.02.18.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:18:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00DAIQOK008696
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 11:18:26 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DAIQUN009065;
	Mon, 13 Jan 2020 11:18:26 +0100
Subject: Re: Reach-out for help getting qemu-e1000-demo config right+working
To: Thorsten Schulz <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <764a07bc-d7c3-4b06-a7fd-ed8358dd8037@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c95ae0f5-9510-86c5-b4db-8939980399bd@siemens.com>
Date: Mon, 13 Jan 2020 11:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <764a07bc-d7c3-4b06-a7fd-ed8358dd8037@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 13.01.20 10:29, Thorsten Schulz wrote:
> Hej group,
> 
> I am stuck getting the e1000-demo working in qemu based on 
> jailhouse-images/wip/update. Due to a prior glitch, I am still on 
> PREEMPT-RT (./build-image.sh --rt --latest) if that makes a difference.
> 
> Upfront maybe as a "bug-note" /if/ "config/e1000-demo.c" is expected to 
> demo on the qemu-x86-root-cell, it is not. The configs are out of sync: 
> e1000-demo.c expects the card on address 19, while qemu & the orig-cell 
> config provide it on 2, so unfortunately it does not play out-of-the-box.

Yes, the e1000-demo was originally designed to run on physical boards 
with standard Intel chipsets that have their e1000[e] on 0:19.0.

> 
> In the long run I want to run a system with two e1000 cards, each tied 
> to a cell, so I wanted to start this on qemu first:
> 
> I modified the start-qemu.sh to add another e1000 device ("-device 
> e1000e,addr=19,netdev=net2"), ran `jailhouse config collect 2cards.tar` 
> inside and create`d "2cards.c" from it, as well as trying to meld it 
> with the original "qemu-x86.c". (There seem to be some "magical" hacks 
> in it for someone who is relatively new to the matter, about what can be 
> removed and what needs to be added.) I also adjusted "linux-x86-demo.c" 
> and "e1000-demo.c" for the changed addresses.
> 
> Enabling the 2cards.cell succeeds, however, I noted the root-cell's 
> kernel-driver for ivshmem complaining (dmesg-enable.log: "uio_ivshmem: 
> probe of 0000:00:0e.0 failed with error -16" and "ivshmem-net: probe of 
> 0000:00:0f.0 failed with error -16" -> EBUSY), so something is skewed. 

I got such an error recently as well. It turned out that I accidentally 
assigned the same or overlapping memory regions to the two ivshmem 
devices. Check if the regions you use are actually free.

> When I `jailhouse cell create e1000-demo.cell`, I get 
> (jailhouse-console.log: "FATAL: Invalid PCI config write, port: cfc, 
> size 2, address port: 8000c8e8"), the linux-cell throws the same error, 
> just on its device 02 (800010e8), so I guess, I must be doing something 
> fundamentally wrong.

You need to add write access permission to some PCI caps of the e1000e, 
likely PCIe power mangement, possibly more. Check what is at PCI config 
address 0xe8 (lowest byte of that address above).

> 
> I saw few similar discussions on the forum in the archives, though 
> without giving me a clue.

I think I covered such issues in the Jailhouse tutorial at ELC-E 2016. 
Check [1][2].

Jan

[1] 
https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf
[2] https://youtu.be/7fiJbwmhnRw?list=PLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c95ae0f5-9510-86c5-b4db-8939980399bd%40siemens.com.
