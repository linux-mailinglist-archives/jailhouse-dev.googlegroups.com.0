Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBEUK7P2AKGQERICO6FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD71B238A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:03 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id n17sf351988wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463443; cv=pass;
        d=google.com; s=arc-20160816;
        b=taYH4W7seB8uU/25ero9byPVsAKyxKYxq2q9BB115efByAXKMt9DLJoErqkzXnFSoW
         PZ7UBujG0Lv7/JyyYoerk6ExoBX2wi6ZgFTmC5b9TZRaTUU3p0i4qMOZo65ASEooycDL
         VaO7U0B3YM6oyjSC0GNTERRixrR9PRx27jjdtQJTdTXo6mfcpBey/QdXkOAg+lG/dR0R
         WDk82OF8lSvslaF4sfIqqBFsP36Ac9h4je68ycpIJawJTizFFq84GnKl3GYLWnRROC/h
         Ed0Ay9KVBhkPSy9Ln3ibRZfBbmkLdgDMJHxIeGmpFBO37xTlzsFubYfL1J9tSmR/JLTy
         oQtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZpSpYg756TbesWvnkdozhDJ7i0ftCgZPpgfJdo+cLjg=;
        b=GR0qPf39oBDRm1lr2PZM1u2jH/w9BXYYSKFichmKmZtciddz914PHb6gEAg0XY4zUl
         tci2UbwnNrT8/So23mkZHjakFrUwEm4bL8gDNK/samdssXn9avjcvq30hxwbEIORnEaj
         dSOUnLgdB+5G10MrWjuJHAs/QRwObfPCGDmjy1PvGaR7KSGOqQ0gndJVruhSJZC/l46F
         C8hdu4Gp3l7j4CBG0epFgwwaOvwJUksr/LUiBZvLtckKql9A8tPpQLuvgUKcUvJdYy4w
         fLDJA5zifhdRn5QfKtXpgcx3qqZ4g4iBlLffJWw19pBZmtDpYmRleAitFXci0XaNn6xc
         j7nQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=Dgfw8HRM;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZpSpYg756TbesWvnkdozhDJ7i0ftCgZPpgfJdo+cLjg=;
        b=paltH2vMvjEyBKkGCic0mPOrrIqyU1JXrKlSAR2Rj6ooDTNh+9uC8h1fsH2fJne+EU
         qAXn4mfMQN31Rn8HxE0TNJ+Gnp5Gorpc8cjDoaUqcKCYLa5jSz7ncHZjQ1M407wXEePi
         pEIdXlVR+IvGvNgzIzQovBP/toHMAtYULjOd9HandXmKWbrNTLSKrUafdt1XrHO8r2iw
         sU3KhawqEBGf0VNPUfRyR2FTzYb4SBdSEqkGyF8WJl/0WKUQXWlBlmzLf65DKKW+VuPq
         lRCX/HwHIsgn/6mfHbIgcKXjWP7FKQZkDQPzBOCEhgrs025XoSr2pD06otkhs78tI8uj
         CLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZpSpYg756TbesWvnkdozhDJ7i0ftCgZPpgfJdo+cLjg=;
        b=gOFgDTXDQ1xLzbKyU3YjcxqzxrrGkV3hZRMBniGKVopjUZKOmjf8ml6pN5UxwFfcZT
         1JYDkc20ZavxAzaeYseKK9ep4xQD67gnbGZh7K/q3po1zBbs8exhux8dqdCkwVxL7khC
         k+8vBvd20OyHPeKD1kNaXcpEgi3vnIn6l2bQwrk9rfKiAuCdW3xAT6CFOzOgbh+/SQod
         WUL45v4ldQ9YbpmJO1xzY41XIRuNUjo78VAtwuO1pu5Ujny5rIsAgkS3gIVMbyDVbc5o
         upXGrB0p0mF4PsmfC+YrN1DamlB1CbYg0TEt44eJPh3U+QQPoTO6ozeyHmQxFj8CBNUm
         xe3g==
X-Gm-Message-State: AGi0PuYazZ07Nc/dOjcVTOYGiQPWkBqRtm8WPELqM5Mtb93gJHpocB3i
	yOaGWYq/6hsQLXLZ0LLF+rQ=
X-Google-Smtp-Source: APiQypIEItWHIhM4gTkr2PAcypll+rwG6+i7ojaLqXBrWNWqy8IV6a1GfWYtFwWmLssG540/rDjgPA==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr4097271wma.170.1587463443123;
        Tue, 21 Apr 2020 03:04:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4a83:: with SMTP id o3ls15674408wrq.7.gmail; Tue, 21 Apr
 2020 03:04:02 -0700 (PDT)
X-Received: by 2002:adf:80ee:: with SMTP id 101mr11632683wrl.156.1587463442387;
        Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463442; cv=none;
        d=google.com; s=arc-20160816;
        b=0jhjfG16uXf3DL6PMR/LjARZncawfrxG1sxRyMb5NiBKlw2Ku8lPcT+HGfD+4CKsa5
         NTTiva/JSWR3wGVtJOgzKjIw2YO888hAJYs8jsF9M5VMrcwGtJpSINvV/FW90FrQ0rwK
         TM9Eq4YgZ51OYDxpqO2WLRdqBq9sGx3NtKSoZC5+1HGzDNt9gszCYaOajumyhOXvc7Nu
         Os5QnquBYYGJZ9Jtz4BR6Fp5A4ODq0BILcXfYDHxnXa5SZuTcMavizm1cNeQR0W/HPu9
         8+7h+2JXsNcd84tHx1cnpOvWqaah1dZJ+pGHNz0sKgmkaOg/llAFuhoEFSCrx5kXHpRN
         hfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2cfGIApoLLpa4YPF9X92IorXNuSDG0lu05Y7qm7NCK4=;
        b=rwSxlzpuxR2F4TpmoIyAjK0nOOBmwqfmpZg4Q0AIBCsoZ1W15lOzM0IllWx9Avd7Mk
         us1s9aE+8f1umZ5huORJ5x+ka487kmGo1/Bx5DyU/qpE7JF2WwDfFLK2vHNvtub0vdCq
         uWbBcuG0DGDuKgwhB650tx/0U9LeIXmcn6LK8r6pDf4d/bt5++ynwnTg7C4qkJGCu4sQ
         5zM0E8VdJiumSI7xLUYHNCLSz5FPRunzYEEMzLkrJ4CUB51UDNJcirlAjKwvmLjBiifV
         d025A96cAD8BtDNoqOcFsk6teE1VqxZ2FgUT8qNNuvGjte5ThZzOnzSBy80jG7tA7aw6
         PNjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=Dgfw8HRM;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id m4si143074wrn.5.2020.04.21.03.04.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl3-0005BJ-Ed; Tue, 21 Apr 2020 12:04:01 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 2/9] hypervisor: implement paging_create/destroy_colored
Date: Tue, 21 Apr 2020 12:03:44 +0200
Message-Id: <20200421100351.292395-3-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=Dgfw8HRM;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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

From: Luca Miccio <lucmiccio@gmail.com>

Add functions for colored page creation and destruction and initialize
coloring on the platform.

The story of the life of a coloring page can be summarized as follows.

1. Bits in the address that are useful for defining colors are computed,
   and used for all mappings. The page size used to obtain the lower limit
   is assumed to be aligned with the `PAGE_SIZE` constant defaulting at
   4KiB, and also as the unit for the mapping operation, even when
   consecutive pages would be possible.

2. The colored regions can then mapped with a new paging function and
   destructed with the old one, because `paging_destroy*` acts on virtual
   addresses while coloring happens on the physical ones.
   Paging_create has to handle the remap to root_cell too when e.g.
   destroying cells.

3. The colored unmap function is instead used only when destroying the
   root cell mapping, since we assume that the root cell uses a 1:1 mapping
   for memory regions.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 hypervisor/include/jailhouse/paging.h |  11 ++
 hypervisor/paging.c                   | 155 ++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index 5513c4ec..032a3a04 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -267,6 +267,17 @@ int paging_destroy(const struct paging_structures *pg_structs,
 		   unsigned long virt, unsigned long size,
 		   unsigned long paging_flags);
 
+int paging_create_colored(const struct paging_structures *pg_structs,
+			  unsigned long phys, unsigned long size,
+			  unsigned long virt, unsigned long access_flags,
+			  unsigned long paging_flags,
+			  unsigned long *color_bitmask, bool identity_map);
+
+int paging_destroy_colored(const struct paging_structures *pg_structs,
+			   unsigned long virt, unsigned long size,
+			   unsigned long paging_flags,
+			   unsigned long *color_bitmask);
+
 void *paging_map_device(unsigned long phys, unsigned long size);
 void paging_unmap_device(unsigned long phys, void *virt, unsigned long size);
 
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 876f1521..e8f741c2 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -5,6 +5,8 @@
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Luca Miccio <lucmiccio@gmail.com> (cache coloring support)
+ *  Marco Solieri <ms@xt3.it> (cache coloring support)
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -14,6 +16,7 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/string.h>
 #include <jailhouse/control.h>
+#include <jailhouse/coloring.h>
 
 #define BITS_PER_PAGE		(PAGE_SIZE * 8)
 
@@ -438,6 +441,153 @@ int paging_destroy(const struct paging_structures *pg_structs,
 	return 0;
 }
 
+/**
+ * Create or modify a colored page map.
+ * @param pg_structs	Descriptor of paging structures to be used.
+ * @param phys		Physical address of the region to be mapped.
+ * @param size		Size of the region.
+ * @param virt		Virtual address the region should be mapped to.
+ * @param access_flags	Flags describing the permitted page access, see
+ * @ref PAGE_ACCESS_FLAGS.
+ * @param color_bitmask	Bitmask specifying value of coloring.
+ * @param identity_map	If true the mapping will be 1:1.
+ *
+ * @return 0 on success, negative error code otherwise.
+ *
+ * @note The function uses only 4 KiB page size for mapping.
+ *
+ * @see paging_destroy_colored
+ * @see paging_get_guest_pages
+ */
+int paging_create_colored(const struct paging_structures *pg_structs,
+			  unsigned long phys, unsigned long size,
+			  unsigned long virt, unsigned long access_flags,
+			  unsigned long paging_flags,
+			  unsigned long *color_bitmask, bool identity_map)
+{
+
+	phys &= PAGE_MASK;
+	virt &= PAGE_MASK;
+	size = PAGE_ALIGN(size);
+
+	while (size > 0) {
+		const struct paging *paging = pg_structs->root_paging;
+		page_table_t pt = pg_structs->root_table;
+		pt_entry_t pte;
+		int err;
+
+		phys = next_colored(phys, color_bitmask);
+		if (identity_map)
+			virt = phys;
+
+		while (1) {
+			pte = paging->get_entry(pt, virt);
+			if (paging->page_size == PAGE_SIZE) {
+				paging->set_terminal(pte, phys, access_flags);
+				flush_pt_entry(pte, paging_flags);
+				break;
+			}
+			/* Loop until 4K page size by splitting hugepages */
+			if (paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
+				err = split_hugepage(pg_structs->hv_paging,
+							paging, pte, virt,
+							paging_flags);
+				if (err)
+					return err;
+				pt = paging_phys2hvirt(
+					paging->get_next_pt(pte));
+			} else {
+				pt = page_alloc(&mem_pool, 1);
+				if (!pt)
+					return -ENOMEM;
+
+				paging->set_next_pt(pte, paging_hvirt2phys(pt));
+				flush_pt_entry(pte, paging_flags);
+			}
+			paging++;
+		}
+		if (pg_structs == &hv_paging_structs)
+			arch_paging_flush_page_tlbs(virt);
+
+		phys += paging->page_size;
+		virt += paging->page_size;
+		size -= paging->page_size;
+	}
+	return 0;
+}
+
+/**
+ * Destroy a colored page map.
+ * @param pg_structs	Descriptor of paging structures to be used.
+ * @param virt		Virtual address the region to be unmapped.
+ * @param size		Size of the region.
+ * @param paging_flags	Flags describing the paging mode, see @ref PAGING_FLAGS.
+ * @param color_bitmask	Bitmask specifying value of coloring.
+ *
+ * @return 0 on success, negative error code otherwise.
+ *
+ * @see paging_create_colored
+ */
+int paging_destroy_colored(const struct paging_structures *pg_structs,
+			   unsigned long virt, unsigned long size,
+			   unsigned long paging_flags,
+			   unsigned long *color_bitmask)
+{
+	size = PAGE_ALIGN(size);
+
+	while (size > 0) {
+		const struct paging *paging = pg_structs->root_paging;
+		page_table_t pt[MAX_PAGE_TABLE_LEVELS];
+		unsigned long page_size;
+		pt_entry_t pte;
+		int n = 0;
+		int err;
+
+		virt = next_colored(virt, color_bitmask);
+
+		/* walk down the page table, saving intermediate tables */
+		pt[0] = pg_structs->root_table;
+		while (1) {
+			pte = paging->get_entry(pt[n], virt);
+			if (!paging->entry_valid(pte, PAGE_PRESENT_FLAGS))
+				break;
+			if (paging->get_phys(pte, virt) != INVALID_PHYS_ADDR) {
+				if (paging->page_size == PAGE_SIZE)
+					break;
+
+				err = split_hugepage(pg_structs->hv_paging,
+						     paging, pte, virt,
+						     paging_flags);
+				if (err)
+					return err;
+			}
+			pt[++n] = paging_phys2hvirt(paging->get_next_pt(pte));
+			paging++;
+		}
+		/* advance by page size of current level paging */
+		page_size = paging->page_size ? paging->page_size : PAGE_SIZE;
+
+		/* walk up again, clearing entries, releasing empty tables */
+		while (1) {
+			paging->clear_entry(pte);
+			flush_pt_entry(pte, paging_flags);
+			if (n == 0 || !paging->page_table_empty(pt[n]))
+				break;
+			page_free(&mem_pool, pt[n], 1);
+			paging--;
+			pte = paging->get_entry(pt[--n], virt);
+		}
+		if (pg_structs == &hv_paging_structs)
+			arch_paging_flush_page_tlbs(virt);
+
+		if (page_size > size)
+			break;
+		virt += page_size;
+		size -= page_size;
+	}
+	return 0;
+}
+
 static unsigned long
 paging_gvirt2gphys(const struct guest_paging_structures *pg_structs,
 		   unsigned long gvirt, unsigned long tmp_page,
@@ -702,6 +852,11 @@ int paging_init(void)
 			return err;
 	}
 
+	/* Setup coloring */
+	if (coloring_paging_init(system_config->platform_info.llc_way_size)) {
+		printk("Error: Unable to init cache coloring data\n");
+		return -ENOMEM;
+	}
 	return 0;
 }
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-3-ms%40xt3.it.
