Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBYN3XH3AKGQE7PLBCCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9D1E425C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:32:35 +0200 (CEST)
Received: by mail-qk1-x73e.google.com with SMTP id 25sf23641119qkc.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:32:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582754; cv=pass;
        d=google.com; s=arc-20160816;
        b=gwhjuzVyPEqcRk2fGx2IWoDf3G68uVzZyio+RbspsGFHFrrznKbt4F2IvBFGGRqKc3
         KKvYVqP2crxI1FQv5Rsr/XOxx04Ch0c34l9ZS8TkoRWeSlR9913m9fdn7602FkSn76BC
         yJa6Fgpu7S4IBmHu/7mqygggMnDok7IzpD0X9a2Nkx1HdsVJBQyD/Y20TArpm423wlw/
         JfFyFv9G/XHhael7RugSGGEY3+na4GPlIJO3pRDl4JN+b2KChfN44UxcVGycqDPDw03/
         lmh4OBFxDNXNO6ZcSwOMu/GrQCEfMdBKbb+w7k4p9VE0UwkZ7EmxMYU5DTgq4+atts/q
         F3DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wIedefvXmFy1MGBmlxNRbC59zS4pfAYy8IyvYJlFGZk=;
        b=tqvBQtf6FpMwx/aUQNiZRQuoKBrRYMNQJEsSH4OesnaMy9ozADX1j/bliXmFV8P4Bb
         bsnKZWHJfFlRlYNHc72hNo7wa/ecqNVEJLONDWGmhfFqwjLsyGV/K+J8QisA+Xr52D2M
         L8WHWOUBZxJ+ei3i7ArXZcm6ci6s2flQuPR1A6eKVbkgvFb8vVRQIn3Aon4LIXdxFE6k
         b/Axk9IXJ30Y9sog1l7Hvgv0PIGF5L1mjoUda4L6sp+64LDiw9u0mnoA7AHCNRWb8Gsf
         Rd17MT16kcfQgrnHymOHpW12+or9hS9o5gaBVlyAJleyBxTGNDIgqE5zmDfGPM4klKm0
         KssQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZZvRqpbj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wIedefvXmFy1MGBmlxNRbC59zS4pfAYy8IyvYJlFGZk=;
        b=ZSkI631af7OQt7SYn1gOYGzR1kALLo1VORoBDfwrTeqU2zk2SwPzNRBH8DPJ69gE9Y
         1VnmDa23CBEn8vSPyLpk0+pkqxzkHVP17dejR9D0MvuYpQHMOkgWqRnwmTuC3Uki2JVa
         f0mIPdmxNoHNkUDrzfDZ6y58n2J2NJYY+dN2qW8YTb+AGlEvCFrRVriGaSSYmbrqgOFT
         sD99NrQ03ig3zwEYqRS1bY/jDKOEv7TfamflTQOpZ2PPiSnXs0S1KMY7al1Ws/Q1W+j2
         XChF4lNC+iA6uHL3NnRfRFjct4nyHaKP/RekgvxrwavlvC241akJoIXQxVsxYQhfWk0J
         ru4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wIedefvXmFy1MGBmlxNRbC59zS4pfAYy8IyvYJlFGZk=;
        b=DxDTpDBfCoP+l4eC7jNfye3UqevGmyHh5fmL2OZbhRchtbbufIc0UlvzpwV+Gtd+Zi
         qh9Gh6doqbEZmS7UzBg2kTL0wprgCk3PtP/TciSOAwExzR+2+rUwgKc4udVbloGbQb4S
         FaMldyowI6TZaLB6TEeExPzb7eph2C6OciZEXcPHfY+6t5LDPo1lxE09ko71W9O+QmSQ
         xDDAaY6t6mlUB/5z7hBoFdXEV7oCNOeUzsV8efZtsMaoDa92SVUEgSOPZYHEyKPbPTgM
         NFS4LLC/qknN/dfc7CV1w4bt8eUBBdO7QgMwR0AHkSCzW8xFs9oUmTuwVp6mm4hsv9jN
         +fJQ==
X-Gm-Message-State: AOAM532H5XZRF1aaTwuGIY38LR6HzQwh3/gkDOBj6G24M9yuxIMHnfH5
	a1lByam5LzVEEM83ifK9qKw=
X-Google-Smtp-Source: ABdhPJziDEQshlON9L7Bcp4vp0VTeh8a4f/kbMLLE1RG32o82KCM7RrvjxH80SFT/kUf03pDeuFSZQ==
X-Received: by 2002:a05:620a:247:: with SMTP id q7mr3853674qkn.36.1590582754066;
        Wed, 27 May 2020 05:32:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7c8b:: with SMTP id y11ls2200626qtv.4.gmail; Wed, 27 May
 2020 05:32:33 -0700 (PDT)
X-Received: by 2002:ac8:7296:: with SMTP id v22mr3911015qto.239.1590582753567;
        Wed, 27 May 2020 05:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582753; cv=none;
        d=google.com; s=arc-20160816;
        b=L1Q76c+S1BN89uCi9bmTpe+SwRAcYGCVWdkcwwSDi+LcA11I9dF573UEJvkpN2H+tQ
         iyQHgXEYeixmF/W3W/Vy+UpqOiCjVCEwUxkpjmeL2xZUo4f3+pO7uBCBPXVjxtDQ7pKC
         gjPHK7iNYOoNPi24i+Xg7JkDMeguiyLHDdDJICD9udGL96c5NiKRg2vWfTpBANiOuFD/
         zHtv6X1p0I/v+IylQHUNX5Y644MTI/AdS+zdhM5jzU8exHtyLa51rM1GcIE+n2lUc8l4
         hIOYX34M/eQ/8eDXUnTmOtdAGkwsiq4iJAxsHFMmPcZJF2/RCA7L8GO9JNNqE0Gxtxu8
         1GTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=155Kbr0GnyHDcSxhmEe1KbriBfe+D7EBzXjzzLXKbpE=;
        b=JIiwgKaB9QCYTMw0SU2HFg8WFPUlhrXTORhgrrL06L5gFi4y3BHiOWmROFmLrrjEph
         Z2Qpw4KEpBYTV3rojfLQbaFkhUhoP0oOQfTK9XfA1MqQJQn6+krx37/YFn6JYCTFMkGX
         mMsadwgRJM9zHMotQgHjolcy7uMYWZ0VrNM/JJsffgvfMFD91MVQBr7gOSfSIUo1MDth
         AhEiNzW94fCUMa1z/UUz3AWSQ0rBQr99sShGSoFDZ03Zn4FvpSEs7QaNfx2e33bcaBLz
         qUPt1LzNwQgOAP+dIaYWjXewPRWGe3ojYV3CCcfzcmrX/wXCyk7TKtV/jXGhLy1rKwr2
         8oZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZZvRqpbj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id j94si183192qtb.4.2020.05.27.05.32.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:32:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWX4e027791;
	Wed, 27 May 2020 07:32:33 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWWoq073857;
	Wed, 27 May 2020 07:32:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:32:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:32:32 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWPj8096152;
	Wed, 27 May 2020 07:32:31 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 3/4] tools: ivshmem-demo: Map memory regions with correct sizes
Date: Wed, 27 May 2020 18:02:24 +0530
Message-ID: <20200527123225.31726-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527123225.31726-1-nikhil.nd@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZZvRqpbj;       spf=pass
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

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfw.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 tools/ivshmem-demo.c | 50 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 8201ad15..163653e1 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -17,6 +17,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdint.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <sys/mman.h>
@@ -44,6 +45,25 @@ static inline void mmio_write32(void *address, uint32_t value)
         *(volatile uint32_t *)address = value;
 }
 
+static int uio_read_mem_size(char *devpath, int idx)
+{
+	char sysfs_path[64];
+	char output[20] = "";
+	int fd, ret, size;
+
+	snprintf(sysfs_path, sizeof(sysfs_path),
+		 "/sys/class/uio/%s/maps/map%d/size",
+		 basename(devpath), idx);
+	fd = open(sysfs_path, O_RDONLY);
+	if (fd < 0)
+		return fd;
+	ret = read(fd, output, sizeof(output));
+	if (ret < 0)
+		return ret;
+	sscanf(output, "0x%x", &size);
+	return size;
+}
+
 static void print_shmem(void)
 {
 	printf("state[0] = %d\n", state[0]);
@@ -67,7 +87,9 @@ int main(int argc, char *argv[])
 	sigset_t sigset;
 	char *path;
 	int has_msix;
-	int ret;
+	int ret, size, offset, pgsize;
+
+	pgsize = getpagesize();
 
 	if (argc < 2)
 		path = strdup("/dev/uio0");
@@ -82,29 +104,39 @@ int main(int argc, char *argv[])
 		 "/sys/class/uio/%s/device/msi_irqs", basename(path));
 	has_msix = access(sysfs_path, R_OK) == 0;
 
-	regs = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
-		    fds[0].fd, 0);
+	offset = 0;
+	size = uio_read_mem_size(path, 0);
+	regs = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		    fds[0].fd, offset);
 	if (regs == MAP_FAILED)
 		error(1, errno, "mmap(regs)");
 
 	id = mmio_read32(&regs->id);
 	printf("ID = %d\n", id);
 
-	state = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 1);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 1);
+	state = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (state == MAP_FAILED)
 		error(1, errno, "mmap(state)");
 
-	rw = mmap(NULL, 4096 * 9, PROT_READ | PROT_WRITE, MAP_SHARED,
-		  fds[0].fd, 4096 * 2);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 2);
+	rw = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		  fds[0].fd, offset);
 	if (rw == MAP_FAILED)
 		error(1, errno, "mmap(rw)");
 
-	in = mmap(NULL, 4096 * 6, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 3);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 3);
+	in = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (in == MAP_FAILED)
 		error(1, errno, "mmap(in)");
 
-	out = mmap(NULL, 4096 * 2, PROT_READ | PROT_WRITE, MAP_SHARED,
-		   fds[0].fd, 4096 * 4);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 4);
+	out = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		   fds[0].fd, offset);
 	if (out == MAP_FAILED)
 		error(1, errno, "mmap(out)");
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527123225.31726-4-nikhil.nd%40ti.com.
