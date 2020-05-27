Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBY53XH3AKGQESJYL2II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x140.google.com (mail-il1-x140.google.com [IPv6:2607:f8b0:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 773461E425D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:32:36 +0200 (CEST)
Received: by mail-il1-x140.google.com with SMTP id c29sf4902999ilf.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:32:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582755; cv=pass;
        d=google.com; s=arc-20160816;
        b=UFg3LxRPUe0BXBhl2b8gMaJByCSA8UTUO3NqHByurO0dpqKj9DkZgFnIiZX2M2PZ58
         kRUntibnCHzlJfSKHWdoXrf3KiCbzsiVDoGUU9rZa3+jHk9a50nGwyhXo5GmHChd6z7v
         EkyhEFFAI9o9WiyvOEZ2gcMD2TL1ecQwuYjRUucvOb99ZbRynE5ohROcRhyTghLKkfi9
         Xh9JM2Heryq5pETuKDrcgPdwHeyRoCMwzkmkJlFuFoSpIS6wKOE2DIJEqIlxd8xyG3qd
         0u6g1NzsEuMjsv7K7SodOTWVPjm/6cCwjOfhm/rpRGZ+5Dc5Rhkh7Pxi+iyVIKrrWacZ
         wQ0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6SkaLLHygzOCfmbfs2csc1xKVThK7NRPJQ8TwsJA+kg=;
        b=LTugs8NtT2ASL7T0PFdp3zXT1jWEgjKj85YiaztgCpS2xxqsXmYKRyOh2S1bY+mkwe
         EXCB3Nl3pbjJ+V+vQqN3/A8+HwtqLUmxTusjrXPg/IF3EH9KIYfwpf2gHvcdiyYIl8+B
         CpExdkj6/4jRdFEQq50br8fitPYsFunCWVGgWvttmjpVllbLo+ELLsYkOsvI5u75s3Lh
         K/v6c8kHKmPgB9RxNLePAs36LBKlFaz6cfXkkLCG19x1Jjje9HytLiqbApXQ9aByEC0W
         +bo8thRwTp7BcHzGbr+3ltTwdpEjxIr40v8Czy7ffyLv5UnP2/j8YbaR4zBVfWDIw1jo
         if0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JhWMKtEv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6SkaLLHygzOCfmbfs2csc1xKVThK7NRPJQ8TwsJA+kg=;
        b=G6bCmx4qSrHbeicgnhOvVH0pW1BxtlZEA8mUUFOPNva4u/SwW22ZPOmVQb/56wlR/D
         PvJjga+pPXdKNTQxNZuSIGJwYPYcsWgi0/WBu7BnBrmW7XNijQdYkf2I2OBXhCgPPDOc
         YRPIAB67nkocnBvJL9uccxrgAZIumnTiCRMRiiVZqxA2DOWoB+jarlgvRh/M83x0kFmr
         BtbjHifJSqGNBk8uyjK8KL7ASd2/c5/t43j3viFxm334ieGkvbqrH8CiQcU9aGi7RcXR
         4XjPngSCfWfNCmOhbPOCeDrcL44vs7EqVKF5mf98XVghuVif4oIiNZTIQsohbjTxANRr
         y9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6SkaLLHygzOCfmbfs2csc1xKVThK7NRPJQ8TwsJA+kg=;
        b=A53OHhnivWlDfhsK8IXuZb7Z/D+mo2m3Zb9vu/Vk1Q0CoWP7+ogX0AGgvJjBURNdzs
         /SPvrT2pWa79msQ/nA+XNscVBT09UwulQOUzbLW+l5/sSgq/0Qbqd8JM+GyWn0q9kpTJ
         LthomNZZE13OXzLgyOE7qMVM95sH8vQYCHYdvJZ8dJsnm6V5enYRzki33E34LVMcmmM+
         ykHkP7w3wlAwbPLpkUPIcTscsM1hV2kkmZjKPTCjLSUG0tYQLBTrtzStotE55++x6/Qa
         6XdfxLW6Uy/7QUcsNsWGG+EOjlot0KfWRYX4EOjLrfLtSXOBIC8JrUAEZ0x83rJtQJSk
         Upjw==
X-Gm-Message-State: AOAM532LbLlG76CrQP7u3pvFnDq916QVr5vl7UiFgd5xnmPYmxwPjorY
	58qrO6VJkffhiz63qQ5HmPY=
X-Google-Smtp-Source: ABdhPJw8kObV3v7oZyD752mQJr4LUGt1i71eXcPk4ifxfg1jKPX6Zqj7NOtU1jtj21bpqPGmrGLPjQ==
X-Received: by 2002:a92:5acb:: with SMTP id b72mr5423701ilg.76.1590582755473;
        Wed, 27 May 2020 05:32:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5e:9505:: with SMTP id r5ls1865126ioj.10.gmail; Wed, 27 May
 2020 05:32:35 -0700 (PDT)
X-Received: by 2002:a6b:ea11:: with SMTP id m17mr20249549ioc.149.1590582755053;
        Wed, 27 May 2020 05:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582755; cv=none;
        d=google.com; s=arc-20160816;
        b=P7EoErb+BT/GdA3UcTJ3xpDd0YyyJJDZWPfsYY2N5gfDSe3y2IMUELZDvaWqEmykUS
         cTyxwpcAWOn3q+24l9hbQySXrtTOyT6lSMZk162QGTn1MudmyWlLZh5RYMSRkLu5kfWE
         3TCnoxWnnXOVuB16wBv1gNG3VSeFBZcp14uq93FHHChJhYqH1hmXDInwIIJW8VPLr+OR
         hDKNqwJWl6DI4FzsFCy3ieY8JyHDt8BFbglvbrMRAO0I7IzrGtzO6WZ4oQdqJPUSts5d
         kd7q/+62Joag5vmpA9F1likS/o8C0yEOCUSPshVmfG2UkWXsEGWAsYsfTi0Ty+PKkkqX
         LJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uc3qekbZx+plY/6t9N8rW+OjGzAYyQaqKElm/mfieqQ=;
        b=CIe0ThSznhfcvBZn9lKuloGORDnybqxHkAbGnlCEEz1wTPzymvkBUMTvzLFQ33gQFm
         JqW9FkQbRbgY2tnGTWWRlYpZCX1EFjWADLryhph9qh7gZG+h/eyUuCz55TZpng5AZ7jj
         J5x5JdXBOx7O26oAgiO+6ZupmPJi7b/H1IAyaO2JDBs79PI9NYQrJ3VrgpqDzm/twZpa
         N1zwMzRIj18sgkFlmF5DFw8XsxaknZUGdEKkizYbAo4KyCQbCyCgOQd44wilbpBbZz2z
         GeNjX8L42woK5jx6cH/zVEHoG4lc50OLOZKipL7YSe2ss+Ru4syMfYa34LQvFbcCUknz
         Iifg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JhWMKtEv;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id d3si156183ilg.0.2020.05.27.05.32.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWYTd007811;
	Wed, 27 May 2020 07:32:34 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCWYjG123442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:32:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:32:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:32:34 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWPj9096152;
	Wed, 27 May 2020 07:32:33 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
Date: Wed, 27 May 2020 18:02:25 +0530
Message-ID: <20200527123225.31726-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527123225.31726-1-nikhil.nd@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=JhWMKtEv;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527123225.31726-5-nikhil.nd%40ti.com.
