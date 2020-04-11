Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5OGY32AKGQEO7MHHJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8B1A4F79
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 13:01:10 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id b16sf1622318lfb.19
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 04:01:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586602870; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q0msjyM0Ef7IUdFZHrjaulrOvo/ssF/LTX/SEo7vKvMiY4K/oi2S6g/kn8JADs0h9g
         LXDg2pcnfYNsoRWBlmeqZZ3/yZ/1Xe6WM3E5hE9ZynZJbiB/2VgOQRVznwXrq/zg0+f3
         BcB0Z/kA+i7wLGQqwBVmaYTBZM4yxnndNYAg1rNbvpSytknL+Ckd9+pT7uoyktZ56xd9
         8WlWso7u36+Mb3/ZB9wLclBmMpKJVwMb1oITubj8aJmHi7NmFvvUpr7NYlGPPuod5yd3
         peXZ6SGMQqaZkdZKiA/Riy69da4/R5z8qbXD8RTNTB3HhqdANbfrMsy1U3t04lZuOJRx
         o2fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=9v3XhjwvVts4NxeY8B9v2bk/NOLzdsvZIzo1qMqgue0=;
        b=mchSJ8tP23/j9bkYWzgN7aTa+ZntD8LWeQuK6Dr505va5xZsWBO6UbIJ0GyHVWBLHa
         QDy1LfBXQC4Pt1UTqaKQbp20eLy8hucn35hyUd1fY5KeE3mQ3qlyDogPTrackLTSWMFp
         YwRfqUgf1ZTbDajLqZ4HGRHT+0rdMxa7ofG5jvCPdXK1lWGWl8ss2qNQRPEO0Kt6vHSa
         TC9erIuw32OkeJVaJsCpRAJULNwg8elSDVnE8kRsEIeYNrZHiv73dP2H7kFebEKkZXHK
         J+aaEwr3lt1AgDvUJd76a6sGVugKiRicLAml6pPk8pqMz/LpZpuAAQVkiIC+9dRMG7+G
         tk4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jTFvZaVT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9v3XhjwvVts4NxeY8B9v2bk/NOLzdsvZIzo1qMqgue0=;
        b=BPnqiqG/jaDtSkDxDK2WsWuBy3V/+6ZlO7RPscfiPH1kiETsUb+oxxvMuMRbgk3ynM
         PqDVAaMm/dwQXbQtVTsWp7XoPCLopljXZlIYhk0bKTkLI/n/nbSppSn7WPjy4XrOjc18
         TJCHR8u5A8Mb0KyebyX1VCn2kV/gTZjkE3Ih7dnadBgzk2h6gdX43xAEPmrmfl54cc+a
         koJdYG8AAoUqnVoRR+39W9rqzfpTY3zsI+5ZEqbtpZOj8wuPc536/BCudemrHSkuJ1QO
         XI9Ln7k3y4YEhg44Q5gavzfQXzN9izqS6F2qASSH5Y+9uCVybCCuJCxR1QQd2+JwdFDl
         vpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9v3XhjwvVts4NxeY8B9v2bk/NOLzdsvZIzo1qMqgue0=;
        b=UQknQ1Rvggc06EUZogZS7iOBLgPiJjPLej1hNh8/L0hjT9KGb6drIneuwM2TihBfwf
         9g8vls04INdZ60zPmiIqX62Vvndp0u40uwJ2HdaUYsQ8He0P+MDDvwXDY2+MOvWdf1VB
         ccnT/wp5vQTWC6A6YaQ81cLaDDEz68+f7lzh38WItMM0j9h49RNGlvQ0e85dqL9+AA2f
         EPtvnyGpqN7xkXRa76oP8i8DsXXRV8uxhJLpJxRQezKjbwo0IjauazRhAchRlojmyyFk
         e4D1QIJalgahPEAvZ8nBpcqIsPlhqPvLq/6S6aw+iEUszDhrk7MgRHptwTgAxuucEKTS
         dfcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZQsDLzTsEYddD2IDUDJAy+jQe5JqrNQHgCzPADzJkEhGbiNWz7
	y9rv5YcjMNenwpYPbOll2As=
X-Google-Smtp-Source: APiQypKwe8J4n9OzqMNzwFTQBV1+7bdOVhpAnHLP7tESeFoVK3PWPsi8CeFcMzMa1r25jJgETPPzSA==
X-Received: by 2002:a2e:888e:: with SMTP id k14mr5547996lji.4.1586602869873;
        Sat, 11 Apr 2020 04:01:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:488:: with SMTP id v8ls2097394lfq.9.gmail; Sat, 11
 Apr 2020 04:01:09 -0700 (PDT)
X-Received: by 2002:a19:4014:: with SMTP id n20mr4962513lfa.6.1586602869083;
        Sat, 11 Apr 2020 04:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586602869; cv=none;
        d=google.com; s=arc-20160816;
        b=IeXuBlj5MHFx0T0XvzC4zg98AUFofYJUJUzsrHgRe9qlTuI8JmgCpWshGFQDw8TKiU
         n/dX+yxj6jFqOgYTrQx8xoTzQKkQpiDr6fPqRb+h5j4H1SucKpr6g5kON/NiJt4HDYad
         +qv/+J54zUE0AfDFPbxXjkTNz3RZRB2os3NBw0cV9HnU/aKho/xv05ylEHA+TUa/Gp/6
         sDPHYnO2kMXDYF7855SKWUvVF0XtOdKPri9OpHOnpxgVxNhxvUJHB9d+xkJRjRXH5ArI
         PptJVcNUZNhfqa0AEA9B7Ak7DVeWHRM3KfErbgeBXx/E70T/Ho+ezV3cRKXUNcSdXd+m
         8r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=H5P+ywYmoIHxhzGizVp5H5JT8F2aJ1oC/2A6ioQXMRk=;
        b=d1l95zwQ2cqp9UqdvmMDHnPUzGUNNQ5iw2Yykrhtqj/OAgUAaBPUvvOrBY4a+uyd3i
         ZQvHKpjsK87tFxO/riJ6RSmnx2qXoYf2/3jPryYVosczJVvWb09aTXStP5N04txduqwC
         Ky4RXfYSeTv4Q4IRDDrIkcW7c8h84uPYuaprCXqddzCfY2MfKKCFkO6/kyEiQqv18uZX
         R7sH72I0N3wJTqUvCTMhfZeGGcSP04h4IwmJ3Uid7+x+1eK8YrzqYv3USWvVfzbjdyTv
         9S4YZJuWqN+lSQzp5S7lbR7fJ68/cz55qRbX9FiUCtHCoVJgfzlYgVLfplZYZJ/9A6xm
         lgag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jTFvZaVT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id f25si226124lfc.3.2020.04.11.04.01.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2020 04:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([80.187.82.138]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCIoz-1jViC50f69-0098kz; Sat, 11
 Apr 2020 13:01:08 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Jailhouse <jailhouse-dev@googlegroups.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
Date: Sat, 11 Apr 2020 13:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:htyDWqy7k9kP1s/vWgygVb7zJ6s4lbSOTal4BIhy0v1xxcOfg2v
 bVtplGmQIeiPZ/Gui3dejpmsYtyqnnNBzhk5BEM1/NWN+KtYYFu9P4ug/vxTSaCnaGtTbt9
 gjfnBr+S0zs/BtdsfP4aHJGx89raxkPNQAiSiCf9XHS9xWX7REXU2V5tYQgx7m1aOuBkAI/
 II342VTE8adxhM8btxidQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gkcy300gpdo=:bgSNwskaiNdSxjEJJjh/Tj
 t4Z8BhaNwtWqQwzBUvGGyjazSqoCp0jYKGFCUxSak2FXHNCx/mSY9cgSBFpYGeodWqvi2DHsB
 ikMCFGjZQxc3TfX5O2kjIA9linb5PMGpzHAJeTqYt1hXkkdSUpLsS1/N9OcU27FTX4eCmv1L6
 lmMiPl4Ft815C8TTkBUgcFwUUrENtnPuGC63qkOnPSyL4mXeZvP4qYFttMFPd+1N1XZvl8W7C
 ifQnmU/tI8aJkT2pahaLrwJjS6GV0cMxQaXh/hBylYNMjG24TrzDA+ehWUP1z5BSYY0edp3eN
 VaZxEM9VbWuD2YtB4o9HsWB/j/Xyzxp7s1f2yyp6fiNgd4WTjwMNsD2W11kdRx7V8cCQhYkaY
 AbKFLLGTjVJZr0ihRmL8LzgLlmI74uOV/HLQd+zSKxNWuyu1lbS/Q8ArlnphNSLEX15Kt55KW
 N8eWKivtJs1G53tLVrAzYFmgYSrrdMl9XdFlY5SizjVXCNxEVr/AAksqVWLEkpxDHCi/xqPW7
 diAg/iHEaB2q4ZalXi1EhinlB2EsNuCuPGrq5aJq4OXrGzp0HAsHwiuMJnkZAlQOzmszVtZWf
 HwvJTmuCAIeM0iQEQfoC2YOwleyM0wQoU7N8CkcILWUh/xfzNzlZVfRaxVCoRdkcbz+ezYxJW
 10HA6/WPicFnm558ttk5J6ocGXpdgZmFbBiGZ6dJeEBv67VQ79jJpYvPkfFoACv/7H10HYI7j
 H3SCId6pzFWahnoPzG3F65ZSxBy/PR+igTXhnIFJqdUQS70DESTRV5szk4IwAXpexXERBUz6/
 1ba23CLl8T3fAGxDcZZgR1F5U4zzUqVN1KT9wDIazDYSY1KLgo8lUSiAldreMbVI1ml96bgEb
 8qVf8NxN52hDoiBZCaKA0vkiCoGIt4VP/8YloE0mbjo+glvasrrnaJ6E9ToCMHjXaqi82r6C/
 pVMKG73neb4qDaOUfO9NEmvzgshx4u722mFQIoOh5unJrvAwNJtBrw2GnHdI1sEJjUZkotYrG
 zuBoYbhEriA72rGegjqoyzgSytdbn6T3K0T79SqvjugiFJhv67bk1BXZjY2OOd7KBrTIK20ps
 T00t5LFwwrDfoy5JNXyqfc0tW32ON01XTySQLr029B6AAPs8X9FcSJlh5e+mwAn532CuSDBdN
 QLeH33l52l92MxgBm/oojVQKM6uJuRakqtjKXKDOUDrNc5OArViXjgambO8on4P7XvBhRi9rJ
 5xhBIm4ptMoxSATA/
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=jTFvZaVT;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

So far, any error returned by a function called by
pvu_iommu_config_commit was ignored, only reported to the console. That
would have resulted in an inconsistent configuration being run. Also,
pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all, and
the former also returned an incorrect code then.

We rather need to panic-stop the system in case some configuration bit
cannot be programmed because there is no way to roll back from a
config_commit by design.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

I wonder if there isn't a way - provided it's not too complex - to build
up the programming during cell_init/exit, validate it at that chance,
cache it, and only apply that state on config_commit. Would mean less
panic.

I also wonder when that error pvu_tlb_chain can actually happen, or if
the check was just defensive programming. Maybe you also have a better
error text for it.

 hypervisor/arch/arm64/include/asm/ti-pvu.h |  2 +-
 hypervisor/arch/arm64/ti-pvu.c             | 65 +++++++++++++-----------------
 2 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
index 2c340b3a..466b5b3f 100644
--- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
+++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
@@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell *cell,
 int pvu_iommu_unmap_memory(struct cell *cell,
 		const struct jailhouse_memory *mem);

-int pvu_iommu_config_commit(struct cell *cell);
+void pvu_iommu_config_commit(struct cell *cell_added_removed);

 #endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index b06ba843..91d39848 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -15,7 +15,7 @@
  * There are limitations on the number of available contexts, page sizes,
  * number of pages that can be mapped, etc.
  *
- * PVU is desgined to be programmed with all the memory mapping at once.
+ * PVU is designed to be programmed with all the memory mapping at once.
  * Therefore, it defers the actual register programming till config_commit.
  * Also, it does not support unmapping of the pages at runtime.
  *
@@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
 		return 0;
 }

-static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
+static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
 {
 	struct pvu_hw_tlb *tlb;

-	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid)
-		return -EINVAL;
+	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid) {
+		panic_printk("ERROR: PVU: Invalid TLB index %d for chaining\n",
+			     tlb_next);
+		panic_stop();
+	}

 	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
 	mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, tlb_next);
-	return 0;
 }

 static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
@@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
 			return i;
 		}
 	}
-	return 0;
+	panic_printk("ERROR: PVU: Not enough TLB entries\n");
+	panic_stop();
 }

 static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
@@ -159,8 +162,8 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
 	dev->tlb_data[tlbnum] |= (1 << index);
 }

-static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
-			   struct pvu_tlb_entry *ent)
+static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
+			    struct pvu_tlb_entry *ent)
 {
 	struct pvu_hw_tlb_entry *entry;
 	struct pvu_hw_tlb *tlb;
@@ -175,16 +178,16 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
 	}

 	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
-		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
-			__func__, ent->size);
-		return -EINVAL;
+		panic_printk("ERROR: PVU: Unsupported page size %llx\n",
+			     ent->size);
+		panic_stop();
 	}

 	if (!is_aligned(ent->virt_addr, ent->size) ||
 	    !is_aligned(ent->phys_addr, ent->size)) {
-		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
-			__func__, ent->virt_addr, ent->phys_addr, ent->size);
-		return -EINVAL;
+		panic_printk("ERROR: PVU: Address %llx => %llx is not aligned with size %llx\n",
+			     ent->virt_addr, ent->phys_addr, ent->size);
+		panic_stop();
 	}

 	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
@@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,

 	/* Do we need "DSB NSH" here to make sure all writes are finised? */
 	pvu_entry_enable(dev, tlbnum, index);
-	return 0;
 }

 static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
@@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
 	}
 }

-static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
+static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
 {
 	unsigned int inst, i, tlbnum, idx, ent_count;
 	struct pvu_tlb_entry *ent, *cell_entries;
 	struct pvu_dev *dev;
-	int ret, tlb_next;
+	int tlb_next;

 	cell_entries = cell->arch.iommu_pvu.entries;
 	ent_count = cell->arch.iommu_pvu.ent_count;
 	if (ent_count == 0 || cell_entries == NULL)
-		return 0;
+		return;

 	/* Program same memory mapping for all of the instances */
 	for (inst = 0; inst < pvu_count; inst++) {
@@ -356,20 +358,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
 			if (idx == 0 && i >= dev->num_entries) {
 				/* Find next available TLB and chain to it */
 				tlb_next = pvu_tlb_alloc(dev, virtid);
-				if (tlb_next < 0)
-					return -ENOMEM;
 				pvu_tlb_chain(dev, tlbnum, tlb_next);
 				pvu_tlb_enable(dev, tlbnum);
 				tlbnum = tlb_next;
 			}

-			ret = pvu_entry_write(dev, tlbnum, idx, ent);
-			if (ret)
-				return ret;
+			pvu_entry_write(dev, tlbnum, idx, ent);
 		}
 		pvu_tlb_enable(dev, tlbnum);
 	}
-	return 0;
 }

 /*
@@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 	return 0;
 }

-int pvu_iommu_config_commit(struct cell *cell)
+void pvu_iommu_config_commit(struct cell *cell_added_removed)
 {
 	unsigned int i, virtid;
-	int ret = 0;

-	if (pvu_count == 0 || !cell)
-		return 0;
+	if (pvu_count == 0 || !cell_added_removed)
+		return;

 	/*
 	 * Chaining the TLB entries adds extra latency to translate those
@@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell *cell)
 	 * Sort the entries in descending order of page sizes to reduce effects
 	 * of chaining and thus reducing average translation latency
 	 */
-	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
-			   cell->arch.iommu_pvu.ent_count);
+	pvu_entrylist_sort(cell_added_removed->arch.iommu_pvu.entries,
+			   cell_added_removed->arch.iommu_pvu.ent_count);

-	for_each_stream_id(virtid, cell->config, i) {
+	for_each_stream_id(virtid, cell_added_removed->config, i) {
 		if (virtid > MAX_VIRTID)
 			continue;

-		ret = pvu_iommu_program_entries(cell, virtid);
-		if (ret)
-			return ret;
+		pvu_iommu_program_entries(cell_added_removed, virtid);
 	}

-	cell->arch.iommu_pvu.ent_count = 0;
-	return ret;
+	cell_added_removed->arch.iommu_pvu.ent_count = 0;
 }

 static int pvu_iommu_cell_init(struct cell *cell)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f87739b0-2990-1229-4cfc-105c36f4efa5%40web.de.
