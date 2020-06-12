Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNF7RT3QKGQECVWGLIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC21F73E1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:24:53 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id m22sf3766173ejn.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:24:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591943093; cv=pass;
        d=google.com; s=arc-20160816;
        b=F4HHQ0ZFIcZQBgXCY31pRRq8UMjGZf0yfuMurtAUI4TA6UIdad0i1VBZ1I8nOvfFCH
         I+5Es88kqjFeviZIy+/5dDIItHGYlE+JWOn5LVy+xrCcEVa6cPni9SIkQ5JI8jIxF9j0
         Uc+IAgjulN8u0iLy3e5MniW+DsYP6EBLZsAxhhzA71vjflHWvt+w0K/DAL0B/IAZnp4K
         PmWyP5WTFVzOwThQmptoRSNDwSvW6nX3bQLe41K1jkCZRunjCJY5kquuNVoJ/55ldpRK
         7OWoitU8m5gHoO3ZVFLCjqLjV/FLTj/i21JxlMQAdOpyx0Czoiqpc6mb1FWZKZx9uy0v
         RkJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=prBe/qKYug7ijTp+GPZCbkpLC+wjWCcQ2HlMMlirRYI=;
        b=mEIKD4FlGH730cbF4uFRiQ8rXhw+zvY/9yaU8UKKPLdJC78WrXATXLU0NCg/2VngcC
         FvMMrDK79i/LxSFnvd5avAwi3ho7WFjzoAa25VNc8us6hHkag/c1qjK0uJ6eNPC7g8mV
         tQ7duwBYRfJBQnBAQqUh8Pps99HE8UdkfbhkcwBAcC5jD4/e6qZQWCo+zpb70l27KuxN
         XdWp0ra+1YaRO3p7v3yZxnw86kbqSm6GTR5S6GsBqE3cbGQZDfcwhVYqMh82v07gCXuy
         jVZoDoqi2SddmvuEARRCOpUDlOrtM8rtFnNwyBeRL0lVGeY2LbSSYAiwLMDP8ecP/4Jz
         crQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=prBe/qKYug7ijTp+GPZCbkpLC+wjWCcQ2HlMMlirRYI=;
        b=DbAMXS99AsN2kiM6UicIybPUZ7iARQPvcbxDLLi/N6OxiWkWtGq3wpoxf3hyjV+kS5
         YYVBiCZHmEnOxTer7X3FgSt0HZ6NfCswsPIOgsAsuDZgnLOt57khMVio+I3PkELaKwxp
         /jwWNee91W93+uy5JNDTzxJrx0L1ibVrKU0thDWj0YmA7h7pwsVeGXfvXAdXcGds/cCW
         xssIl5H9Uqvex/mD63b7MzZJapfQ94T3iLwOJig0YQmEVqjcdbheh+Ebd3EJFvo2dPkP
         lNJPHP78f2lPKXifoGbavA7JN8nR9Ge6LsyIYU8q/h/aEVZLJxShD1VQfU6ukbcm0/So
         //vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=prBe/qKYug7ijTp+GPZCbkpLC+wjWCcQ2HlMMlirRYI=;
        b=miXl5gMiA4yisMUA7xom0kDbQ7maNjShCQhZ3xLZdpVYV4ShcwMR+uR5e8DCjEQY/9
         bpirjmC+gm/SS5wwgOdyn4VNVqP27ePOR/dl7FVMjQmkecCCgsh6yjJ66Y0yI2gJfYtj
         vEPC6lxrtaejKGPBAvuA2DxO5M1aCipbe1P4n6KOY5wXyOZGxw1TCp0o9VNlliNwS0qV
         dL9PBY6oY4ogW2hW2gEywqlMImacxZR1xdgpXpm2x49sb9maHMyPVUm9nmgeimlRpCwk
         z8+T3gj0pagZMnt8c+660nxxsYCRf9aQPW1ZpdccbBPVqpde+fvaA3jgEdD4WGI6o3FY
         N06w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J+LzqoLHE40uS2Z84haO5TUp333G3SQg/VytJ2PLmwsmEceyK
	AgoH+h790j49IlXMXCumzFI=
X-Google-Smtp-Source: ABdhPJyziBaB2YOay9iB4tjjBuiIzcEVvO0WwTfe8ZFQhLh8U+XDQByOAuFStZJeYqyf9dXwkCnWSA==
X-Received: by 2002:a50:d75e:: with SMTP id i30mr10503757edj.305.1591943093014;
        Thu, 11 Jun 2020 23:24:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c142:: with SMTP id dp2ls2143213ejc.5.gmail; Thu, 11
 Jun 2020 23:24:52 -0700 (PDT)
X-Received: by 2002:a17:906:11c4:: with SMTP id o4mr12255335eja.163.1591943092274;
        Thu, 11 Jun 2020 23:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591943092; cv=none;
        d=google.com; s=arc-20160816;
        b=Pe1l2+p0V3f3GpGtlzzwJGzXoaFprCPueFm5eJMlNGiOo1luuEsxzKhS/7e5taGm2k
         0Hedq6O9EJNS9zXICuBno+XhKNLqqLXXLi+k1cgxX7b9DIoOYS9J2wYUXeEOxI4eYx+0
         D32hH687LqXjTZ/6V4fEuyDeCRRsJ5d6nCI4GjBJcIqIYJxinPHJEd8J4Ofpb4+7THx2
         dC6IL0Z6CTXq5J13MYVdK8Hjba3mmijH4jft59iQ4Hw0WIbRNk/SgMhJFb+Prm/Do7xq
         s0C67u5dctbbG2TQ0Pr4nuyOpMgvCqsXA9zWwxSxGtVb1rAtuaSVvR+ohg7iPwob8kkS
         5UWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=T6ly7mh1DwdgRs9nHmisVBPV1f4yeQm4dvni11CNcSg=;
        b=bJMw0L+ei+jsaBvwXC+Nk7+hKA8ERurkuHHJeAtaj8GhzvRpDZPSINhv0rQkazq2v/
         b1ms+anmhi+XQKvsTZziGJYUfeLkF2qYLj3505FEd/KoTtQb1PK8hppsdVeZw2nfeHie
         XB/6oMg5qux+WoNxqJlPdW+8BJbCyLmDr0Qr0loxw8awi9YS/H+Nzy9/AYc8G9rXHCfR
         V8kZOEc2Hv2lrga2kMU2BxKr5y9uRF0BQGGwPg0H2bfbc7QMfKqg9lHwAXNYiTClIGCB
         dL8rRxWNHTn9q7r+OMC2g9xc3MNlv+RThMQqV6yz9bENLKSc0ps8lqm+FMyKxHGaw6G7
         NKLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r19si298914eja.1.2020.06.11.23.24.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05C6OpjH006183
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 08:24:51 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05C6OouJ005748;
	Fri, 12 Jun 2020 08:24:51 +0200
Subject: [PATCH v4 7/9] tools: ivshmem-demo: Adjust selection of interrupt
 target
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200611125423.16770-1-nikhil.nd@ti.com>
 <20200611125423.16770-8-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4c91b041-b062-a35f-15cc-06b63c640707@siemens.com>
Date: Fri, 12 Jun 2020 08:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611125423.16770-8-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Add support for passing a command line parameter to specify
exact peer to send interrupt to. Furthermore, avoid using a
hard-coded max-peers value for the default target selection.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix register access, print max-peers, massage commit log]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/ivshmem-demo.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 163653e1..4110e898 100644
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
@@ -33,7 +34,6 @@ struct ivshm_regs {
 };
 
 static volatile uint32_t *state, *rw, *in, *out;
-static uint32_t id, int_count;
 
 static inline uint32_t mmio_read32(void *address)
 {
@@ -81,20 +81,32 @@ int main(int argc, char *argv[])
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
+	uint32_t id, max_peers, int_count;
 
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
@@ -114,6 +126,14 @@ int main(int argc, char *argv[])
 	id = mmio_read32(&regs->id);
 	printf("ID = %d\n", id);
 
+	max_peers = mmio_read32(&regs->max_peers);
+	printf("Maximum peers = %d\n", max_peers);
+
+	if (target == INT_MAX)
+		target = (id + 1) % max_peers;
+	if (target >= max_peers || target == id)
+		error(1, EINVAL, "invalid peer number");
+
 	offset += pgsize;
 	size = uio_read_mem_size(path, 1);
 	state = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
@@ -180,7 +200,6 @@ int main(int argc, char *argv[])
 				error(1, errno, "read(sigfd)");
 
 			int_no = has_msix ? (id + 1) : 0;
-			target = (id + 1) % 3;
 			printf("\nSending interrupt %d to peer %d\n",
 			       int_no, target);
 			mmio_write32(&regs->doorbell, int_no | (target << 16));
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4c91b041-b062-a35f-15cc-06b63c640707%40siemens.com.
