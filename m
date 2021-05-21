Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGWFTWCQMGQERMRGHUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53638C0CD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 09:34:51 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id o10-20020a05600c4fcab029014ae7fdec90sf2519969wmq.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 00:34:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621582491; cv=pass;
        d=google.com; s=arc-20160816;
        b=ui2nhjaLQfD3gpspeRIiVvLBe8Mi9jUu016WLOX/Ng5tj8D3bFTm7nL0x3E+r7VsPM
         uKurcHVRDqM/PyphaoiaW+0t9d+cxBYPXkvlsWdIuKVJ1lD2iq0KQ3TYa2Ug9ziQuRmV
         I/CUIkO8Qp/fCwGQJMC7b1/A4WjqwVcsSKInmfvv63JfhV3gJ1dTOS7P2N2LlJfM1mfT
         q0yatozb+K+vs/Bybstru5NokMIxjwRFmPITyIqE4yranVTQC+ak3E7RDfD0khHsEQWA
         XLFkDU4nVVIF64TxgNmGkmNGUYe24oNy2gu9MsLZUTTMLEfW3qzYh0KHJ7dyDbZWR1S+
         GSTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=SPWGUWwJTMWvaNGG7ZU9ujQsYKVghCVc16fVsbVgh98=;
        b=suCLWvUzVxIPIvCUZY+pUO35IwZ9lN3m5vjLh+KHaFrIniJ+U4QvIG9xmnwpRRMShw
         7Grn4shXns3OJdJvRCtLht2VtMaO8PDlTohiCaCNJyVVsuICNKhPfMDPGIyY+mp6hprz
         pjUK4NqrFdHXPdZdhHMh4ezrd6UFRE5272bdcxf5X9cOOTE4k0m/HEZD3e34PnW/PTjg
         SGhmY+99RK3Elh2phYdibKT8pnJ8thqesT8kr++fr0h/adYDsuICkJZSFx2HRAHRIdc1
         NOyQyacHLXpGiFNZjc6RtvqwpW+nnBnOzvHLSbzC27Lo0PcvFHPv2P2Ynua1sWIwYuc5
         Nfhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SPWGUWwJTMWvaNGG7ZU9ujQsYKVghCVc16fVsbVgh98=;
        b=sDS7aus2gBwZPmYrBXeWo8vqHwbWV2jFLcYXcdEzUUY0O/v23y3ZSVuBL9ZXFl6wiq
         566dMnHxU71gVy6ejQQrZZWus6jbtmHEV64FxOPJx9zdRgvgpQhf6n/j4lQoc1gCQJWQ
         x0Yr436V2Uyr19qCJrVyPrNLmWaCUCPO56Sx+efdSou6cNFD5k1CCLF5bGBEoyKrDcuh
         T8dVpicOYsen2FULjsFxzYr+geAWnez3NopZE6myOWUOzdSCwyPp/YOv/n3FaSDqt4nx
         dc5ieCxQLR4ZnZ0TpUDR7+YWZNy4Fjk6Dpi8nWJSRv5oR1l8NLgZUVRyeUIMNdrR/I3F
         Wkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SPWGUWwJTMWvaNGG7ZU9ujQsYKVghCVc16fVsbVgh98=;
        b=B/1Epm4xig2sxlP4MnZCG3HzQ9/O+pPDOhXYNuZ+PnKecsY9tqfc2NeHqlMguIr3CX
         wjfrYHcmbIiIBNN4Lu00jMAz+rIqGtg0XN3U+b22nrmVj4p7NnAKFVERrRkcLg98QQnr
         mjMxTgLB59t3eBm4vMfQvixwf8/h1CfOdD7YeWHFF15Hl0JAoH3zuYvy8vuW+WnKcCxJ
         3JdWZaG1gTV0LfqEcC7fS/0MIMKpGMmAvGx7bJ8FzUap3TEFZWWtkLD4TuVqfT1ObpDr
         d/ub2a7ant+k7CMGC/w5WDw7SeTrOsIqInD5D1MT52DWLX/h3A3EeVt0pTxRkmP84JW4
         UczQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VbcUnN4qkn+QoQzAefZq07vzJXGjX/iY2MDp+BNdPsX2+W5w6
	f4VnYSXBRopdqDJQIK9KwfY=
X-Google-Smtp-Source: ABdhPJxvmoy9vb3vEzM84B0jk+z4Dzb/qxFd8squekJgoAhTdJtIbeA+Y3uV5uFo1+bR+9/xx87d+A==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr8006957wme.12.1621582490911;
        Fri, 21 May 2021 00:34:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f844:: with SMTP id d4ls3218828wrq.3.gmail; Fri, 21 May
 2021 00:34:50 -0700 (PDT)
X-Received: by 2002:adf:f805:: with SMTP id s5mr8014179wrp.143.1621582489919;
        Fri, 21 May 2021 00:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621582489; cv=none;
        d=google.com; s=arc-20160816;
        b=zauzOd7vQfo1cOISyjbBqKzVt2Ijs9lMZJmelJGpD7RBc3pUpyiDZ0AhoIk4dAPfGx
         r32D+0UyihkDzE/XPETle/yzG6tNcOsJBlVztLpR69X15TvQ1NlmVaA/t92qYtrVij8R
         kUHV2mGi7doIxkd3bpD2FZVhmA5iTrptHN5t5VuqL9XZKY9uIRaKy6ZNYP8ZifHcTIt/
         ZviloHeQbKjou8HoDQn6gg89fOSozIpB2ioohOPt/DP72QHZS87kEKilYIoiK4cuie4X
         QnlSyuSuv9dtrTyNykipBUW4fQvXTIMW+Ev4EwwG0rXFnu0vpNUKzVnSysY6cpZAV4e9
         5B4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=0QcV+n261Rl7CqopDyTgKtUb7KVuEUA9ul3BGB4T8nY=;
        b=jeQPhBAwhRkF4r/U8KFOSi8A5YXUYIdIpnCWTSDph8WRyIgT6OxgpoKC3/LZqXAjzu
         XESHL7/W9SFsb9snv6AkH+rtJLFydN5PPzVhfOMhClqu+0sRRUwcfgx5yiS9f7k2/ERe
         Jgc52dtr/nqvbpbn85Wg9flXeFs8u3IObNiiNyWTcqv4BKwOw3vU/+MfXAFrL9/rK90B
         23+91nW3tE7eG/oPujL523wz1GshhVEJw91lvsw956E/BW6PUFfTHEWDzGW/YJPZR8rZ
         AD0vxV/Bv4JG2M6FbqQeG9yEEOVwSYRSTf5H8EUswSINYpHnzdizy5BhTYgRAFCOcZKa
         qxNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d11si535743wmb.0.2021.05.21.00.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 00:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14L7Ynel009373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 May 2021 09:34:49 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14L7YmfT016952;
	Fri, 21 May 2021 09:34:49 +0200
Subject: Re: [PATCH] nxp: ls1046ardb: add configure file for running zephyr
 inmate
To: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
References: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6b72efce-b519-41d5-bc69-8d04e3eb9970@siemens.com>
Date: Fri, 21 May 2021 09:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521062144.11659-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 21.05.21 08:21, Jiafei Pan wrote:
> 1. Use virt_addr to be same with phys_addr for memory
> 2. Loading inmate binary from start of virt_addr
> 3. Use 1M bytes memory in order to load Zephyr
> 4. Using CPU Core2 and Core3 to demo Zephyr SMP
> 

Could the Linux demo be enhanced to cater both use cases? If not, at 
least make sure that the common bits are actually common (see diff 
between both files).

BTW, we have a finding of "jailhouse config check" in the root cell 
config:

Reading configuration set:
  Root cell:     ls1046a (configs/arm64/ls1046a-rdb.cell)
Overlapping memory regions inside cell:

In cell 'ls1046a', region 9
  phys_start: 0x0000000080000000
  virt_start: 0x0000000080000000
  size:       0x0000000040000000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE
physically and virtually overlaps with region 12
  phys_start: 0x00000000bf900000
  virt_start: 0x00000000bf900000
  size:       0x0000000000100000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE

Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture x86: None

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6b72efce-b519-41d5-bc69-8d04e3eb9970%40siemens.com.
