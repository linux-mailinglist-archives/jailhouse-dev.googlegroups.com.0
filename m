Return-Path: <jailhouse-dev+bncBAABBUPKR2MQMGQEIJATU7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 509215BA338
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 01:29:24 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id q6-20020a17090311c600b0017266460b8fsf13536207plh.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Sep 2022 16:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663284562; cv=pass;
        d=google.com; s=arc-20160816;
        b=yEvccITbcNeSuZjFGL64U7Jokf1C1SGUfMzzNPVoaVp5kyrDn/tf9IfKV+ZJwHBPl0
         eg0B61nE8Qj18ouACF5tL5lsA3Akf+CxRnIDCZH/zXBJbOyUj6IV9BYzlyBPwARcVWfH
         fFOMv4sL9GYsfsJ/BleVd1o2zpkRvHmA+kXL/Jhvf22G3xSTvuZQyx0UY+nuWr8/yIUH
         iwPTKEXmWeK9d62HJOY2lhqRUXdKUrBfwwvuVMnr1PrweounplO0UagJtgC461d5T/qn
         Ekicmx1AnAP7RZqmdajsg5VYwLXE0AYhXzpFBhkV0Isa6JjpYxqZERCbPYsxh+bxXyii
         eAyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:from:references:cc
         :to:sender:dkim-signature;
        bh=klvmSmzhomU9lSCPflAOqkquoXEuTDQfrShChlMDTO0=;
        b=y1DmWl/2epShYOZIapWS+kqXRAsdXKhQGE2jflX+F2CGQ5XikpGi/zfc4ZViaMmbTJ
         kLtzzLEn7loUw3yKMOttc+IJahW5kYsnIhdHMTr+YZ85XoofA0G8XIpsTYEljqr0H102
         0ZuuWQhGp+kmM2oHrowoNJGWn2ta1xLKDWYjW+0BY+LBjSQqZ0j4oRg2GbAbOC+HLoQm
         FrHh96nSB/lHpNzR8uRevV0Kbos0gVhVsIfx8DxoS3subDaONKhVpPO2XoQZU3q6EVAf
         FfoHrQQji6FyA5pkS/7I5mmJKYfxDJNn3IYQXAy9/nFJUqgZz3HnrmaYaBlkpUM37Cks
         Uozw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to:sender
         :from:to:cc:subject:date;
        bh=klvmSmzhomU9lSCPflAOqkquoXEuTDQfrShChlMDTO0=;
        b=rS8v0HCe5eURNWtXVWGnMb2wBMOVo81WpWZWszmCg6oLTDCDZbgZ+pwjHFTbKzOEze
         82H6DN8/6aw07taFnrJ4nAuJkEmMJIuMejT2Prtrku8p5fLWv68BDirH8XOm/Nm8Dyo0
         /+4L+8gsvO+82IxYFsHI7Mc3P4VB931hOL5iTdJUqtFiqZGqMlQzsEgjMQbyBiZxXlf8
         tO5N8ZMAT+0E6K0S0+AkExk3DMz97cw1l1x1F1IoueDb4kcRoRDMgez7suMSdElvrokQ
         HYwaqvhy44nHOwZ9PH0eOYC5eAllMchFib9FOvdlONonz9OOsRJ+8RdANkpc4lQ/TPm4
         Qb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:x-gm-message-state:sender
         :from:to:cc:subject:date;
        bh=klvmSmzhomU9lSCPflAOqkquoXEuTDQfrShChlMDTO0=;
        b=sp8IfQRoqiwal3cfEVWJY5we2qUCfhZFldvCya0qN1T6Cd8wRtXFzhZklmSAeArB5I
         X5ZxsgCraNQFPxQWemB0PrG3WrcnaxxwlqN65sB5eh/OPRfGZeVUWQMHAJLV+3JJKqu0
         G80qj5Crc2SYN7McjhLEl2vw/LkK1ufZ4tlFsjjZypoWQEYNmGMyGkkcHD2TM/7Pi5RP
         TZL0Ygg/k2QDSaDlrOz1LfXA0/AJ+zQJnLYR6VrdaNEmTs/h6W4Cs9d1gDLbCS7GZp6A
         TS3zvC3ryNFCSFOARJiP7kYKs19RVg9NVXzY6ez0fdtYQS5hH5LSN0GMjhy/TEBQ6qTN
         KWQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf263W7U7/JyfA/Xr8nkxPpIHQwmevHtrJudQBGMkgJ6KBm5cUE/
	1doE6F3NfqvTQXQM+16Lvc0=
X-Google-Smtp-Source: AMsMyM7Y1CNluatBu6yAUiekCq6PdVEOljJaKLNvsqQuOEEup0p+fRYHQA0b397dAle30gilLCgsQg==
X-Received: by 2002:a17:902:e54e:b0:178:5371:5199 with SMTP id n14-20020a170902e54e00b0017853715199mr1931454plf.59.1663284562432;
        Thu, 15 Sep 2022 16:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:a411:b0:200:66a9:ced4 with SMTP id
 y17-20020a17090aa41100b0020066a9ced4ls293065pjp.3.-pod-control-gmail; Thu, 15
 Sep 2022 16:29:21 -0700 (PDT)
X-Received: by 2002:a17:902:8d8a:b0:16f:21fb:b97a with SMTP id v10-20020a1709028d8a00b0016f21fbb97amr1904875plo.160.1663284561261;
        Thu, 15 Sep 2022 16:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663284561; cv=none;
        d=google.com; s=arc-20160816;
        b=UynA+zt/vErATayidvLmCssl6m1c6yakCq/eFIQH0tSK4DBHgmmoWE3v1tplYSKL35
         LTJlrxPznCoCU38lSWs2ffOEB5+FTDZlZrLUuZljlm+XNnZS306ycjCYdzFnNoO4YkJd
         /W/B3BdV5/OJ7QY//CgQ/XAX7gEStFMwGC8t3k0hdC+yhH0JwItR6BXvRdKgX34xahd1
         hbbEPpn11UGg3TBbBFhSJHZWIRZ8YMM1SaeVMpTq5mHf0Rq9xX6tII0WoWT6AOq+WzXu
         /Ljgy7FATpMc1kMYrPFTg6j1tBbYw4XtQPJh0mFokCxTpmtKSWilndLANIaKhuukRtCL
         a7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to;
        bh=+uTlEQ6q8aqY57joS3uQP72+FHpgXSFnbn3Nhuk7rsg=;
        b=KXLp2Ts2a+kAAPTSjXXYAFtVw8Vwlb45ACPmq4BKXmudBHQblWVPxFCDmd08UxazEn
         Sg8xWtqIPGENhIxLTjNumaSCrR2oj54EUBG0IuPt1/UKb6e2fVTO3c2tRk0ItmdnbAkw
         hRtlc0PDyt8Dw1QL0AoJNvgm/aZPnJ3nbMBQrqhn84m4c8q4jPueiUl6PQXdi7Q85JRS
         /2y9VR+ZC9jQs+mHL0WQSIcWkTAw39vMBimeRDs7RzH278MTL5J3dBuqUwOCboOHEij1
         WjGD97tLWI281aoUHMV1tGA9h6pZGcHZnSWWvL239xGXSqViAkZ1DZR1KsYWjxL6uLci
         2V7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu. [128.30.2.78])
        by gmr-mx.google.com with ESMTPS id p14-20020a170902e74e00b00176d0b3d584si502581plf.11.2022.09.15.16.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 16:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) client-ip=128.30.2.78;
Received: from [128.177.82.146] (helo=srivatsab-a02.vmware.com)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1oYyID-000q2X-RC;
	Thu, 15 Sep 2022 19:29:13 -0400
To: Liang He <windhl@126.com>, jgross@suse.com,
 virtualization@lists.linux-foundation.org
Cc: wangkelin2023@163.com, jan.kiszka@siemens.com,
 Thomas Gleixner <tglx@linutronix.de>, jailhouse-dev@googlegroups.com,
 mark.rutland@arm.com, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, andy.shevchenko@gmail.com, robh+dt@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220915022343.4001331-1-windhl@126.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH] jailhouse: Hold reference returned from of_find_xxx API
Message-ID: <f7316f94-433f-d191-0379-423c22bec129@csail.mit.edu>
Date: Thu, 15 Sep 2022 16:29:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220915022343.4001331-1-windhl@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: srivatsa@csail.mit.edu
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as
 permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
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


[ Adding author and reviewers of commit 63338a38db95 ]

On 9/14/22 7:23 PM, Liang He wrote:
> In jailhouse_paravirt(), we should hold the reference returned from
> of_find_compatible_node() which has increased the refcount and then
> call of_node_put() with it when done.
> 
> Fixes: 63338a38db95 ("jailhouse: Provide detection for non-x86 systems")
> Signed-off-by: Liang He <windhl@126.com>
> Signed-off-by: Kelin Wang <wangkelin2023@163.com>
> ---
>  include/linux/hypervisor.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/hypervisor.h b/include/linux/hypervisor.h
> index 9efbc54e35e5..7fe1e8c6211c 100644
> --- a/include/linux/hypervisor.h
> +++ b/include/linux/hypervisor.h
> @@ -27,7 +27,11 @@ static inline void hypervisor_pin_vcpu(int cpu)
>  
>  static inline bool jailhouse_paravirt(void)
>  {
> -	return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +	struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +
> +	of_node_put(np);
> +
> +	return np;
>  }
>  

Thank you for the fix, but returning a pointer from a function with a
bool return type looks odd. Can we also fix that up please?


Regards,
Srivatsa
VMware Photon OS

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7316f94-433f-d191-0379-423c22bec129%40csail.mit.edu.
