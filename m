Return-Path: <jailhouse-dev+bncBCW2V5WNZMERB6MCYWCAMGQEBJUAMVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB4372A45
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 May 2021 14:43:38 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id c4-20020a05651c0144b02900d41930170esf2896155ljd.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 May 2021 05:43:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620132218; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y5E5yL5Uql+WMckHIuq0j1su7XgTcTM9aIyfJnyen0x35/EH+r8bgezMcGDJ5RMTqH
         Nmas192ybhKBO30g2VPYNKpxrOMkCD1/A0wQoY0UYbDLSCTtCCS35GwxFe7RtCCgnZnq
         KVLlARwf/Fshq4dsLB0OtGM1Wu1YVMURy9smdEFWZXVgL0cqHhnyZHKnd/ZYzxdNqRyj
         CrmT971ZZgtK9vGysUutHPzxlOG/tt57ZibZYaVfBE+4xPWotlN3+2amkKZq+m+oohXS
         rYjP/IXEgFo4x53AI1y2BE/y5kuKSpWZ+KkwK/kr7IJE58+v/ZLIL8UzkM+xCKc0dqub
         AE4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=UlM5rEWONbS/CDzNsx8J8GSzovfYWNAjpeVchEC6Y9A=;
        b=zWuee6Sze5I86SJlKNgO1xE3PE7Mv5cNp4V/riKfbLyBE/5D9jwJgNkWZOm/jYKt5j
         Nol2JMvYFLagcUbLvQIRs7FbgcdCZchj8UHO3KVwhliL06Glf0nIpS9cpcxoiUj8U/xV
         8zxGqm5yT1PtzR9OceMUJNE1O53xeibtaiYPqlVGRC5Oopi2Abzy5nOMVRE4AQHlID+y
         Jz7nUVjbL4dlN/cHTU7ekIDEc54cidZ9rphJ9CIBkSuv237LivqhcyXLrS9uxeRwBcfw
         tddLkjbiUnCAvv2DUstEDZzTy9d0k5yl4MinI7T6jBhKS9hVJ/Ru6y63dxgprK5LWYf6
         IPGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=cAVq0Zc4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UlM5rEWONbS/CDzNsx8J8GSzovfYWNAjpeVchEC6Y9A=;
        b=phTIqCXVq099wV7WPBkps32MxF7cseMuhZIn6tXq/n4U7OyddoifuvyMc6C48s/2rh
         0F8anBLNrqPIYlgHPVxCMBMLkEfslv++w1OzQVDFoiUYJX1WFEP/VippYCozRPPEfpIE
         NKfit1eZ3qs4PalOsnUSo3mOKj40ZMUkiBGU1KXjuvQd1yn/cTjEifxBq/FNCo2mE+ST
         O86FJSQxTyj9Z782pmKu83UckoTxuR0qjQL8P3EXJUAoVd3BxphjSnFoNG4hmSYezyzN
         w5sVfNs5peZYJx/ReUE95QYhN+X6e5VAAllGEJc7oOL2dHSOhHZNmvfAKXKAdGIfFbzw
         3OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UlM5rEWONbS/CDzNsx8J8GSzovfYWNAjpeVchEC6Y9A=;
        b=psQ77h6YSnOCU2A0/Awumb1e8ASu9Tqnr+IGUvlgWHwuHN6J9oqbckTVw8U8bxDnd1
         6ufWg1pLaUWIQazBCpPB4P2E4rLuCN9X1vXa7xokC95vYKdoIbKa/K2QaXiUMSbELRCJ
         PebMwDyWiHIlo4ewwAa04C6uZtIz2ftBf0nSZj1yy5wpf/y0d7gidegKkiJkyfvlvNYt
         nug8nH1J0Z/P25PQOR3wbfKoXwoWT8vNAXgS1/NmOF7YaBI1I9w16TuO6cIKkT7s6D1/
         6QflfptnYAnIyWUj98GnYVFpgM1KRTxHx/ULuVRuUI4z8ZsY86OFR9RX0EchKoFBT++L
         QZZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AZaSQsEcKFmji/QwA0dR3eT8ZJtzmK4Rbh8zRXLuleo3L2pIe
	/7OzraO8l+lsMOYEH0iY69Q=
X-Google-Smtp-Source: ABdhPJwZySEKNu1LeNLtKFv3OWCDa6Gbg8nviK3c/vpamG0pueqg+nhSaxdbqVsBZTgeGP10jgSyLQ==
X-Received: by 2002:a2e:8295:: with SMTP id y21mr17464045ljg.279.1620132217952;
        Tue, 04 May 2021 05:43:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf0f:: with SMTP id c15ls4089430ljr.9.gmail; Tue, 04 May
 2021 05:43:36 -0700 (PDT)
X-Received: by 2002:a2e:b6d2:: with SMTP id m18mr8797524ljo.233.1620132216823;
        Tue, 04 May 2021 05:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620132216; cv=none;
        d=google.com; s=arc-20160816;
        b=ShsTitCr4LybN4j/LgnJievo65of8iuoEpL8aWkYq6GjqVOnEwfUu+a8JOim6of65r
         2/v4iRS1OAbXYEoaNsI04nvbAExkzIIIxAuC8btU8If4PbMIGMxIEOIhvHa9JV1vr/8w
         Q7OmK+p6XnML1AEdremOeqVSdJWE1uA5CQ/5RLM7jqHBRrTf2rcD+vZqGpXKjoBBre5e
         jYfFVjNt7iWuEhGIZyae+jkrlvlQPhqeg5ltQRcf4JqozGH+pd640Hv/ivuu5Dfo8bru
         +7Ve1RURtgaRCZ9iGPchlHXtTqlOfJf1JyEI2G/7aoxZCvsQSs6K0YsU83pWxdzPQ4uI
         XF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=jGsv+0WpiDLOJv82oc8RKXhlc7A3oPdRTDah1xuYL3Q=;
        b=HF+xioJb7A3mug8p37gbzT2dLA7MgKf34uh84BCyVSeLfyP+vn4aoBb6+BsXQOW4Ka
         nxzLceG5AfixmbcrGa7cvnkNVMg7alHDcKdijdJ0Q0bf0nEnijWcPNIeSIwuF4iYznAH
         jlzFATx2R6Wlgoyw01o/6e+2w/pTUIQ0VJZ54I0WzESEDR6ermQ4ds7aY4lh8UP0xbmJ
         UjW9znK7RSy88tKyGFRO27RAbM8q8A0MYkX6MelUe0KkTDpVdOpyqE/zVyG4JyXA5sZN
         5ELzyW6/N7fiI3w4pQZdJRTDRusfRjBHhCmgKq7riXcE5Ykph+XKUn7HvTSHOPN9ymDP
         ESXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=cAVq0Zc4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id v3si202670lfp.0.2021.05.04.05.43.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 05:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4FZKJm1kl2zyQH;
	Tue,  4 May 2021 14:43:36 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.872
X-Spam-Level: 
X-Spam-Status: No, score=-2.872 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001,
	LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_HTTP_DOUBLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Q6Mn_6RrLKCu; Tue,  4 May 2021 14:43:35 +0200 (CEST)
Received: from [192.168.1.23] (ip5f5be839.dynamic.kabel-deutschland.de [95.91.232.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4FZKJl1xNyzyTF;
	Tue,  4 May 2021 14:43:35 +0200 (CEST)
Subject: Re: [PATCH v2.1 0/9] Cache-coloring (ioremap_colored version)
To: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Message-ID: <1a89d1ea-4299-171d-b655-73252c5a2a61@tum.de>
Date: Tue, 4 May 2021 14:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=cAVq0Zc4;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Hi Jan,

I'd like to ping on this if you had time for a review.

Thanks,
Andrea

On 22/03/2021 20:44, Andrea Bastoni wrote:
> Hi,
> 
> Didn't have much time to work at it in the last period, so it took a while.
> 
> There are two similar patch batches: PATCH v2.1 and PATCH v2.2.
> 
> v2.1 is the version with the colored ioremapping in the Linux driver. I've tried to keep the replication of the code to a minimum, but the main coloring loop has to be replicated in both driver and hypervisor.
> 
> v2.2 is the version with the temporary "root mapping offset" that allows reusing the plain Linux ioremap.
> 
> I've removed all other "additional" patches and just focused on the bulk of the coloring implementation.
> 
> Overall the changes are:
> git diff --stat siemens/master driver/ hypervisor/ include/
> v2.1) 15 files changed, 515 insertions(+), 22 deletions(-)
> v2.2) 15 files changed, 468 insertions(+), 24 deletions(-)
> 
> PATCH v2.1 is also here https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring_driver
> PATCH v2.2 is also here https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring
> 
> Feedback/comment welcome,
> 
> Thanks,
> Andrea
> 
> Andrea Bastoni (7):
>    arm-common: bitops: add most-significant-bit operation
>    include: cache-partitioning via coloring, add configuration
>    hypervisor: arm64, arm-common: add cache-partitioning via coloring
>    driver: provide colored ioremap operation
>    configs: arm64: add example configuration for colored ZCU102 inmate
>    configs: arm64: add coloring example for qemu-arm64
>    configs: arm64: hook-in coloring parameters for ZCU102
> 
> Luca Miccio (2):
>    pyjailhouse: add support for colored regions
>    Documentation: add description and usage of cache coloring support
> 
>   Documentation/cache-coloring.md               | 177 ++++++++++++++++++
>   configs/arm64/qemu-arm64-inmate-demo-col.c    | 134 +++++++++++++
>   configs/arm64/qemu-arm64.c                    |   3 +
>   configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 ++++++++
>   configs/arm64/zynqmp-zcu102.c                 |   3 +
>   driver/cell.c                                 |  11 +-
>   driver/main.c                                 |  75 ++++++++
>   driver/main.h                                 |   3 +
>   .../arch/arm-common/include/asm/bitops.h      |  10 +
>   .../arch/arm-common/include/asm/coloring.h    |  45 +++++
>   .../arch/arm-common/include/asm/dcaches.h     |   8 +
>   hypervisor/arch/arm-common/mmu_cell.c         |  68 +++++--
>   hypervisor/arch/arm64/Kbuild                  |   1 +
>   hypervisor/arch/arm64/coloring.c              | 109 +++++++++++
>   hypervisor/arch/arm64/include/asm/coloring.h  | 140 ++++++++++++++
>   hypervisor/arch/arm64/setup.c                 |   3 +
>   hypervisor/control.c                          |   6 +
>   hypervisor/include/jailhouse/control.h        |   4 +
>   include/jailhouse/cell-config.h               |   9 +
>   include/jailhouse/coloring.h                  |  45 +++++
>   pyjailhouse/config_parser.py                  |   9 +-
>   21 files changed, 913 insertions(+), 25 deletions(-)
>   create mode 100644 Documentation/cache-coloring.md
>   create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c
>   create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>   create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
>   create mode 100644 hypervisor/arch/arm64/coloring.c
>   create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>   create mode 100644 include/jailhouse/coloring.h
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a89d1ea-4299-171d-b655-73252c5a2a61%40tum.de.
