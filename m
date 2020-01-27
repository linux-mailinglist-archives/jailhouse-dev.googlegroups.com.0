Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPOKXPYQKGQEVZJA2GY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id A210214A51C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:27:26 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id d14sf2542245ljg.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:27:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580131646; cv=pass;
        d=google.com; s=arc-20160816;
        b=071aAU67PIZk5EkZduNR7DZNBy1TVinY4WLDbzXJbHRh9OGAKpHd/HT0o3cQztJneF
         M5OsSCH4clP2ixj4L6ePrG3ELgw1d47OHIH+t77aj/7/7kb5jj/qZW82kI0fpGduSqxZ
         NY+RKvJWakPlqvlrOF1ZEZej8LJb6B/yVSl63KFA4v4QFJ+2pmKNxxdHW+vFXt3piEw2
         Y4A33GjWRdNjAZjNwurcswaPOshMcSry5DL8Yhsl9MjVwDmYEJaH0rAMKk7jJjRReike
         cMXKKgST+QM6bHJGJH/zPer83CGAyob/SNx+P4SRZLr0sJK9r+wef4+GJq9ZLX6ehsvF
         88PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=9m6wJYlc317mWtS/ApRp1npNHf6ig2Fprnqngoz393M=;
        b=WvQwcpaYHFZd1orsgZ1Bku9s6JlX1u6BhharDA1Lu1rHT8gK8UuTa2lqb0L5FjOsnE
         ZaCTlBLhxWFrBmPaXDLxqByQLDjIQ5f/T7yE46jz1bGh3HVLZch1SwJJO6tox+/PfzfL
         9lc6zXtsNUOgTzeI9v5q5mOMJIM8LaBwHNDmQMjOzMfw37sAkrclMFgf4T0Ugkb0guV0
         wy/64uf3/K/VYrfxNOjVBmO8c2kPeKVspYvtIgArIPojDADXRTiz+W7mtNa+Os6sGjwo
         YUwEj2l76cyZvDrag7TLNKKqAkKiWH6rlwsTPUSFamvkaXbfCx6Xc0w0l0HAq2ou7O/t
         6iFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=eQiQV2bw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9m6wJYlc317mWtS/ApRp1npNHf6ig2Fprnqngoz393M=;
        b=dpccQ3Tx8NhDhuDihTiYsPYRNpRbXNhOkeE63yn9YSHylYx/AS6WzdqKVdeDcrpJxv
         hGLOWhNNjsbnMORyPnXqmBpEsTVG12LWomTfXJbSSBPc0KS/EvcQBQRGLKw7A9Brq1dU
         ldThhnm3rOwypYVqtEVHEGyfn8oKGADIwMgYu5DYvCxYSnMw/YXkGcKF+m+zzUfWtrzH
         zFALNqTU4vCYQvYwvkDZbLHqeqQny4TLwStTdZYdY4fRaJpFmgt/1dAZx0zpFenjEmiP
         /wSadYe+e2bCLsP5WJoPYoG20Olp7zEQpJHGvSii9V8lFO9lpbwHX5MJjWGhbXtq82JI
         3/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9m6wJYlc317mWtS/ApRp1npNHf6ig2Fprnqngoz393M=;
        b=YwQ8d88TfRtUXuNww+L8fK2Hnki+JIhMQle8jR7i2hIzEfpLmRtRZYG+mGiuJwqa+3
         O21cQv7RA2ezldVOxRMJJ7ysW1CvwgsCZsXqdDhWkhHXUPcNKrzsa1s10KZc8SezUVC5
         zBTmI05E4DoZ1za7W4uIz7MjkcO0OcxHwUM9bxFaDXXnak4q6XHmxe4AtwLcxa57MtWj
         BPsYyHfcMqd5HkiLdExW56iE3M6ily0oSzPJzCMssC2vTpcYD6hGQheZ2asPCw3fbEr0
         o8PXUIoxTeWUKma1zXBKi/Ab9sXCZu/sfZP5d0qUrk1p2uyzcsUi26nQtPUeYLr0YGbR
         FmNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUM/vb6VKgG8b4CL2BOa6lzIPdKmLLS2fQvCSQvaRc6xhdnH4Nd
	+tBlyJpQseHRJvyiuK2PzS8=
X-Google-Smtp-Source: APXvYqwSRyx90ZImlU5ZWMBwWYYj+BqFd2yGNmBrhnTIZlK/w616Gf/Uvr6aptXzbTGEh9RgmcLxOQ==
X-Received: by 2002:a2e:9090:: with SMTP id l16mr10571428ljg.281.1580131645855;
        Mon, 27 Jan 2020 05:27:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1b4:: with SMTP id c20ls1006545ljn.5.gmail; Mon, 27
 Jan 2020 05:27:25 -0800 (PST)
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr10489928ljl.134.1580131645013;
        Mon, 27 Jan 2020 05:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580131645; cv=none;
        d=google.com; s=arc-20160816;
        b=SvQJPA5Xpr2FMuq344ZEPUpVlRKH7FhMVTZW5N7EdE0UyMHK12YupAbgpNbsk15acq
         dqvk4pFXvo32oaj7U/WnR0KAbalZleUWgFmB2/PuwiKK5egaRR4hZKcSWJwg9749lJy1
         7z/p6CwlOGiyJaYRH31ae5r+5RYHHBxLxFha0OFT77mXawlnpb2RNhmjtlc7Fyzy5fxo
         tq2jpd1lsu09Q21nF8h/Z6/mw5fonFFXEOZVCBVHc8QIHeRV8tvHlKYrEcCd+ApqjBy6
         ZsUKwqA9rCARfrobO51wSIJ3pfto6V8w4st0o/fFWmZAhzBUQNqYMyKTfoJzZU1Iye2y
         BAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=pXVMXLldPzn6CRi9PkpldqBDIPoPzcman5JW8Q0l42E=;
        b=GxMhKSVPkwNkbR6zpCOv/kloA+yjA3T8e22uIGsyIRADdQ3D84klJtx1HIO++bSr9T
         ACAokj2XdRWSiVLkDWwDffwnJ+IDfsF+GzJZMb7rAPcL5XIC+VJ0nUf+PN+DjdvWncsE
         cGQ8VouWw3IY9e70at3lR+0TCNv27hkZTGVU3vU4iEtW1iWSZyhv7g1rRpCvjZCaOGTz
         Oyj6tESJM5mPliAn09iPoHA8NZY4iy2D5KwTYeR1yV4As9j+5t3w42eZxzPNE8Hswzv7
         ehKhR7adRXOGRaQsmYEL1oZzPVSCIz5PVs7SWt+xSGN9rFFjZnrCm2YowO9H2ISZuwbP
         QHkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=eQiQV2bw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id p12si245005lji.1.2020.01.27.05.27.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKrLo-1iw4QG0Hui-0003DC; Mon, 27
 Jan 2020 14:27:24 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH v3] core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region
 flag
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <dfa7af35-5f90-1f41-74be-9797f33ce8aa@web.de>
Date: Mon, 27 Jan 2020 14:27:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:BqZ54trazWwf9y+zmuwBg2Gg5Xq//b9y3iZQvfLQCxawvSMAOq4
 rbEg9Iflyb0url8BSXozYDRxQSwD5H8J0ugDwH7CLnD8HA6A5UYtWeRJG8qqewGcIjW69fB
 FGbk444JcqOAINj7G+8SN2IVI4Mlr0KCWoAFkeXAaBMgKGtjYQHPYKh5RBmFktp6gT9MN7T
 RPuvwR2rHZ0n7orI2qnQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:alirEDyvQ98=:xbwkJtxxRJDD99kddfaxL4
 IoCoWiRSdA+V+B1LYWqHl8FgC5RSBvj69jbA/4by49C+kA8v1g1aV/jpkkqjh8ntdP7MMbUuL
 EW0yNscAydbrdWJQQsPWV+ex4xdp7qz6H/rEh4n8dmQ2LRsYUQ3PR8e4/cpIF5rx2T6u/5oyr
 uq+NLo1W1ufHp+OF0Vp4LASrFaiy20WP1H6oGfULJj1LEIKCEytrk4BqSaq5Is5B5U+OvreO5
 hAAYRWIf09fY/c7g686XA4XFkNTvN7BBv6ta5QV0fmAMV3V4w4Dw9K6HcEtDDgVhcas13Jrba
 aiauzl5GXMU0X05SZ9bzo3hM633GAyPxzD9bW+VSrpxYkss6fcC8JE3g4mwIDMzvxcFGbv6Bs
 9IkzlXjrr1Uud9T0LORADsdilQAajD/P/1ipD48CLQyLzfSOpja9OHDRlnYcyIFdjOjjzc/h/
 bcrJ+zAaFd50AlOmjhT7AT67CCvSqzzbXLHPFO3GaEHrHQKNV9kg5U1poFa6tum8GvEzmyqPz
 G/Z2GM7Ue0LDx3Dma1PtKyu1K811DVMU4aCjEzc7EJdbHeybOpdVFrglo7beGzs80Tl2uVND9
 vS3gle0Me6cc2Km6xnbCDg7JIadz03HnsjyoKmt3Zt16Ypq8iH1uvbxJ9dOJCNcg4n+fD039J
 s3Pqc6GYaRpJ6cX15C/FeDU5EnNMzjFHcMhs+wQUrFMU9VeKlJQzuajZZogiRFXZZJvHDH6Ty
 kuf7CeNbcNqyYQ3IzL/BryZw4U8Pua8g+xR2lUJswaGVYI9VwdqdyH7M9HCjWDDcyntyOlsXz
 jb5OkRtTx2J30pntSOFyHCPHJl+KT5vGuTTw6zGWevA18MlY3Uj5TXvyR/3HyVW/Wzm7ImS0Z
 swwIJCQoMJMJuvnhHJlM7aiQUSybZH191KYuBwHc2i3kdHk5XyYPv6FV3GVjkKqDb6IxZIIDI
 W5u7Tk3EoAXqhu5kJ+Cw4L97JqiLIQ7DtObdvges/39V2YAsw/oKMOT7FF5eP/vRR90HEpamf
 Aw0SwWVh96jM7o/+w0ql3F8jjdINFJI2dGiGiKYSkUlr5fBJyBgUQjgv5OIVd+kkF6giJ9l8u
 5DZ4hIFVK4qkiw8W82UPfDaZAZySd5Y56zdtrHd3gKTMlbGAqVVAFRrYEwVlzS3I3AwWrxQAY
 p36eXTkb4k//ID16MEjGqif8UqjDWxAPehUc2krk/I2II53AF71Bsn4bmdrc91KcRTY+udtGL
 94b7XVZzNPJZ2pyVy
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=eQiQV2bw;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

Changes in v3:
 - rename PAGING_ALLOW_HUGE to PAGING_HUGE
 - consistently add PAGING_HUGE/NO_HUGE to paging_create callers

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
index 91437025..a3dd17e3 100644
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
+				      d_maps[i].addr, id_maps[i].flags,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dfa7af35-5f90-1f41-74be-9797f33ce8aa%40web.de.
