Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBDOTRD3QKGQEISNRZJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD901F6857
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:38 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id k186sf6362845ybc.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880077; cv=pass;
        d=google.com; s=arc-20160816;
        b=iEz/Bm/xCEbMrTS3/b0OYoMPpadOPRHYA0g5irhK/Dr1BnSfFRtwv7AvFAuVITqINZ
         bp3Zb8W9zH464CrPyBMMLrEWYQJMymc2UEqdMXZ2Du0+OGppA0iRfmqZYLV/RlZwwq2K
         ob3dDt6LRkZTzI289kJAPE5dAOmEc/PQUc1ryq+1fTtcrDeoPtRrTlzAPAWGTIZQtrad
         EfNVUdFFMrI99ugYBcYjquAbCDyWHPGEfCZ+mi2xCMt62XCT+1K8u7WAxLy+z5Xd/Px4
         J68ZmbXkp5uaIfGYm7twz5w2niTgd0ipAsXYiZjT+36yBAK/CYNqUpZkdCsmFlBxAumS
         ozAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PW5yJYzsjNKzYaEFnIIxQ1XNk366yq+L6Ps6x5bC7C8=;
        b=xjuFj9m72/srpTa2CkPMqzjOJK/N3qIZBIRS0f8VUJrEuIBo4mxgxXq27n2ooCIKfE
         o7r4yT1UuUMdu5QD0LmqR0W8yP1lQHL7qyTvJyCtIhEe9RM36ecFfkRfRHDtSSkC2JKc
         1rnX6y//CO1qt6IA7OyXm3YUd4914TrLZC0lf6dMuxdcK6bzM9sYZ4WU//tZ47c0nPeV
         uXkbqAZhgY/CGKDXgpd1GQUzF2GFI6vTShQVkJ/Of8rVjmh8PO+pRrppJwpZM9NfKFRz
         UlLeXasmq32VqsBDy3zJ+0bIv+/MRD7VUf8bsZXfZSmySajo4B9CM2wzgPezptvam+Hs
         doRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iL8kUkwk;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PW5yJYzsjNKzYaEFnIIxQ1XNk366yq+L6Ps6x5bC7C8=;
        b=CVWKWc1M3IoFxq7DWSjQl7MnKwacNIEu/Z15BmZGjldTt4zL081W1auIzaKHsEzvaM
         iza0CWFL+dxs8tzxwW6gkCF2cc3VEj20oPRmBy5JL02iCBmOwkanLyUKumer1WYC6Myn
         Bi9OEYCCn93oS2WaO+WQDgNyLEveuTwvoWtEqUx9Xbsp56WBgueLcODEEFVXQz9mQXuT
         0Ul7GBkm3cqRjuSTpYQjt5skBpQRodF5GXAwVFNGR5NN9Akjgr6fF+0YhVJA5Ini/9SH
         /kwmqZwTCjy6kPxwnzK9slaXtIfdw/vwypfAr3e4yhbA5+c4RUGkShLMxK4KPTxrpbzp
         Wonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PW5yJYzsjNKzYaEFnIIxQ1XNk366yq+L6Ps6x5bC7C8=;
        b=lONryA59Vs0RGVibSVeFKMyRd5KQzIl+DO/YXcUhg779D33RNDbzyBPwNfz0jrGWAW
         gGM0diK9hG/EdfLo5cBZt2a36VBkLZiphRN9f0tP0KkNqF2Kk5TrYCWAiF4/WlIQtDLY
         odcJnMnraWNbz43wxmIyYmhjVWqQm7gegqDGbUAsM3BpCSdZh/v9CSjTMzK3G425m7+I
         pm8EtBESfeMJ66UN57lDxAGWxfoygXOEXqiFis71iob6igZNMhPXEpQpYraHBU55Fgjd
         d7tFIWfvHlf/qQ8Icd2kVcqRHBhE0IW/bcuTkiwjhlpFBbCZTBFi+7wV4yvn5Y6b4Fa0
         z20g==
X-Gm-Message-State: AOAM532EirjddX7+F0e6aCIw45dFGfmpN2ioFTVfJEpkT/2NBYNCc3wc
	u976bEPzgGfAREiAK0kN/ww=
X-Google-Smtp-Source: ABdhPJyQjzgNfmh45ByxrGQ/Q1dAeiHhsAwr9Z0KQH24kRyK7qy7RUUlNo+S3oV0QWBOG/ABl4ulLA==
X-Received: by 2002:a25:d7d1:: with SMTP id o200mr13457877ybg.194.1591880077190;
        Thu, 11 Jun 2020 05:54:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:4192:: with SMTP id o140ls840867yba.9.gmail; Thu, 11 Jun
 2020 05:54:36 -0700 (PDT)
X-Received: by 2002:a25:20c4:: with SMTP id g187mr13732255ybg.347.1591880076540;
        Thu, 11 Jun 2020 05:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880076; cv=none;
        d=google.com; s=arc-20160816;
        b=B88U+8myEM9PxvXzMywiK6RNYS7ehv7Le5DdDHz+fbNXYSGLWGvBHqMc5kvPq2e9CO
         PIANGa51Y9oAm3Io/6OLZ4MU3iEz6gEAEozx4lsHMQelvj9x2ZqrySr/HpIgWrhDg1Be
         W4JsX1ipVYsQR/jG6DdAjlUbWtNlBeJq4sFI0XfweC9QiM8c0pqj0hE2BM1jgU7ob0/z
         V2yZU/X/joUtHOb2TCdsUwU4kOyqLKQWzB8wNvnDqifqXC6Vjb0GT+Z4/HFmPgADQF0M
         sb5ThumVSGwBYuH+KazMYMab4/Wck+IuKXZ3ehNPIksuWjswaMs/JniXEQIop7I5VMAY
         n19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6TBl8xlbUGOWl2DqslTujk8C8a6smoXAxyJj/xIa+84=;
        b=HvKtyN7Pzz+qDD59oAC4VLBUMyhjzpDIIaPeTN40Fka+vXM1QAW275taHOdAirsVmB
         k9eDkkkLS8KFH4IItkkTgL5bSqFesoBCZQWLPv+PDr2K5/oU3QBvz0nNwnzXohG/CpTU
         5BcyZMIIOsyrVJBfFJ6QQQ6wLBCNaxH5d3ewRDr1uEKjEvnbFsNLVJ0PUssIHar680V7
         WIC02iUNtT1GVFkUWg3URu9xENzBSjWmvUklpasIGAbdEmxK2Y52OLLKzpAWasLFAMM3
         KGQCspo00rHvNt/T7jNvj6FnoLNlWrR5Jf9l2i2S/oU2IyIwkhYsE7oUjd00vezD+0L6
         2MsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iL8kUkwk;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id k11si320553ybb.4.2020.06.11.05.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsaV3079817;
	Thu, 11 Jun 2020 07:54:36 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsai8104656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:36 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:35 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2j062138;
	Thu, 11 Jun 2020 07:54:34 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 6/9] tools: ivshmem-demo: Map memory regions with correct sizes
Date: Thu, 11 Jun 2020 18:24:20 +0530
Message-ID: <20200611125423.16770-7-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=iL8kUkwk;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-7-nikhil.nd%40ti.com.
