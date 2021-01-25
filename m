Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBLPGXKAAMGQEZDE6GWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF4302498
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:50 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id k5sf7236532edk.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576109; cv=pass;
        d=google.com; s=arc-20160816;
        b=MvaIRhizi67Fnr9Byh1MJf8TMDeZtS0E0oTFOF/ijXfJ5N8a++QBXtGSZDTYmWqz6R
         I8cwGy4MLovmzb1he2Ym1xPMlVsiS1wlbcvSgdDk74vobBl5tiKrKdOkJuZUSuULgvdn
         xPWVy8EAGLk2L/l8ciLXhpFeXknYAQh2xX1X1tR59stTvFmfH6WU2Alm+dgAl1lzSewU
         HCdwZd3N0K6MiL/u453dksVcIMRamSAxWJGBYK96ADrIA5NNJQrM396tMSgn35rin00r
         8dPaBz+t68B7EHHXKG0qTG84sv0Zx5sdsVx3dsbf/xjiLxTynnyIrgyGc2XYEZywrWDY
         9tFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5igD4FrFmieSyF9SJtDLFfpBRPoKX1Imp/oDV9iTbsc=;
        b=SNZjrP2fY2FvObsJuZyFsXSCvm56w69TNSwKu4XWRu10QfD2mjVru4OzADz/1M8ulz
         vMJynlIsiSS15wibG+ItHkJEe9VrAjDRDRAtBrbwPL4tnnMPWh/vRIwJ8EyK2tcIGqje
         SKLByn78mMssVXU2GNJyuVmlcH2IjLB3MBa8C48blqnhPyfKC61Zpdstf2nM1oIgzPKt
         ij50HoEQA960/yy1niscMXGh2vnrKub0tutspJQLIHIJkPEzQxS15opkB8DLxIMogKDC
         2lLT8eXyXNxeGxjt7jV/gpH5pyR16FYeRLEPeFqS+qBuplBM+YtTS4J4eipvDziHjmeC
         ilHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Xu/Mm4C+";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5igD4FrFmieSyF9SJtDLFfpBRPoKX1Imp/oDV9iTbsc=;
        b=NH4Dw/frdajYhmc04kyIR65gIbFwf3LFYvvqYgMzHXZqERVPeep1YYUJS2xPV7FkTV
         dTR5t1X7idSD7/3TKDfYKSFrNu8DTSUEMMFztMowJ1Ai8qVl/cEPSvq+MYZ2uJYcrIXL
         pHY1OD/jQQktWbIFfdSYgGBeN2tV+aTMNqgGfRTgrDQi5A1I6ulWwmkXtexmuzYuTjwj
         uIQd2jRDJHKB+QsSGD5qrPy3JiXozZJitWBYdYNAKa71o3J2uFeFdr4LHFDTt8coSHm+
         m3+wae/OIpljqLIF3WWAGdXiguOhqEl1FCHycnYiQ+yL0l91mwpDzRx4wKv3eahMbRXW
         zaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5igD4FrFmieSyF9SJtDLFfpBRPoKX1Imp/oDV9iTbsc=;
        b=G08jUCVCVVZe42nyJN93obxrPpmKnG7BvoxlfEkVfos6sUEL0RzAmghs/LWnpHFjhw
         oLcI/WFaix9R9d2KEz2GYkJJjX8GuCZP5M1OYGqNZQBNl8N8DCaTRg5fDAE/IumsAguq
         /mwclsHMi4h95c7HCmGohPMA4WXxSuDhBCEsb3fXjSGPzCR/lz3yoLhYnLBrwUEzGuN9
         RRW43DTiPXmKq4MczyWtSd/cQVFtWseK6HeiU0VeMluvNAwcUClaFqhjv/IKdG0sZ7E/
         rJpGdvFigtXjlMoV2aUjZ8mCSXbdsHhZIoF1x56sDFwbO//uROwWnVrX5ZYBqTF8/s5U
         fTMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533N1Y4/0pilRa2mvWmtewHWhnMe9CCrpON9Snn9VQubEDJfAjT/
	SByjUsmevlnVKYkanIvvzwQ=
X-Google-Smtp-Source: ABdhPJx3+xmGg+5YjnFPvHujQptOBz+rnCqOuAcTKyOQ71Koe2JbbKYNaEnb6axEMiUnJ9+HObIR1g==
X-Received: by 2002:a50:fc97:: with SMTP id f23mr132310edq.307.1611576109798;
        Mon, 25 Jan 2021 04:01:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:310d:: with SMTP id dc13ls10039497edb.2.gmail; Mon,
 25 Jan 2021 04:01:49 -0800 (PST)
X-Received: by 2002:a05:6402:206c:: with SMTP id bd12mr190369edb.10.1611576109066;
        Mon, 25 Jan 2021 04:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576109; cv=none;
        d=google.com; s=arc-20160816;
        b=t5GdNZrRzPlTq67IywinWiQ0B3Uc9FRG8RY+rVA+hnjv5sapVRmE+x9nZ47tpSCRN4
         q+hLi46V9z6N3Eqi3AZJAyt6saXxLFAPJnBkENkFKuzfyKtuv6UR8BI1lgayFmlovAiF
         NH0fmHmj053Se0tlnTKBWfvA8C+ccrHcHwLF/fvz2xcL+/dTd2e+ezr3stsEwNwcp0fv
         hmBv4NkxOSNV4cFdQ2iSb3FiBlsaLD3M9frlo7lQD0lMnq2rS63YUQjQLY2hxCIJNneE
         NeygXHdG9q+tBUlXPvBvShcVjllK6DnXhYJD6L4JGiM6lgaIWHpdIJKvBTHPz3DV8iT8
         lVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nBukWX9ycrjFkM/lkRywDTJAorzyaPNfMzw0EoGQFqA=;
        b=bUNAbrT+E8nUcjM7lkMluK0hXfwYCdaTSjK+hIeAu0jM61IBZ+zBnfSDL7e2+W2xCq
         pMHMTj6j/AqKOl+Wy0c1cthHPczRP9rTlcwGG2z2apKIze5pi5B20m/qMKd0U9/hd9xL
         tw8lXEmfyYaRmCRRX9/XpFNZ4MgW8DWIDS6pI6fcFiul/LqLOHRYAZ7LUw1HiYPcYfRm
         lsQlE+nOEVxjqaLL44LDsZ1D+Yl/bSjqPYwHJ964eHdOHjspljOQCJghEfxF4/+iqPAW
         eWA79R4yLwN2Y6p5Ii2oPZhS5uzHIdo/96mjryw2/YsqMWBNuACYh056n7hDc9me6vhX
         Kv+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="Xu/Mm4C+";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id s1si825684edw.4.2021.01.25.04.01.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4D5qgtzyjw;
	Mon, 25 Jan 2021 13:01:48 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id vGpDd-neKtBb; Mon, 25 Jan 2021 13:01:48 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4D135NzyjM;
	Mon, 25 Jan 2021 13:01:48 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato95@gmail.com>,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 16/23] coloring: fix physical start address computation
Date: Mon, 25 Jan 2021 13:00:37 +0100
Message-Id: <20210125120044.56794-17-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="Xu/Mm4C+";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

From: Luca Miccio <lucmiccio@gmail.com>

The variable used to set the current way sized offset is wrongly
increased each time a bit range is used.
This means that if we have a discontinuous coloring configuration
we will end up wasting useful pages in the same offset.
Fix this issue and increase the offset factor only when all ranges
in the color bitmask have been evaluated.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Reported-by: Carlo Nonato <carlo.nonato95@gmail.com>
Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/coloring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index ea59e292..123e191b 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -167,7 +167,6 @@ int color_cell_op(struct cell *cell,
 			mr.virt_start = virt_start;
 			/* update next round */
 			virt_start += mr.size;
-			n++;
 #if 0
 			col_print("V: 0x%08llx -> P: 0x%08llx (size = 0x%08llx)\n",
 					mr.virt_start, mr.phys_start,
@@ -177,6 +176,7 @@ int color_cell_op(struct cell *cell,
 			if (err)
 				return err;
 		}
+		n++;
 	}
 
 	col_print("Result: %d\n", err);
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-17-andrea.bastoni%40tum.de.
