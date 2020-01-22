Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBHCUHYQKGQEIMDVXBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED3145921
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 16:57:57 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id j193sf2269061lfj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 07:57:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579708677; cv=pass;
        d=google.com; s=arc-20160816;
        b=froluuv1yktqhIV738Ta/u3Kx0tXS+uNveQRr+NhOa+AbZqLvSayjrUQ+L9h1Ym+EH
         Hj9Q7ySS6E3bQUPfVyH9NNGFzYus47glkOAOs+IzhJpIy2/KpN1hlKbXo96wY7HV6kqt
         LOnRkXjoQZUfkzwXktvlqqlnR0IoVWG5m6Y6FbnCsi+OWalQDILNrLI8Ojcb3+MV+jz9
         3fLpCzn5GSZPmrSpiEMiDWikpe46Zbdr/ePMBzNG/EZxsp2wHP8UjtIIZgrjZpYTxhNN
         ZRfCJss3j8vVb8JHTZlI/0MuQ65RUO72gl733nFoqsbqc0JAqvAKsbthMNzLDVvowBhg
         2txA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=sKX73GQzDVvbVmbB+mJbs358E7p200mLmzv2y3BhgxE=;
        b=zY18CA35CBBQUt64UZ9UwV6cllU/Y/dM3wpT3EhIMqsNzIkuJvbcCzjgqx4F4IcC55
         Mxz6UVPmUq+P+ikHcRmRRps/WQviRWHXzXDj9WBfi+KDhWD+ZAYzpxtKg9VUX9UcTPAI
         mS3kgx9KOTOKwxkRbZaJQVSP7PqFpVy6TZ0li2iewM9DwpBW3jghXukDfqZHMeTd5yN0
         nedQcx8op/PZHPRQkVv7y5jhh4XUFHsgBIUF/umjkh9UcIRi5jqv5Arg/WQOjw77eTWP
         3HwqGIfvjihMSIIYDKrznGct0bdJgmpGg2/+5MQQNkCrMOUKZyqjuAPy3Bzej/ec8ZBb
         mUJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qXISHHn4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sKX73GQzDVvbVmbB+mJbs358E7p200mLmzv2y3BhgxE=;
        b=B2YpXZ2KX8WHk9mzB8V9/xbkCuwYnBd6YWTW315mx6ruP3x/UVZugjLO5jSpBUbYkX
         IjlEYnw3ziqRnd846lvg4P6n2X3+YV3sK1aOP4zXjp6qcuN6ECFFxkxnWc6M05eL4G7e
         kvvK9lozC0oAyoH3XDxrPQB2lKLRioRIjGL0ANJFu+qmZYcPH8HMGMwsvnC+w+IYwZ2T
         sJoSQS3oISulrcBf5H3c62tzwMEyYlRsI7/81T0EuaUD9XJya5nlyhdIJioLPKzeieR7
         v9aNui2vzNRZLd7PPCGkL5ezgyQFgOp3qH0B0VelklRw/DY9nqMJkTDYlKqmIt3q/ugn
         5IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sKX73GQzDVvbVmbB+mJbs358E7p200mLmzv2y3BhgxE=;
        b=JsXPDV5fQrNrBOiX9vke8q0sfMJBXX4HwElhSm0ROQKT5Hpd77l0wHYsxTu3dC7qWx
         TrtbASMUMt0dvzCRxy7HT5Uj61D5kQk2lD4RxvqEf/TrqEy8KcRzNCISBD0+EZvaMpOH
         puGHjlb6+gzMyvnDaPUhvIn0EciXE5XwRCMC0pPiRLycq0BzlzZQLcoTCbrKQeAero8k
         LgGpSdtkphu4kmuDftCwngQxepoMau6/373LQnohSg2Yy6+do5KUm6cffiU4Yh1qkNOG
         ozIsSFkNsF8RChQtMH7PIMJ6vht3Ns72dgCh031XFRzKQPzpH2ZDs4d3gtdyVQx5foub
         3ajA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVZUFQ/1SsWU6qLxyhLIURC8XgyCzq4CfdV0djkvSvdqUvUXpGQ
	fyVk4NgktF3DX2BxPBGZ9Mg=
X-Google-Smtp-Source: APXvYqxGwNmVHFZkCvHYiMI6Ym4ICX4/rkI/AW8dFSbUAoivMdelgF8IpqvSYMozPGgXvAw9+SUTDg==
X-Received: by 2002:a2e:b044:: with SMTP id d4mr18619983ljl.158.1579708676963;
        Wed, 22 Jan 2020 07:57:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1051:: with SMTP id x17ls5546999ljm.8.gmail; Wed,
 22 Jan 2020 07:57:55 -0800 (PST)
X-Received: by 2002:a2e:995a:: with SMTP id r26mr19939061ljj.78.1579708675813;
        Wed, 22 Jan 2020 07:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579708675; cv=none;
        d=google.com; s=arc-20160816;
        b=JtLtkgJiXQxb7NjwdX6RoJoMj0JiF2P5tflszpP7jr9UhKvACb9CI//qBSUY7cdIec
         VwB/vTrMvmhHFm5UT1GqySFv5M/Zyxf7cpVb9GkVnPlRGacsYoV81iAvKTcG6DfmgnM2
         t4U8G9W1F1F52EjjKpSQKTtZlgdGYPFVsaBIiw8PK3kbxdRTjeHb+LpKNvUGpPXtgSzC
         mosciWuch6s96pNqyzoKU79lL87vt0JVF5UAlWiCOLDgRfAAsMzbybeS1zpXznchNwFC
         XK6mP3/w0aOAYaRBoK2ic62ne60ujfSAlt7fAztZTiHRTNG9p2Zn4nCkF7lGpStWSVHD
         26xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=I9py8y5aHpOy9rmiFIOqhynTOhthBkvzvcS0kT7CjVw=;
        b=XUZ6ahAfxnccwD5/4LaRu7HV+z5a8Jx1e/U2aKfxb81CXZv+IfY6uyWdKcjtHEbdOx
         BpChUdPcwco9tSIGUEEAX4xh4JuggiId1jGRcSSpGykZ8mlkb9dnC9pr25F+I1JNb+mA
         gAmUbjYNmxHE/7wL6ySOBzIaog+mc/dfH+/XEHv8igJbsmKoyanydP+jppeaj0wjZGZn
         ZkgWF2W3XZ6hOEv5Rd0XU/RuVuJPb2MzKot9dFf51RLQMswQU22NXWwk7d6dSL/IB5dY
         MB9CXsJfAWUe3pH3tBb06zQRrRDTkHAmhnFtv1yXPJQ4BOHpD9omU50aVA7j1QEmOtwf
         MvGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qXISHHn4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id a4si978420lfg.1.2020.01.22.07.57.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 07:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.40.128.162]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M2us2-1jmomi3eY2-00sexi; Wed, 22
 Jan 2020 16:57:55 +0100
Subject: [PATCH v2 2/2] core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory
 region flag
From: Jan Kiszka <jan.kiszka@web.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <9ca086db-d475-938c-f362-62d325eadec7@siemens.com>
Message-ID: <7eb9b15e-615c-232a-b051-81c7cf9efca0@web.de>
Date: Wed, 22 Jan 2020 16:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9ca086db-d475-938c-f362-62d325eadec7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:KtoYQP8QNbem/vwKu8oLBZXqvWc1Vm+wk2DwTbRZW8AdzPpuoFa
 YVcdPgeSyiSZWSZsIa1PVCa5uT25CKvlFbpv7RItTfXI0Wd0VOFSODKmLGFeSj5IOyl1Fsl
 qYKlrgIv3TXo8Y8P6u8gVDdVzvTjLL3WHGx2S74cFIzKEhoyY5gdT1YNSBwmo7g59RU+Pxc
 ry8FkwrgeDQH2cgLOXKuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YhRiJYSJneQ=:Dd0+xj0WTVxoabSlC2FbHm
 p4TCYe+8uaa0gBsrimgexLvPdu85ssv+WTtsP2GfjnmrEXNgtaoCOahy+SzPSWDPg3CjAxfbh
 WR48lsgDh2XV+Crs1HvMIw0fGS0aI/sMGeulyeTkcPXFcyFoaA8eJjmSfx7B2EVRhp8x6lRcP
 FPJzgaHTgtLvM7pj28vHNFErw48gqtZKM2rrLhMZcodxIcyBhVhJcvwp2A99MMEHTjekvM1FF
 s2emDjBaC/lv15Mn9EBcaOlxiubayZVvxUoI2XXIYXxlKno/t2HHuhmTuOK8VyZgo626z/4Z1
 7Vsydyk7cj6twx/CeIAVtGOOf0xaKF+KJUeYn7VmIDu1Mt2y667FT4XEWjF2SVh8k+QzdBCQl
 R1lwq0j/kORNab7K96lkKfYRP0cAG1ahmQMHGxNAXRpLPZPYvV07uY5beBr7k8PUHEsodJjsa
 QvOr35NUamfG2jqrwJJqb1FjWRy58TeeKy+cbXSAvmpwu7mJdZlPpv4JSZQYgpFEXWEE0CqdO
 i/OrqpA6uLK4xLoBS8W6tkYU4h7+bxZ+9KI9zXJc2I2WAqGVjmd+qdGWyU2kzc9PcSqQjHloe
 w2+6bpxJWu/bppVoIqTfEUJx1AwJqLgmFjG8TQ/aT7LRF7NN31JXiWUMeEKeAa0WUbyLX1FiD
 s2W8rsuxRC04jRNgLS8rfcmDFu9zuyf63Lr7auRY052rdD+oBten4q/ce8N/n/9FlwB4NawED
 FzHpHLWzhbKjc6qXGxtda7W/hgUfWxu8gbp9sXGBSS3ojQn2d2GudZpbJWcLfdWcDGZwxQ0Qa
 KB6U/EmoTrcZuwF9z1eG6eNcP5F6/3YGDUAshfVGvvMkE3bukC1dfzyEKGXCSGjIe5YYe6gGw
 OjSbHFQL/Twvyqahzy8KjzhXmozW2BIruxGwLn29liKyp4/b8VPmSJOiwrC0J+v6JPVmWRrNT
 Qg1KxW3N1JWs3Lh0/aLxb9G0zmxBsB8D1KiS05hJ/kef//MDcwCA4uTExjV8uIcWBltHc/z8h
 rgftVV6bpAf33tHw2XucI/Dv3Z2UtVdPGdZ0AZYJV3CGJ8uA7bcM7W4e4EOFTTUi39G/O/4aX
 Hxb1JiC3GlKIPoNtnHXE1ejeWrhBsyeZSfOK0+MBHWBetgD2gcPSuh+FsoyCwGshnnxMwrDRW
 4c7ymUp2vQVuy4Th8G79xBPpOi1OQVPIJ/YF6gOyRDvgO79W83JaHwKKFeUfFpOi0TjAc=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qXISHHn4;       spf=pass
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - fix untested (well...) hugepage disabling logic
 - tagged some hypervisor mappings with PAGING_ALLOW_HUGE

 hypervisor/arch/arm-common/mmu_cell.c |  5 ++++-
 hypervisor/arch/x86/svm.c             |  5 ++++-
 hypervisor/arch/x86/vmx.c             |  6 ++++--
 hypervisor/arch/x86/vtd.c             |  5 ++++-
 hypervisor/include/jailhouse/paging.h |  5 +++++
 hypervisor/paging.c                   | 11 +++++++----
 hypervisor/setup.c                    |  5 +++--
 include/jailhouse/cell-config.h       |  3 ++-
 8 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index a00997c3..56db2e8c 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -22,6 +22,7 @@ int arch_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;
 	int err = 0;

 	if (mem->flags & JAILHOUSE_MEM_READ)
@@ -38,13 +39,15 @@ int arch_map_memory_region(struct cell *cell,
 	if (!(mem->flags & JAILHOUSE_MEM_EXECUTE))
 		flags |= S2_PAGE_ACCESS_XN;
 	*/
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;

 	err = iommu_map_memory_region(cell, mem);
 	if (err)
 		return err;

 	err = paging_create(&cell->arch.mm, phys_start, mem->size,
-			    mem->virt_start, access_flags, PAGING_COHERENT);
+			    mem->virt_start, access_flags, paging_flags);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 513c696c..d85d2b50 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -349,6 +349,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	u64 access_flags = PAGE_FLAG_US; /* See APMv2, Section 15.25.5 */
+	u64 paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;

 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= PAGE_FLAG_PRESENT;
@@ -358,6 +359,8 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= PAGE_FLAG_NOEXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;

 	access_flags |= amd_iommu_get_memory_region_flags(mem);

@@ -367,7 +370,7 @@ int vcpu_map_memory_region(struct cell *cell,
 	 */
 	return paging_create(&cell->arch.svm.npt_iommu_structs, phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }

 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index f0a2534b..1cbc6417 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -353,6 +353,7 @@ int vcpu_map_memory_region(struct cell *cell,
 {
 	u64 phys_start = mem->phys_start;
 	unsigned long access_flags = EPT_FLAG_WB_TYPE;
+	unsigned long paging_flags = PAGING_NON_COHERENT | PAGING_ALLOW_HUGE;

 	if (mem->flags & JAILHOUSE_MEM_READ)
 		access_flags |= EPT_FLAG_READ;
@@ -362,10 +363,11 @@ int vcpu_map_memory_region(struct cell *cell,
 		access_flags |= EPT_FLAG_EXECUTE;
 	if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 		phys_start = paging_hvirt2phys(&cell->comm_page);
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;

 	return paging_create(&cell->arch.vmx.ept_structs, phys_start, mem->size,
-			     mem->virt_start, access_flags,
-			     PAGING_NON_COHERENT);
+			     mem->virt_start, access_flags, paging_flags);
 }

 int vcpu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index e5f9bfb0..51649662 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -751,6 +751,7 @@ int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem)
 {
 	unsigned long access_flags = 0;
+	unsigned long paging_flags = PAGING_COHERENT | PAGING_ALLOW_HUGE;

 	if (!(mem->flags & JAILHOUSE_MEM_DMA))
 		return 0;
@@ -762,10 +763,12 @@ int iommu_map_memory_region(struct cell *cell,
 		access_flags |= VTD_PAGE_READ;
 	if (mem->flags & JAILHOUSE_MEM_WRITE)
 		access_flags |= VTD_PAGE_WRITE;
+	if (mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES)
+		paging_flags &= ~PAGING_ALLOW_HUGE;

 	return paging_create(&cell->arch.vtd.pg_structs, mem->phys_start,
 			     mem->size, mem->virt_start, access_flags,
-			     PAGING_COHERENT);
+			     paging_flags);
 }

 int iommu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index dcf77829..96e3fdbc 100644
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
+#define PAGING_ALLOW_HUGE	0x2
 /** @} */

 /** Page table reference. */
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 94ca1812..99abaee7 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -304,7 +304,9 @@ int paging_create(const struct paging_structures *pg_structs,
 			pte = paging->get_entry(pt, virt);
 			if (paging->page_size > 0 &&
 			    paging->page_size <= size &&
-			    ((phys | virt) & (paging->page_size - 1)) == 0) {
+			    ((phys | virt) & (paging->page_size - 1)) == 0 &&
+			    (paging_flags & PAGING_ALLOW_HUGE ||
+			     paging->page_size == PAGE_SIZE)) {
 				/*
 				 * We might be overwriting a more fine-grained
 				 * mapping, so release it first. This cannot
@@ -489,7 +491,7 @@ void *paging_map_device(unsigned long phys, unsigned long size)

 	if (paging_create(&hv_paging_structs, phys, size, (unsigned long)virt,
 			  PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
-			  PAGING_NON_COHERENT) != 0) {
+			  PAGING_NON_COHERENT | PAGING_ALLOW_HUGE) != 0) {
 		page_free(&remap_pool, virt, PAGES(size));
 		return NULL;
 	}
@@ -611,7 +613,7 @@ int paging_map_all_per_cpu(unsigned int cpu, bool enable)
 			sizeof(struct per_cpu) - sizeof(struct public_per_cpu),
 			(unsigned long)cpu_data,
 			enable ? PAGE_DEFAULT_FLAGS : PAGE_NONPRESENT_FLAGS,
-			PAGING_NON_COHERENT);
+			PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
 }

 /**
@@ -667,7 +669,8 @@ int paging_init(void)
 			     paging_hvirt2phys(&hypervisor_header),
 			     system_config->hypervisor_memory.size,
 			     (unsigned long)&hypervisor_header,
-			     PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+			     PAGE_DEFAULT_FLAGS,
+			     PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
 	if (err)
 		return err;

diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 99a2b0c3..a49d857e 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -128,7 +128,8 @@ static void cpu_init(struct per_cpu *cpu_data)
 	/* set up private mapping of per-CPU data structure */
 	err = paging_create(&cpu_data->pg_structs, paging_hvirt2phys(cpu_data),
 			    sizeof(*cpu_data), LOCAL_CPU_BASE,
-			    PAGE_DEFAULT_FLAGS, PAGING_NON_COHERENT);
+			    PAGE_DEFAULT_FLAGS,
+			    PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
 	if (err)
 		goto failed;

@@ -141,7 +142,7 @@ static void cpu_init(struct per_cpu *cpu_data)
 	err = paging_create(&cpu_data->pg_structs, 0,
 			    NUM_TEMPORARY_PAGES * PAGE_SIZE,
 			    TEMPORARY_MAPPING_BASE, PAGE_NONPRESENT_FLAGS,
-			    PAGING_NON_COHERENT);
+			    PAGING_NON_COHERENT | PAGING_ALLOW_HUGE);
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7eb9b15e-615c-232a-b051-81c7cf9efca0%40web.de.
