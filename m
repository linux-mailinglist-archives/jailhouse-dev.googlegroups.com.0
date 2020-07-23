Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWNQ4X4AKGQEU4UIYFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id D047222ABC2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 11:28:57 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id t21sf1298472lff.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 02:28:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595496537; cv=pass;
        d=google.com; s=arc-20160816;
        b=BIHTv6OT6UvBeXcUa/yxGkHMdxbVPqgWd4p3SQ7BpKpeCPDI/zZKsDmd6g3J6ulv7V
         NSjso8fyZFVprAgB/GTr1hyQA10FMzVvjXjDf4uJ2Lqy3gC2HF5BKkRFsFM/vy/K0SiH
         yPzBjdsZvOBndySs/TR+s+6NQQ9i/aE6VWAJesI82BmgKT5newcgcrz3lAeiaur771Od
         N2SsdWEwt94hzC107nou/QdlTV5DyuDqNZVL9EexQ+IJtz/xEs7lc1m7ZK1obzzX2iLk
         T7GuOVt5zHX3gTwJRcOhOi2zuRE2AXx3nNrXh0eeOgPbL04xKKrU70h9IEbD5lrH9d3D
         ZOjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=xOsMekQel+bS3J4nABsMqaz0T9OzU/ieQSBzvALvMuw=;
        b=rihtYohwVvBmCe6DdPgNfATcxH8VvsV3a7ib08Qe62NrXIX66bFPEAFzRpxj5FgghB
         qeuKfLPz+yqGjaFimB9W5HOOAKnrisCfIzI+4wa6TxLWYmSgn+VgP6hLP08dWq+dK+N2
         0OXZczVL3ApmhY8x0CONeo13jujgzJH5eizqqc6bWQNDTwQ6i4KO5x7ZGq0cDaW/1Lni
         psHfFFghwvviiJu4+hY5Bze0vpcKYEq9uGAO5TkMEcI4/4TSDBhvVBI0vNlBTGEkH6Tw
         7X4eAJXUDniDz+hIqSWuvnKO7nWx35AQ7THVu5ahV7QcgyJ5giFGYUBWrOPMbyA01Xxy
         SUuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xOsMekQel+bS3J4nABsMqaz0T9OzU/ieQSBzvALvMuw=;
        b=V+VHrTElCYyJGdtrYT0EVdjpHW+E2eWSTH10dlzb+T45lhO28Y3yiLPfQtBIh6Oyjf
         raorvKhzHDRsMVld1lkRs7br182jOXkF96XUDljijhdkHcHuFso0QMJw+BBKghWohf9b
         IYRAWpYRNby87pls8MK7vUcTcxmfqKnVijpF4loBdtQydoQwl9jCdtECD/ADz/GazygZ
         Dhj7R7Tb70N03L+BBPK76ptuYCalHQch5QQjrCt9YVr1RwsvHxrmjjrCfBSUW9rsmexU
         ZRn7/TjtydfqMyxDNgNE5Ywi1WKHDKKNOyKU+yL5kfgnFSs+BIIqFewgD28LHyDixcjc
         FyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xOsMekQel+bS3J4nABsMqaz0T9OzU/ieQSBzvALvMuw=;
        b=BHZgjII/DVKmgpye9toOfWsK4bQcRj+1vYQ0M1dExx6dJWBmjQtt7ceo6yOmFW4PSv
         eJRrGt7eIB5rATCtYJwdG2uur0VIXkEzLa8ocRcroPf9d4ylK1iJ6nZUgds4OrxRNnPW
         1FXjPfrAHWxLuToS9HHKP1mr5MPTnwb7qVO87bwm/TdtjX7O0IuHKrMYeGXUcTHH8fdY
         qmVQk+VkVpO9yy5UPg5VDtHOKJGHoWO+p5aBD5zpN2aBsSu0r13TLmf6uusA9e9CmlfK
         IHC2HvdGgLEY9FL6QpGX8FbxTXGj+2MObECM3zt7QMXwKeENvBGB6I+G5nVP1lVpPL1/
         y+tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5308Ozpzu2F3i7pQwB4Fg/wXGf9V5didYZkG2rK8T4cAz97QnFpW
	+NVuRZPyBDHfdiY4mATy9uA=
X-Google-Smtp-Source: ABdhPJxqy0kzoVa0shoC7dFT8AlkUlMz7U8GH8aKcMmt8RNgmFpc74V5GJe+4+XHt4LNBOZsfWywGw==
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr1465897ljp.355.1595496537313;
        Thu, 23 Jul 2020 02:28:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9190:: with SMTP id f16ls936582ljg.11.gmail; Thu, 23 Jul
 2020 02:28:56 -0700 (PDT)
X-Received: by 2002:a2e:874e:: with SMTP id q14mr1632750ljj.310.1595496536187;
        Thu, 23 Jul 2020 02:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595496536; cv=none;
        d=google.com; s=arc-20160816;
        b=R+1RMZAjY9J58uSa6Qzru1CD4AZlUhE6j0c9nnkkgxRmdHeu0M46ZJ2JQ/PcWrS6PF
         4HTJddgtRf7oTh5xqFBawM8NQP8I/myqQWoaa1BKSMogSox7hyUWgAesYXAvDGjVHLOb
         4CutSaav6PLANcpPbWbwLtFgAbJRSoIvbYKLfZg6pK5gXYsb8FvEfXtAwlchaFvWy43t
         aZoOhZQEfWGpXTzww9ZFnZQG2vDbj1Q2dyv/7uFO4AUv/fTGWY5f28nO+VLd/BzVr4f8
         KJPX/REMUxhMZYnI3BOTB9SIz029JzI/SBTShLWOK6YCASe+1K2G+EPK/Zr7sH+y0r+0
         rU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dyRdACOKq6KpLEV68tPIa4hHKSfJcsG51d0W15+h7lU=;
        b=mqm56aFKi5ln5lGUDBePMQVFiKVaPUR4sgzqjsaWTS74uSvhH+4hU/VRgEmlFg8sWx
         hgHafBrUY1jrwCu30xQgEI58Zju+jwkp5f051EbzSAeB7gtNcTZrjUQxAzUTrQcEOBQ7
         EW7FwUsYst0CnpPwlikppg99sNlp67nDn6EHP2YzPdgrBxY/NmeMVsg3dSD/R4T8BBrW
         nueQUtWQ3eH787X4omiA03IXB/wWSGVJL8N8YDTsoNnh4OuI0fYxxg0cCpVP1y3XaiCD
         yPbQmtq0efypm7vL01phuZRq4xBltpnqDMa01PErD894MEitSyc8RrULK9BxL+HtfDCq
         eEPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s3si112736lfc.2.2020.07.23.02.28.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2020 02:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06N9Ss34017918
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 11:28:54 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06N9Ss1o008613;
	Thu, 23 Jul 2020 11:28:54 +0200
Subject: Re: ivshmem-net no going lower_up in root-cell
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn@googlegroups.com>
 <15788c10-ef19-0fa7-ece9-97c3ed78ce52@siemens.com>
 <ac8480df-0064-4059-8940-c5915d66de9dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <84037e45-31c6-6011-9491-e10c17d775bb@siemens.com>
Date: Thu, 23 Jul 2020 11:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ac8480df-0064-4059-8940-c5915d66de9dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 23.07.20 00:42, contact....@gmail.com wrote:
> 
> Jan schrieb am Dienstag, 21. Juli 2020 um 15:40:30 UTC+2:
> 
>     On 21.07.20 13:30, Thorsten wrote:
>      > I have a an ivshmem-net defined between the root cell and the first
>      > non-root Linux, and another one between the first NR-Linux and a
>     second
>      > NR-Linux. The second one between the NR-Ls is working smoothly fine.
>      >
>      > However, I cannot get the first one up. Jailhouse-console-ivshmem
>     says
>      > the cells are connected, In Linux the device comes up fine with
>     mem and
>      > alike, but the stats stay at zero, no carrier detected. I have
>     checked
>      > the configs to my best knowledge, mem-regions + devices look right.
> 
>     Sounds a lot like an IRQ delivery issue. You can check that via
>     /proc/interrupts. At the point both peers are up, they should also see
>     config IRQs (first vector). If not, check if you have assigned the
>     right
>     IOMMU ID to the virtual PCI device in the root cell (use ID 1 if
>     none or
>     0 was used so far). See also
>     jailhouse-images/recipes-jailhouse/jailhouse/files/nuc6cay.c.
> 
> 
> Thanks, you're spot-on right, but the problem persists. Partially.
> I tried quite few variations of the configuration, but there are no MSIs 
> for virtual PCI devices in the root cell (/proc/interrupts as the 
> indicator). One thing that I noticed, no matter how I set the the 
> iommu-value for the root cell [0,1], the int-signalling in the NR-cells 
> always worked.

That is because the root cell has interrupt remapping on. That is needed 
in order to handover with x2APIC enabled, which is faster. The non-root 
cells can use x2APIC without that, thus do not have interrupt remapping 
enabled.

> I finally resorted to a different box having a similar processor (Atom 
> E3930 2-core vs E3950 4-core in the problem-box) and it worked there as 
> expected by setting iommu to 1. So I am still lost about the cause. The 
> two systems are sufficiently different boards to spot an obvious difference.
> 
> At this point, this problem is not a show-stopper for my trial 
> application, as the "beef" runs in the NR-cells. -- I can go on looking 
> further into the issue, if it is of interest.

If you want to debug this further, instrument along the injection path:

- ivshmem_register_mmio, IVSHMEM_REG_DOORBELL
- ivshmem_trigger_interrupt
- arch_ivshmem_trigger_interrupt - if you enter apic_send_irq, it's
   likely fine

Another area to check is upfront caching in irq_cache.msg. On the 
receiving side, that is triggered on programming of the MSI-X registers. 
arch_ivshmem_update_msix is eventually called, and that does 
x86_pci_translate_msi. You come out of the latter without irq_msg.valid 
if the interrupt mapping translation goes south, e.g. due to a wrong 
IOMMU unit.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84037e45-31c6-6011-9491-e10c17d775bb%40siemens.com.
