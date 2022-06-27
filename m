Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF355B9BC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id x7-20020a05651c024700b002594efe50f0sf1014072ljn.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=wH/zSN5VjtCxF1/OPtCcJzolJRXiDIgQ/u8NtnsNBV5FC7B/ClJOsn7aSeoUt2xkzF
         mFYf7Z3s9ASYun4g9nJiVdn8CcZkyGshg8/eDnCzoMKWBv1FjHaMColE5YFGWpmWQpIa
         VWudrlY7POXSV7ovPFrnbWOrXuGIk59e1eCYsg26MC3IFPxH1rwuQBUhafh9q2cTQobw
         qNKNsA0/JOsfS9J2OoCt2zw081h8Ui4h4BuB1IlN1uR9yo5hlxUpIc90Pf/Yjuvcxhqe
         x6XXZH1KdiBXyX2+mODanTXF/p1seadjWaYw0hUsLn64r1AgFkkvkNPX9S15DlTqUR+w
         gnew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=L92w1/xWLVwiE5ue7qVSkEEOgM2Zjl4DElGdLRu7330=;
        b=s4IhYvwJfLzUv+KySFEgdsCDeBPUnqOCOrS4nMRHAtPo+KrEv0WPN0Yj8JooaulpuY
         tutljPMcKa4qtd9kQuEV8ceBLfc/joNDzKIRWuDy9vx1AYde6N93T/7p6qqDXGpd1VkR
         xSAsdcD8AtwfWCUvFTRghjHVT1OHc0OW7eZUs4pbpAskLQCsov4CCeLQubrl3rmMtodH
         U5uAPltK0r89wNiZ3YTGETYJC+7oTAHLnFy9RE+B8Bn4A56ZE8k3H49M1e5SUH0gf2SJ
         3kcgpe+dyaMlhFngdk6TUYFtFg+FEj517lgdN71iq71w4TBlUkcFx+zPoykMsjFsb57Z
         qxIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=rSnS8xpr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L92w1/xWLVwiE5ue7qVSkEEOgM2Zjl4DElGdLRu7330=;
        b=eVnRgL4PNLJTrzjJcDOXQHw0//1Y2rsukBiRDFzIwBX3GxYcU4MeHN+y4PYj3WJ8/C
         OWdbvihYQ7/WQ7q572qz99G7ciosm6qz/KzMgtOX8YZfUw0/Vh2UopbO2nLC9NERObj9
         X+4mD8j7YqcX2DXuU2PhW244vTsigjpl0KavexZZsCLUoMS+aZYwr86OFcszH/YyjMhk
         zNLtBEqEwvBQSpr3NmSA/6jP50kD+gTVsnVHtN7ZAeVV4QV3OlfS/PvHaVA2X8b1J2bq
         f7GlmXqmax4ZS3TJhW43XDBFfjqiMYF+PNYMaBjBB91rCa7gXn4Pc90107Nf+kQ9aPnW
         VmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L92w1/xWLVwiE5ue7qVSkEEOgM2Zjl4DElGdLRu7330=;
        b=TOGDEd9qBIFHr2d2M9eqOjhb+n1ucLVrnoWTcH5VgkmfahqGah8A2wSYQIjlX7lb+E
         +OgkfGGosjgy8+iImGRuRgCTh9vvFj8BLb/mUjM0PAsQ+PN+dEt4W4Fwl/mahzAYWdL4
         aH/qYguwTuje7v766l2nMdUXGLBwSdS3WZo49POBg1u+TS82dSlGJKrIHdWPoKozXcQk
         hJQma8lc/qLHLwb5DVHkmvYxk/Bo4wuBl1MVIZmzFMvJRD46y4MiXwAK+Si2UvDesYG3
         /49lyMUFJmJFJtX7L+QPmRAvs/YkdpPqWEVqQk+BEnUdthXyyk/D5aXGPWHejDAyYmFH
         ygDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9pN7Y9yuRfv/hrwT+LiQ8eLAtI58OQiyMf4cQuYiLBuT6DJZ3I
	8eR+PZJyfDVVwLFX9Ua17Ik=
X-Google-Smtp-Source: AGRyM1stkTRhGekrPockYxsnBhaofmJrzIP60tEnrjMxilqwn5noZdtvy5vr6inGmrwjwgBgMeGP/g==
X-Received: by 2002:a05:6512:1288:b0:47f:b7a6:221d with SMTP id u8-20020a056512128800b0047fb7a6221dmr9196454lfs.236.1656335619698;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf11:0:b0:24a:fdc1:7af4 with SMTP id c17-20020a2ebf11000000b0024afdc17af4ls4758548ljr.1.gmail;
 Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-Received: by 2002:a2e:2243:0:b0:25a:9dc3:fd81 with SMTP id i64-20020a2e2243000000b0025a9dc3fd81mr6568032lji.387.1656335617971;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=kdk1nL4DjJiPdxIkG6QaOjZ0OJ9Zpjgr3Wto3G5hstYx8b9oNMeeL7R4+qGKJU/cZ5
         uHfyfS15Xs+gYFGi6cg3zQiqhrK5ccXm49aW0aVnWPSRy/MJ/+UuLXtqUeF3i9FPCsho
         3q4mrDguww3a5fcZQt8O7aZoL9597gaPGGsLqIUFfrP3O3XosFVLDEAM9b0ozt1K66da
         eYlaOL4NJTlQLMswNfNnNt1R0w4crlmP1lhh2wKkRJzzE+kBUqUWSsl5EaUEu6Lf2Jdd
         Zq56nnPiOlSqFAClqulLXEsuwJlJfyiEyYYWL8njSlIyuP345wj7Q27wVmKTKc9V9R3r
         qybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JN4OFQpWPLA0fU9xCU/GO4hqLCjXoEZOW5q75iP490I=;
        b=ngmHnS4LANbNsnH18rPpYEGcYm4RoXPnHI+w2J/6IIQOHTBDP6ypvfiMpemrmEaapv
         E1iGHco55YGyDJcCtbMHGRIpQoQVsbfdHu9KoJLqwW3YzdKFs43l+lFMQho8DeiPf64u
         pWyAwRTXdRGqAYUw98YXQ7qeebsf2caQ0x+7HV6tkmUL9fqQ1ubooaTjPRrAiTfJT/ka
         xA3WZ/waGRw8t+CctN7jvBbSPNtD9IrDgYnslXQxtEKMjPgSpXS1tsJ6xFFEK8vNzdKA
         Gr8eO8LbAb3+9kQfECxt0o1c7Gcw57rWtjSNBxZM/Gt+U1dAu+iy6Ujl3RAin0leTwqS
         n2kA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=rSnS8xpr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t28-20020a05651c205c00b00258ed232ee9si364353ljo.8.2022.06.27.06.13.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp812rMPzy8K;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 09/20] core: Beautify for_each_cpu helper
Date: Mon, 27 Jun 2022 15:13:18 +0200
Message-ID: <20220627131329.3659-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=rSnS8xpr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Avoid -1 as impossible exception value, rather use the equally
impossible INVALID_CPU_ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index ececa026..35634e74 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -54,7 +54,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  *
  * @see for_each_cpu_except
  */
-#define for_each_cpu(cpu, set)	for_each_cpu_except(cpu, set, -1)
+#define for_each_cpu(cpu, set)	for_each_cpu_except(cpu, set, INVALID_CPU_ID)
 
 /**
  * Loop-generating macro for iterating over all CPUs in a set, except the
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-10-ralf.ramsauer%40oth-regensburg.de.
