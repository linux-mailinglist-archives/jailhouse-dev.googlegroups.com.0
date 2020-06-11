Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBD6TRD3QKGQEYIY3JFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DE1F6858
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:40 +0200 (CEST)
Received: by mail-vk1-xa39.google.com with SMTP id g3sf1180971vkb.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880079; cv=pass;
        d=google.com; s=arc-20160816;
        b=e/ce7Q05OW8zXLF1eiwMJJkZNi9KxYn4TTjuJbKHzNjDRwblGH8ItCnR4pRbhyR30t
         EaECjc2DHf5sOtNlwGyvaSlAlA3d4hHM9qAuxj0R2iFToXRRhhBPi/sKv8GPqJf9iZ4v
         JW/VktVSJ20ZxrbSX1RBq/T/5ZCw90G1xHiAlaxADc6kPx3AW8bPAyIT/S1lE6FqK9nj
         wLv9VtBRQF8q+DErCMU1xfwDY4b8sZlIFkEc7fulrnL69IWoAGwBIAOPSLrJkID6pucb
         2F5hY7lkGf6sCwx/GYjIlobZ16Uu+PzIBK1xGsl3vqlywPCrcvGKsskYd49C4N0Jqitb
         j4KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/s5UUAZGFPMP4TPZBA/U5nMdLEH2CWbkWJ/rxdPLFuc=;
        b=QkurMEWcy2TGk6YtsMbbcCHTPVkG4n2grMu7Ppz6EWoJF9ZkvK7jGtbIMFPyWouOR2
         niepCyu7zoPEToR4CSixAeZ2VEGgL/U2nODpNkeEe2joqWLz/NHVOz3VyxFOvLCRf6Jw
         xC+J8UpxRy5lzfLepeS6L4pbMvScBOKgF7aSzXSgqWdnn4mSCjwyq8CONyOLy1/J4+Tu
         6qKhKHvFA5hA/rp6mqKQhOfv2zBdtYXxdFtrL4Wr2p66OAZHutXmp1QwS0Zv+jvcN56n
         xg4jodxMg2vKy+0qJqj8n6Hxq7UVzkzLF8VWJv/1/BM3zBpn/hpRkMEcEcEIuJrNhRx3
         bUuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OXLnciXl;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/s5UUAZGFPMP4TPZBA/U5nMdLEH2CWbkWJ/rxdPLFuc=;
        b=U73B4ij6DsgxXXnRtmGIk5SrXrU5fOOusRLbebe6KDa6YBNJGO3oHgwzhAOhQhXz4V
         Alf1hk3XsRQIqy7X64rTt+ahzZiMFZIgTJA+znxph9Q045/30zY750ezWpeSoVxT6kW3
         SYie8WfUETcuvFZczMs7WG3bY4nEiWcaPYXpF8dhHPvmvXw7t1xWNUGZpDGnmZQBOsEk
         ZAF+Mkv+ToCS1N4r4SarZpXdrJimNT1gJGJW1msY+/SiHKr46fEhsNJ4l63visJn857s
         MZyAjBWDLaagOpMoBE7lPTitQSRBQVVsmJwDERGeXcZCmFzUGWcnmN32+XoPhk4BvAHC
         nCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/s5UUAZGFPMP4TPZBA/U5nMdLEH2CWbkWJ/rxdPLFuc=;
        b=JVMvyt982IYHLDpZfSt8M2/iIa6ibvR+7JXSWjCyjhU5mhQuq+47KRdWDM7qx3/eDh
         elwjSZEsYmNOEIOzIQ5FDQCdiMTBtnjoJDBGV1cONUQndrF88aBXpqKJM5wnGKQkpm/T
         IaQiGQLSTp6RYX0JOblVuwpl4f9p44JxbhlZsf/42tXVj/a04KQNPiXnzBCg3O0bIQon
         BEhWbiVyFjCtrQwg3SeC3DJ2ZOLNYGlitPCRXU5djnMzZ/A32NSfF7/88UtCSQJjpbvJ
         QV2PFyObEWtVoCFORZN9dwPXumsmpkO5hte8vvO5/YlfOdksv0Px/azYMC0l8Et8zxSm
         qFqA==
X-Gm-Message-State: AOAM530kigMsZ3xcbPpjv+o//TbL6z8qKSYxmvK6cUSEy9eVaPgxHMl9
	DhxMFMQkU6uS8TdQ+oocJX0=
X-Google-Smtp-Source: ABdhPJxR/cv74c0kf2WCWslqgO6tYEv4Uqvun2wAsMtVYehLFUVfRF7e0WafBVYmoNPNcpFDjqb52w==
X-Received: by 2002:ab0:2308:: with SMTP id a8mr6053513uao.88.1591880079442;
        Thu, 11 Jun 2020 05:54:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:3749:: with SMTP id a9ls131185uae.11.gmail; Thu, 11 Jun
 2020 05:54:38 -0700 (PDT)
X-Received: by 2002:a9f:2acc:: with SMTP id d12mr6213203uaj.116.1591880078719;
        Thu, 11 Jun 2020 05:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880078; cv=none;
        d=google.com; s=arc-20160816;
        b=cKd4JiKMlunTEqjk8cdFKnj4HhQhgf3WxJppuApBAFPBSoTfYiV1yNcS0204Enw4oG
         GpDz/8Ftjn0xYxKXduKLcQw5d1jNd57CIP6tsetjn9fOOTbZNz4gVuereSdtkgt3sVef
         bVtOVZas9tJCzN04TJoV0vDoeow7k07/WlnO+5rkR7CbdQpcxq4aIcYtr4qJHZ5VZ3eP
         IHn3PWEPvqMvCKiLLQHIckvGXRLbC6U7muhkuLqhjn3OHRuR1/5M7rmv1U86BDUEXkmT
         R+Ozv3ccJuFME0j0c2ZF4zsu7LUSZFO1YKy3/VQi9B8QySDTn1zuyQ4kdhs8C84H4sai
         tQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ASMJJ3/dCkEbQef2EMi146RFHaJgpdvLXS1aAWEyrI8=;
        b=PGQzm1+++mty4EroRK7cKhDPk4IibEN1AaC1y8sUrqCjLKo/w7sKJU8AInXXK0VKj1
         caaksqBjUQWLGcev2hflTNIknNc/d1F3FCUsTJgNWNJdHMFdiwXr1ZdKBMHP5rUEUQC7
         79v4NR7A4i+bB1BSgyNvg14CnRgDRRM7vsiUv0MFnhM4uRLBlwe3k8lyp+KTk58Ukfs5
         cugp5hgNCnyvgAO8r0gpzUnguoeuH7+1ZFTOHIn2SdbQuzIoDVmtUW22gbKEk4/K+TfE
         uqx9jZSaAjUeuAIwYl3ViDw3I9eaqkMbEmwEuKjxt8RNYtbRmZD8PhoBG/DFdYTDnTW+
         h6GA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OXLnciXl;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id n24si158958vsk.2.2020.06.11.05.54.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsbkv101812;
	Thu, 11 Jun 2020 07:54:37 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsbcT104672
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:37 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2k062138;
	Thu, 11 Jun 2020 07:54:36 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 7/9] tools: ivshmem-demo: Pass peer_id command line
Date: Thu, 11 Jun 2020 18:24:21 +0530
Message-ID: <20200611125423.16770-8-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=OXLnciXl;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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
Ideally, any peer should be able to communicate with
any other peer. By default, all demos send interrupt to
the next peer in a ring fashion.

Add support for passing a command line parater to specify
exact peer to send interrupt to.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 tools/ivshmem-demo.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 163653e1..d985b01e 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -19,6 +19,7 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
+#include <limits.h>
 #include <unistd.h>
 #include <sys/mman.h>
 #include <sys/fcntl.h>
@@ -81,20 +82,31 @@ int main(int argc, char *argv[])
 {
 	char sysfs_path[64];
 	struct ivshm_regs *regs;
-	uint32_t int_no, target = 0;
+	uint32_t int_no, target = INT_MAX;
 	struct signalfd_siginfo siginfo;
 	struct pollfd fds[2];
 	sigset_t sigset;
-	char *path;
-	int has_msix;
+	char *path = "/dev/uio0";
+	int has_msix, i;
 	int ret, size, offset, pgsize;
 
 	pgsize = getpagesize();
 
-	if (argc < 2)
-		path = strdup("/dev/uio0");
-	else
-		path = strdup(argv[1]);
+	for (i = 1; i < argc; i++) {
+		if (!strcmp("-t", argv[i]) || !strcmp("--target", argv[i])) {
+			i++;
+			target = atoi(argv[i]);
+			continue;
+		} else if (!strcmp("-d", argv[i]) || !strcmp("--device", argv[i])) {
+			i++;
+			path = argv[i];
+			continue;
+		} else {
+			printf("Invalid argument '%s'\n", argv[i]);
+			error(1, EINVAL, "Usage: ivshmem-demo [-d DEV] [-t TARGET]");
+		}
+	}
+
 	fds[0].fd = open(path, O_RDWR);
 	if (fds[0].fd < 0)
 		error(1, errno, "open(%s)", path);
@@ -113,6 +125,10 @@ int main(int argc, char *argv[])
 
 	id = mmio_read32(&regs->id);
 	printf("ID = %d\n", id);
+	if (target == INT_MAX)
+		target = (id + 1) % regs->max_peers;
+	if (target >= regs->max_peers || target == id)
+		error(1, EINVAL, "invalid peer number");
 
 	offset += pgsize;
 	size = uio_read_mem_size(path, 1);
@@ -180,7 +196,6 @@ int main(int argc, char *argv[])
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-8-nikhil.nd%40ti.com.
