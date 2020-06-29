Return-Path: <jailhouse-dev+bncBCB7D7MXMMILBKPH64CRUBHCQ5EB4@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CB20CE58
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 13:46:58 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id s28sf8427810pfd.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 04:46:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593431217; cv=pass;
        d=google.com; s=arc-20160816;
        b=vjg2gT3gQ68fuX1dmcyafp6FuxyLvTpGFxxbLOCHlo6S65NnBthjqJ0/bll6QSr49Y
         YeMZ438Za4DKdPdIJS6oPh2C6L5xASqiWCthdIYd8/DuY+dIEGEGGuUOEIXfd0i7tIXL
         SHQPYBy8TeXGqRV+fUsS7AKmMhJ8t7/eHREUJR4BIVoS3pUYYfT7limrj5oEjVwNs5E5
         P/DXNHbtURaGYXo4MdUb9xb2zG9du/CQdiqFrqDkDFS54/JpV3WLJ1Ai4ZmfINfIyNRh
         eqzVrmmcluZ4n+4+UMfVwKW7ZCLoAPwsYW/KH+8sq8xaD1zw10wDbU2q/6CQfr0X9hzs
         mt9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=Mfqpt1Qqnn0P3AScmRtep03SAYqv27MmrevfEEJ5c1M=;
        b=ipuDZ9xe2OyfYbXQm9uVb2HtKnJnBozvyr4U9zMAPlszwKptZRipr1jVB02hh2ErWw
         Wenb9uTR1HEZAlor+NicgHZxnv35tVvzMMdBcwPGdcmEp5sdc3/Om3/pV0eq8jsLfUAm
         iJlE+mPERJvCNCffteYQ7tKbL31pRtu/6xcxWO0IVB29FPKzDpcrRLaMQ81bvzSca5yC
         7+eYillZww/1vrNqOEGaA+DTarPaMAm3V6/30ZYrh0BMlxwLlHorubGTE9yyx6Gk7xI4
         gDWa7BZzJ6gXs1fw57OaxL6df8xmh1TDbx9NDtGiMBQDEdR18v7eBk3z1s/u8RXMuRhd
         YRAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UssFdaE2;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Mfqpt1Qqnn0P3AScmRtep03SAYqv27MmrevfEEJ5c1M=;
        b=TnMlNfkrfh+zRz6YGWemdsQoIvZXJPbP7+Sky7qd8HzvgQZEkg6MBhi0kY9mXn/b3v
         cnuk5K4r+/3OE07MeQ7bROunFZYQndwJTGtWIVxKkJN+vvPi1hzAE7qzDwoExCcz+Cmo
         IDacRjKI02LZAcD/mXriX6Y/H58Ak3Yxff5a5pV7/RVlqIucbiIij6V3yUXvY0iU+heo
         LMcjjZR89IueVxb9ASEslDcvbYmLwWsPuOfAn3GCblEBvp3H3kzz5kUFqLDFAvEWYHPr
         YQfN9+X4qh0Mi65qLdSmvkM2ex5H5sFZ3s8JGDuOIG+FuhwBcKRBb12/4+ulW1ZugWOA
         N2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mfqpt1Qqnn0P3AScmRtep03SAYqv27MmrevfEEJ5c1M=;
        b=EQKHCJnPZyZ3vDtls0f7P+zd93CBTYGxOijKbj4kjI8bOkB6DQJ7bOb1xt3Tq+4pHP
         +z/uwDRqXUdFFW7JJqL8EqQjqbCCiidG1/eYFYBH8qgQKAyizAa2ovQ6lrgntkWwLxbk
         qU5vOl/9KK4oAaCK7H3D3TcpJhR026zk4YbP820gtv0Q2q4bFSxy35ua+374LbF7oj+B
         0/P5ePg1iAhPxFshPtRSAZ8VXzMIetp+MfZaf2GUeRxN1cYMTkWO2yF4cxUiMnnnMNEW
         DX8IQ//4euHTTRUI55E7kBtiLUBqxXj6A3mTZcP1XGRj+gq3VQUgxO32AxQvhY1kc6Hn
         jVYQ==
X-Gm-Message-State: AOAM533R8KBLTeA0fwwSl4EsnPEcPyUfe5R+GF2qrOL0YI8CfUR1Gwpg
	xYX2WJ/sHI6N2wAWg5Pl06Y=
X-Google-Smtp-Source: ABdhPJw/I5FEAhHvoq9yGtopiLPT7qeC73NhlFeqygmcRujaWX4aZuSO3TluwvB/nihNbIl78U3esA==
X-Received: by 2002:a17:90b:1c12:: with SMTP id oc18mr15883209pjb.160.1593431217254;
        Mon, 29 Jun 2020 04:46:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:582:: with SMTP id 124ls425627pff.8.gmail; Mon, 29 Jun
 2020 04:46:56 -0700 (PDT)
X-Received: by 2002:aa7:82c8:: with SMTP id f8mr14938026pfn.165.1593431216652;
        Mon, 29 Jun 2020 04:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593431216; cv=none;
        d=google.com; s=arc-20160816;
        b=nN2pub8ZPSEQpom1fJ9S4u9NXggCw0VF8LHanhIa3yL88lKNWt4uh4UqmAMZS4HdJT
         J8Q++ggGtZ7e3lq2fp6+eihJaMG94D3pMmDWjeteeodXT9hVAN6OtggRX+E6+nL7kLch
         ZngZrJjbEo9dgGdYvrwvyWQPdkbBX+XuyW7M1Lv8vdsrt5Wsgf+NqKIuCKYKFFW1Pj2e
         al7tKflzYfUUdS5c0cvNbqYUI3ooOp+6nG8Am3c/7pHDT6IrDM0iS5aQXAdODJs/3KgT
         evuXeuxakWenHIhq1asbvzRAykVL8jjR8l2zFreWFs6i5xSlpK+y58/GcYR6U38mTI+D
         u6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lV5ltukfZqStRbm6rjxbd+T4CLZBAy7iQMDNrf8xAm8=;
        b=eSQTo0/+S+kj8vWTjcfdqeN2EFhxv3kXpNHDOeicClXpDrUPi2dYWGxvARXbiCgBYd
         Mj75dKzK4W+RpcgprCLGxdS8RGax28GwtsCscZHRL4UZxnOAKGrSiOkBi+1D6RQYgcjo
         WroPEyDNV6x9LcQVGDvwc2s9pzVPild+1AbfL3nnVRRhre6iGFf11DUBD5gS+CQ99jMl
         Bk4e1MCIHoGiVnHRGFe0Rdo+9qypHMtGDvl1Rppg5qVCkf0E0MoE7dnRwYUBtnwaCgCD
         gnXQoUzW5Dxyf9sAMiZBVpP/5uSgUK69OgZjIJUaEnbJhMvQYyhrhSeTiRe7ORltqoQA
         2E9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UssFdaE2;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id n68si1511720pgn.1.2020.06.29.04.46.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 04:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05TBktEQ089767;
	Mon, 29 Jun 2020 06:46:55 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05TBktSB005406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2020 06:46:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 29
 Jun 2020 06:46:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 29 Jun 2020 06:46:55 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TBkqMa017038;
	Mon, 29 Jun 2020 06:46:53 -0500
Subject: Re: [PATCH] README: drop the warning
To: <peng.fan@nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <alice.guo@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <20200629072439.29835-1-peng.fan@nxp.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b40f15a4-7eb7-0eae-8ce5-bc2169d47ca9@ti.com>
Date: Mon, 29 Jun 2020 17:16:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200629072439.29835-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=UssFdaE2;       spf=pass
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



On 29/06/20 12:54 pm, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
> in regular software releases. And it has also been deployed
> in real products.
> 
> So let's mark jailhouse product ready,  drop the warning that
> make people scared to use Jailhouse Hypervisor.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

May be 1.0 should be tagged :) Not sure what Jan's plan is.

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b40f15a4-7eb7-0eae-8ce5-bc2169d47ca9%40ti.com.
