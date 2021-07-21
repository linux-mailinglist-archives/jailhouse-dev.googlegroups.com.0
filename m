Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUHV4CDQMGQEOX3LERA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D13D1223
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:18:41 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id k3-20020a5d52430000b0290138092aea94sf1139430wrc.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:18:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626880721; cv=pass;
        d=google.com; s=arc-20160816;
        b=IMbgPF1X0esbUUMGGBwviJt9vjNAKjoQAUGhWQSIoRc1Jewp61HzKPXK20Ft7W2By/
         NevCV4AcHBb0czHaP051Y5ASibPS8waFjgiOezZXY7Svg4my/pgZLNPItZzQQl0lv4Vp
         UEx+ibh0kPaZdgiV/eNLpLRvE2eKDGk56TRf1pZECfJtrHslJZzNT/k8bDrpRJPu4zvl
         5EzqAZp/gh9HiiQdbNBowIWtWPFUE62DoInLJ59fZ5z68V3Sv4BXOSYvKJDQLp/BCIG0
         7LrK7iSYQ9bEyO8iAQ1VlWwYIQl8HZCsTluL61Z3T0h3pjeR06QhnQKwuVJHM5EwDYCI
         B7Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ktzym3HKR6UoXoSCqbmalroOSNXsHfel8Lonsrv8GSc=;
        b=nKPfB3PPcyBt2w9nlerAU5kbaAW96zGymBceprGrwBUBOCXmpETycvIKSXcOlP+Dhw
         VOpxyHSawwg6NSm29p00gt9Nw8cdBKS93YxT1mo+coskQpehGXNYxBDEB/CMg6RB/RfY
         y9FyP9vWdYl//A/C/niX4fMPLbMWMs6TETtXEnsYxNN/mSnL7IfLGUfhLJssJAlEVkql
         lwRZnmYdKH/4o1AJ6FE49HAKO3BnIkjmU+2Svl0pCRAm4vS9ttWqUbUPd7Ohjhl/8enj
         1VUONMbB6H6tVFUoOFlMYiCqIs5ApOSHeGMFvLPGsq9Lt3yeiv4cPOXa8jQwWAOXNlDr
         vsfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ktzym3HKR6UoXoSCqbmalroOSNXsHfel8Lonsrv8GSc=;
        b=C+SIi7uOq+vfl/PsNKA9tniPnxtdVTSrupJd8ORGvvTtDKIaxmhJB5rx1yhQwrq2Sb
         BlX3sohQWfOXq0xhgzdEmK8mfoTdh/JLIxxzYwArIwphAEt/vGLnVDdq5xdRLUmgO9EM
         uZcR2Pq/yBj9QybkFRwsmym7Yac8XWtUZ6kPvaW2lvDh825oT7+fjPso2PKL8CeC9mIL
         9ujtu3Ahy44W/ePaRFvmdi5po6Q7XvTAi2Amg7y56/qsJjfUrBpjDzIUx5Xg9luYWFff
         GxblBhuFxQl4iV+Jgg5DVUrohMEpsQ8pcCtAluk4m9OVkauLWmYZScrRQfsT2SDgB6NT
         t5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ktzym3HKR6UoXoSCqbmalroOSNXsHfel8Lonsrv8GSc=;
        b=KDIDzPvi/402r+VHyQ3HRL4BN5eBp3vjgNEjea8XK7Dj6/IMwpfwOIGMELWmkLFnMU
         +xb7WPAO/nh1JOoSpB7hjX05aD8MxrnoPkfh/tOk3YgS7WoCACesFlL0ReAUIlCx7y2Z
         pk68LX4wH9+eQ1USUwy73ouDTOxER58Xm8Vf1sxwgmAB4ld17UoqmecSS+6ya5rFz0l/
         Mdo1sYmp7E9ui4D469VIrsk9z5G64yXKioMkJocgdDsQ9rl7Lpi0AcMds4iKDtUjbJpW
         sIeqtlHg8u5j8LAr9aPc6j3secWO1FHtVa8PZ3t3B3dvGjsWjlhbdqYsWOP3nlXZytve
         3QCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Sq0RkfM6B8qPAVW4CYgwzW7tJ5ztimbdsQx5Gk6QE0pi4vAA/
	G1EVSrPFOGFgZnKF6pO8Yqg=
X-Google-Smtp-Source: ABdhPJxj6dD+MdBdOVF4YxnWaOhZxID/9J4KuHzJ11Tl2CMyPdgW1E5eoDK3hGlQ3P5uxG17R4kGkA==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr43085981wrr.55.1626880721173;
        Wed, 21 Jul 2021 08:18:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:511e:: with SMTP id o30ls3176199wms.2.canary-gmail;
 Wed, 21 Jul 2021 08:18:40 -0700 (PDT)
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr39572081wmi.185.1626880720205;
        Wed, 21 Jul 2021 08:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626880720; cv=none;
        d=google.com; s=arc-20160816;
        b=fXmSP6K1D6zHCIZR91ivh/GjMZB70tMJdjQWyT/QtBwNY2uvyEqZSXx9tAVlnvwF2l
         vuCvQjQCCba3SnxCFyZvqhpXNHSno90qfYJTBs53GgaY5yAkxQgYWScAj16GGg9+ZNsT
         A+Lw/IE5en3NsTxmCjuNzp63ppfkxS7FTPdaqf+aszMh7tMjFF3mojEGOf/bNF6mILbA
         0nOMV6vksL5hbmqk4Q6OaxQcww7OKgvPGPATkNLtV3vO0WBZcIDmn8vMNLKyDA26vJHq
         c1kFUMRsXKf/94tdD0xOawCRt+GVEnbHxL0vo/R5gVINWUICdNCgpRJ55DnwBzwN7Oru
         /32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=8536JcvE2buzpfH5phoWuteulqfcQKzHMtU9SjnKlbo=;
        b=Ze3OBL0mI5TFlaVVcx3C8bA0vAmTuImhxC5gDyquyHYc/uOEWxLNvUJwTA0whnDU1a
         OBvJMz8Q2KTW6b7HEiLXUkDeGUjgX0XQ30Vds9NsssNwn/m6UUNaoM2wugZXdoJilknn
         3fPSoDqLMeFTn2IKSb14+/HZsQTqkXtL/BqRHdnV7fV2NNenINUTvt0DdwmeLWFdiIe9
         Au/GA4OQAiHGEnjaY6sH/jk4u/EdTEcXze55XznC3B5hs1I463SOKyfuy7d+DyapsHzE
         waZCqNEK6BSLd+sYyaIskjMNNtRZJult04s3V98lwKupjpXtlAThATPBEYSHCk6gGo3M
         kWUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k29si83736wms.0.2021.07.21.08.18.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LFIdFk016156
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:18:39 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFIdCD005768;
	Wed, 21 Jul 2021 17:18:39 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
 <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
 <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
 <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
 <1fb2994e-bc44-c9d6-1678-d574abaabbf4@siemens.com>
 <b38f413b91cd4b4686d636b57fe3665f@uni-rostock.de>
 <345af092-2503-9ce8-0c09-cdd6e3e679dc@siemens.com>
 <ab513562e1ba43c298c97a4e08d975c5@uni-rostock.de>
 <46885237-2f3e-8d77-11fc-b178dc827202@siemens.com>
 <cf1fcea46111456c9e33d5d30d840f38@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c2c85f94-2844-113d-b2ab-b169b1fa2449@siemens.com>
Date: Wed, 21 Jul 2021 17:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cf1fcea46111456c9e33d5d30d840f38@uni-rostock.de>
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

On 22.06.21 19:19, Moustafa Noufale wrote:
> Hi Mr. Kiszka, 
> Yes, you are right. I managed to build the kernel headers and make an output folder "build" and passed it to the Makefile and ran:
> make ARCH=arm64 CROSS_COMPILE=/bin/aarch64-linux-gnu-
> I saw also a conversation in google groups about a similar problem. But what modifications are required for the 4.14.98-imx Linux to be suitable for jailhouse? I mean, if is there something missing?

Conceptually, you need to backport the kernel patch queue that is
available in [1] or [2]. Some changes are needed to make things build,
some are "just" adding features like the ivshmem drivers. Note that [1]
contains some old 4.14 branch as well, but I would not expect it work
with latest versions of Jailhouse anymore.

Jan

[1] https://github.com/siemens/linux/commits/jailhouse-enabling/5.10
[2]
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c2c85f94-2844-113d-b2ab-b169b1fa2449%40siemens.com.
