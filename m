Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBP5M7D3AKGQEGGQG6II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B431F16E2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:12 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id h30sf9766445qva.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612991; cv=pass;
        d=google.com; s=arc-20160816;
        b=QCrM9zZeR7+GfVs3YV9oFRpMW5xnMIsCzShg12+tSeuHb0T8hb/bFrL1N8DW1oEf+b
         FZM3hmwngJ52hL/AeCUoVF5rST/hZFwnCTvYZuUJjYctie4uVoOmWr8nC2rhsn9gEkhH
         geI4PI9bJcJOFhKQ/A/w+4nr4CC0nznRpZmG7hGMyxj6G/yM1zeeA+mbzdd8QpBMRIf0
         vWSRCO8ZztP22XAJ4by88e+6FtYRnomF6yGJybEmQXZv66U+pjs8s4JAKRQ+t7YhZeh6
         U+JxC87o5y+uRXdahN0t7JpJXDvcrTg9CJis+wTfLr8vRDVJoI5H5RWJr8+eZjkKjiGo
         XOyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DlBVPdKIquBJ7PJOAZGaT+8URhm3J6AtRG9ICA/G/ds=;
        b=FfZyyHHLMksrdtdxHWuI0XIK89jXTa4gemNre1D8UgsU7DfnRaG3LFwh3StD77jCTl
         3m6RRW+6i4iWGU/Z509RjXBHSbecYNxtRmXff2qdDgtFH7thEuh/+7r517KJdvxGXhAn
         oB9SFLWcazbfN/1cbICH6OGUEe07p13D/p7K6n+8Pc0eRj6PwHv1/7Fg1eY6PisTCSBS
         JnNAOJ2oA7IgBZKjjH9/2oCGFluq9DBB+NpQ92Z/xjPJJOyIzr1mT6yXY1pQV3OZScN5
         szGzDwFBxKx+jd+vUvtFde5TCFz9O+gI73aE0GwFxIZNzMsOAl8FckUph5s8WeC6a0s9
         Asqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JnsYNblq;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DlBVPdKIquBJ7PJOAZGaT+8URhm3J6AtRG9ICA/G/ds=;
        b=d65i+zULJBwdrMiafru0vah1f3Tb346bJgIwZKAamapD9k/qbP4NyOVhM/g3EJgs/0
         pGXgAzUD8C9klZvsklr0GlLn1f25byuEJS6OUnv/o6a5Hfqy3IikGn/bhTSa9/HEWsok
         XCF1DUcFzTRtFjXOmHSg8Gwx5tqOMG0Tgv5ZN5JHB3PIP15dFgmuNzJjN11jOm1m758J
         p50BdJmNdl48wRbvhHMsX6z7ld7vwVXPflHQMUlABNr83f20rjQuLMoH/xUq4xl4UauW
         Ujkt4pHy7h0RTgZE+rEZjy1Wf5r3abxtsUQ7MR5j8PAN8nSAIL/oDa6haskl355hc7Iw
         bDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DlBVPdKIquBJ7PJOAZGaT+8URhm3J6AtRG9ICA/G/ds=;
        b=uApKkajNv+nxC1M8v1/ItwfmLbyr1SjITYkdUzlkgxZZ/lgsrqIM9BVtaET8eVC/Iv
         OeKHLZwztRWQP7194uW/jBrBgyqoaOAaF/b1N6x2ocaAOrHhWLbxffXZAl3ZNkGEN53d
         qIO73Cskg6OzmcDrb7OhUiWuCdJ1eem87bAYEuMSCMWNBmq8YSRyG3kwdnu9Moya9d3V
         b1gm5+CB7nfF7pjfQf7ZuxP/ErQmT823plj0T4Npo5pl72DObgBN+XfPSKFY3xpW8+qT
         sMILyDTcYp1a0lnU66F2LqbzRxkj2IE5PvO6LYcJ8Bi10sv3d90SRS0xEAjXNeXVcydl
         xExg==
X-Gm-Message-State: AOAM530VYJiWiIftFtIEVQ1xaUh8KLkeam5pe1FewdQSPeAkmy/0G7ew
	uv0UXZD/wPGUj13+tIwhoCA=
X-Google-Smtp-Source: ABdhPJwkPzqsWMyRf3j0Dze6AmD9xMe4vw2Xt6Dm3cLLI2oCcegMB0WbaRKEkF+sqUhgHBydZw7K1w==
X-Received: by 2002:a37:65c3:: with SMTP id z186mr23349672qkb.368.1591612991329;
        Mon, 08 Jun 2020 03:43:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:488a:: with SMTP id i10ls6163692qtq.2.gmail; Mon, 08 Jun
 2020 03:43:10 -0700 (PDT)
X-Received: by 2002:ac8:6c23:: with SMTP id k3mr22472607qtu.298.1591612990677;
        Mon, 08 Jun 2020 03:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612990; cv=none;
        d=google.com; s=arc-20160816;
        b=Pu1AGHikq+UAhgE2FGLbEnMpm2i35wD+jLsVnFfuGDriYt7AxDI7VV1Wm1PzDnGCM8
         fZ9QwMUz5mWQRF+fngv7VLB7xNfj6I+FB4f2CjVraXb/baTdxk6NSWUQNhWZwZtnpr9c
         NsqFl1HscQ4rtx19B7XsfFyCvWYCFUVPQb+USGM4iQuy0jH+s8J1zXE+6ZK69tAC5U4X
         jlvyZfUd2npR9Ow6bwsyKNQlGGL3zjR5Yb7Bfi1N5xTX90qEuNd97fOvf4Nch3aHTibf
         w0SeL0hN1XfkPlEByZCOhWtq5uGYX3S0GfTCGocS/ZrdAH4H4RU34LszCT7s593toHZL
         epPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uc3qekbZx+plY/6t9N8rW+OjGzAYyQaqKElm/mfieqQ=;
        b=gbyQhk0MvmDX7tWN2oR/HfU9YSdnetQFkyS4gjal7Cv+Mf6l2NNyf5Vw8pMedwyYpf
         ZufJsdyPsmdYdQUXeWHohgO+3dAYLMEO4veY7AegCXHt95ZxRzQ83e8T8fUIx5L8ZQg5
         9q+/el1CHFWVFIcVBBjbiZWG6Lbj7lsy76O6ZoWmhfvgD8LTi3FSCMW6M9LpUGIu6all
         Sx22Etp2ICSxrawdLtXU5dzuOtng88G1MrvZZGQX9zRlKtUUzoSQLrVu+J0lYG5DoZwa
         YfCCZOr1HEQZ2XuUS1vS6oUCVDwOjlfEHVTvAJlET6IbqnsDBKqBonUpILnGhnYZltEp
         NWQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JnsYNblq;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id a72si237777qkb.0.2020.06.08.03.43.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AhAp0119874;
	Mon, 8 Jun 2020 05:43:10 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AhA2G037033;
	Mon, 8 Jun 2020 05:43:10 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:10 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh8012229;
	Mon, 8 Jun 2020 05:43:08 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 7/9] tools: ivshmem-demo: Pass peer_id command line
Date: Mon, 8 Jun 2020 16:12:53 +0530
Message-ID: <20200608104255.18358-8-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=JnsYNblq;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

Number of peers available on a platform is different.
Do not hard code the target peer_id used for interrupt.
Parse this from the command line argument.

This de-couples the dependency between number of peers.
ivshmem-demo can be run to communicate with desired target

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 tools/ivshmem-demo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 163653e1..98d24111 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -91,10 +91,11 @@ int main(int argc, char *argv[])
 
 	pgsize = getpagesize();
 
-	if (argc < 2)
-		path = strdup("/dev/uio0");
-	else
-		path = strdup(argv[1]);
+	if (argc !=  3)
+		error(1, EINVAL, "Usage: ivshmem-demo </dev/uioX> <peer_id>");
+	path = strdup(argv[1]);
+	target = atoi(argv[2]);
+
 	fds[0].fd = open(path, O_RDWR);
 	if (fds[0].fd < 0)
 		error(1, errno, "open(%s)", path);
@@ -113,6 +114,8 @@ int main(int argc, char *argv[])
 
 	id = mmio_read32(&regs->id);
 	printf("ID = %d\n", id);
+	if (target >= regs->max_peers || target == id)
+		error(1, EINVAL, "invalid peer number");
 
 	offset += pgsize;
 	size = uio_read_mem_size(path, 1);
@@ -180,7 +183,6 @@ int main(int argc, char *argv[])
 				error(1, errno, "read(sigfd)");
 
 			int_no = has_msix ? (id + 1) : 0;
-			target = (id + 1) % 3;
 			printf("\nSending interrupt %d to peer %d\n",
 			       int_no, target);
 			mmio_write32(&regs->doorbell, int_no | (target << 16));
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-8-nikhil.nd%40ti.com.
