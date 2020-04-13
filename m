Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLEZ2D2AKGQEDSIJDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D11A6345
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:37 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id s1sf1533428lfd.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760877; cv=pass;
        d=google.com; s=arc-20160816;
        b=rxTSTcjbbFSO2ncjtYPpwK7VzRLBV/QQ5AZgKZF2c/hqEEMVR+3H6oSStTJoLvP9+U
         GmgCSWYyGTtj8JXJBkHwKdAduhFoCtmNa8BsrZBil/Cs2vnvDuO4P+OIgL4W1Djiohfy
         QaMiGHiCArvULG+/Ae40q3kmDrPIWefcHxRn8RPpNaVj0XQRdgKUk8Ld8OpohiKrkiEq
         EqykvyN5qFZAWbbtJcq1o7H1vMCyF9aI7NC48NGauRvH1DRsTA3YzBiSz31K1RF4c7vb
         HJnHUckis0LG35Yg8U6CsVZx3DPPhykV57/gsk9czySG7JTf/Q38s3KzXwKpQg7vzrSz
         vvgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=QN94S5jel6n89roGSDlv5f2CzFeNBYNsYXO7KtbOCuk=;
        b=GFLK2Yqp83y3OpCJMnglqibykKqkQeYwOOk9vej4PS+nqAlvfPdeKZu9P+meepShZQ
         XOW2+H+mzzVsBt3GoJijq2SrjJYCyVgDXZElKFq4uMZ1Hbkmqboa8HIQx9130zQWVMf0
         Gr4TBN3OCg00vir15y036+dmsBsiMpC3EKvixUuUrQ/EOV1yMvN0gj+GYeibubc9Ivwi
         JQhDWmGjOWqpR4ebeyRm7fvpcxMQSrx9x3zBIbXAuERXeGMye4iDv7WGneP6sCBfzdIm
         K5wxyW7CjphcUmEFszGvpf6w70W0xZzxvuB8T2B9qXroVvM4j6fkSYld5+vtRpLdNkWC
         YhAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QdDMZPiZ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QN94S5jel6n89roGSDlv5f2CzFeNBYNsYXO7KtbOCuk=;
        b=pL4Wn9gdtFbqQ9uNz39uGJssME6ug37HvHd4tgodeq8qu0i82A+qNHFVDXjOT+VUto
         oOCUybxqLG75aSFSumf4Dc66B9eFNHNZCikjgmsNv6lTfwdXQWDf5kXNbrbkNWt1QwIZ
         7jEBS4TQlkdS8Oot7vNXET59IEB8KnoktfKKAKNQ0C+Z4nHlFwSEQ/lbgU3T4aRCRW21
         p/CvrmtSeiyUtI9+29A18ykA4aWcFO5fqIv9bf+LQsB/kalQNmPuP9QeELavCErvlMMG
         vM/Ni2Kft48z2/h3wwetVAeIWdSBK9HscrWbgwld/B7MTTFsenZUNv52V7dFSJ2kMjd6
         iz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QN94S5jel6n89roGSDlv5f2CzFeNBYNsYXO7KtbOCuk=;
        b=X5EmcrMJ0MQPjzVeUZMmG29D7uAZ7pttIVLmF0nDKXQ/Zhs0eJ85+xtYLM7RSNGAWa
         MWP+/dOSQ2Q8LTnqXJFPt3IDLR0baQH1NGN5rYf72noF6o860ZOOvEuu99ZFOwIsbepD
         3gvvjGyC45h45eBYpzbQ1Q8dF4LLj8HM3FjOZ/l4S+D9cyw0L/k5Xz9iWm57MgZA377u
         jupXQTsHDWUsumOFDluTZiY8S3lseLuFZ9kSt9E5zrVjixrrCN8b8Tv1FYu4CeChwBn+
         FOhk6epFs/ybFvUCjPG1Rimu81W/3J80PPiNpWXl5U6EVOQezY1+6OQkI0Fs/19woNbQ
         sOxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZGibuBd5O4ir2QLslUGzP7Jq9ic8Z3eUgX3yZguFcXn4TJODCz
	9c7b3IQyN9b21QmwRDkoLBg=
X-Google-Smtp-Source: APiQypLd7LPKDVQAJoTOXQg+81UTPldXkrW3oTLV0gyvvx+h/Gnvitvuj5Bjh4WQuG8UzdlHpAcKCA==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr9851628lfc.60.1586760876796;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5a0e:: with SMTP id q14ls2602546lfn.3.gmail; Sun, 12 Apr
 2020 23:54:36 -0700 (PDT)
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr9806248lfg.77.1586760876012;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760876; cv=none;
        d=google.com; s=arc-20160816;
        b=GBVtdtG5Tkh4/Yx8pk4io+OeVRdOkNhoYswpvaz75AfNyJkFABJOl2yAg6vl0WbRWo
         CaZVNxYiWN2nuuRH6z7CPZu6xl7O1fqARwEemVXm7G3GT4DoQMHO6fUx3qVoVP8autK7
         OoRY0GA9c5j4QibnqpIEbbqC2CW+OqX6zsI5LC02Qwlsip1VvoHCWjWrXD09IVwJNYlo
         xPyC67CmfT9srfpSYR+57pZXhe0d8s+rdEwAgMaSnb0P6WDqLqQAetxvOaTpMAzrNaD+
         tPlieS80ylojgsTRXgR6ujxBA9oiQHoSFBywoGY6dGtqwaHHb25inAh5Zd7VcS+CbimM
         Hp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=eTBMngb8qze4UFgfOEMg0pZQnUwASs23+XBP8/6kOD8=;
        b=ezhIPdR+dh1msFk4IWuouMKtca4dciRpl99Wf3WlUCaL93ymmXKd1M8juYcXLTdLpD
         Rs9n4+1c6W+0D8blelZToI95vxuxEftMFZRnvE/Ey4ybr2dlH9oAthMpmEp39RFxyBtZ
         q66vD8f/BQGWevMcXWQJ64bQ/DuImY3bou1T/pd6gjYlRlRSIZhC5L2U/oiWa+ioDF1J
         JRlerVJDM1Kz6JOfMFHFPNQC++l3Q+slbt50yJcwkcYG61AhGfnmMQ5SwTsDorg/R8HW
         89xCTwbbV+su/Tmtas4MKs1WrWNMZ4vqKwBxbRwCeSnlrWeHXREhpRY+uAnwfCf5AFk+
         11xg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QdDMZPiZ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id f25si459848lfc.3.2020.04.12.23.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MXpV5-1jjjG000xj-00WkR3 for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:35 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 09/13] jailhouse: Add support for SIMATIC IPC127E
Date: Mon, 13 Apr 2020 08:53:51 +0200
Message-Id: <8b1b83bc08687dea50340052b7a955fee093fa8f.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:JPcp1FFwFHJZDgpKYWTm/gYfKn8iXQdIfa7ZIHKnuIFVNOuXO8Y
 7zLRf9BhYV6jp2IUcWq0TKgbH/7R+Tw+zY2ZaztMKNNr8dA40lwJ/swL4veoiWShqhNVBo3
 ZJp4wXCR7kghrqNkpvx8QlYG7XvTp+bsCIZMqAjA85uGfwacmrHzqr2zmAfyzM95rpF8szu
 /CjNq/Oao9Xm2tfn40GTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6HM173DJVPg=:DifE1wnZoptoJzwE7rfsiY
 aMVaTkUYCqkuW8kxYdAsKSYH5xSKO4p8A99lsowJdItGFKPyMlAtm8BtmYvgBTKauT/wU8zbv
 SEo6osUo+Iq/tKVCySfEpr5AfFmGBErNs8yTiqkm9bGOzNtKasgD2k45UbgIrr13NxwWVmd99
 Kn0VHBibGSgfEVmueZXJB/tVUX/V862c+epG6KIQ2j9pAhmmqaqv7P9Fh0b2EbMbYzoPutbNS
 1OKB1mu7kiuM4sU8imEIG8D959fcU6yByWi6eQpnR/ZnVdTV0XCxVwIT2o4gMEC70AnKDW9Ic
 laLdmhG4yHa6SxyZc27XlE8mn23l2heGcc/5MpdFEZ8NhSs+y3foQQPswVfQsSHrh49d8ltzi
 k7swQzhYiOle73SjqDbctVgwRHpNJCbrHcfIUNAyDPIp+dDXEaAth10TZZ5xRQkP36wxnM5q2
 SP0XIHuJlAZgCBMH6pJkRH5dqSXjvGiVLrEtA2ItqhQA5TzNMPRPz5r//lm6qTYqagMu0jV5g
 FdeVMbo9VueC9VKz/KnjXj7IM2F6uBlpc0BBv0Hyz74ma4yGWeI8q2SYsKMgu8mcgrPxJKOcJ
 JhINqym9isphLUdQwWAl7skpJbKBxyGHe0mB/FAiXSh/erktb3BUgy8uAA5XSJ+gAw/C5wasM
 VZy2RekaVrB/hIKVyWaVaQsrohBv/bxT+179AP0bz0nvLG7Zxusk1AQjJPzU4qp0WGCfeCA66
 OQlB0MPyINhGW7t7ELGZ/+O80wvad7AtHolMZSmu1XQjHW/47p+VXxM+qSKNhvgUAwlMcrZGw
 tkxiiA2gLfOMCb4JUUytaaejMHaAa5ntLPQbkI7NS1Q+sOL/xBeD++ywCcV5mL+ONZ7prmRrg
 L0mKK4yAx1KpyL9jdQFGQwltK8c6H0rCQ6VQcW3RuUQAfJQtODKyUURvRmYIe6c1Sd/IbShJz
 Gy/7s/S7kv3R6YHpJuIRmmxD3PVrKPBquYycsqtnG5FUpNUkilwLRso+8PY7B/Wqy9jcbjMBq
 sfMHTKaoSU5D5reRm0QTeNfDlCujURS0l8wLMM6wPCZwyadl/Ow+ujOKctzf1iovuJaHY2dOu
 PQBCSTNP49pTOQFhgrE9+7QsMtod7dn8BSg4lHsF4faxyH6LIH4JvnZuuwAYfQN62gSk/eOTv
 XplTaTPL6BxZ7/Fay+rSy8PO47rAQS8Lcl9zZxIA2PDg6wCb0ucYKyuUT4MDBuudtgSm0235x
 hIL9cfTZ5SxqGPLwX
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QdDMZPiZ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Add the necessary configs, including a custom apic-demo because this
target comes with just 2 cores in its base configuration and allows to
let a LED blink. The latter also requires a small patch against 0.12
release.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...x86-Add-LED-blinking-support-to-apic-demo.patch |  58 ++
 .../jailhouse/files/apic-ipc127e-demo.c            |  84 ++
 recipes-jailhouse/jailhouse/files/ipc127e.c        | 960 +++++++++++++++++++++
 .../jailhouse/files/linux-ipc127e-demo.c           | 127 +++
 recipes-jailhouse/jailhouse/jailhouse.inc          |   1 +
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb      |  12 +-
 6 files changed, 1237 insertions(+), 5 deletions(-)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/apic-ipc127e-demo.c
 create mode 100644 recipes-jailhouse/jailhouse/files/ipc127e.c
 create mode 100644 recipes-jailhouse/jailhouse/files/linux-ipc127e-demo.c

diff --git a/recipes-jailhouse/jailhouse/files/0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch b/recipes-jailhouse/jailhouse/files/0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch
new file mode 100644
index 0000000..cc675c1
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch
@@ -0,0 +1,58 @@
+From 8d6aed50dded9e956cc13be835b7c8a78241c745 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 12 Apr 2020 18:26:36 +0200
+Subject: [PATCH] inmates: x86: Add LED blinking support to apic-demo
+
+This is analogous to gic-demo on the ARM side: Grab led-reg and led-pin
+from the command line and toggle the specified bit in that memory-mapped
+register at the pace of the print-outs to make an LED behind it blink.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ inmates/demos/x86/apic-demo.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/inmates/demos/x86/apic-demo.c b/inmates/demos/x86/apic-demo.c
+index d9aada6a..83ab77fd 100644
+--- a/inmates/demos/x86/apic-demo.c
++++ b/inmates/demos/x86/apic-demo.c
+@@ -18,6 +18,13 @@
+
+ #define APIC_TIMER_VECTOR	32
+
++/*
++ * Enables blinking LED
++ * SIMATIC IPC127E:     register 0xd0c506a8, pin 0
++ */
++static void *led_reg;
++static unsigned int led_pin;
++
+ static unsigned long expected_time;
+ static unsigned long min = -1, max;
+ static bool has_smi_count;
+@@ -72,6 +79,9 @@ static void irq_handler(unsigned int irq)
+ 	}
+ 	printk("\n");
+
++	if (led_reg)
++		mmio_write32(led_reg, mmio_read32(led_reg) ^ (1 << led_pin));
++
+ 	expected_time += 100 * NS_PER_MSEC;
+ 	apic_timer_set(expected_time - tsc_read_ns());
+ }
+@@ -132,6 +142,12 @@ void inmate_main(void)
+
+ 	init_apic();
+
++	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
++	led_pin = cmdline_parse_int("led-pin", 0);
++
++	if (led_reg)
++		map_range(led_reg, 4, MAP_UNCACHED);
++
+ 	while (!terminate) {
+ 		cpu_relax();
+
+--
+2.16.4
+
diff --git a/recipes-jailhouse/jailhouse/files/apic-ipc127e-demo.c b/recipes-jailhouse/jailhouse/files/apic-ipc127e-demo.c
new file mode 100644
index 0000000..8503a00
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/apic-ipc127e-demo.c
@@ -0,0 +1,84 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Minimal configuration for demo inmates, 1 CPU, 1 MB RAM, 1 serial port
+ *
+ * Copyright (c) Siemens AG, 2013-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_cache cache_regions[1];
+	struct jailhouse_pio pio_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "apic-demo",
+		.flags = JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
+		.num_irqchips = 0,
+		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
+		.num_pci_devices = 0,
+
+		.console = {
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_PIO,
+			.address = 0x3f8,
+		},
+	},
+
+	.cpus = {
+		0b0010,
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x3ef00000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* LEDs */ {
+			.phys_start = 0xd0c50000,
+			.virt_start = 0xd0c50000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.cache_regions = {
+		{
+			.start = 0,
+			.size = 2,
+			.type = JAILHOUSE_CACHE_L3,
+		},
+	},
+
+	.pio_regions = {
+		PIO_RANGE(0x2f8, 8), /* serial 2 */
+		PIO_RANGE(0x3f8, 8), /* serial 1 */
+		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial */
+	},
+};
diff --git a/recipes-jailhouse/jailhouse/files/ipc127e.c b/recipes-jailhouse/jailhouse/files/ipc127e.c
new file mode 100644
index 0000000..021e4ba
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/ipc127e.c
@@ -0,0 +1,960 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2014-2020
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[47];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pio pio_regions[11];
+	struct jailhouse_pci_device pci_devices[15];
+	struct jailhouse_pci_capability pci_caps[36];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x3a000000,
+			.size = 0x600000,
+		},
+		.debug_console = {
+			.address = 0x80000000,
+			.size = 0x7f0000,
+			.type = JAILHOUSE_CON_TYPE_EFIFB,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_FB_1024x768,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xe0000000,
+			.pci_mmconfig_end_bus = 0x3f,
+			.x86 = {
+				.pm_timer_address = 0x408,
+				.vtd_interrupt_limit = 256,
+				.iommu_units = {
+					{
+						.type = JAILHOUSE_IOMMU_INTEL,
+						.base = 0xfed64000,
+						.size = 0x1000,
+					},
+					{
+						.type = JAILHOUSE_IOMMU_INTEL,
+						.base = 0xfed65000,
+						.size = 0x1000,
+					},
+				},
+			},
+		},
+		.root_cell = {
+			.name = "RootCell",
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
+		/* MemRegion: 00000000-00057fff : System RAM */
+		{
+			.phys_start = 0x0,
+			.virt_start = 0x0,
+			.size = 0x58000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 00059000-00085fff : System RAM */
+		{
+			.phys_start = 0x59000,
+			.virt_start = 0x59000,
+			.size = 0x2d000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 00100000-01ffffff : System RAM */
+		{
+			.phys_start = 0x100000,
+			.virt_start = 0x100000,
+			.size = 0x1f00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 02000000-03ffffff : Kernel */
+		{
+			.phys_start = 0x2000000,
+			.virt_start = 0x2000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 04000000-0fffffff : System RAM */
+		{
+			.phys_start = 0x4000000,
+			.virt_start = 0x4000000,
+			.size = 0xc000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 12151000-39ffffff : System RAM */
+		{
+			.phys_start = 0x12151000,
+			.virt_start = 0x12151000,
+			.size = 0x27eaf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 3f200000-6209efff : System RAM */
+		{
+			.phys_start = 0x3f200000,
+			.virt_start = 0x3f200000,
+			.size = 0x22e9f000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 6209f000-6209ffff : ACPI Non-volatile Storage */
+		{
+			.phys_start = 0x6209f000,
+			.virt_start = 0x6209f000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 620ba000-620f6fff : System RAM */
+		{
+			.phys_start = 0x620ba000,
+			.virt_start = 0x620ba000,
+			.size = 0x3d000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 630f7000-7822efff : System RAM */
+		{
+			.phys_start = 0x630f7000,
+			.virt_start = 0x630f7000,
+			.size = 0x15138000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 7822f000-784befff : Unknown E820 type */
+		{
+			.phys_start = 0x7822f000,
+			.virt_start = 0x7822f000,
+			.size = 0x290000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 7aebf000-7afbefff : ACPI Non-volatile Storage */
+		{
+			.phys_start = 0x7aebf000,
+			.virt_start = 0x7aebf000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 7afbf000-7affefff : ACPI Tables */
+		{
+			.phys_start = 0x7afbf000,
+			.virt_start = 0x7afbf000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 7afff000-7affffff : System RAM */
+		{
+			.phys_start = 0x7afff000,
+			.virt_start = 0x7afff000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 80000000-802fffff : efifb */
+		{
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x300000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 90000000-90ffffff : 0000:00:02.0 */
+		{
+			.phys_start = 0x90000000,
+			.virt_start = 0x90000000,
+			.size = 0x1000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91000000-910fffff : ICH HD audio */
+		{
+			.phys_start = 0x91000000,
+			.virt_start = 0x91000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91100000-9117ffff : igb */
+		{
+			.phys_start = 0x91100000,
+			.virt_start = 0x91100000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91181000-91183fff : igb */
+		{
+			.phys_start = 0x91181000,
+			.virt_start = 0x91181000,
+			.size = 0x3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91200000-9127ffff : igb */
+		{
+			.phys_start = 0x91200000,
+			.virt_start = 0x91200000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91281000-91283fff : igb */
+		{
+			.phys_start = 0x91281000,
+			.virt_start = 0x91281000,
+			.size = 0x3000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91300000-9130ffff : xhci-hcd */
+		{
+			.phys_start = 0x91300000,
+			.virt_start = 0x91300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91310000-91313fff : ICH HD audio */
+		{
+			.phys_start = 0x91310000,
+			.virt_start = 0x91310000,
+			.size = 0x4000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91314000-91315fff : ahci */
+		{
+			.phys_start = 0x91314000,
+			.virt_start = 0x91314000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91316000-91316fff : 0000:00:0f.0 */
+		{
+			.phys_start = 0x91316000,
+			.virt_start = 0x91316000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 91319000-913197ff : ahci */
+		{
+			.phys_start = 0x91319000,
+			.virt_start = 0x91319000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 9131a000-9131a0ff : 0000:00:1f.1 */
+		{
+			.phys_start = 0x9131a000,
+			.virt_start = 0x9131a000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 9131b000-9131b0ff : ahci */
+		{
+			.phys_start = 0x9131b000,
+			.virt_start = 0x9131b000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fea00000-feafffff : pnp 00:01 */
+		{
+			.phys_start = 0xfea00000,
+			.virt_start = 0xfea00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
+		{
+			.phys_start = 0xfed00000,
+			.virt_start = 0xfed00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed03000-fed03fff : pnp 00:01 */
+		{
+			.phys_start = 0xfed03000,
+			.virt_start = 0xfed03000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed06000-fed06fff : pnp 00:01 */
+		{
+			.phys_start = 0xfed06000,
+			.virt_start = 0xfed06000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed08000-fed09fff : pnp 00:01 */
+		{
+			.phys_start = 0xfed08000,
+			.virt_start = 0xfed08000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed1c000-fed1cfff : pnp 00:01 */
+		{
+			.phys_start = 0xfed1c000,
+			.virt_start = 0xfed1c000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: fed80000-fedbffff : pnp 00:01 */
+		{
+			.phys_start = 0xfed80000,
+			.virt_start = 0xfed80000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 7ae9c000-7aebbfff : ACPI DMAR RMRR */
+		/* PCI device: 00:15.0 */
+		{
+			.phys_start = 0x7ae9c000,
+			.virt_start = 0x7ae9c000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 7b800000-7fffffff : ACPI DMAR RMRR */
+		/* PCI device: 00:02.0 */
+		{
+			.phys_start = 0x7b800000,
+			.virt_start = 0x7b800000,
+			.size = 0x4800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
+		},
+		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
+		{
+			.phys_start = 0x3a600000,
+			.virt_start = 0x3a600000,
+			.size = 0x4c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* IOAPIC 1, GSI base 0 */
+		{
+			.address = 0xfec00000,
+			.id = 0x1faf8,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pio_regions = {
+		/* Port I/O: 0040-0043 : timer0 */
+		PIO_RANGE(0x40, 0x4),
+		/* Port I/O: 0060-0060 : keyboard */
+		PIO_RANGE(0x60, 0x1),
+		/* Port I/O: 0070-0071 : RTC */
+		PIO_RANGE(0x70, 0x2),
+		/* Port I/O: 0400-0403 : ACPI PM1a_EVT_BLK */
+		/* PIO_RANGE(0x400, 0x4), */
+		/* Port I/O: 0404-0405 : ACPI PM1a_CNT_BLK */
+		PIO_RANGE(0x404, 0x2),
+		/* Port I/O: 0420-043f : ACPI GPE0_BLK */
+		/* PIO_RANGE(0x420, 0x20), */
+		/* Port I/O: 0450-0450 : ACPI PM2_CNT_BLK */
+		/* PIO_RANGE(0x450, 0x1), */
+		/* Port I/O: 1000-101f : 0000:02:00.0 */
+		PIO_RANGE(0x1000, 0x20),
+		/* Port I/O: 2000-201f : 0000:01:00.0 */
+		PIO_RANGE(0x2000, 0x20),
+		/* Port I/O: 3000-303f : 0000:00:02.0 */
+		PIO_RANGE(0x3000, 0x40),
+		/* Port I/O: 3040-305f : 0000:00:1f.1 */
+		PIO_RANGE(0x3040, 0x20),
+		/* Port I/O: 3060-307f : 0000:00:12.0 */
+		PIO_RANGE(0x3060, 0x20),
+		/* Port I/O: 3080-3087 : 0000:00:12.0 */
+		PIO_RANGE(0x3080, 0x8),
+		/* Port I/O: 3088-308b : 0000:00:12.0 */
+		PIO_RANGE(0x3088, 0x4),
+	},
+
+	.pci_devices = {
+		/* PCIDevice: 00:00.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x0,
+			.bar_mask = {
+				0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 0,
+			.num_msi_vectors = 0,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:02.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 0,
+			.domain = 0x0,
+			.bdf = 0x10,
+			.bar_mask = {
+				0xff000000, 0xffffffff, 0xf0000000,
+				0xffffffff, 0xffffffc0, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 7,
+			.num_msi_vectors = 1,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:0e.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x70,
+			.bar_mask = {
+				0xffffc000, 0xffffffff, 0x00000000,
+				0x00000000, 0xfff00000, 0xffffffff,
+			},
+			.caps_start = 7,
+			.num_caps = 5,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:0f.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x78,
+			.bar_mask = {
+				0xfffff000, 0xffffffff, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 12,
+			.num_caps = 3,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:12.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x90,
+			.bar_mask = {
+				0xffffe000, 0xffffff00, 0xfffffff8,
+				0xfffffffc, 0xffffffe0, 0xfffff800,
+			},
+			.caps_start = 15,
+			.num_caps = 3,
+			.num_msi_vectors = 1,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:13.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x98,
+			.bar_mask = {
+				0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 18,
+			.num_caps = 9,
+			.num_msi_vectors = 1,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:13.1 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x99,
+			.bar_mask = {
+				0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 18,
+			.num_caps = 9,
+			.num_msi_vectors = 1,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:13.3 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x9b,
+			.bar_mask = {
+				0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 18,
+			.num_caps = 9,
+			.num_msi_vectors = 1,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:15.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0xa8,
+			.bar_mask = {
+				0xffff0000, 0xffffffff, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 27,
+			.num_caps = 3,
+			.num_msi_vectors = 8,
+			.msi_64bits = 1,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:1f.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0xf8,
+			.bar_mask = {
+				0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 0,
+			.num_msi_vectors = 0,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 00:1f.1 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0xf9,
+			.bar_mask = {
+				0xffffff00, 0xffffffff, 0x00000000,
+				0x00000000, 0xffffffe0, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 0,
+			.num_msi_vectors = 0,
+			.msi_64bits = 0,
+			.msi_maskable = 0,
+			.num_msix_vectors = 0,
+			.msix_region_size = 0x0,
+			.msix_address = 0x0,
+		},
+		/* PCIDevice: 01:00.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x100,
+			.bar_mask = {
+				0xfff80000, 0x00000000, 0xffffffe0,
+				0xffffc000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 30,
+			.num_caps = 6,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 1,
+			.num_msix_vectors = 5,
+			.msix_region_size = 0x1000,
+			.msix_address = 0x91280000,
+		},
+		/* PCIDevice: 02:00.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x200,
+			.bar_mask = {
+				0xfff80000, 0x00000000, 0xffffffe0,
+				0xffffc000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 30,
+			.num_caps = 6,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.msi_maskable = 1,
+			.num_msix_vectors = 5,
+			.msix_region_size = 0x1000,
+			.msix_address = 0x91180000,
+		},
+		/* IVSHMEM: 00:10.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 16,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM: 00:11.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x11 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.pci_caps = {
+		/* PCIDevice: 00:02.0 */
+		{
+			.id = PCI_CAP_ID_VNDR,
+			.start = 0x40,
+			.len = 0x2,
+			.flags = 0,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0x70,
+			.len = 0x3c,
+			.flags = 0,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0xac,
+			.len = 0xa,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0xd0,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 0x8,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x200,
+			.len = 0x4,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x300,
+			.len = 0x4,
+			.flags = 0,
+		},
+		/* PCIDevice: 00:0e.0 */
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x50,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_VNDR,
+			.start = 0x80,
+			.len = 0x2,
+			.flags = 0,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x60,
+			.len = 0xe,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0x70,
+			.len = 0x14,
+			.flags = 0,
+		},
+		{
+			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 0x4,
+			.flags = 0,
+		},
+		/* PCIDevice: 00:0f.0 */
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x50,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x8c,
+			.len = 0xe,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_VNDR,
+			.start = 0xa4,
+			.len = 0x2,
+			.flags = 0,
+		},
+		/* PCIDevice: 00:12.0 */
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x80,
+			.len = 0xa,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x70,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_SATA,
+			.start = 0xa8,
+			.len = 0x2,
+			.flags = 0,
+		},
+		/* PCIDevice: 00:13.0 */
+		/* PCIDevice: 00:13.1 */
+		/* PCIDevice: 00:13.3 */
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0x40,
+			.len = 0x3c,
+			.flags = 0,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x80,
+			.len = 0xa,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_SSVID,
+			.start = 0x90,
+			.len = 0x2,
+			.flags = 0,
+		},
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0xa0,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 0x4,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x140,
+			.len = 0x8,
+			.flags = 0,
+		},
+		{
+			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x150,
+			.len = 0x4,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x200,
+			.len = 0x4,
+			.flags = 0,
+		},
+		{
+			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x220,
+			.len = 0x4,
+			.flags = 0,
+		},
+		/* PCIDevice: 00:15.0 */
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x70,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x80,
+			.len = 0xe,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_VNDR,
+			.start = 0x90,
+			.len = 0x2,
+			.flags = 0,
+		},
+		/* PCIDevice: 01:00.0 */
+		/* PCIDevice: 02:00.0 */
+		{
+			.id = PCI_CAP_ID_PM,
+			.start = 0x40,
+			.len = 0x8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0x50,
+			.len = 0x18,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSIX,
+			.start = 0x70,
+			.len = 0xc,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0xa0,
+			.len = 0x3c,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 0x40,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x1a0,
+			.len = 0x4,
+			.flags = 0,
+		},
+	},
+};
diff --git a/recipes-jailhouse/jailhouse/files/linux-ipc127e-demo.c b/recipes-jailhouse/jailhouse/files/linux-ipc127e-demo.c
new file mode 100644
index 0000000..45c0095
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/linux-ipc127e-demo.c
@@ -0,0 +1,127 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem
+ *
+ * Copyright (c) Siemens AG, 2013-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-ipc127e-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+	},
+
+	.cpus = {
+		0b0010,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
+		/* low RAM */ {
+			.phys_start = 0x3a600000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+		},
+		/* high RAM */ {
+			.phys_start = 0x3a700000,
+			.virt_start = 0x00200000,
+			.size = 0x4900000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+	},
+
+	.pci_devices = {
+		/* IVSHMEM: 00:10.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 16,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM: 00:11.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x11 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index fbca1fd..5f99915 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -19,6 +19,7 @@ EXTRA_JAILHOUSE_CONFIGS ?= ""

 EXTRA_JAILHOUSE_CONFIGS_amd64 = " \
     nuc6cay.c linux-nuc6cay-demo.c \
+    ipc127e.c linux-ipc127e-demo.c apic-ipc127e-demo.c \
     "

 SRC_URI = " \
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index 0ace5f9..a87b6ea 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -11,10 +11,12 @@

 require jailhouse.inc

-SRC_URI += "file://0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch \
-	file://0001-configs-arm64-Add-support-for-pine64-plus-board.patch \
-	file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
-	file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
-"
+SRC_URI += " \
+    file://0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch \
+    file://0001-configs-arm64-Add-support-for-pine64-plus-board.patch \
+    file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
+    file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
+    file://0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch \
+    "

 SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8b1b83bc08687dea50340052b7a955fee093fa8f.1586760835.git.jan.kiszka%40web.de.
