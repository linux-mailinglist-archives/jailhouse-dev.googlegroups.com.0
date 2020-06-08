Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBPNM7D3AKGQER56OOVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C701F16E1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:10 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id v1sf13597021qvx.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612989; cv=pass;
        d=google.com; s=arc-20160816;
        b=VEKf9QsMBvALsLrsVKDcF0kL89En+KuZ2XycE07qYpnkbBAe4hhg+BV+l1tJ47YQF6
         kUp7jKpafrNK3aguFZIT2mqTFNAjA9//tAG3VbluiNJgE6P4fyNRlOQ8LE8Cq4UPiKU3
         pGcYBcfPgjcE3quLRZbeHzuG1beuCYJ1nP8J4PtSEgPOHvR+LuOzvaDT4V8IvpatObdQ
         wLf61g2WJOduR3y5VDSgirb/gDyMEADvvv6ZApW/FcyCFJindKrJR0RsWNRufM5Xvmbu
         joazkw/D3CyViPZ2oPlmEG8GnA2SBLIzlRs2kRRwjrCpfWzCvnViAKz8M+x7tsdYGlJL
         hQuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=L+TjkvbX6STAyvISLawaLONYfORSBb2kFJPY8WeiELI=;
        b=bi3MPHheI9dCGmEWbOjis8Pq6VFt1RYbOVL4Y2Cr/BXiJNijEzf1U+Np95VfvLBZvQ
         SpLJrzsXe+7OdZDkkaLyOymgQTe1N3f+/+ILA1nyJv/8KdP7bv3hYkHSv5ofoe7yjJ5k
         zWIzN9ROonGVnWAraINTaI1083zlVHSqpmhdRzx3jXscuqVD8JaNViZaltcgltOd8uuj
         2D2tIPSqepcBThhSpuAfYoT6BR5xlZz0XdhJ0WT+MvJev4KZPCOXO9Dd799wZEXmpdiR
         51czHYn7v1QFCpOqFSM4+LvmYr2MkjLD8m2UbElbxRiTH/1g5ugbMiA8Qeegds6XpqRA
         g/5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lABddn2S;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L+TjkvbX6STAyvISLawaLONYfORSBb2kFJPY8WeiELI=;
        b=gzRQsQEwRdRJicx5HTVrhZJ2xUkzwKwNrLR598BLZxZVlgxLgz0FTe04aI4b3R3clp
         Er51jy4l9kJFvvpMwDAgDKVLjC3qqnC7kWNHjaxOc5JTlVaHgN241IyVXEbloSOHQbVN
         o+MN3Nwp8h7RFe7QpjRurJW/GEcBxqxva48FSRHg4naN/+8e8a5/oIMKyjaknA1rzCQm
         ckHLaKfsndh5Nt93+++i2UIEr9h5kdcLSzIamgp0Qa5JCa0IQnQPpKXAJJINUBM+Q3Rc
         FyJUXgYHJ8XFS+Wvnu6hqI9vpuuFc/0aqscSIonlO2/kB/atPcOsHZ0PXKfBGHwuvS3a
         nJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L+TjkvbX6STAyvISLawaLONYfORSBb2kFJPY8WeiELI=;
        b=PiM1GBmGLrxvfyfU5URthkpzhiyTnxuBRJMirW5utwbR05p9fL/ehfjSoxXBHmGUxU
         InPp98V6WlRcdgCcOTQyTbIJ99Eh/55q4auAS9xPMiIq8nmVVkUzxYc1RbUBarQaRJen
         mGnYsgx1T6Ts9fX8HKGHeZXVWNgfGg5EYcXkDYy/q7JxALz+TRY0NPAtK3rLBGnfetym
         5j33wQHGXwih3gYCccpm/scrCj523s6JqeCLzRj1YIzbqCjjjJDuLPPWJaLIp3tFrDmI
         E4vf3AsHD1KDbburSFOYpA9bJ1DoNHFGklgOYuDUxMcv/vAYoXRz1/yua6rgdQ8MNMZN
         zpjg==
X-Gm-Message-State: AOAM533/OZYg7JsvHdNljR9/MefX/idn/CJKJN4a331Xb3jgnvx6IA+1
	KDS6EwqkLcKSc/ReCO6H2WA=
X-Google-Smtp-Source: ABdhPJw6ZF6QxFQ+suWgTV6ImgyQdvrMHa7Or3+mSAHJgqG5/IhdM8WdntiIW/jteGvu7CRkOIYPYg==
X-Received: by 2002:ac8:4d03:: with SMTP id w3mr22087731qtv.200.1591612989684;
        Mon, 08 Jun 2020 03:43:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1af4:: with SMTP id h49ls1891883qtk.7.gmail; Mon, 08 Jun
 2020 03:43:09 -0700 (PDT)
X-Received: by 2002:ac8:6a08:: with SMTP id t8mr22594504qtr.271.1591612989147;
        Mon, 08 Jun 2020 03:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612989; cv=none;
        d=google.com; s=arc-20160816;
        b=r/dAcHmjupPLDl+SmyMaKFk4mv/ip5+Bi0h6qJhrB9iJMS1vEM2f/fJkn04k1nWyov
         WpcAfODlEwm69Vg+fslGVyGR1T/K51u24zqvtestAgA6AhNrvMmChSHsoeyy3d0wtcDK
         IAFczHer8BOvIVdsnUoWPYPmnkATcS6E+OXFhoY2syRHX8HMxjirrCQDwX5rUACsC5GX
         FFnUnTu+8diw99utSNJcmG8MGSPo1e86AsYN8gEIRgMpjhIdp8pyWKMByXpme+UqCMpF
         cyAonPZnTqlzjnH20XMhjT2acFPvVjCpwSQbS8+DiJT21mYGtMfGTMhTChdk3r6kl1RI
         2flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6TBl8xlbUGOWl2DqslTujk8C8a6smoXAxyJj/xIa+84=;
        b=S8zJ63GJq2tTE+qNrYo1UTvcNFirk0UyTp0qloBNQag9+8fXuOVTKpREZn71ap/+e0
         BuxUvw83glRtJtDd8DjgiFzZsDGQ5kX+aUj84CmNSHLx28jBHOfPax9huAYSJ/JEAIdJ
         yOU/GW0zIGbke6lBu4i1pwHuaQC9pR+vnZHrxBUG0jJmRzOxuS+7BeeZvehX4y1d7tRh
         j6Ov+O9ulnSHRX/VFQ++Yh8HUIvG1zGw2jAFwC7TDMIG7r6kuK2rtgqkBliV4e0bvkIK
         ecOO6dKPKaIgdXqFvJg/nR+3ZOjQqsolFAAbe5GlCZRqR/2QFXpQmsE7LqF77/YoZUvY
         of4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lABddn2S;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id y21si471486qka.2.2020.06.08.03.43.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah8F9085140;
	Mon, 8 Jun 2020 05:43:08 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah8S4009391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:08 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:08 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh7012229;
	Mon, 8 Jun 2020 05:43:07 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 6/9] tools: ivshmem-demo: Map memory regions with correct sizes
Date: Mon, 8 Jun 2020 16:12:52 +0530
Message-ID: <20200608104255.18358-7-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=lABddn2S;       spf=pass
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
driver will populate this information in the sysfs.

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-7-nikhil.nd%40ti.com.
