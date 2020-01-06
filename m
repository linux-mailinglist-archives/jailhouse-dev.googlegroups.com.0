Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOMEZXYAKGQEVNGPPNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C513137B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:41 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id a19sf8143123ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320441; cv=pass;
        d=google.com; s=arc-20160816;
        b=OzGB8hAZU4bqKv4I5WlNo9tng/3TouC3BLIXQs0kImUOAvi1bnc5ZrfymC8S85x7gw
         HSQ40670mvwty/ipwmiFbTCOzULMjA9o3it9DkpFO+49EEdWw0TDV/DH5HuD9WrDLzej
         Rl3cEaz4KZlg50Db+CFXj6c7s15CZHcKAup7gpDTOaFeBXg0ZO/NeMF3IQH6RpjxqqwL
         XcKf+lkv+VTqKSCyJsf0qidMs0bkUJ1foTYLwEQq+3r70FHP8MSi6Wu5qugV5+qCPaal
         88Y/Wum07JeCqYzX1Y+gCH4g5PdZvVJIFxNo8EPLASxPLxUqSxKJqFYfvefDPdHfAJ0a
         Rciw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=YCesyL4th3AI6YRlI9mTyAwIikHefgO0xNoAkpPB3Oo=;
        b=i3S/Zm08ns9upbVwQwATyLuVLeEVGJbBDFZMSHE0xUqb7it6T7ZmpriAWYLdwgrJ1L
         16MxmVLzWSQtPRctOL/YfJFFwQEyKQeV86oxu9FIzgTA9KqdpI/E/KUceQDbAOYI65pn
         VEfUWPfPoKUlvowGzD2w53N6vNQvO5EhH4Vu6ZeOmpD3PoghQXyh2sUYqCnUyPrS0I2Q
         ogEIArtYefx/uMeXW5PGIwznwFKDeQ30s4C9SidKOyZKWQmQYxGToOrOEIirHvbGI/Et
         2B0QIlfIgLTF1rRAzUTm+kmfyUYLnkI/swI49iNF8SHWjC1pgDu1AqH8sy9/7YzOg1le
         M5OA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YCesyL4th3AI6YRlI9mTyAwIikHefgO0xNoAkpPB3Oo=;
        b=ICglKTlAHeAF7WFZrVQxhxAjAvuqCd7qKvs37YRpW1EyF8POoahDZOB0MRbRrGD/xL
         +SyZMq8KKkXtiztcH1VDaoLp84bS9l60BE6q1IfzrNcdxGWDVNIznSIaW/Q/6aKs/zWs
         6QS53rQz7bmOiW1xufaqwGKq9Cq+6fPbkMa3qk+HxusI3q4zsHooFFeduXB8ih8dteGv
         sGQ94PpoKI/8FxgorPMXjqWYEFQ8c6k2lOXqeqIs1n84aovGOQNcApMH4n3g8xsbu/De
         NweHdnxQhnmzasg9pkmqhiJzKHNJdCBDK8VW80yH6jZTj1M/DgUTxk+GIyA/ZWoIGo8R
         Tbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YCesyL4th3AI6YRlI9mTyAwIikHefgO0xNoAkpPB3Oo=;
        b=Tjl6suVW+m+EDPcBR/FDSLw1xP+/ArbN3Wmj3n4Td8SsaqY/C4o3jWOpK53v/wNKAQ
         rK54N4j10XlWLpTBciTvlgSd92SJnLisCqBT65w559exgW5qJK1Ijdk2zPqZlk9hjT3m
         XOxENVVoUKuQMXl1yRsbxJiqDLj2hSalKpWldJOeg8JsIh564pqGQtNMXihTxc99PUr/
         X3gtvwsbKGw9tLMfq8/Ldsh5gkcQPtP4ZHA29eMhgT5GRivLhGCMYj/BW3epdtV8zEjX
         xxl3+lmIgmLeoDnY74uZFdQMjLqUjYA+zwzPCS36EqvFuIfdd9yUXSjr6XSgob7QFCaq
         +ucg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyx9rxIEnpwAvTrQlpl0ulzRkyURB3p3Lfo4HQpOv/FFwwIty3
	3ZYk+LkxLSi16CuhCS0HrHc=
X-Google-Smtp-Source: APXvYqzDq7kkxN9IfVD4Duixia9ubfmECmhULC5N+EZNCUQyZx0LyTI2qlHnPi33St+1lMnKgC9eKA==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr61814598ljg.88.1578320441261;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5056:: with SMTP id z22ls4154893lfj.2.gmail; Mon, 06 Jan
 2020 06:20:40 -0800 (PST)
X-Received: by 2002:ac2:51de:: with SMTP id u30mr56102205lfm.69.1578320440530;
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320440; cv=none;
        d=google.com; s=arc-20160816;
        b=CQTeqZiK78rZA1wCUtR2VIphNWEJO+IkPcwEVD0bvCfZfqsjoYf6oTIU3Ov26Me52n
         lSrXIg3jqE0zJ9EOi9+FB4vWnfnZEKBK5QgRaAZCyuCJOJSjZHmd9sgs2szLMEnt38VX
         8UHN9LnXvoFRxJZs3vvIH4dX7PP09XEc1rfn+LlYMbZJJw5sKYJbJfo7rHrTeIffBcfJ
         cY70n/dQrj8J60AcoJxbJ70Prr27nRVSSdtgHSK5FsCTNtLGnuA2x4siYjejcX9grbA2
         enRT81EPpxEUzQxmhzSMCLFY1zSJVaMNpy7qTVISmCbTrdiv39MVvaVAA101CBbDk/38
         B/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=22Uw22sWKQzzdPslWDasJ7NnTWlBQmrdwvvIVKhbLZY=;
        b=WsRiOistdFa6adkcb6UzOgSlquY8YbN7KNGv6CFFz6Qy1cjTQmyMzo0Lpcr/JH6brK
         cB6XWrg5yQaiNDf2BcfzbAZGtUMFkpGSXiA0MA7zLe8omjEcI0LFyzNpVESbqHMLNDqq
         5dyITSmMbSyVUfYOFNwEBKGX03S29i/MlKlEA1awXNsFav5Z6o4msj3UdpwNjLxG+2RL
         gPr/Gls4Cmg0UjhAg9aBwdop3M8Xw+1CJpn9+o5fqf8gnZbRG9OZ2cFFmWTjs2DL2hqj
         +41SEMthlBs9x9tzkISXbtw/m0N5V2Qb7jbdhxNkC+amD+G1BXM04mZx6sS8vVBkgcU0
         GgCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o193si1374709lff.4.2020.01.06.06.20.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKdC5016658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjL008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/19] tools: Add ivshmem-demo for Linux/UIO
Date: Mon,  6 Jan 2020 15:20:29 +0100
Message-Id: <87cc49f944ed756e930b70991726ca5595a30717.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This does almost the same as inmates/demos/ivshmem-demo.c, just using
the UIO driver for ivshmem under Linux.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore           |   1 +
 tools/Makefile       |   7 ++-
 tools/ivshmem-demo.c | 159 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+), 2 deletions(-)
 create mode 100644 tools/ivshmem-demo.c

diff --git a/.gitignore b/.gitignore
index 75145605..4691ff79 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
 pyjailhouse/pci_defs.py
+tools/ivshmem-demo
 tools/jailhouse
 tools/jailhouse-gcov-extract
 tools/jailhouse-config-collect
diff --git a/tools/Makefile b/tools/Makefile
index 2d6ba9a0..542127cf 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -32,7 +32,7 @@ KBUILD_LDFLAGS :=
 KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
-BINARIES := jailhouse
+BINARIES := jailhouse ivshmem-demo
 always := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
@@ -100,11 +100,14 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-targets += jailhouse.o
+targets += jailhouse.o ivshmem-demo.o
 
 $(obj)/jailhouse: $(obj)/jailhouse.o
 	$(call if_changed,ld)
 
+$(obj)/ivshmem-demo: $(obj)/ivshmem-demo.o
+	$(call if_changed,ld)
+
 CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
 	-I$(src)/../hypervisor/arch/$(SRCARCH)/include
 # just change ldflags not cflags, we are not profiling the tool
diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
new file mode 100644
index 00000000..8201ad15
--- /dev/null
+++ b/tools/ivshmem-demo.c
@@ -0,0 +1,159 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2019-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <errno.h>
+#include <error.h>
+#include <libgen.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/fcntl.h>
+#include <sys/signalfd.h>
+
+struct ivshm_regs {
+	uint32_t id;
+	uint32_t max_peers;
+	uint32_t int_control;
+	uint32_t doorbell;
+	uint32_t state;
+};
+
+static volatile uint32_t *state, *rw, *in, *out;
+static uint32_t id, int_count;
+
+static inline uint32_t mmio_read32(void *address)
+{
+        return *(volatile uint32_t *)address;
+}
+
+static inline void mmio_write32(void *address, uint32_t value)
+{
+        *(volatile uint32_t *)address = value;
+}
+
+static void print_shmem(void)
+{
+	printf("state[0] = %d\n", state[0]);
+	printf("state[1] = %d\n", state[1]);
+	printf("state[2] = %d\n", state[2]);
+	printf("rw[0] = %d\n", rw[0]);
+	printf("rw[1] = %d\n", rw[1]);
+	printf("rw[2] = %d\n", rw[2]);
+	printf("in@0x0000 = %d\n", in[0/4]);
+	printf("in@0x2000 = %d\n", in[0x2000/4]);
+	printf("in@0x4000 = %d\n", in[0x4000/4]);
+}
+
+int main(int argc, char *argv[])
+{
+	char sysfs_path[64];
+	struct ivshm_regs *regs;
+	uint32_t int_no, target = 0;
+	struct signalfd_siginfo siginfo;
+	struct pollfd fds[2];
+	sigset_t sigset;
+	char *path;
+	int has_msix;
+	int ret;
+
+	if (argc < 2)
+		path = strdup("/dev/uio0");
+	else
+		path = strdup(argv[1]);
+	fds[0].fd = open(path, O_RDWR);
+	if (fds[0].fd < 0)
+		error(1, errno, "open(%s)", path);
+	fds[0].events = POLLIN;
+
+	snprintf(sysfs_path, sizeof(sysfs_path),
+		 "/sys/class/uio/%s/device/msi_irqs", basename(path));
+	has_msix = access(sysfs_path, R_OK) == 0;
+
+	regs = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
+		    fds[0].fd, 0);
+	if (regs == MAP_FAILED)
+		error(1, errno, "mmap(regs)");
+
+	id = mmio_read32(&regs->id);
+	printf("ID = %d\n", id);
+
+	state = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 1);
+	if (state == MAP_FAILED)
+		error(1, errno, "mmap(state)");
+
+	rw = mmap(NULL, 4096 * 9, PROT_READ | PROT_WRITE, MAP_SHARED,
+		  fds[0].fd, 4096 * 2);
+	if (rw == MAP_FAILED)
+		error(1, errno, "mmap(rw)");
+
+	in = mmap(NULL, 4096 * 6, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 3);
+	if (in == MAP_FAILED)
+		error(1, errno, "mmap(in)");
+
+	out = mmap(NULL, 4096 * 2, PROT_READ | PROT_WRITE, MAP_SHARED,
+		   fds[0].fd, 4096 * 4);
+	if (out == MAP_FAILED)
+		error(1, errno, "mmap(out)");
+
+	mmio_write32(&regs->state, id + 1);
+	rw[id] = 0;
+	out[0] = 0;
+
+	sigemptyset(&sigset);
+	sigaddset(&sigset, SIGALRM);
+	sigprocmask(SIG_BLOCK, &sigset, NULL);
+	fds[1].fd = signalfd(-1, &sigset, 0);
+	if (fds[1].fd < 0)
+		error(1, errno, "signalfd");
+	fds[1].events = POLLIN;
+
+	mmio_write32(&regs->int_control, 1);
+	alarm(1);
+
+	print_shmem();
+
+	while (1) {
+		ret = poll(fds, 2, -1);
+		if (ret < 0)
+			error(1, errno, "poll");
+
+		if (fds[0].revents & POLLIN) {
+			ret = read(fds[0].fd, &int_count, sizeof(int_count));
+			if (ret != sizeof(int_count))
+				error(1, errno, "read(uio)");
+
+			rw[id] = int_count;
+			out[0] = int_count * 10;
+			printf("\nInterrupt #%d\n", int_count);
+			print_shmem();
+
+			mmio_write32(&regs->int_control, 1);
+		}
+		if (fds[1].revents & POLLIN) {
+			ret = read(fds[1].fd, &siginfo, sizeof(siginfo));
+			if (ret != sizeof(siginfo))
+				error(1, errno, "read(sigfd)");
+
+			int_no = has_msix ? (id + 1) : 0;
+			target = (id + 1) % 3;
+			printf("\nSending interrupt %d to peer %d\n",
+			       int_no, target);
+			mmio_write32(&regs->doorbell, int_no | (target << 16));
+
+			alarm(1);
+		}
+	}
+}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/87cc49f944ed756e930b70991726ca5595a30717.1578320435.git.jan.kiszka%40siemens.com.
