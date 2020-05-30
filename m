Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2G6ZL3AKGQECO7FB7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 954291E9344
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 21:09:29 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id h16sf426186lja.11
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 12:09:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590865769; cv=pass;
        d=google.com; s=arc-20160816;
        b=PCef9D2frMeu9J+blNqYk68dNc229dqEdxfwGbFaF/BaHM3b3iPxFzqZw2JAcNkb6E
         PORYyHkU3EaRnD6dI4lDxDm93i6LknegazwzkDqPBsp3FM0wZRcJHSrdLhBcJgvnUtts
         Z4EpqNgg+AIEYA7pUe55PbQR+p1LwIxRjrpVUM8F3Jy9meIpNDEhuYAAAs4dUsB056fC
         VIamoY/nAFKJQf9bdLrN7s+U/8iCZeNdJ7HVmHH6Vz4jjaM8h1gPQEF4pZpASBTTW33I
         YZo0LzKAvUjYP5btlahJG7Q++nLHYcc5zjGmKjCRYuQ8sR17byim47ShUhm9tcb54A+T
         0nZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=y5m/OY4cA5X5emXq5LHXv7r3oaFE9hmKsAADb+ckzj8=;
        b=ObibJS5sUnYnsR5TDI9ZKMcVe9iTLmj1z0z96Oe4QxPAeKXIF12fqDoiCQovvv25+B
         mKeByea9JBC9dR4FyYEyXOMMGBHVMazHwAZRV19Ab6ZSrlGWnoS5JT/COx+Gv/lDzNV4
         bd9QRq5Pizda5nw7k0QLnTc8kyNuddEyzmy1GswrBaHqEr+U4EcDfc1AKFxpvOnnzqJU
         lYLYvi7bk0wAS+s1AilAV3O/Ia1BKB710eIhjClMUKRIf4gw6rZhsVlV8yazZEcKnHmJ
         ENoCkidN0JH+CS3Vqs9LBJP2twQlc1eUjaLu87E/fJTNCfuQGfv1ogPivTiM8hlAsTrd
         JiUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I3y9Nvi+;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y5m/OY4cA5X5emXq5LHXv7r3oaFE9hmKsAADb+ckzj8=;
        b=cFG+yw08Y43TGkRzm2MgpLF3CR5MXyUk5XVCR5xZ6CTwqK6Gi5EGL1aRbWcxINyh9T
         1Kcx4c7S79uAS+tSfcbMTRApGjLzKQ+JeOEEZJz7NDioELjXKc2id1+86o65sxFa2mpp
         kEvwi++7Pp9IiUAdKR5ZCtPewxy90WDUOT+Ftvh+oZKWLFENO6uryUYyhfxhW4qXC0qS
         cehMcVjcDstnfblVLCXf8H45XhIVuzCtkAVlWYlYTh2gDrELlfpcUxWvfmtQOpHYgdKj
         Y42khBmVH5IYvHs9LSN7N1c3Iddogvge5U8fzYDHDcsBMvtJSZYBC199CRr8JKvP1XSa
         GJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y5m/OY4cA5X5emXq5LHXv7r3oaFE9hmKsAADb+ckzj8=;
        b=EKxRDeuDR3RBXFw9yKV2FSV3+9KfCWx9zll1vgxTS2/5nQe9sQM31O9x3TRe5s2J7/
         fgrammbbgvv7LOCkuamYWb0cUMmkhdIJbDzX9wUQe+5c8Fgsol1pzkpfQruoo1T8Ad/X
         kp7rtVls+so+kvoj/QmbAivA24OQkBIeE7zKRvlJV15B2p65JEBml6EbuseRyBB0XTpk
         ouS6eLBXISnYssENMJniGwWyMD0ocIH9BkMP8lGcbKeOkctQZo2JGWjb7LxtQ6bZbUMF
         d46XzhZ0k7Ob3JJxNIP1dsLW/IKeJsU6U9tqfDYXXqqgWrEK6P2Boj35/tGI5GhKO7Jc
         DGcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iFPBCwfT5Oa4BLuy8YSBUksLC/Hum92DSf85L1NGDjO6DKOwk
	OOLBnimTCaRzeon4dJmYDTg=
X-Google-Smtp-Source: ABdhPJz9jMtLCEP7cKmUiHAcUHiKJb7lV4pEzw8s77aFlan1tFtcbqSpsXjKtRuPhvsoOsePT7y5vQ==
X-Received: by 2002:a19:f518:: with SMTP id j24mr7353022lfb.11.1590865769147;
        Sat, 30 May 2020 12:09:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95d7:: with SMTP id y23ls991234ljh.5.gmail; Sat, 30 May
 2020 12:09:28 -0700 (PDT)
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr6974632ljp.146.1590865768379;
        Sat, 30 May 2020 12:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590865768; cv=none;
        d=google.com; s=arc-20160816;
        b=sXNmxXIHbY8douDJsf3ry/zkCcVk1E0ATzSPKm0RdHONH3r8RkERX4vzukLWgnVM+i
         FAFtrm4++qw9+chgLcR8NveHpQj46paN6xBMikqjy0P/UcYKZEqR1j81+7FrSmmE0hCw
         40QaP9zhKZWEJ5jRTJ14sbX93Sc+JdtIjdOnNXeBA8J2/Sby00+4ltowx6VyQB9JN8uy
         gMg2yF+/pXjxZXdk8GXz9HvXIxJiqlHFqYBBc1KtZNPEZXC5bcI1MR75ff19d4hGoEe3
         FM0GQB7Naq8GgXO6uDl933ebOkvj6Mynb/ccAx/7aNVF72PXve5cLmAYVntRH4oZbcqy
         TOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=tBc49r82h/xrq6n6sLeoTJdFyl/ixLFjW1bId+bMKC4=;
        b=vWnlRngdNOQtiCRBEGgyzv5l01la5ZovJAu6ZDj+uRgMIMOjMgbJeaex8MY771nfBX
         pM3/W8rq+CsG4yU471wZj9/fRfyZzoWbbtA3yBmPDnJCLXtX+6D1fjFS9yVNxwLlgmRk
         tYzBUlQkjC+8qPlc/9bGGxjuD6h7jjqamdsQ0fUcd6xmUvwM+TiZtjIsFBWi42Etzg+l
         Nop8CDoUpLc7peFh/fL2TRvvhBGRCAR+3GSbNWOByJRNfHSyGmQXb4Pmj/+MEyWu7tCG
         1QcKjD15O7Rmj+AV0qOXe6BRFPeLCi7VSHJKsrBfCqRCRenYnOt6NLUB/uUOJhNtVFIB
         dIkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I3y9Nvi+;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id x25si785852ljh.7.2020.05.30.12.09.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 12:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOzrj-1jbXpA2IFz-006PT0 for
 <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 21:09:27 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] driver: Account for changes in kernel 5.7
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <53cdb580-ddfa-1a00-6267-f65d7c2b4e63@web.de>
Date: Sat, 30 May 2020 21:09:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:bVulpqHRV4PATuwMD93HjKx0vQfdAQikOtmYfe3K3w71b4Q9kqS
 3j/q52MFNdp+k0HFOF52civ2a5ecctQl6XlPmVrlCNla5KSjVy1D4UZYWwq6rJfDGzMQ+Ly
 sjE8wmRZRvh7XWyuZRpKras6Lz+goCWoJAG5mTu63crA0NloMYu/FYX7BOksEL551ZowLCE
 NrdklKuoIBjdrQMABYT8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nOW7IwKuaTM=:e3o8hRj/ji7GK+TBRYd7QL
 8tRC24NGXuRD5GSoN4KpsI9elabZXa5KeWWAXkYWVYGTCj2/EzAS2eYE+fkREwCuqBihYP73v
 GNLVklIL/Vm0jUX7UOLNw0EtpoZQrV7+Hsh86RJJjYalWNjeUct+KDU6T25jJKibU3klD7ICc
 gDHvGZBRJUHgvDRVQTno0r9gsdzfT2fapxMU/fT5uPuKGQFEK9uK2mz4NCoI4PeDFt/2SvKkl
 lYJtLKLAnDJPeP7aSwHs64xM/LzLYxsryeUZWjZRxTqKv5fD40ow6lB6cDOUxobyzu7hRgZSu
 mj9g4s2KM/jgJnWJVv/pSMylNtCfQY+FbziFXFuAGx894mwQ9UaevZr6ciPioWrlb2/wgwqFX
 ht8YpdSX8TOEoHhUsVoeJRakt7rxag/G+LcgPgd40AYENgoWGDZyoUYdPy7jlBA/q6MBSAzu8
 mVl3XTpuHU1AXEDxRgU9Vr0VjyOeMkjJbyy5egm284vk++FnlHZL04h52QymmSaT43j8nb7uV
 Szbxy+mwSS+cP0yKFm4n1oCugS+G7SLY47r9fYnMvAE0spF02QLFP5q3y81c7TgPn8T5Z5kZ5
 I4RuIsriGr28JOZ42MfTjrRGph95pZ4yR3IMKPOotgCF/8GT0V3K9um6/Z0FBpAMQXoiOkyzA
 aip0syeEYwIwgRO3odWDw2y8pEhY7GJPhmeQhKFlZ9UFWDucwWJ/CKd7JqTSQzdmCyoXwqPrr
 5sZaNPJZ+TuA+MG0xstyB/JigY0sIHHfaof1Cz8EKP5oqV8hnPlUm7EDHyq+TRSzivHnwaQhX
 QgCML1KJxqsn9hAOFCjH9rWq92LFTvJS7TNrwrqVvU5rvlN16As2UCr4Yz02ThVzkELwfANQy
 pf6EggXzcl0aTFM8yvomPT6jbgY4YHgzvvTvb7zep1Bj3uwNR0grOoeD/nOeLtkNKKFL++fE6
 uyNmtgP/FWKpETmn4jxl3gQdWWQJ1fidWoxbHLWx9i+77GJ2g6I9CwUCXEMEtbn0O8C/sFay5
 JmiQN77KJCJjiWbD6XUS3VZudvN9cx6mEM6zOIUVwnT5MgGB56FcM34NPUxyi1qEJ2O7lUN82
 /ZpqwCehfsjjT89Pz94A55wdaitrRpnvuEzaiaLKVKvoH8KOo01dc8EPckjUI2rAQMSRrBLjN
 dop0bqxKWYKcD+BpnkIRMIVTJD2ynlmXBk72Fx0Mt/Faxmr/A1SCdiY2JpqUGNtfN4y/P+hr5
 Z29mCrL79q+p9roMO
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=I3y9Nvi+;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

The cpu hotplug interface got reworked. Furthermore, our trick to avoid
kernel patching for EXPORT_SYMBOL purposes only is passing away with
kallsyms_lookup_name no longer being exported. Keep the infrastructure
for now for the sake of older kernels. We will remove it eventually.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/cell.c | 14 +++++++++++---
 driver/main.c |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 50e344e5..a4d386e6 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -10,6 +10,9 @@
  * the COPYING file in the top-level directory.
  */

+/* For compatibility with older kernel versions */
+#include <linux/version.h>
+
 #include <linux/cpu.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
@@ -23,6 +26,11 @@

 #include <jailhouse/hypercall.h>

+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,7,0)
+#define add_cpu(cpu)		cpu_up(cpu)
+#define remove_cpud(cpu)	cpu_down(cpu)
+#endif
+
 struct cell *root_cell;

 static LIST_HEAD(cells);
@@ -232,7 +240,7 @@ int jailhouse_cmd_cell_create(struct jailhouse_cell_create __user *arg)
 		}
 #endif
 		if (cpu_online(cpu)) {
-			err = cpu_down(cpu);
+			err = remove_cpu(cpu);
 			if (err)
 				goto error_cpu_online;
 			cpumask_set_cpu(cpu, &offlined_cpus);
@@ -261,7 +269,7 @@ kfree_config_out:

 error_cpu_online:
 	for_each_cpu(cpu, &cell->cpus_assigned) {
-		if (!cpu_online(cpu) && cpu_up(cpu) == 0)
+		if (!cpu_online(cpu) && add_cpu(cpu) == 0)
 			cpumask_clear_cpu(cpu, &offlined_cpus);
 		cpumask_set_cpu(cpu, &root_cell->cpus_assigned);
 	}
@@ -421,7 +429,7 @@ static int cell_destroy(struct cell *cell)

 	for_each_cpu(cpu, &cell->cpus_assigned) {
 		if (cpumask_test_cpu(cpu, &offlined_cpus)) {
-			if (cpu_up(cpu) != 0)
+			if (add_cpu(cpu) != 0)
 				pr_err("Jailhouse: failed to bring CPU %d "
 				       "back online\n", cpu);
 			cpumask_clear_cpu(cpu, &offlined_cpus);
diff --git a/driver/main.c b/driver/main.c
index 01e9c049..ec302639 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -900,7 +900,7 @@ static int __init jailhouse_init(void)
 {
 	int err;

-#ifdef CONFIG_KALLSYMS_ALL
+#if defined(CONFIG_KALLSYMS_ALL) && LINUX_VERSION_CODE < KERNEL_VERSION(5,7,0)
 #define __RESOLVE_EXTERNAL_SYMBOL(symbol)			\
 	symbol##_sym = (void *)kallsyms_lookup_name(#symbol);	\
 	if (!symbol##_sym)					\
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/53cdb580-ddfa-1a00-6267-f65d7c2b4e63%40web.de.
