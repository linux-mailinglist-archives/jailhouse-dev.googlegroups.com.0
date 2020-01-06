Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBCXZZPYAKGQEDIPJW5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAC130F57
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 10:23:23 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id cy24sf7524391edb.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 01:23:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578302603; cv=pass;
        d=google.com; s=arc-20160816;
        b=S74iaVooJMhG4/7p8HtGjwh/REMTkeBbJcG3bdthdP3qDop2knNvK9wP2vpV/zfHQD
         Vu68xgtQ47oGIDlzyVl4DITEQXcu1kNsRuGH6hcoSTlQfc/t1Pa4UtSn5kVSehyhHh+O
         3HTH14m+WfLJ7F21IxJ5NYlJpd0X0Uwp69Nx9i26tkHFFpgtVlKOntiIXMf9WGbKelcD
         658ZTxxgnLGnsvhJzzbQK7iOZHKaRLJDaLuzsD54X737YLP0bGFd/2Q9wU+Ay1zPHNAp
         DptYgVo4yj/5UCrNDDBeNUvFxcKokyrJpou7jMNInBBnbrIPXUvGs4hejXEVuoI9Gcs5
         ZBTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=LSjf5LdLgjOkESVnUbpak8swehrSC+NSpo1N5M8LTvI=;
        b=XhkxwGOLfPiKcTEJQ9p00LZRkEwkShFzgFZr2dREXjASW3ZrPK2HSM9i2bvt0BLMbi
         6snRVwz4j1Y6P9dZUIQcUlmolhw6nr+UGSS4JK0fs2UIi7//3bZV54siH0XsqmNmBrpC
         13hAnVux7wN9bgOAgszL54o/4vT88bB0rhTlaOaNoUIP30g3AsNQzrAeE0m05TeAJQ7c
         uTJjM2MjGMhJbTO1XiqkDBSD9dE+6q/60YXe1+9D0r5keVP4rjVb0EB/tEmrwrMa2bj4
         +O3xnSuPDh5P97WTuVlj9EpJQaOhRXq5/k2sZUCH9w4M+aNTxRB81oQ1PMnmp8wRWaCG
         9dLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=OWACJ68a;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LSjf5LdLgjOkESVnUbpak8swehrSC+NSpo1N5M8LTvI=;
        b=ApAQeFxPNWwLxeTLoNaaMCzOiyLW1DWxJ4YPQ3oJsUKLaOeWNb+lJodOfubX2qpin1
         nAQgirs5xxQU+YJzo/hXLHOeUi5BFQJ9UUZs3eQrSffU+iaffdTG5zRSdkDyoTq4a+lC
         3mKqJPUOidGNKAIktmgMz/D5bcfcgwsycmgj6scNvamr3wYXxYLOb+hRhxm0jxHR6AVP
         R0X/wzZyRFwkTTnvDu9dnpawB7BZuq2cr2QRJsgyiyztPgjlzHOSmEez9AOFluCD6sE4
         6uOQVTtkvLyJI2Qy02uMLbctqA0SkKJeSZ0Xsc639aY92gQ20NYu9F4/kGsePDKUWE6F
         4RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LSjf5LdLgjOkESVnUbpak8swehrSC+NSpo1N5M8LTvI=;
        b=SRsxTcA5NNCir2b8V0+FkKc6tGxBLjtTWFolKuVnxQHcbgE4YEDCuCW5UT5pE+o2Ea
         iTU3Y0Cx2p/DWhUq5IfGCtA9b0iT7pkFXhx4KyrduPK4RbyxK52wcOmzHreUdCzN4Ax/
         IjEmpLU9ASlyxklZo844zRG6sM0Qn6bg/NiD2b18kitJwH2CJ4BN2k8PCYvWOKQSbADF
         6yVkiaG8n1ztTmoVpetSJufDQ8wjTHZle1nHXVur7oLKPCPtA1r+bFL5AYtywnRXmRAG
         0ex3DP2M+PgGLaW+3Tztz1dwp3gwDyChgPnB5/iBiIsVfhUIBepXhyBV3M4osGT19F5y
         +pVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnHQUJPROgGbmFcN4ju4PqaMxFMgirtnIDhBhNlqMFlWkhXr/P
	7OArJqcLo1l+glrYFZs+q9U=
X-Google-Smtp-Source: APXvYqwPIRd+13K2UUpobnLJL8Cp31WlL4t+ck7VoJvz9VW6RSjEqotEO8aewxOTZ4rrpgNg/NtZ3A==
X-Received: by 2002:aa7:ce87:: with SMTP id y7mr106276508edv.82.1578302602907;
        Mon, 06 Jan 2020 01:23:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6a19:: with SMTP id o25ls9519041ejr.14.gmail; Mon,
 06 Jan 2020 01:23:22 -0800 (PST)
X-Received: by 2002:a17:906:19d0:: with SMTP id h16mr100093730ejd.70.1578302602260;
        Mon, 06 Jan 2020 01:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578302602; cv=none;
        d=google.com; s=arc-20160816;
        b=EDNMTBj1vCI75jVZRMVOR9laICDRvQkkDQlInUKTMMs1J6S6F9bBEoBtMhHEWQoCRC
         sa0SblQUdtWET1Etb2HSCujTCvX+6I6g+rkio4A7AlPAwoT5ZiqpoS1q65VFVDyMUsH8
         864MwbCzuNVjEW43OY/pk9r9UKdHBpshdPO+uc/k2OjoP1Fcb7HZzLzzUJxqk2QbzIJn
         xJ/zQ/2Q2SsrcgMd+J0womip0hWPhr3nRiTp/7Sroo4hWLxuflB6YCtU4ED+XdVTU/GT
         CzLmwBBvLlntgMWXVBYI3s8Qx47/4uCjBWubF6F1T5Dpm69ts82U6pgjklt/t/Qi6w0i
         E/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=gqHYwfBPXhPphttHu5FsnpfdnOHWcVY8deoQju+93PM=;
        b=yIxSSLzL2uc0QzHFf7YV5DZwPMXYMErxd1g34sGY5Mcj4/vPfieWZBS7pdoqTRhuZ2
         hKkEg0NUPpNW4VxdxQYCAkFDqyCE8U+POIZQ3mt5/Yv6+kPTE8ExZHBidD1/s2YdUd8j
         ERXLaMagnAoFhcyssQgBtLXcpD8a5tVHv/KRWjyCG7ByiSFp+a5g60jX4u0wANLXkB5t
         7wYo50ZAUbXgJbb361WBgVGogmep5W129cDBMMDQmStY8H/CQEBNIER6wNTopLx1aBJJ
         syPknJ2zEvlTNk9NMg6foFQRhL5Bm6dKL1JV/vLEmWgNRj8sx48EtY7TuqhkNA2nHDm1
         GP+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=OWACJ68a;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id n21si2514402eja.0.2020.01.06.01.23.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 01:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8iPI-1j0Rpq3NSW-00CEbC for
 <jailhouse-dev@googlegroups.com>; Mon, 06 Jan 2020 10:23:18 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] core: Use PAGE_OFFS_MASK consistently
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <da1baca9-d1f2-946a-f7e0-064a74398b6b@web.de>
Date: Mon, 6 Jan 2020 10:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:OTWuuL9X2AkeneINu4mpmMh61a6namHImnJmvZBum3HlwzdRlp8
 FSMyvef3ZlZgYTgHwcNzB6UD/qwU78/0JZ5mMEminTeRyJUrU9XGj4sOe4RvBSvwgIjP9NH
 ZDO8ECywDcY6LYsooQmwAN5LPc7cxrEaJ6+ojSGhcmt49PYybtzkO7n7AmQw0ey34yujJlp
 wreUMpM+fLleT0kpumhlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pJ5mXpGg/SI=:KcIlY2XPAIlvMzCY8TOcRJ
 IrTRxJIYsjV0w3VByIRz47WcCrofJOVSzcSsRJdqcHxgVOaixPzOGxPbFHYjjXyi7AUmJVYua
 J3g5mKREWyWREcNK40Uyzl4RXK+GAHOEM+j/rFfNFfSA/+nOt+IyKU7I6EXuQcLXIgdImyLHN
 WAz5mXer1P9YxWIrQ+cnMraqpPYg2LazU0DaK6gjRM+dhZRgnu0Q5O6U5/H3/yMLJI8scfpvD
 B3rBu4XyHnnlIRbsU8CkL9mJYKiYEkL75otKs3+CF4CsTsZyzC9+STUAijrtwaKOdEV7B82PB
 ex74KIuaZRkGx9BAiRXSQWfxja0JxGcQJ6p7UmETyguxHRVDVw+3CgZHTffXULE6pGLW32bqK
 6C/Qxfw6LBbL53k/P2rp0eiNM+FtgIFNFPXQp+uH6wmwyIH+vgwHMsJnPihO1gT6hJb4sEmOd
 vn/FBU9Gf9IqYoyDoL+XH0noAmoIQo2L/pFY+sfCuHHfMDu9g9pR3D0RxOUUgoqaZXQh5S8QM
 7yg4fJ9LHFuy3bNUrC0m6H7JRwY83cS7+G/rEmn7Qv4Zb6SyYQ35bf6HLXFEikJNT7wGOjEMr
 AnoIDXWhd5d3P/smuggCXt9mDoLEp7EW8R6L01jRe6XLWzneFL34tlkKXtHsX4KUd1wcTQZud
 Z6Qx6Zi5XQWv6GiVKyPw2VokmnS/ua+mnNz8SX6KxrkymWXRaNkmV6eXktjhO79viPIGMUOXY
 YKJ4aAwfEAqAhLl+adWpGz+FacQXru1FZMLkMdo5fcR5r+89qiIk2m2WziWyJGxfH6+Jf0875
 AWbxIZDik6tvs+JoJ849H4qMbgQQWoPwbcL1W3Rnu6Wmrm/9OJrZvsbV/9pU5WcDOF16cuZx1
 jICC/r12QzQpEPRukg8yIA9eWqBLIRTc6lqLaLsI/mRMkdjHb0pw/jrib2UjETD40LOjh3mj7
 siPO0ll4C/X/28BNSftYGO0tJU8qsQAyLje7djxB+rwslrFDZFqFRfbcaAsLB48WkKZaoyueu
 Ou+qbrC8+vDJtA0PEUI0fNZhkVGO/uGXHVj4CJJBaGZ3d8CrvMKQEzj9rpKT2Y+tOBad6LcnO
 1ylCHjw0FD3KchBL3C+8G9B/7G2mn2ELe17iiCC67RDTZtiYWS9WLyuwxbuQYM3u197U7YW7t
 SThiIS1ImA0GONhT2Y4RnigrhQqzFukyQbOX/Jl/dWWqd1UEORFjIN/cOFJHpuypNuNGfvnOT
 rjWjpRTpo28TaC1mOXHZzdlIeAlcRwRDjIC22JHAER79uyhbBtYmYaYWCtNc=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=OWACJ68a;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Replace remaining ~PAGE_MASK patterns with the more readable
PAGE_OFFS_MASK.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c       | 5 +++--
 hypervisor/control.c            | 2 +-
 hypervisor/mmio.c               | 8 ++++----
 include/jailhouse/cell-config.h | 2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 5ce7025c..2ad7e228 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -498,7 +498,7 @@ static enum mmio_result vtd_unit_access_handler(void *arg,
 				goto invalid_iq_entry;

 			unit->iqh += 1 << VTD_IQH_QH_SHIFT;
-			unit->iqh &= ~PAGE_MASK;
+			unit->iqh &= PAGE_OFFS_MASK;
 		}
 		return MMIO_HANDLED;
 	}
@@ -799,7 +799,8 @@ iommu_get_remapped_root_int(unsigned int iommu, u16 device_id,
 	if (!irte_page)
 		return irq_msg;

-	root_irte = *(union vtd_irte *)(irte_page + (irte_addr & ~PAGE_MASK));
+	root_irte = *(union vtd_irte *)(irte_page +
+					(irte_addr & PAGE_OFFS_MASK));

 	irq_msg.valid =
 		(root_irte.field.p && root_irte.field.sid == device_id);
diff --git a/hypervisor/control.c b/hypervisor/control.c
index ac8e18fa..16f2cc13 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -398,7 +398,7 @@ static void cell_destroy_internal(struct cell *cell)

 static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 {
-	unsigned long cfg_page_offs = config_address & ~PAGE_MASK;
+	unsigned long cfg_page_offs = config_address & PAGE_OFFS_MASK;
 	unsigned int cfg_pages, cell_pages, cpu, n;
 	const struct jailhouse_memory *mem;
 	struct jailhouse_cell_desc *cfg;
diff --git a/hypervisor/mmio.c b/hypervisor/mmio.c
index 98e98ee7..539fb110 100644
--- a/hypervisor/mmio.c
+++ b/hypervisor/mmio.c
@@ -337,13 +337,13 @@ static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
 	 * This virt_base gives the following effective virtual address in
 	 * mmio_perform_access:
 	 *
-	 *     TEMPORARY_MAPPING_BASE + (mem->phys_start & ~PAGE_MASK) +
-	 *         (mmio->address & ~PAGE_MASK)
+	 *     TEMPORARY_MAPPING_BASE + (mem->phys_start & PAGE_OFFS_MASK) +
+	 *         (mmio->address & PAGE_OFFS_MASK)
 	 *
 	 * Reason: mmio_perform_access does addr = base + mmio->address.
 	 */
-	virt_base = TEMPORARY_MAPPING_BASE + (mem->phys_start & ~PAGE_MASK) -
-		(mmio->address & PAGE_MASK);
+	virt_base = TEMPORARY_MAPPING_BASE + (mem->phys_start & PAGE_OFFS_MASK)
+		- (mmio->address & PAGE_MASK);
 	mmio_perform_access((void *)virt_base, mmio);
 	return MMIO_HANDLED;

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index d435b9f7..6ef9e513 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -130,7 +130,7 @@ struct jailhouse_memory {
 } __attribute__((packed));

 #define JAILHOUSE_MEMORY_IS_SUBPAGE(mem)	\
-	((mem)->virt_start & ~PAGE_MASK || (mem)->size & ~PAGE_MASK)
+	((mem)->virt_start & PAGE_OFFS_MASK || (mem)->size & PAGE_OFFS_MASK)

 #define JAILHOUSE_CACHE_L3_CODE		0x01
 #define JAILHOUSE_CACHE_L3_DATA		0x02
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/da1baca9-d1f2-946a-f7e0-064a74398b6b%40web.de.
