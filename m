Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXGWXPYQKGQE2U33HUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E20B14A579
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:53:33 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id f13sf3817303edy.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:53:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133213; cv=pass;
        d=google.com; s=arc-20160816;
        b=GuC8CcFn0UMmqGpmX8tSUP9oM7u5GWwvJGKauQKxhBG0+uKxrFdmgHWPH3QjzsgMmW
         C70EvDTcP9trDlOtAvN/r4e5OntDEy4KEr/nSAO7Ga8/N24i9V/pa3R41HvULHxgicP1
         2JQvsf3wRpbx773CQ5A0FMIEn9mIfb9RdouvtumDyzwFddFsxfkHh1+A0odG7klgkFKr
         KvEC35i8zd4YBPJ5zky6thaFdqv5b29farJH0woqFq555/VJqDQU/Df1XVxr6bYXW6f9
         ItVVzCFRFRJJwyrNQfvduDEuDz5t5C8mMFTSw0DCQ7JEYK9Xrm/5joYkFNIMeasa01uS
         ibuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=3FFYC8xHY9OuC1RU0SKWNEhVxK0hD6Nu9nNVj6LyDDM=;
        b=VJEVaMg+qiY+hM1rbDMxnVthBcKt95N5vSTxaXp9wh1jIcqxBXIxlkTUTUr/R4ptTE
         mA8swjKOHUmWmyrY5LQnrAsFVAHWK/7pkaVuitVhIf1BQb/1PeX6mwjQwIk7MEIWlB+r
         yV6dEmYW3Tkz92naoqyTtKVtqkExdcPqFUyNln3tfNr1KHVtS09y/MwOKbK+rdLxNfLT
         TKukslI3/z721RF0f7TxMZhDNfD49q3w4Gi8oSX7w08o0piXJ81TtdqxUthBKu50+qR9
         K7MzIbrkmbIGFx3EseA+Cr1ASdQ379qZuibBw93LFVTwqpiTpsPbHPUQETovrQXqbWw/
         1m+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CtFh3Lls;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3FFYC8xHY9OuC1RU0SKWNEhVxK0hD6Nu9nNVj6LyDDM=;
        b=RqpG+C5yOFqtlegMZQB0EB3YjITGItCcNWC5bAJmJImB0iPTPsZ+mlMq9ZYKU9jEmu
         gMRCiQ8Bel79iODE2len1XYiFj+oewRRv001h2jCkA0aXRGRQKo1rOTYbISji4nNBFQh
         nDrdQLlOWs79JCG67BfKNPl520UjKz4oqfyGH5q0k1S7cK1l5AEmvHJhn7MkVJo7WMTH
         EdT4JbJk4uzB0sxTOB0wfvZrHajI4Poft47CmH8sb1Qyexr8G+FXNjn1Arr9miaXT0ym
         3F/nqBC+lFCYaBg3ENrHpn8F+M+pmDtYa/8Fstr//zvgZ03JrKM4kYa0MBJa0LFIdGbb
         w+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3FFYC8xHY9OuC1RU0SKWNEhVxK0hD6Nu9nNVj6LyDDM=;
        b=p+KjEUnWaMZU7RWKjNUBhwkWLz5aTEUAvDPNsBivnc/oYEF9RGL/++L5acdeSBucKV
         Ty6yUrigjm3GCoJY/Pf77vl1P9eVhl4nJL0XQZEshf6Eg5DUL9g/eFHDqlBb9lRYRjPp
         xWCZ+A54jqDIB+kXB8b6e8plVWOkMWA+iItoBTbYJNRQjzjrZ0Bn27ZLecTXWEj+5yVj
         7zvK4jP7L0I8N25HwVQn8oZhvjoraO7fkGpWnWV97wF68nWwEx7LXvUoKoZH4wPQ0hlM
         SXgTi/BfDqOPSPPZgk/mkxPBOg4AU6Oi4qXIGYi58xc8FwiaMSPcXcXeoWfJgOENvta9
         J8Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVNMca5+HcFubzUCaSURbRvWH6bkG226KeeU9cuwRG2AIg0dRoj
	PfXgYBUGJfnIfeF9YQWBXv0=
X-Google-Smtp-Source: APXvYqxFYyWypigjH3ZuOoWF9O4YdAPEk+EE3FgmPWipDvNMpPsZNLmxWWs9JprDjFPd88MAbcyRAA==
X-Received: by 2002:a17:906:b351:: with SMTP id cd17mr9852981ejb.45.1580133213027;
        Mon, 27 Jan 2020 05:53:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:385:: with SMTP id ss5ls3365755ejb.7.gmail; Mon, 27
 Jan 2020 05:53:32 -0800 (PST)
X-Received: by 2002:a17:906:7d6:: with SMTP id m22mr10347980ejc.335.1580133212335;
        Mon, 27 Jan 2020 05:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133212; cv=none;
        d=google.com; s=arc-20160816;
        b=fZeD4/wpCrJk/29OAqAGQeV2kOhRUgbGeKA26xO5gvA84ZLdNUBuNmEmswSIvd/g/q
         aZBYo8DKa/E/Z3+D3hiuEOrNoOfqZPMEZKoTfev4yJYmdbt49aobOmNtPjcPkuxPQohn
         OTJly7vfdqWNrWIgkMWZoHjS7JEj7YI1fUG15V5Ian6eKt4ZwA0QfkHkm1c6QckkDByN
         sK+8dDNwTfKNz161YIcoory+7Fe7TiGuK+3NXxss9C9YKadXrMpNrbwD+pw0SKAedLeo
         bMA2m/aihz1/V+1QI4HtVnrhn5hrPFk770QM5mchaQlh/NJFwGs4JcY0VzZogrZ+RgJB
         1OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=lShO22KJjtbfx4mJzxCrr4jKbZRvvcDoYcaPLvt2M6M=;
        b=XHyEfTIzDM3UQ1rJolnc4GTDFzN4180RH1Iyi/8Yo8BmiWJ6OyLzOLrZmAWtb7Kqwk
         T/3unxYuMBGmOJ/eNzLZjHrityktFLWuzZjr+FF28lHG9BHofAWowmTutZob5JiI0fBS
         bjCB2yhFSgq+6palNnjbfhwMI0Rv5NigJvWr1fSs8tbPumn/RlDFszZZTbtJXzhpbhs7
         KGKgrAqI/dClWqMIKpkEzHzBQmXHGrUz2FHOp0rnnvTw6I3MVDiqU0EfPXdwChs52OxV
         ZPHLS10p7PQ8RTAY+eUNmcoYuky1p3sQo2HXqFnG8g2vC1pjULowjUQKU2XRVCrY9DzB
         LoBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CtFh3Lls;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id z20si408943ejx.1.2020.01.27.05.53.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MeBHO-1jEARJ32Ug-00PrcT; Mon, 27
 Jan 2020 14:53:31 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH v4] core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region
 flag
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <7a9cdf63-c1f7-2a70-6216-7b386727543d@web.de>
Date: Mon, 27 Jan 2020 14:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:5TICNw6/AOvh6/zNzC0+FvdfYEuz7GK4OcUsoxYNJBUaRkuPONS
 IBcRT3FT/mgGON3jLSjY4oWvPWK/ov1kGgcj+ppaqS7DK7I+YjfE3JaaO5toUU9+Vx2opr4
 J5f2hAERRv6H0kfAXqJruHikGEDi6geiePs3QsJtJg6wPyAQtlsTUgqlgcgsl01hSWwqPXU
 d6STcy0sfLowhJivaho2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lv8gj9p/3b8=:siDptgw3FhuuRzqeiHMTzr
 DuS27rLZ72zdDMyHrJqndnuGIde9WJT0sFIDU0LUaqMHX9nIhENN8JRkegY4QZ8XCzWSutwxC
 S4vx5B4Doa2ijqNcsADmwm8iS/9tUtBjy+9FPVn4SacUmPfLCHLWT2jWYxH/ChSuH8phFKKUt
 XFBx+PdYqRgxvnpRXRL49Wzq3ssXR5mX8CK/w3RjHQONMMiwGZ/jR1HE6M96koiFqg3bZVGqP
 fFPD0sq0SGuuiwvMfKsNnmeE+I0qGVYw9RTvD5LSpH2Uo3hhIRh8ytfLRR4YFKuGhQPtz72Ej
 n+bekVKa1aWShCLOn/8FBI1F17NNTKufWeW3K2zUdg9FjNETBcZRCv6/ikQ1beIFqoyuV9rqu
 e2uYb0vubVO2C3gV2d+B+b58Bf/wGmS94e1AWW3raPYU9BIKx2QgeLOmTHh+YEUhuquI/EfIb
 2vCBvgyuzROVwb5k1fCynzZHidWG/4hWehh0n3Zts1YfV2GiXJtsZ7k/9J4XjTvBKgVa+hJXe
 1E7hejm1AvG0V0FSVNdOold2zydZq4oUYB9OTR8hfLxT2rPN570eaRRAHOvSOVEbz9NY5xL6u
 l7o6xAuC0yujDzWpaD3u0YlmodnYtJR+QQw5uMcKiB/O0iEJz28lJzvO3BwlwtMo7PJwKWeHO
 IDBVWzT7qWmyBV4Jf9cHOXEolnv62idq5Ksh0YWkLlsh5ll1ssepR8yLmLXLAM9/tiAgWNO7A
 NuTDfmSeXX4rWS+hYeMw9DT53/V9VQnJz4noAEno8nQ3W1EW9q6jvt741SsZ/pbE69isHmZ5L
 ttIw70NvW0O6tAGJCQtE0rsxxXQO3ZSqc7zZi9zbCFiUu0vE3vwrz1Bxp4VxqCtDUkmZCLe49
 8QeGGlLU7tvAwlCQITNow3SD4+UoKLJ766alMo0aPFr2q2/po8Bv0eUeMA9AnbAFcjflsgxXe
 mzK0QhPUb3xknF4jMvPBnLza07rGEt3eYkfFaQ07LyBVVnuOjNcGtFxfdLLVb34+wisnQLjbg
 eQt0wEFAc9I53cxoTMJMpzJYFWUQ3Wzzp38EwYATxAYuWwLZe3K6Q5x2lHrQswrmBX/TmN9hy
 VxRzTO0bJ5VxWoUieGiZRYHpoifCvW4B+qapBlBlDkbj8Fw3n0wBC/WZl/O0s41LP1L3Itlik
 CAq04oScGOjA7a0DAusQZLgzAxVjnQYjVuf3G3f70fsYf85k4B4oKq+USjNNxOqEirVUXysLE
 iksZYALxkwpGr8iab
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=CtFh3Lls;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involves on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

PAGING_HUGE/NO_HUGE is consistently applied to all caller of
paging_create, using NO_HUGE in case only a size known to be smaller
than a huge page is requested.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v4:
 - fix build breakage on ARM (lost character while editing)

 hypervisor/arch/arm-common/gic-v2.c   |  2 +-
 hypervisor/arch/arm-common/mmu_cell.c |  8 ++++++--
 hypervisor/arch/arm-common/setup.c    |  2 +-
 hypervisor/arch/arm/mmu_hyp.c         | 10 +++++-----
 hypervisor/arch/arm64/setup.c         |  2 +-
 hypervisor/arch/x86/svm.c             | 13 ++++++++-----
 hypervisor/arch/x86/vcpu.c            |  2 +-
 hypervisor/arch/x86/vmx.c             |  8 +++++---
 hypervisor/arch/x86/vtd.c             |  7 +++++--
 hypervisor/include/jailhouse/paging.h |  5 +++++
 hypervisor/ivshmem.c                  |  2 +-
 hypervisor/mmio.c                     |  2 +-
 hypervisor/paging.c                   | 23 +++++++++++++----------
 hypervisor/setup.c                    |  5 +++--
 include/jailhouse/cell-config.h       |  3 ++-
 15 files changed, 58 insertions(+), 36 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 978fb66a..6a81f77b 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -239,7 +239,7 @@ static int gicv2_cell_init(struct cell *cell)
 			     system_config->platform_info.arm.gicc_base,
 			     (PTE_FLAG_VALID | PTE_ACCESS_FLAG |
 			      S2_PTE_ACCESS_RW | S2_PTE_FLAG_DEVICE),
-			     PAGING_COHERENT);
+			     PAGING_COHERENT | PAGING_NO_HUGE);
 }

 static void gicv2_cell_exit(struct cell *cell)
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index a00997c3..db618960 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -22,6 +22,7 @@ int arch_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_HUGE;
 	int err = 0;

 	if (mem->flags & JAILHOUSE_MEM_READ)
@@ -38,13 +39,15 @@ int arch_map_memory_region(struct cell *cell,
 	if (!(mem->flags & JAILHOUSE_MEM_EXECUTE))
 		flags |= S2_PAGE_ACCESS_XN;
 	*/
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_HUGE;

 	err = iommu_map_memory_region(cell, mem);
 	if (err)
 		return err;

 	err = paging_create(&cell->arch.mm, phys_start, mem->size,
-			    mem->virt_start, access_flags, PAGING_COHERENT);
+			    mem->virt_start, access_flags, paging_flags);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);

@@ -90,7 +93,8 @@ void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
 			/* cannot fail, mapping area is preallocated */
 			paging_create(&this_cpu_data()->pg_structs, region_addr,
 				      size, TEMPORARY_MAPPING_BASE,
-				      PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+				      PAGE_DEFAULT_FLAGS,
+				      PAGING_NON_COHERENT | PAGING_NO_HUGE);

 			arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
 					  flush);
diff --git a/hypervisor/arch/arm-common/setup.c b/hypervisor/arch/arm-common/setup.c
index 2a04cdb7..26de97d9 100644
--- a/hypervisor/arch/arm-common/setup.c
+++ b/hypervisor/arch/arm-common/setup.c
@@ -30,7 +30,7 @@ int arm_init_early(void)
 			    PAGE_SIZE, 0,
 			    (PTE_FLAG_VALID | PTE_ACCESS_FLAG |
 			     S2_PTE_ACCESS_RO | S2_PTE_FLAG_NORMAL),
-			    PAGING_COHERENT);
+			    PAGING_COHERENT | PAGING_NO_HUGE);
 	if (err)
 		return err;

diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
index 91437025..16f9b5ae 100644
--- a/hypervisor/arch/arm/mmu_hyp.c
+++ b/hypervisor/arch/arm/mmu_hyp.c
@@ -81,9 +81,9 @@ static void create_id_maps(struct paging_structures *pg_structs)
 			 * This extraction should be implemented in the core.
 			 */
 		} else {
-			paging_create(pg_structs, id_maps[i].addr,
-				PAGE_SIZE, id_maps[i].addr, id_maps[i].flags,
-				PAGING_NON_COHERENT);
+			paging_create(pg_structs, id_maps[i].addr, PAGE_SIZE,
+				      id_maps[i].addr, id_maps[i].flags,
+				      PAGING_NON_COHERENT | PAGING_NO_HUGE);
 		}
 		id_maps[i].conflict = conflict;
 	}
@@ -349,10 +349,10 @@ void __attribute__((noreturn)) arch_shutdown_mmu(struct per_cpu *cpu_data)
 	 */
 	spin_lock(&map_lock);
 	paging_create(&hv_paging_structs, stack_phys, PAGE_SIZE, stack_phys,
-		      PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+		      PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	paging_create(&hv_paging_structs, trampoline_phys, PAGE_SIZE,
 		      trampoline_phys, PAGE_DEFAULT_FLAGS,
-		      PAGING_NON_COHERENT);
+		      PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	spin_unlock(&map_lock);

 	arm_dcaches_clean_by_sw();
diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index 264b3d14..57b25dbc 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -36,7 +36,7 @@ int arch_init_early(void)
 	 */
 	err = paging_create(&hv_paging_structs, trampoline_page, PAGE_SIZE,
 			    trampoline_page, PAGE_DEFAULT_FLAGS,
-			    PAGING_NON_COHERENT);
+			    PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	if (err)
 		return err;

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 513c696c..3c3e6854 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -333,14 +333,14 @@ int vcpu_vendor_cell_init(struct cell *cell)
 		 */
 		flags = PAGE_READONLY_FLAGS | PAGE_FLAG_US | PAGE_FLAG_DEVICE;
 		return paging_create(&cell->arch.svm.npt_iommu_structs,
-				     XAPIC_BASE, PAGE_SIZE, XAPIC_BASE,
-				     flags, PAGING_NON_COHERENT);
+				     XAPIC_BASE, PAGE_SIZE, XAPIC_BASE, flags,
+				     PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	} else {
 		flags = PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE;
 		return paging_create(&cell->arch.svm.npt_iommu_structs,
 				     paging_hvirt2phys(avic_page),
-				     PAGE_SIZE, XAPIC_BASE,
-				     flags, PAGING_NON_COHERENT);
+				     PAGE_SIZE, XAPIC_BASE, flags,
+				     PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	}
 }

@@ -349,6 +349,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	u64 access_flags = PAGE_FLAG_US; /* See APMv2, Section 15.25.5 */
+	u64 paging_flags = PAGING_COHERENT | PAGING_HUGE;

 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= PAGE_FLAG_PRESENT;
@@ -358,6 +359,8 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= PAGE_FLAG_NOEXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_HUGE;

 	access_flags |= amd_iommu_get_memory_region_flags(mem);

@@ -367,7 +370,7 @@ int vcpu_map_memory_region(struct cell *cell,
 	 */
 	return paging_create(&cell->arch.svm.npt_iommu_structs, phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }

 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 01c336de..676dc481 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -50,7 +50,7 @@ int vcpu_early_init(void)
 	/* Map guest parking code (shared between cells and CPUs) */
 	return paging_create(&parking_pt, paging_hvirt2phys(parking_code),
 			     PAGE_SIZE, 0, PAGE_READONLY_FLAGS | PAGE_FLAG_US,
-			     PAGING_NON_COHERENT);
+			     PAGING_NON_COHERENT | PAGING_NO_HUGE);
 }

 /* Can be overridden in vendor-specific code if needed */
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index f0a2534b..bf25d00d 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -345,7 +345,7 @@ int vcpu_vendor_cell_init(struct cell *cell)
 			     paging_hvirt2phys(apic_access_page),
 			     PAGE_SIZE, XAPIC_BASE,
 			     EPT_FLAG_READ | EPT_FLAG_WRITE | EPT_FLAG_WB_TYPE,
-			     PAGING_NON_COHERENT);
+			     PAGING_NON_COHERENT | PAGING_NO_HUGE);
 }

 int vcpu_map_memory_region(struct cell *cell,
@@ -353,6 +353,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = EPT_FLAG_WB_TYPE;
+	unsigned long paging_flags = PAGING_NON_COHERENT | PAGING_HUGE;

 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= EPT_FLAG_READ;
@@ -362,10 +363,11 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= EPT_FLAG_EXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_HUGE;

 	return paging_create(&cell->arch.vmx.ept_structs, phys_start, mem->size,
-			     mem->virt_start, access_flags,
-			     PAGING_NON_COHERENT);
+			     mem->virt_start, access_flags, paging_flags);
 }

 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index e5f9bfb0..c845fa94 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -751,6 +751,7 @@ int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
 	unsigned long access_flags = 0;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_HUGE;

 	if (!(mem->flags & JAILHOUSE_MEM_DMA))
 		return 0;
@@ -762,10 +763,12 @@ int iommu_map_memory_region(struct cell *cell,
 		access_flags |= VTD_PAGE_READ;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
 		access_flags |= VTD_PAGE_WRITE;
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_HUGE;

 	return paging_create(&cell->arch.vtd.pg_structs, mem->phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }

 int iommu_unmap_memory_region(struct cell *cell,
@@ -1034,7 +1037,7 @@ static int vtd_init(void)
 		err = paging_create(&hv_paging_structs, unit->base, unit->size,
 				    (unsigned long)reg_base,
 				    PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
-				    PAGING_NON_COHERENT);
+				    PAGING_NON_COHERENT | PAGING_HUGE);
 		if (err)
 			return err;

diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index dcf77829..bdaf8b58 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -63,6 +63,11 @@ struct page_pool {
 #define PAGING_NON_COHERENT	0
 /** Make changes visible to non-snooping readers, i.e. commit them to RAM. */
 #define PAGING_COHERENT		0x1
+
+/** Do not use huge pages for creating a mapping. */
+#define PAGING_NO_HUGE		0
+/** When possible, use huge pages for creating a mapping. */
+#define PAGING_HUGE		0x2
 /** @} */

 /** Page table reference. */
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 613df1ea..22283a85 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -116,7 +116,7 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 	paging_create(&this_cpu_data()->pg_structs,
 		      ive->shmem[0].phys_start, PAGE_SIZE,
 		      (unsigned long)state_table, PAGE_DEFAULT_FLAGS,
-		      PAGING_NON_COHERENT);
+		      PAGING_NON_COHERENT | PAGING_NO_HUGE);

 	state_table[dev_info->shmem_dev_id] = new_state;
 	memory_barrier();
diff --git a/hypervisor/mmio.c b/hypervisor/mmio.c
index 539fb110..b7915eae 100644
--- a/hypervisor/mmio.c
+++ b/hypervisor/mmio.c
@@ -329,7 +329,7 @@ static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
 	err = paging_create(&this_cpu_data()->pg_structs, page_phys, PAGE_SIZE,
 			    TEMPORARY_MAPPING_BASE,
 			    PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
-			    PAGING_NON_COHERENT);
+			    PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	if (err)
 		goto invalid_access;

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 94ca1812..c6fe1286 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -304,7 +304,9 @@ int paging_create(const struct paging_structures *pg_structs,
 			pte = paging->get_entry(pt, virt);
 			if (paging->page_size > 0 &&
 			    paging->page_size <= size &&
-			    ((phys | virt) & (paging->page_size - 1)) == 0) {
+			    ((phys | virt) & (paging->page_size - 1)) == 0 &&
+			    (paging_flags & PAGING_HUGE ||
+			     paging->page_size == PAGE_SIZE)) {
 				/*
 				 * We might be overwriting a more fine-grained
 				 * mapping, so release it first. This cannot
@@ -456,7 +458,7 @@ paging_gvirt2gphys(const struct guest_paging_structures *pg_structs,
 			return INVALID_PHYS_ADDR;
 		err = paging_create(&this_cpu_data()->pg_structs, phys,
 				    PAGE_SIZE, tmp_page, PAGE_READONLY_FLAGS,
-				    PAGING_NON_COHERENT);
+				    PAGING_NON_COHERENT | PAGING_NO_HUGE);
 		if (err)
 			return INVALID_PHYS_ADDR;

@@ -489,7 +491,7 @@ void *paging_map_device(unsigned long phys, unsigned long size)

 	if (paging_create(&hv_paging_structs, phys, size, (unsigned long)virt,
 			  PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
-			  PAGING_NON_COHERENT) != 0) {
+			  PAGING_NON_COHERENT | PAGING_HUGE) != 0) {
 		page_free(&remap_pool, virt, PAGES(size));
 		return NULL;
 	}
@@ -590,7 +592,7 @@ void *paging_get_guest_pages(const struct guest_paging_structures *pg_structs,
 		/* map guest page */
 		err = paging_create(&this_cpu_data()->pg_structs, phys,
 				    PAGE_SIZE, page_virt, flags,
-				    PAGING_NON_COHERENT);
+				    PAGING_NON_COHERENT | PAGING_NO_HUGE);
 		if (err)
 			return NULL;
 		gaddr += PAGE_SIZE;
@@ -611,7 +613,7 @@ int paging_map_all_per_cpu(unsigned int cpu, bool enable)
 			sizeof(struct per_cpu) - sizeof(struct public_per_cpu),
 			(unsigned long)cpu_data,
 			enable ? PAGE_DEFAULT_FLAGS : PAGE_NONPRESENT_FLAGS,
-			PAGING_NON_COHERENT);
+			PAGING_NON_COHERENT | PAGING_HUGE);
 }

 /**
@@ -664,10 +666,11 @@ int paging_init(void)

 	/* Replicate hypervisor mapping of Linux */
 	err = paging_create(&hv_paging_structs,
-			     paging_hvirt2phys(&hypervisor_header),
-			     system_config->hypervisor_memory.size,
-			     (unsigned long)&hypervisor_header,
-			     PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+			    paging_hvirt2phys(&hypervisor_header),
+			    system_config->hypervisor_memory.size,
+			    (unsigned long)&hypervisor_header,
+			    PAGE_DEFAULT_FLAGS,
+			    PAGING_NON_COHERENT | PAGING_HUGE);
 	if (err)
 		return err;

@@ -695,7 +698,7 @@ int paging_init(void)
 		err = paging_create(&hv_paging_structs,
 				    system_config->debug_console.address,
 				    system_config->debug_console.size, vaddr,
-				    flags, PAGING_NON_COHERENT);
+				    flags, PAGING_NON_COHERENT | PAGING_HUGE);
 		if (err)
 			return err;
 	}
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 99a2b0c3..e761415a 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -128,7 +128,8 @@ static void cpu_init(struct per_cpu *cpu_data)
 	/* set up private mapping of per-CPU data structure */
 	err = paging_create(&cpu_data->pg_structs, paging_hvirt2phys(cpu_data),
 			    sizeof(*cpu_data), LOCAL_CPU_BASE,
-			    PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+			    PAGE_DEFAULT_FLAGS,
+			    PAGING_NON_COHERENT | PAGING_HUGE);
 	if (err)
 		goto failed;

@@ -141,7 +142,7 @@ static void cpu_init(struct per_cpu *cpu_data)
 	err = paging_create(&cpu_data->pg_structs, 0,
 			    NUM_TEMPORARY_PAGES * PAGE_SIZE,
 			    TEMPORARY_MAPPING_BASE, PAGE_NONPRESENT_FLAGS,
-			    PAGING_NON_COHERENT);
+			    PAGING_NON_COHERENT | PAGING_NO_HUGE);
 	if (err)
 		goto failed;

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index b8e1f038..30ec5d06 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -113,7 +113,8 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_COMM_REGION	0x0020
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
-#define JAILHOUSE_MEM_IO_UNALIGNED	0x0100
+#define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
 #define JAILHOUSE_MEM_IO_16		(2 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7a9cdf63-c1f7-2a70-6216-7b386727543d%40web.de.
