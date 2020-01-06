Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OLZTYAKGQECQBCM6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CB131205
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:06 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id b13sf9400109wrx.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313206; cv=pass;
        d=google.com; s=arc-20160816;
        b=eXDoiXb8zwJYZng538eU/PM54fetMUE7j5D1Z+rsYurHbs4w/98PQExKUFAAhvoUuJ
         PUZFZblBR1ShDkj/WHYGfRyr98AlCEDsHMxvVlv3NF6YYGnaGq3rr9vQO6DwwEEKMnRN
         6Yhkwy96a7UGIyXQgNbWl3SzPpWUfTkBfh+iFFdRSdsB8eYNaVEdWzIylxY81eVR5WV3
         sEDnxLoXz+9AWw1uaEvnq5FQR1fkSxi3YSH17RRiT5guW4ROFIbC4ubcgayeYe3TSQ8P
         XFbY3weDDkgiwlaiIMQak6I+vvYaC83GDasSqwywFRmQj75VSUxhLYaJ6tDySVgLxRJ3
         qdGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Dy3NEYMButrcf1CWJmVeLJ+C0Cawk/hyDYXEmgK0o+8=;
        b=sWwccUBoc+f31I9J0Hw6cLwhI/ssRjhaG8sqLr9yUsREbdJ7qk9IwECkcA1Zt2+/fy
         fc0VX+R9I2+3ASsnZxTK/YwBxp2BKIlF/kmzbkNklxtUZNa5E1b0pmgkyjI7Cl0paFVG
         GaesKCfjMhwrE7JbWw43Lep24X7+XB9mP/RVRdUOaAjCxXNjNFkxFnbBm73uzwHw4gV0
         xRm6JUEC6ksRoVxRCBc2qiHDVrCqlwgbocEgimOl3/W/OfgOmCvGkWaqX75PLMCM2oR2
         vlIqs499y65fEBxFfR6mInfySHpsiL03EsseyNiQPhGCIAaLZQUO53OdZRudeWotrY2i
         /p3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Dy3NEYMButrcf1CWJmVeLJ+C0Cawk/hyDYXEmgK0o+8=;
        b=CP2V5lSvqbsrSpfXQZXBybQFcjeWR2ygkol7X0K5PEQgrrUwrAtrLKoaqih/RjQNGC
         aMI6WHwlNgzCKnaiZ0tOrLaXK909cGKwC2Sek8qV7MisjGzoy05hVKigMbdkOAIjcAfj
         hHBTbKjtY4V8Hz53203rzgEHYGzxETMg3Sva/BR+UJnrFlMBnDxPH8IFHpHuYmf9fJv8
         Sg0TTKAPvpOYEqdICBXt6F8eqLnmA1irGAp5X/5t9nQCwJFV6NPiaWVohcDrapB32fLr
         qzLLr0IXFrOQ28wSoczCkI4VgApNs4wNh4wEI8bJjJqvAsZSAf07hkR6uRVDPlNOA8kp
         gV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Dy3NEYMButrcf1CWJmVeLJ+C0Cawk/hyDYXEmgK0o+8=;
        b=knOdU+v4vEAKZRAKHNixuIZBuCKcMGqzg0GvynP+XPQwcjx2PRwjEh5wpyzN7LO09Q
         l/JoI4fC4h5UMC4hAIYHDFp0qgblemouSVrhs9hQbYGPetaoqI5TzjsmWng/gjxy1vy7
         m3TCa3N0xETmkkkKqJsijPzGdZs3zIj9aRpM6myEIFF44PdrZPeoFQkgsknU33UkHZqR
         GT4naLN2Sp06PSL4o8xCnhBcsLx64rt+NVsBdHEqri1QhJOkOHtlRnGyBErKFgqO/RHe
         IGpK+V3PjpwVXlR0vMZekPDcXfW90x6uR2vhHt11g5RTLgzq7Z+GSse4juQa85zFmLcE
         ONAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWw0Zu0R7LM3t9cMPjBo5U+xVsFMaM2iHCFWPyu/AU3ycOjhNjC
	0ZfG7+fWp18kykvZavJo+0M=
X-Google-Smtp-Source: APXvYqylEkBB9ud4ayqzRp1UeUUb8yjPVduxsKHlXrUevSN44pufplvyRmZj0x7RcL+fAMTNVc2/EA==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr105596524wrt.267.1578313205906;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c3d8:: with SMTP id t24ls5252881wmj.5.canary-gmail; Mon,
 06 Jan 2020 04:20:05 -0800 (PST)
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr35372549wmj.33.1578313205105;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=E/U/4Eqyba0JQ5Z3dsFhK5ys46Hkm2xRvn4L4xqbM65sDYaVzK+0RLWO6V2XV9wftE
         Ey+5SImedJio30aTqSHR55sU/DzM/FmxVr3dnXidMGlgCd5Jv7yPfXoNUG7w4RkqpWHM
         BUSg3+Fcobst+blZCIhmL6sjbCvL6NAkfeVAHdXne/pw6CTZCN+8rdoXoE6fyn7xCR/X
         ykImBT781KaiZWE1mSfHA/TWwclenz0dvToKwdQ2fvgAZXUUDdEnAx8fJQ3B6MFnVHG1
         8lYALB0SMdaT+HgK/jYUKlNaY/0pwiTsEvN8MJBD8mjlVlypWCxGt2BUu7Xmozqjk0tS
         xpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=UnQvkfye3E/ZO+q2+/mciMjkIPkLOJqldMDSKzZKL5g=;
        b=NqFeZjBHsmwoi9xbs1gT3YopA0yjlXR42EsI2eKOs0K3uB7ZCkzSmAHpBgUnEZb8kE
         FAcfu6MsVS2XRDzFgERJrMxaPcOsOoyVaVrRDiSzHNW1BadQdSWJIybCMu8LRVi0oG9r
         DELdMNVCNhIbdO4FuOj/Crr+Eg/PsC75DPHNmP0Vm+sZBy0ghVmVKQnCPiTYupvzs56a
         Ff6imneF3viRPamSBoqzTI7RzfiUPQ3ZEcUAQAki2kAGCakjsgRm+YW6UtxiBXpmWf6v
         eF7WkP6vfGkEWnZN48CmZMQVIzfVXG1eG1HO3DKJKGugCIqh3dpASsUPynQcfs1hWjt3
         ERew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g3si2439199wrw.5.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK4mP019451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF9029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 35/38] core: ivshmem: Drop revision protocol ID
Date: Mon,  6 Jan 2020 13:18:16 +0100
Message-Id: <71b9ef1653ccc8fb483900a37c7f69e6bf9a1c46.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

Drop the possibility to carry ivshmem protocol revision numbers in the
scarce 16-bit space of the protocol ID. Rather force users to either to
revision management inside the protocol (e.g. via shared memory) or use
a new protocol ID in case of incompatible changes - or even avoid such
incompatible changes. This frees more space that we will need when we
want to map virtio device types into this namespace.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6d397d9c..7694c296 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -182,8 +182,8 @@ struct jailhouse_irqchip {
 #define JAILHOUSE_PCI_TYPE_IVSHMEM	0x03
 
 #define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
-#define JAILHOUSE_SHMEM_PROTO_VETH	0x0100
-#define JAILHOUSE_SHMEM_PROTO_CUSTOM	0x8000	/* 0x80xx..0xffxx */
+#define JAILHOUSE_SHMEM_PROTO_VETH	0x0001
+#define JAILHOUSE_SHMEM_PROTO_CUSTOM	0x4000	/* 0x4000..0x7fff */
 
 struct jailhouse_pci_device {
 	__u8 type;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71b9ef1653ccc8fb483900a37c7f69e6bf9a1c46.1578313099.git.jan.kiszka%40siemens.com.
