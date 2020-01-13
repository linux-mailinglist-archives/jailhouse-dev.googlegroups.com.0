Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3UV6HYAKGQEXHYO5KQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd39.google.com (mail-io1-xd39.google.com [IPv6:2607:f8b0:4864:20::d39])
	by mail.lfdr.de (Postfix) with ESMTPS id 03502138F85
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:16 +0100 (CET)
Received: by mail-io1-xd39.google.com with SMTP id m12sf5548124ioh.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912494; cv=pass;
        d=google.com; s=arc-20160816;
        b=U5PeqLKbjEPjE0jWO5P2SXyFyZPpchQ+YKoq2U4ycokJSg4PhedIz3yjlzWSf52kUo
         Dnop1k6ha+YEw+ru1wQWoSHSQ4Fuca6mrAdimNVEG2PDfaCwGPiP2JzCj8bc7qLD1mjH
         3tujMeqzx+hMyG2aJAZP+39xF19BG53CcqsmC3Tux1kkbmlC9qsVqB2SG8+ttWHRZWcQ
         gZwcjIC6QIc0e+IGbJ+lbxYsPYZPaVrLo0OS1PWULzScohpbQus91gJXTzNKlVg8fBgj
         5OKFgwC9RLsuvtSd6BO15tzk2imgLpIZidH8ktTfkbwkMsd/WEVxG6Uo8Tx1ZCSGT+qC
         wxBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KzcHW0MVPDe+o8KMS2RmMwwNWZ7CcBqHDfn91Nk2lB4=;
        b=WMYLJdDmK+2rFFzeoorGM5j8VaialAi0/6RD0bAJ/9ZLWhrstjhH3trRjYNYFSnSSe
         QHUVHLdjo4cAqkhKFkMVrs1w0Gu7Of6cNeXduLKLLis0UXzeJAp5ACMTbTwS9MR/qn3K
         pCmS/YpQf5/v242jHnNHMUgeb/gI7gtVIlpT8WndOIYT4sF0ETNnrNXBC1PMH+DxSQT/
         FRnKjc7vYrCIKXAcWk6CuUEp5+YF03B4FnqsX44goJaHm8drrDmKvcCiOJwYmdHEIqTL
         H1EaZHkKm/V09cBmx39i69VQZ2bshWy2XpgRHGAuDJj1z5QetXPKtt6tBIOzAqRI3/yI
         FCUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mTyK10nG;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KzcHW0MVPDe+o8KMS2RmMwwNWZ7CcBqHDfn91Nk2lB4=;
        b=eJwRDhyu1/03HH8ZVw+oL2kecLjRVwkO18h2emdTtTFO89mSKz0vARH4f9JmO+jLjC
         /o7+RQ7uyzQ2t+WmbJNcds/xpO+besJqfsGn+h9xkc0vt0ZLTwUURF9gmY4iaPBWuWyT
         YBO+dFM3THgI8LDgthRgp6frlHBGzYjfYiFl6e9EXMEoIrvgp6yUDiXyfuN8KSHsfxT9
         aeJNdE7LVloXFJLJpXijnttENy2wQuHz9drO8Ra6nKMU+iyvlFvw02HJwAKD0JlAI3J9
         Blrm3Dhu4D8hTrwH0xx3sQrvsalZbpoBLubJxEeA7QBdx7FMbVZtrSog/vNSBt91owT+
         5bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KzcHW0MVPDe+o8KMS2RmMwwNWZ7CcBqHDfn91Nk2lB4=;
        b=CRYanSV4VLT0NvbvPrBX/VRzQZ0njJpdDtrpHiWNaefqDy+pAYahPku9TTIk27sbFZ
         KKcvzYOa/3Z589nuuAwcsihcQfe+/QS4X6HYiLuJ+jFzYyJWUZXIrrnyMMolsQfgC74t
         sziFC3G6DJIyT0k1FBesahI4OmdNdczcik1nFaRKKZZMcIfS9Bw3InK7jZxbrFbB319Y
         3xTeAU5UL7p6xeKjOeQN3Gwk3xjM27/L1bfLDeUV1RYVrZJ++N69i97uTyOJDaX3Jmw+
         7fNbkH+i50neVJ05Y/XPk9ll4QnlWm2tBMKF0eigSNNcofFPMKfYmO8GEdbxLctF5SaT
         kedA==
X-Gm-Message-State: APjAAAWVwikDbJ8ztzn8ADPwNQiWzgphqScdjX4UDmyB7cjZoOrs0kaE
	+pFbBKqaSERefJg2ydmhQM0=
X-Google-Smtp-Source: APXvYqxGsj8gDKFuPdGZMDpsRQDdDXJgyRbyCaDwaHQPQzSWaSvpI0C0w1WGAHdMth4dsjdzz1gRwA==
X-Received: by 2002:a92:8893:: with SMTP id m19mr14297313ilh.4.1578912494516;
        Mon, 13 Jan 2020 02:48:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6602:2256:: with SMTP id o22ls1753119ioo.11.gmail; Mon,
 13 Jan 2020 02:48:14 -0800 (PST)
X-Received: by 2002:a6b:6712:: with SMTP id b18mr12358957ioc.256.1578912494062;
        Mon, 13 Jan 2020 02:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912494; cv=none;
        d=google.com; s=arc-20160816;
        b=uhrtMcRDunbE0A6/xEdkleqst8qXHXS1r7eZ179NEdmSavU48OgpPbmjJS17qubcMI
         wsy82BNJK9kWdq46NNsLPfc8edsWHkjP9sHhCVeZh3UviTjs2WY3JS5CjOVddF+5cniL
         lSLbdfK21WRoR6YjmYfOquWapMpHEfWvA9oUPxJ5BkEHdhWvDCtVI9MLhgqcxUPhm2Oq
         woaMnw6gmkL2QQ7oy5tEASC7/atXPtOwqZXfDu8alcozPKk39gE2+l4fh/R5RcVV9cgp
         5sjWxsyufpFYt1xUPsUCSTF6hjrB8sPB7WMJagOxcGaG3bOljAW8NIIgMncUdcDgTAeu
         0Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AosoKB5jBAJcHPQtFt4dVZJtsAKuTsAJY96IYsGvLnY=;
        b=jWYrOrp6DUjck/jS/6+MmQVyIFXVTpgBOsiTMGg6XEPSwOh3ZOm4xCxzU4AcGm0pJF
         JSyms70m2ezh/W0gHoHSUHsbHWuqjj4D+5TEsT0T+s9UITstXCXWJmUcx5T4dfnfdU0V
         jOIvzz6BdRloAcEXIcjVgb2jRY0YtaeaMQLLsMPY0PY47F6cb5N/WEE+/8Vh4CismcVW
         8dz0RfSGaiYHH3F4tyFgN1tmLJIPSn64rVqAS0mK4SLAVHk4tI7anQqAbD1PiCSe7+Sr
         O4cI5utJfv7PVqbEzBrMbrZZJ2HRGcH+J4slVc8cEBwlTvBJJTKgp1wbxyZstTh0a6sS
         t2jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mTyK10nG;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id h13si433372ioe.5.2020.01.13.02.48.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:13 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmDpa070183;
	Mon, 13 Jan 2020 04:48:13 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmDFP027570;
	Mon, 13 Jan 2020 04:48:13 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:13 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9MH011219;
	Mon, 13 Jan 2020 04:48:12 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 1/5] core: Update cell_state while destroying the cell
Date: Mon, 13 Jan 2020 16:16:43 +0530
Message-ID: <20200113104647.25884-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=mTyK10nG;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Update the cell_state to SHUT_DOWN as part of the cell_destroy
This will make sure that the memory_unmap calls and unit's
cell_exit calls can see the correct status of the cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index a0a7532c..2ab6beac 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -363,6 +363,8 @@ static void cell_destroy_internal(struct cell *cell)
 	unsigned int cpu, n;
 	struct unit *unit;
 
+	cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_SHUT_DOWN;
+
 	for_each_cpu(cpu, cell->cpu_set) {
 		arch_park_cpu(cpu);
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-2-nikhil.nd%40ti.com.
