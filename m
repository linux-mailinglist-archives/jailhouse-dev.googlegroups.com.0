Return-Path: <jailhouse-dev+bncBCB7D7MXMMIJFOUD6MCRUBDLG5WUO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46D17A3A2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 12:05:56 +0100 (CET)
Received: by mail-il1-x13f.google.com with SMTP id x2sf4244344ila.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 03:05:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583406355; cv=pass;
        d=google.com; s=arc-20160816;
        b=vXmY3eguSbOL3DpvnZbO7CH/roKaBxlqpAZ/D1HQJTNjaGqEWOjvw7llQdU/H5b1Vd
         3bxKiyx1Nhfp4MELe4rHGV4vgE2yp5wBzgOn3Q6XtvxsCgYVPx0RxaJ7dVL/9nuhfmTD
         K4UiUBdWk+BcEEnvMs7u1pu5ReQWiPAg/RMNmR+Kz9bsbGrHP08imz4wJMDDfboG0y0b
         qF0Z+vSruCBlQMJX20RzJHr/SZRl+AzH4/J7wCXdrCGILhvIueXZqbHz0+ahddSWHLqN
         uWtSCjAQe9cG56VLy+HgYURcMB20MFB19+hGodMK5Xjpx5ZNG5yWAdIEpMicRtjW+eoS
         TBbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=gItXMoMTYXBmxO5zcGQOjOKXMU69s0DgmnsBFIWcoI0=;
        b=NIR8BAQvJPalELZ0b9ARLwq07TkAXS5WyWb/o3brnkIspWkzeBXrIPILaKAek/i2p0
         NjdCoF5CbzpBFbJwc1HKLQph1csOqATRbXLy7w8T+2fSsneJnWaejT8rE6quZ35cXCo+
         t835oRryQtma0eVQ/Gb575L8c1YyyIHtRYFe/IazD+BCgCWnxTAyN8tdqd9T21Wn7kG9
         IILNItzxHPrTjn9+zOohbleWjhBxxBFg+gPD9UWoZLGEjsp86gux7J+kq8Itrn3vt1LK
         xZP7BehZgE6tF35BwOBV0mE4jR9QTTEpiJ8+S5SK1SbAZHVObIP393BOCd25SJsT1Z0E
         o42Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dmv6fw5F;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=gItXMoMTYXBmxO5zcGQOjOKXMU69s0DgmnsBFIWcoI0=;
        b=Un8TRRE+48e7TEtA68HfIhyIIhRzLuGUbNzuSN3sc2JH8UTcHNu9rZeINHcXQDu3ks
         mJbVoGOUNRW29sogYCME6q0N2zNPdAkGgPrHmEJEJgDCRofDrudmSRfuwVUW0rmI1NMX
         AQP3rU3p3JvEy4C89YbfYo7jQanpZ6uZtqKMHORRJU3OrjESP90FoXeD2htYXx7A7Giv
         7oC1A9JIZzJbblltSZzRT4CRPjE8rSJ4P9tn/wrOesw7UUAB1gn2w31FNUG2iE2kazLO
         3G07Vj+FoLnZRQ5ynCWi/tC3htOQiVEVTvpK8xUlLhgqtSJl0L6E7jVMg+Di6IVWBn0C
         n3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gItXMoMTYXBmxO5zcGQOjOKXMU69s0DgmnsBFIWcoI0=;
        b=DtVchVeDiTw/DjeHsujKidgaO0EZ8TCfyA9fb9hvz1TmUwXZPFmG7QAFh4Cj9eIVl6
         bmSaNPOYIffBnlOCJx1wOcfEqakyoQpiaMeN2KBf89qbxwgntxe+2upCcNTojYF4Aogw
         n+1JMQHgqtrZuoi1EgOwP1DliY1sCiW/7p7i9QJwl/JsKz46EjW5q656mLQLF/UsgWSz
         SAAMSQ8SjGdHnvAs/xMBe7vXg7BqOtOFtgz5b4uG+Y/7SaY2fmqhLqUvX/5GQiYbon9B
         1JQy63GzVD4Dtt29tVQ3erNidrCk1t0YKJJlbJgjR+JHv9mPUQEwP40gM+xNgmPwwMHW
         +r5w==
X-Gm-Message-State: ANhLgQ1noyQyvsn5p2z4jAzz83pUPrt8ITvYqSYhdltK1IF8VskwOJO+
	ocKqWdLxKPuQujqhplfEg1s=
X-Google-Smtp-Source: ADFU+vtB7IXMA8F3kaY6iTWQlpOIDFycrXDeHWYYYRQn8jSNCsNyVvGkDyMUwiRRy5xnLm4zIKqPtw==
X-Received: by 2002:a6b:8f89:: with SMTP id r131mr6264534iod.232.1583406354707;
        Thu, 05 Mar 2020 03:05:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:1031:: with SMTP id n17ls258811jan.1.gmail; Thu, 05
 Mar 2020 03:05:54 -0800 (PST)
X-Received: by 2002:a02:90d0:: with SMTP id c16mr7237376jag.22.1583406354156;
        Thu, 05 Mar 2020 03:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583406354; cv=none;
        d=google.com; s=arc-20160816;
        b=F+trrDstbKRgfVx4SsSs6K29jA43CswIMO1R4I1UmRtybsp7Y/pUegif57W9G405zh
         ZrrbusvxFrKURcMMrtVd3p2aAizke5V6P2Tn4XUfW0E5UCv/tNoDg2MCQUdIPFAe2/1R
         6KvK8khY0qxEjvFSwzXCruX/kqaNtB8kU7F6ipg67Pafk90goYR+ULysq5yAdvLXJdPZ
         JgsMBUpK2zTpI5BOnEx0pXndgLYS1Xxpy/K3fnHOhD/ZZf7m2ocOL5RlGMTq8kmUVREs
         ysnbkYScY4DCSEkfPYixxuFeTg28aDT28KAqfpKkU1kqDrxX54tCkfA4gbzm2LdFg2Fc
         ER2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AXN4viYIQ++M2mSFwu++Ou6gPqQUcxGkKhC4bxG/aT0=;
        b=JL5BnYSBuwoAJlKzXAxPJyhL6o3rBeNMijtHRcm0WVDURKR33WrpnsZzcCO29G5mHS
         Xz34izuMrC2eRINJLxvGtiaoiqc0GLcuFC43VCw8+JRIsU5Le1KOffwUHSufw5YWl6ZQ
         TfU385XHHqKAPY+S7aktee4nJv2IQW0akyXySJoPB8bEfYhPIicGQqouU2Rpy2LnRyni
         zGtrQAC+9NHK2ZOm/vmvGEVRiOxP+HEbJMugiNew8ZjxJQn13FYlmxzkFQ4VFBMM14lw
         E6s2GAEjjBP/+TMV44vM9KumLRHZVMGCyZyaiVrXCCpMgZNSY050asw/6Zcy+kax+FAv
         AxJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dmv6fw5F;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d26si240506ioo.1.2020.03.05.03.05.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 03:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025B5r7k012747;
	Thu, 5 Mar 2020 05:05:53 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025B5rc4119755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Mar 2020 05:05:53 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 05:05:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 05:05:53 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025B5p1q085949;
	Thu, 5 Mar 2020 05:05:52 -0600
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: <peng.fan@nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <alice.guo@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
Date: Thu, 5 Mar 2020 16:34:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200305093950.848-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=dmv6fw5F;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This patchset tested on i.MX8MN arm64 with quad A53 cores
> 
> Patch 1 is to align jailhouse_system. Since the loader not have
> MMU enabled, unaligned access will cause abort.
> 
> Patch 2 is not that well orgnized. It does GICv3 initialization,
> SMP boot up. Then kick inmate cell and root cell.
> Some code are hardcoding for now.
> 
> The boot log as below, you could see root linux and gic demo both running:
> root cell not able to manage inmate cell for now. But I think it
> could be supported. intercell communication not aded currently.
> 
> From test log, linux root cell boot will cause large latency for gic-demo
> jitter.
> 
> It maybe good to use cache color on ARMv8, but still have issues
> for root cell DMA without SMMU.
> 

[..snip..]

Nice to see this being supported...!!!

> Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
> [    0.127643] Detected VIPT I-cache on CPU1
> [    0.127671] GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
> [    0.127700] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.159684] Detected VIPT I-cache on CPU2
> [    0.159700] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
> [    0.159717] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> [    0.191721] psci: failed to boot CPU3 (-1)
> [    0.227974] CPU3: failed to boot: -1
> [    0.231609] smp: Brought up 1 node, 3 CPUs

Did not look closer but couple of questions:
- I guess the above CPU is given to inmate cell. We should be able to handle
this error gracefully rather than failure. Wondering how other hypervisors
handle this.
- What level of features supported when compared with type 2?

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be1e8e77-522b-0238-0031-3254eea4678d%40ti.com.
