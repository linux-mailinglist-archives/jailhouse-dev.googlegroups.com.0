Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVFI2GBAMGQEKHWH22Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 229743416B8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:49 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id v29sf2148573ljd.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139348; cv=pass;
        d=google.com; s=arc-20160816;
        b=1C/zwVEHYcx+q/iG9D8ne0NpuFsz3lje2wq6Eh7h6iT58R9v6npHLExFXZhxkemJFY
         sKf5ot1eGgb0NTOYp+6NZcjWUNiWIaD+wvWCu/tx6TbPsPI0YqmaAN7JVWq1iqED+NCD
         0iL5amU59O/3ya1Qm1qRCuok87tslJZRFdni6Lf6xMi5W6mhvSgrxGemH8uqDKzKXv1m
         KBihB59rfBxGY0uZJWv3tSUFv0vecDTFQv5seRH4O89jo3jEZTrhwD6Klqrp83fpajmL
         rd9fXDE58689FjHyIwvGGoibHOepawnSmaYIVMtb+ci0ZfI1XgLBRuYWFJoB73HdNRpX
         MT/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=U55fcFqYebhou4DJUx180VPdLXZMimvYnaePd12TygY=;
        b=Zhc1nsC6pxP5LZyu0WF5i1GCnoxSWt0TPZHtAV3ZOlGlpf6AUESwoMPkS0slJJUIq/
         hcyieFMhjntzNEZCCh2pPc64EuxdI/0dIDOzUTkbpmJMKGg7FaBbmFX9K54ek2vgprtk
         HYYSAqe/ZV0S9H47JcW97BPThnWsXBQyhc44dG7G5hYSnH2akxeapAA3bGe26v+qj5dE
         VJTPIQTJHfBaTMLgAP7+Br4DGEeizNMubQN9wT9BrSiODyiSFRP0q2nmcwjSxORwWYI9
         TquEJ1YCjDWzfCzfg9Nvq0Dm6wzWa63Llmq3e6PMpXbCOUu3bOKwuUG3lFan/mOx83oP
         b3Dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U55fcFqYebhou4DJUx180VPdLXZMimvYnaePd12TygY=;
        b=c11VCgo9IxSbNxGbIf2XZfk/LmCYbFGiw6jOc1B3zoXt/XjKW5hLrIlt66uB/6KMmH
         FpL3FoLoruKqtDLTuMj/Omg2AN/8jal5Dvh0XnEooR0XGs3fy3Y1oXdGxK4RQmobNKb5
         auWd7gu7eqro3eCQkapP1cjJJEKvTs/bNeI421c2klfolERfeU4ss2jU6gyVv9M4QacG
         kl4+yfVYl8mJXgSkJfJU5SaJ8ZwvWgHsulM5udij8iTf8mkuKUUdo44LHQ9zBtag06T5
         nr+T9uoapj8d68viN0Nl6DLQLk0G89fN7MyGWOzcjnn/JTBvceaTBDqczqps9TDXyyUa
         IPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U55fcFqYebhou4DJUx180VPdLXZMimvYnaePd12TygY=;
        b=N3CzbR3x0jrcWFYtO4l/rmHc5X9aINzsM/scEVT3ZTaE8Abg9a6KauuZkP8J01Vr+j
         co2Bfx3GbSe+qiJhuTKrfO+DDScIZFO0O0sTE7XR/MVzhBCvumi4AZZco/PV4hmfL8UG
         0bh3jII6Qx1hNp+ZXF03z5fYMxoiU5UmkkCk3icalfDsCLG3badCJXG5mWpX+JgFYP/7
         xzK8ceRjUXeYHuT7cIHapowLfyDfVyCNRJ3WDENC8mhJu/E7kSX1NxQOL0sABGnp5Pus
         A1CZr4tM1H65MMBAF5GKK5Da+mkKSfzELyayGq45P+zG0K7z+F5LeCb/t/JyEITRVxkS
         gKrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532eBu28JPMa7ZYN2APzZUYG2oxyEtryHuoawud23XNtloz2Ejcb
	udofuFLWwBRzIlnVT0CwU/g=
X-Google-Smtp-Source: ABdhPJypQLu/RbZUiv+26imRBcVx5m3GpMRAw3ocZOa7BZDIsj4G7Iv5qcWuv6j6DZmp5Ki/S7Td+Q==
X-Received: by 2002:a19:690f:: with SMTP id e15mr49427lfc.662.1616139348671;
        Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f8:: with SMTP id v24ls3535261lfo.2.gmail; Fri, 19 Mar
 2021 00:35:47 -0700 (PDT)
X-Received: by 2002:a19:c185:: with SMTP id r127mr52743lff.530.1616139347630;
        Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139347; cv=none;
        d=google.com; s=arc-20160816;
        b=tZzJ/RZORIxx641n7Htfh2jgsHIc3u36MpOmbNhzk3w+NflviTiKGrA2X4mAJ2nL5y
         RNpHLIURgeEGivVZiIPWytl/qMDppgmbslWLb2DHQbAyYy3vt1ZzAL/5AkbKcRheG9HD
         zhFU9OPSu9eUs8/fW1p/3FCSABcDJxeksSjirzQyIrhbNbPbOB2Ah29D7ANqzfnR3ZVt
         6dy61cI7rPln123KFjc6na5Ia8NeUKDz8qWGYkR1+ujk1u4ktNIX28BsKamUpPpLeOCr
         49KXHGywim2/OKtjdjjMY4llKA7bVZ0v7acuYD16uc56Qu/w+Ep3lK800IxZyXA0M39Q
         5VCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AHc59WpqEeVsexzl1dUTLMS7shZLDuc9K+vJ9p0zbYI=;
        b=wEt1Uoj48Espslsw+wDX3yMD+dE0pSSeX9MnBp/Lpb2dL2ScI+H/GTUxqnQcaTN+yx
         QZCPkJLn27AeiyLllmaCkB/ymiYc0NYr4ynkeehdFOiKehNce1MBKkiNRGWxPvY+CDXZ
         eiKZr7oA5JMwm8p08TzVOzvw9gsEeY5pq5jyJUl8+dJvTAthpebjlwP3uZAAfPYzqCi4
         +vE4KkUALB8c+AzEXxdxSPPaQ6oZ8r7QnjhDIVBHcK5k8sdJFsezcT+2+8W/Wi/qNidI
         QSATn6LgTLUjsJ7pzLGGXf87rcGPzuA/Or7GwAjGwVBEkWnDViYiRSChavj+bjGvnwwr
         WzJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q26si170058ljj.4.2021.03.19.00.35.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7Zkw7022857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:46 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC2004384;
	Fri, 19 Mar 2021 08:30:46 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 04/11] arm64: Reorder arch_cpu_init
Date: Fri, 19 Mar 2021 08:30:38 +0100
Message-Id: <275e855a0b75c03c9162c6a3bb4fe7414bf7e37e.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index a24bf1d7..58c90276 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -58,13 +58,13 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 	/* switch to the permanent page tables */
 	enable_mmu_el2(paging_hvirt2phys(cpu_data->pg_structs.root_table));
 
-	/* Setup guest traps */
-	arm_write_sysreg(HCR_EL2, hcr);
-
 	err = arm_cpu_init(cpu_data);
 	if (err)
 		return err;
 
+	/* Setup guest traps */
+	arm_write_sysreg(HCR_EL2, hcr);
+
 	/* Conditionally switch to hardened vectors */
 	if (this_cpu_data()->smccc_feat_workaround_1 >= ARM_SMCCC_SUCCESS)
 		arm_write_sysreg(vbar_el2, &hyp_vectors_hardened);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/275e855a0b75c03c9162c6a3bb4fe7414bf7e37e.1616139045.git.jan.kiszka%40siemens.com.
