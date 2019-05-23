Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAVMTLTQKGQEUJWLHSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2827D13
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:45:54 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id t13sf913255lfq.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:45:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558615554; cv=pass;
        d=google.com; s=arc-20160816;
        b=TJ+PkZtmMWAsQsmRmuRPvHDAeaJsmJXmiTsc1RQn0ZZAsA5HdVrHOUc5RSgoy6ZIhj
         DYk4RnYwoeG0qqFAbDLOAb4UeVwtCm97CYholXcwNfNfYae/4tpDRZvF92bIWT/QD83A
         vnsEzII77N7G26cDQwZOA94SW3VWkuLd2SCLG9CunA6xWQmjKO4u0/CJU3dN88HcYf62
         IlmudMLQNufozRjNDQ9Uf7FfprSEFeFbkYFt6WgReVKljaP5w5IYWBWMVfVgMApSqxVt
         tQzJ4NXP9oteTGXtBqRcGQ6VjHV2YeBQtGYYLiqxFd7THeIqfzon1+jjcVoGymE9TlSG
         9iJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=B5waOcNz83VuTCTzuc4eoLczX4WrpAXffodQyoL7J8Y=;
        b=ZUk+0Wp5zuQM36xde6Y56trg3iRUVNXs3n74KDnYn7yGn9kMNutSp1uT6Fy1PX6Ki2
         6WO8Y906G8AU1iCMyJ8lmaDVU68dSJx5JT9zlRvnZI+qATBmsiGoBNA8yRerH3Ir04WQ
         cGYYa+zYZ2jbHCVVBEZXY1ti84NknX0fdeoNI0h4OA952hsSIczFTEc/EaSIG2k8W9IH
         FNTP5IlqI4/atpxfCo+11jDjnh8V6E+kDwMz7Q9FIj6obR3YA8EP+5UxWHOANXuHwiUc
         TDLRmeJytLp3lG/plxHR0DyLbkyHlew5zv9XU5meMMcR/E91Yp5yztA/6lfiP27VwK/K
         ZMuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B5waOcNz83VuTCTzuc4eoLczX4WrpAXffodQyoL7J8Y=;
        b=mdX/ry5jdLPYKNV63Qo2uUBoBNPpLU5TAqObfN1nNIKy023ENda4U5fRx1v7tOtddb
         Lck3+eKbXQrGQmN8LNszqUdBGcIqAQTySo1jqWwYC1GjikX3Vt+K3jDI2gZnFap84Xpz
         bolVERXxp7moPCYd1j1RmTB6pAzUXxDZB/nyYP2REdHumQE9SBFJCxfQcVbW9BbbI+ZN
         OjvCEyzL3+EZ67geOnAvnjx4DqFCGv71AHyBpOQDFx3jPIIdW2+kB7bJMUaZpRwS0uE5
         1brOrRRW9T1ZN54+fAKD6NiY4FUFAhSQNX7TKoISqmGtMnN1ck4M+Yhf2iT3ny3rLa7C
         7uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B5waOcNz83VuTCTzuc4eoLczX4WrpAXffodQyoL7J8Y=;
        b=bgikQODQZd8XvSCSSHHgMa6FKK5XNipQp/b7BYTnLFVyMde1he2xofeAHFFC8XkMsI
         3vNilDYbJsXkC6cgjRfrHR6A1lGsLewn0lPb1o3FW7T3eiJzVXhmouvSOeT49KyL0Djn
         mlkKHogp/S0boQ0em11/b25wFiuXDCCYxDRuTWqOgsG3hSy9j0N8QSeHsclsauPwmcxu
         8cKhkPVBYFLInNy+LDp+xq5qA0kXwwFfxZrrz2E+HKW25i77kak9YaThctNS0svPWGWP
         v+PNZeeYLlMFAPJZlFttghwAM0nezQsoG4BVD3Y5LQfvw9bxxJsSNnYHmIrF0vN0W8vd
         q27A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW72RrollBSruOwKrRO7g7wwwe9BPkGiPebaQZceWg+q4W0oo5I
	8RZNbcsKh9NYOw1W1o6s1L0=
X-Google-Smtp-Source: APXvYqzP5tT/ADkaqOOrFM9muYOAQwQNk/MZKkGe0jgZru/B82rOVGuS8Q076Rrtb+7dHNwxerhTrw==
X-Received: by 2002:a2e:9acb:: with SMTP id p11mr19624173ljj.129.1558615554215;
        Thu, 23 May 2019 05:45:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:511e:: with SMTP id q30ls143791lfb.3.gmail; Thu, 23 May
 2019 05:45:53 -0700 (PDT)
X-Received: by 2002:ac2:528f:: with SMTP id q15mr29335670lfm.37.1558615553540;
        Thu, 23 May 2019 05:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558615553; cv=none;
        d=google.com; s=arc-20160816;
        b=PsU928SSTi20BsHaON/Ut4XNpW4ffI94wTr+zgNFu1NK0tyOhBOvYdS9D0RhGCXUzb
         m1oGSpbgG6D371vvJpjd/xRCeLz5d3kePcEV80NFwGhIvdyzP2pnuIRVHGHLMfNiT7xj
         5aOskW+5pXCHP078qIROtF3tvj2rqoIll5D8bhJpKjydwfziIVVn+aOwxUxVKWmAtod/
         NAFBipLY6frpgGS944eCk2AelsWjM8mdcK8uJtZggGpoV95WNHmvl1s2xIX9KC/glcmc
         b3yAna6NuEUsyy2V7IGD22qJLUhc0NuB0jJub2xZ7FB1ghKb7hOku+phd7IXqEAVtGTy
         RSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Nr5ykOOinBQZyPc8Cq3z3zVgJZXol6bbZc4/XiaPQr0=;
        b=p1TcXKsmil0eo6pAawW7iqwhmWhxA6kn3UGPDC8d0E2dAFnYwEUUnznfHBkVPfXPV+
         scx5JK2aeDMdx7BLeUJWQ7wDjRGHIwLssy4SnwWLvCAn/2JOcFKFs/1oCk1Uc+c9AYOJ
         3blcAH7ga3EO91SsT6lp9vSNiEmg6ORFkGPqHWjiK01Q8HTJzr1xrlGB/4wWwKiEPqxh
         odBm25CjRrqpQhR1gEIyslRtizVVEGrTThDe0KcDt+kgEo4tl1pF8emFkKW3YRlFbKwi
         Vh2Spfpaq4ZTwnlw3ro/F8CBBzJnPeogsZHG4zq5UCayi92oZ/KHTdBu9ijMr8f35yoC
         18YQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p21si2220139ljj.1.2019.05.23.05.45.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x4NCjqG3024820
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 14:45:52 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4NCjqkt002490;
	Thu, 23 May 2019 14:45:52 +0200
Subject: Re: [PATCH v2 0/6] x86: enable SSE for inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a19c3b9a-d912-0bf6-d8cf-f2eaec65bfde@siemens.com>
Date: Thu, 23 May 2019 14:45:52 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
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

On 21.05.19 16:34, Ralf Ramsauer wrote:
> Hi,
> 
> x86 32-bit inmates are broken with recent gcc versions: they will very
> likely produce SSE instructions here and there for some optimisations.
> 
> This lets inmates crash, as SSE needs to be discovered and enabled
> before it can be used.
> 
> The solution is to either use -mno-sse (for the hypervisor and inmates),
> or to activate SSE for inmates. Let's go for enabling them, as almost
> all CPUs that support VT-x/SVM will very likely support SSE.
> 
> Though unlikely, SSE might be unavailable. We don't stop the inmate if
> SSE is unavailable, we let it continue.
> 
> The actual SSE patch is pretty simple, but I want to avoid duplicate
> code for header*.S, and I found some other spots where we can
> deduplicate 32/64 bit code.
> 
>    Ralf
> 
> since v1:
>    - don't stop the inmate if SSE is unavailable, let it continue
>      execution
>    - Also activate AVX, and discover some other CPU features. Report
>      availability of features in a x86_cpu_features struct
>    - Add a common interface for simple test cases
>    - Add a test that runs some SSE/AVX instruction
> 
> Ralf Ramsauer (6):
>    inmates: x86: rename header.S to header-64.S
>    inmates: x86: introduce a common assembler entry point
>    inmates: x86: Add accessors for different system registers
>    inmates: x86: discover and activate SSE/AVX
>    inmates: introduce test.h and test.c
>    inmates: x86: Add SSE/AVX test inmate
> 
>   inmates/lib/include/test.h                |  21 +++++
>   inmates/lib/test.c                        |  28 ++++++
>   inmates/lib/x86/Makefile                  |  23 +++--
>   inmates/lib/x86/cpu-features.c            | 103 +++++++++++++++++++++
>   inmates/lib/x86/header-32.S               |  29 +++---
>   inmates/lib/x86/{header.S => header-64.S} |  29 ++----
>   inmates/lib/x86/header-common.S           |  62 +++++++++++++
>   inmates/lib/x86/include/asm/regs.h        | 108 ++++++++++++++++++++++
>   inmates/lib/x86/inmate.lds                |   5 +-
>   inmates/tests/x86/Makefile                |   7 +-
>   inmates/tests/x86/mmio-access-32.c        |  52 ++++-------
>   inmates/tests/x86/mmio-access.c           |  76 +++++++--------
>   inmates/tests/x86/sse-demo-32.c           |   1 +
>   inmates/tests/x86/sse-demo.c              |  92 ++++++++++++++++++
>   14 files changed, 510 insertions(+), 126 deletions(-)
>   create mode 100644 inmates/lib/include/test.h
>   create mode 100644 inmates/lib/test.c
>   create mode 100644 inmates/lib/x86/cpu-features.c
>   rename inmates/lib/x86/{header.S => header-64.S} (91%)
>   create mode 100644 inmates/lib/x86/header-common.S
>   create mode 120000 inmates/tests/x86/sse-demo-32.c
>   create mode 100644 inmates/tests/x86/sse-demo.c
> 

Will look through this "soon".

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a19c3b9a-d912-0bf6-d8cf-f2eaec65bfde%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
